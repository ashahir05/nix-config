{ inputs, outputs, lib, config, pkgs, ... }: {
  home.packages = with pkgs; [
    sumneko-lua-language-server
    vmpk
    ripgrep
    musescore
    android-tools
    flutter
    libGLU
  ];
}
