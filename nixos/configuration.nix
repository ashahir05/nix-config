{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../nixpkgs.nix
      ../nix.nix
      ./bootloader.nix
      ./desktop.nix
      ./locale.nix
      ./networking.nix
      ./pkgs.nix
      ./printing.nix
      ./sound.nix
      ./time.nix
      ./users.nix
    ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}

