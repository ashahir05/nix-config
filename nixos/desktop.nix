{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.layout = "us";
  
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs; [
    gnome.cheese
    gnome.gnome-music
    epiphany
    gnome.gnome-maps
    gnome.geary
    gnome.totem
  ];
}

