{ 
  buildFHSUserEnv ? (import <nixpkgs> {}).buildFHSUserEnv,
  stdenv ? (import <nixpkgs> {}).stdenv,
  lib ? (import <nixpkgs> {}).lib,
  pkgs ? (import <nixpkgs> {}),
  localPkgs
}: 
let
  pollymc = pkgs.callPackage ./pollymc.nix { inherit stdenv lib pkgs localPkgs; };
in
  buildFHSUserEnv {
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
