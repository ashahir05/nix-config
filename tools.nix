{ inputs, outputs, lib, config, pkgs, ... }: {
  home.packages = with pkgs; [
    thefuck

    rnix-lsp
    nixfmt
    shellcheck
    lua-language-server
    stylua
    nodePackages.prettier
    black
  ];
}
