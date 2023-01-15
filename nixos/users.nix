{ config, pkgs, ... }:

{
  users.users.ashahir05 = {
    description = "Ahmed Shahir Samin";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      
    ];
  };
}

