{ config, pkgs, ... }: {
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.git.userName = "Ahmed Shahir Samin";
  programs.git.userEmail = "ashahir05@gmail.com";

  programs.bash = {
    enable = true;
    initExtra = ''
      . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    '';
  };

  gtk.enable = true;
  gtk.theme.name = "Adw-gtk3";
  gtk.theme.package = pkgs.adw-gtk3;
  home.sessionVariables.GTK_THEME = "Adw-gtk3";
  gtk.gtk3.extraConfig = {
    gtk-application-prefer-dark-theme=1;
  };
  gtk.gtk4.extraConfig = {
    gtk-application-prefer-dark-theme=1;
  };
  
  home.shellAliases = {
    
  };
}
