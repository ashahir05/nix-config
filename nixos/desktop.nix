{ config, ... }:

{
  services.xserver.enable = true;
  services.xserver.layout = "us";
  
  programs.hyprland.enable = true;
}

