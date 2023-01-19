{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    home-manager
    gcc
    neovim
    git
    google-chrome
    vscode-fhs
    nerdfonts
    wl-clipboard
    wl-clipboard-x11
    gnome.gnome-tweaks
    adw-gtk3
  ];
}
