{ config, ... }: {
  environment.sessionVariables = {
    EDITOR = "nvim";    
  };

  environment.shellAliases = {
    cfgdir = "cd /nix-config";
    syspkgs = "cd /nix-config && $EDITOR nixos/pkgs.nix ; cd $OLDPWD";
    usrpkgs = "cd /nix-config && $EDITOR home-manager/pkgs.nix ; cd $OLDPWD";
    flakeup = "cfgdir && nix flake update ; cd $OLDPWD";
    flake-commit = "cfgdir && git add . && git commit -m \"Automated commit on $(date)\" ; cd $OLDPWD";
    sysup = "flake-commit && sudo nixos-rebuild switch --flake /nix-config/#ashahir-PC";
    nixup = "sysup && homeup";
  };
}
