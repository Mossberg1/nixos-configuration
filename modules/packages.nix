{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    claude-code
    fastfetch
    git
    vim
  ];
}
