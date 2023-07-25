{ 
  stdenv ? (import <nixpkgs> {}).stdenv,
  lib ? (import <nixpkgs> {}).lib,
  pkgs ? (import <nixpkgs> {}),
  localPkgs
}:
  let
    pname = "pollymc";
    name = "PollyMC-${version}";
    version = "7.1";

    src = builtins.fetchurl {
      url = "https://github.com/fn2006/PollyMC/releases/download/${version}/PollyMC-Linux-${version}.tar.gz";
      sha256 = "sha256:1wazsg0r8l0mqbzdcxp0iv322ll4yk2cv29wwm6v1cgmq7kp90bl";
    };
  in
    stdenv.mkDerivation rec {
      inherit pname name src;
      
      nativeBuildInputs = with pkgs; [
        autoPatchelfHook
        makeBinaryWrapper
        qt5.wrapQtAppsHook
      ];
      
      buildInputs = with pkgs; [
        qt5.qtbase
        libGL
        localPkgs.glfw
        openal
        flite
      ] ++ with pkgs.xorg; [
        libXext
        libX11
        libXext
        libXcursor
        libXrandr
        libXxf86vm
      ];
      
      dontWrapQtApp = true;
      
      libPath = lib.makeLibraryPath(with pkgs; [
        libGL
        localPkgs.glfw
        openal
        flite
      ] ++ with pkgs.xorg; [
        libXext
        libX11
        libXext
        libXcursor
        libXrandr
        libXxf86vm
      ]);
      
      unpackPhase = ''
        tar -xzf $src
      '';
      
      installPhase =  ''
        mkdir $out
        cp -r ./* $out
        
        runHook postInstall
      '';
      
      postInstall = ''
        mv $out/bin/pollymc $out/bin/pollymc-unwrapped
        makeWrapper $out/bin/pollymc-unwrapped $out/bin/pollymc \
          --set LD_LIBRARY_PATH /run/opengl-driver/lib:${libPath} \
          --set OPENGL ${pkgs.libGL}/lib \
          --set GLFW ${localPkgs.glfw}/lib \
          --set OPENAL ${pkgs.openal}/lib
      '';
      
      pathsToLink = [
        "/share"
        "/bin"
      ];
    }
