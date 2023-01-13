{ config, pkgs, ... }:

{
  users.users.ashahir05 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      
    ];
  };
}

