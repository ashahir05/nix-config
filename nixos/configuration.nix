{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../nixpkgs.nix
      ../nix.nix
      ./bluetooth.nix
      ./bootloader.nix
      ./desktop.nix
      ./environment.nix
      ./locale.nix
      ./networking.nix
      ./pkgs.nix
      ./printing.nix
      ./sound.nix
      ./time.nix
      ./users.nix
      inputs.hyprland.nixosModules.default
    ];


  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}

