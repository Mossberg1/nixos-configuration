{
  environment.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/nixos";
  };

  programs.bash.blesh.enable = true;
}
