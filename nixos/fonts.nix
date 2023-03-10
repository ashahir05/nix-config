{ config, pkgs, inputs, ... }: {
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    liberation_ttf
    amiri
    lohit-fonts.bengali
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
  ];
}
