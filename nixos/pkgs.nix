{ config, pkgs, inputs, ... }:

{
  programs.neovim.enable = true;

  environment.systemPackages = with pkgs; [
    git
    python3
    nodejs
    rustup
    wl-clipboard
    wl-clipboard-x11
    inter
    nerdfonts
    kate
    vscode-fhs
    plasma5Packages.kio-gdrive
    plasma5Packages.sddm-kcm
    google-chrome
  ];
}

