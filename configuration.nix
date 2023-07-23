{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = lib.lists.remove null (lib.mapAttrsToList (key: value: if (key != "default.nix" && key != "flake.nix" && key != "flake.lock" && key != "registry.json" && key != "configuration.nix" && key != "shell.nix" && key != ".git" && key != ".gitignore") then ./${key} else null) (builtins.readDir ./.)) ++ [

  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.x86_64-linux
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

  systemd.user.startServices = "sd-switch";

  programs.nix-index.enable = true;
  programs.nix-index-database.comma.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
