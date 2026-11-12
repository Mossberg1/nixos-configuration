{ pkgs, ... }:
let
  set-wallpaper = pkgs.writeShellApplication {
    name = "set-wallpaper";
    runtimeInputs = with pkgs; [ awww wallust hyprland procps coreutils ];
    text = ''
      wall_dir="$HOME/Pictures/Wallpapers"
      img="''${1:-}"

      # No argument: reuse the last wallpaper, else the default.
      if [ -z "$img" ]; then
        if [ -e "$wall_dir/current" ]; then
          img="$(readlink -f "$wall_dir/current")"
        else
          img="$wall_dir/nixos-wallpaper.png"
        fi
      fi

      if [ ! -f "$img" ]; then
        echo "set-wallpaper: no such image: $img" >&2
        exit 1
      fi

      ln -sfn "$img" "$wall_dir/current"

      awww img "$img"

      # Images with few distinct colors (the stock NixOS wallpaper, for one)
      # fail with "Not enough colors!" at the configured threshold. Retry at the
      # lowest threshold so a wallpaper never leaves the colors half-applied.
      wallust run "$img" || wallust run --threshold 1 "$img"

      # New kitty windows pick up the generated include; running ones need a
      # config reload, which kitty does on SIGUSR1. No -x here: the process name
      # is ".kitty-wrapped", so an exact match silently signals nothing.
      pkill -USR1 kitty || true

      # Border colors go in as Lua. `hyprctl keyword` is not an option: it fails
      # with "keyword can't work with non-legacy parsers" against hyprland.lua.
      colors="$HOME/.cache/wallust/hyprland.lua"
      if [ -r "$colors" ] && [ -n "''${HYPRLAND_INSTANCE_SIGNATURE:-}" ]; then
        # The leading "--" Lua comments have to go: hyprctl reads them as flags
        # and just prints its usage instead of evaluating anything.
        hyprctl eval "$(grep -v '^[[:space:]]*--' "$colors")" >/dev/null
      fi
    '';
  };
in
{
  environment.systemPackages = [
    pkgs.wallust
    set-wallpaper
  ];
}
