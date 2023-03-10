{ config, pkgs, ... }: {
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.git.userName = "Ahmed Shahir Samin";
  programs.git.userEmail = "ashahir05@gmail.com";

  programs.bash = {
    enable = true;
  };

  gtk.enable = true;
  gtk.theme.name = "adw-gtk3-dark";
  gtk.theme.package = pkgs.adw-gtk3;
  
  home.shellAliases = {
    
  };
}
