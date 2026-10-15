{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fastfetch
    git
    vim
  ];
}
