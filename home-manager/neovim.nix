{ inputs, outputs, lib, config, pkgs }: {
  programs.neovim.enable = true;
  programs.neovim.plugins = [
    pkgs.vimPlugins.nvim-treesitter
    pkgs.vimPlugins.nvim-treesitter.withAllGrammars
  ];
}
