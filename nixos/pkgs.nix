{ config, pkgs, inputs, ... }: {
  services.flatpak.enable = true;
  
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
    adw-gtk3
  ];
}
