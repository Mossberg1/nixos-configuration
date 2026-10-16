{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  environment.systemPackages = [
    pkgs.kitty
    pkgs.awww
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
