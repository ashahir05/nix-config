{ config, pkgs, inputs, ... }:

{
  programs.neovim.enable = true;

  environment.systemPackages = with pkgs; [
    git
    python3
    nodejs
    rustup
    wl-copy
    wl-paste
    google-chrome
  ];
}

