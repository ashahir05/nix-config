{ 
  buildFHSUserEnv ? (import <nixpkgs> {}).buildFHSUserEnv,
  stdenv ? (import <nixpkgs> {}).stdenv,
  lib ? (import <nixpkgs> {}).lib,
  pkgs ? (import <nixpkgs> {}),
  ...
}: 
let
  runtimeDeps = with pkgs; [
    gamemode
    openjdk17
    qt5.qtbase
    libGL
    glfw
    openal
    alsa-lib
    libao
    pulseaudio
    freetype
    fontconfig
    flite
  ] ++ xorgPkgs;

  xorgPkgs = with pkgs.xorg; [
    libXext
    libX11
    libXext
    libXcursor
    libXrandr
    libXxf86vm
    libXrender
    libXtst
    libXi
  ];

  libPath = lib.makeLibraryPath(runtimeDeps);
  
  pollymc = pkgs.callPackage ./pollymc.nix { inherit stdenv lib pkgs libPath; };
in
  buildFHSUserEnv {
    name = "pollymc";
    
    targetPkgs = pkgs: (with pkgs; [
      pollymc
      zlib
    ] ++ runtimeDeps);
    
    extraInstallCommands = ''
      ln -s "${pollymc}/share" "$out/"
    '';
    
    runScript = "${pollymc}/bin/pollymc";
  }
