{ inputs, outputs, lib, config, pkgs }: {
  programs.neovim.enable = true;
  programs.neovim.plugins = [
    nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars)
  ];
}
