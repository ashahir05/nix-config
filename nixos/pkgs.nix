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
    google-chrome
  ];
}

