{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.neovim.enable = true;
  programs.neovim.plugins = with pkgs; [
    nvim-treesitter.withAllGrammers
  ];
}
