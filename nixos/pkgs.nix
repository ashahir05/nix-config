{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    hplip
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
    gnomeExtensions.espresso
    gnomeExtensions.paperwm
    tracker
    adw-gtk3
    amberol
    vlc
  ];
}
