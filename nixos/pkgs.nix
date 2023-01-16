{ config, pkgs, inputs, ... }:

{
  programs.neovim.enable = true;

  environment.systemPackages = with pkgs; [
    python3
    git
    google-chrome
  ];
}

