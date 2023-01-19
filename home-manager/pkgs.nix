{ inputs, outputs, lib, config, pkgs, ... }: {
  home.packages = with pkgs; [
    sumneko-lua-language-server
  ];
}
