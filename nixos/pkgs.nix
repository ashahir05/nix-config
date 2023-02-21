{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    hplip
    home-manager
    gcc
    neovim
    git
    google-chrome
    vscode-fhs
    wl-clipboard
    wl-clipboard-x11
    gnome.gnome-tweaks
    gnomeExtensions.espresso
    gnomeExtensions.paperwm
    tracker
    adw-gtk3
    amberol
    vlc
    commonCompress
  ];
}
