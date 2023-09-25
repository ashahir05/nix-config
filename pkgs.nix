{ inputs, outputs, lib, config, pkgs, localPkgs, ... }: {
  home.packages = with pkgs; [
    google-chrome
    zoom-us
    neovide
    bottles
    kicad

    jdk

    libGL
    glfw
    libpulseaudio
    openal
    flite
    xorg.Xcursor
    xorg.Xrandr
    xorg.Xext
    xorg.X11
    xorg.Xxf86vm
  ];
}
