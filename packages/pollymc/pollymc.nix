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
      
      buildInputs = with pkgs; [
        qt5.qtbase
        libGL
        localPkgs.glfw
        openal
        flite
        freetype
        fontconfig
      ] ++ xorgPkgs;
      
      dontWrapQtApp = true;
      
      libPath = lib.makeLibraryPath(with pkgs; [
        libGL
        localPkgs.glfw
        openal
        flite
        freetype
        fontconfig
      ] ++ xorgPkgs);
      
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
          --set LD_LIBRARY_PATH /run/opengl-driver/lib:${libPath}
      '';
      
      pathsToLink = [
        "/share"
        "/bin"
      ];
    }