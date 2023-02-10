{ config, lib, pkgs, ... }: {
  environment.variables = lib.mkForce {
    EDITOR = "nvim";    
    QT_STYLE_OVERRIDE = "fusion";
  };

  environment.shellAliases = {
    cfgdir = "cd /nix-config";
    syspkgs = "cd /nix-config && $EDITOR nixos/pkgs.nix ; cd $OLDPWD";
    usrpkgs = "cd /nix-config && $EDITOR home-manager/pkgs.nix ; cd $OLDPWD";
    flakeup = "cfgdir && nix flake update ; cd $OLDPWD";
    flake-commit = "cfgdir && git add . && git commit -m \"Automated commit on $(date)\" ; cd $OLDPWD";
    sysup = "flake-commit && sudo nixos-rebuild switch --flake /nix-config/#ashahir-PC";
    homeup = "flake-commit && home-manager switch --flake /nix-config/#$\{USER\}@ashahir-PC";
    nixup = "sysup && homeup";
  };

  environment.sessionVariables.GST_PLUGIN_SYSTEM_PATH_1_0 = lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0" [
    pkgs.gst_all_1.gst-plugins-good
    pkgs.gst_all_1.gst-plugins-bad
    pkgs.gst_all_1.gst-plugins-ugly
    pkgs.gst_all_1.gst-libav
  ];
}
