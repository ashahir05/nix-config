{ 
  buildFHSEnv ? (import <nixpkgs> {}).buildFHSEnv,
  stdenv ? (import <nixpkgs> {}).stdenv,
  lib ? (import <nixpkgs> {}).lib,
  pkgs ? (import <nixpkgs> {}),
  localPkgs
}: 
let
  pollymc = pkgs.callPackage ./pollymc.nix { inherit stdenv lib pkgs localPkgs; };
in
  buildFHSEnv {
    name = "pollymc";
    
    targetPkgs = pkgs: (with pkgs; [
      pollymc
      openjdk17
    ]);
    
    extraInstallCommands = ''
      ln -s "${pollymc}/share" "$out/"
    '';
    
    runScript = "${pollymc}/bin/pollymc";
  }
