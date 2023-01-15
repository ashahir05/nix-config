{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; with inputs.hyprland; [
    git
    neovim
    kitty
    hyprland.waybar-hyprland
  ];
}

