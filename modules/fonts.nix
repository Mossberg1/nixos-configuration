{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    inter 
    nerd-fonts.dejavu-sans-mono
    noto-fonts
    noto-fonts-color-emoji
  ];

  fonts.fontconfig.defaultFonts = {
    emoji = [ "Noto Color Emoji" ];
    monospace = [ "DejaVuSansM Nerd Font Mono" ];
    sansSerif = [ "Inter" ];
    serif = [ "Noto Serif" ];
  };
}
