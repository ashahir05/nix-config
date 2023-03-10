{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./environment.nix
    ./pkgs.nix
    ./neovim.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.modifications
      outputs.overlays.additions
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "ashahir05";
    homeDirectory = "/home/ashahir05";
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.git.userName = "Ahmed Shahir Samin";
  programs.git.userEmail = "ashahir05@gmail.com";

  gtk.enable = true;
  gtk.theme.name = "Adw-gtk3";
  gtk.theme.package = pkgs.adw-gtk3;
  home.sessionVariables.GTK_THEME = "Adw-gtk3";
  gtk3.extraConfig = {
    Settings = ''
      gtk-application-prefer-dark-theme=1
    '';
  };
  gtk4.extraConfig = {
    Settings = ''
      gtk-application-prefer-dark-theme=1
    '';
  };

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
