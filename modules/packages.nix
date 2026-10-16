{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bibata-cursors
    claude-code
    fastfetch
    git
    vim
  ];
}
