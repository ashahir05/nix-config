{ config, pkgs, ... }: {
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.git.userName = "Ahmed Shahir Samin";
  programs.git.userEmail = "ashahir05@gmail.com";

  programs.bash = {
    enable = true;
  };

  gtk = {
    enable = true;
    theme.name = "adw-gtk3-dark";
    theme.package = pkgs.adw-gtk3;
  };
  
  qt = {
    enable = true;
    style.name = "adwaita-dark";
    platformTheme = "gnome";
  }; 
  
  home.shellAliases = {
    
  };
}
