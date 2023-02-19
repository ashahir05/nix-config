{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.neovim.enable = true;
  programs.neovim.plugins = with pkgs; [
    (vimPlugins.nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars))
  ];
}
