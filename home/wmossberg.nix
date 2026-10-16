{ config, pkgs, ... }:

{
  home.username = "wmossberg";
  home.homeDirectory = "/home/wmossberg";
  home.stateVersion = "26.05";

  xdg.configFile."hypr/hyprland.lua".source = ./hypr/hyprland.lua;
  xdg.configFile."kitty/kitty.conf".source = ./kitty/kitty.conf;
}
