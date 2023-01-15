{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; with inputs.hyprland.packages.${system}; [
    git
    neovim
    kitty
    waybar-hyprland
  ];
}

