{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = lib.lists.remove null (lib.mapAttrsToList (key: value: if (key != "default.nix" && key != "flake.nix" && key != "flake.lock" && key != "overlays" && key != "modules" && key != "packages" && key != "registry.json" && key != "configuration.nix" && key != "shell.nix" && key != ".git" && key != ".gitignore") then ./${key} else null) (builtins.readDir ./.)) ++ [
    # inputs.nix-index-database.hmModules.nix-index
  ];
  
  nix = {
    registry = let 
      flakeInputs = builtins.listToAttrs (lib.lists.remove null (lib.attrsets.mapAttrsToList (key: value: if value ? _type && value._type == "flake" then { name = key; value = value; } else null) inputs));
    in 
      lib.mapAttrs (_: value: { flake = value; }) flakeInputs;
  };
  
  nixpkgs = {
    overlays = [
      
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

  # programs.nix-index.enable = true;
  # programs.nix-index-database.comma.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
