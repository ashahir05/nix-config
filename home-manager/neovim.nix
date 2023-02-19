{ inputs, outputs, lib, config, pkgs }: {
  programs.neovim.plugins = [
    vimPlugins.nvim-treesitter
    pkgs.vimPlugins.nvim-treesitter.withAllGrammars
  ];
}
