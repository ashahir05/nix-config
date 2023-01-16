{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    python3
    git
    neovim
    google-chrome
  ];
}

