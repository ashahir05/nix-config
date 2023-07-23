{ config, pkgs, lib, inputs, ... }: { 
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "aliases"
        "common-aliases"
        "copybuffer"
        "copyfile"
        "copypath"
        "cp"
        "dirhistory"
        "fancy-ctrl-z"
        "git"
        "sudo"
        "thefuck"
        "zsh-navigation-tools"
      ];
    };
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = inputs.zsh-autosuggestions;
      }
      {
        name = "zsh-syntax-highlighting";
        src = inputs.zsh-syntax-highlighting;
      }
    ];
  };
  
  home.sessionPath = [

  ];
  
  home.shellAliases = {
    
  };
  
  home.sessionVariables = {
    NEOVIDE_FRAME = "none";
    NEOVIDE_MULTIGRID = "true";
    WINIT_WAYLAND_CSD_THEME= "dark";
  };
  
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "Ahmed Shahir Samin";
    userEmail = "ashahir05@gmail.com";
    safeDirectories = [
      "/nixos"
    ];
  };
}
