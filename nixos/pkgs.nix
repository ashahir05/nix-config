{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; with inputs.hyprland.packages.${system}; [
    git
    neovim
    kitty
    dunst
    polkit-kde-agent
    eww-wayland
    rofi-wayland
    hyprpaper
    flameshot
    swayidle
    clipman
  ];
}

