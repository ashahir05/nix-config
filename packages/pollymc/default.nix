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
    stdenv.mkDerivation {
      inherit pname name src;
      
      nativeBuildInputs = with pkgs; [
        autoPatchelfHook
        qt5.wrapQtAppsHook
      ];
      
      buildInputs = with pkgs; [
        qt5.qtbase
        libGL
        localPkgs.glfw
        gamemode
      ];
      
      dontWrapQtApp = true;
      
      unpackPhase = ''
        tar -xzf $src
      '';
      
      installPhase =  ''
        mkdir $out
        cp -r ./* $out
      '';
      
      postInstall = ''
        substituteInPlace $out/share/applications/org.fn2006.PollyMC.desktop --replace 'Exec=' 'Exec=env GLFW=${localPkgs.glfw}/lib/libglfw.so '
      '';
      
      pathsToLink = [
        "/share"
        "/bin"
      ];
    }
