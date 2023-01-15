{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    neovim
    kitty
    waybar-hyprland
  ];
}

