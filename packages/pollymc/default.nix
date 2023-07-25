{ 
  buildFHSEnv ? (import <nixpkgs> {}).buildFHSEnv,
  stdenv ? (import <nixpkgs> {}).stdenv,
  lib ? (import <nixpkgs> {}).lib,
  pkgs ? (import <nixpkgs> {}),
  localPkgs
}: 
let
  pollymc = pkgs.callPackage ./pollymc.nix { inherit stdenv lib pkgs localPkgs; }
in
  buildFHSEnv {
    name = "pollymc";
    
    targetPkgs = pkgs: (with pkgs; [
      qt5.qtbase
      freetype
      fontconfig
    ]) ++ (with pkgs.xorg; [
      libXext
      libX11
      libXext
      libXcursor
      libXrandr
      libXxf86vm
      libXrender
      libXtst
      libXi
    ]);
    
    extraInstallCommands = ''
      ln -s "${pollymc}/share" "$out/"
    '';
    
    runScript = "${pollymc}/bin/pollymc";
  }
