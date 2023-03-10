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

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
