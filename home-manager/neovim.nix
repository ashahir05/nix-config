{ inputs, outputs, lib, config, pkgs }: {
  programs.neovim.enable = true;
  programs.neovim.plugins = [
    (pkgs.nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars))
  ];
}
