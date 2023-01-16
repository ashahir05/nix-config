{ config, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.initrd.systemd.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  boot.plymouth.enable = true;
  boot.plymouth.theme = "breeze";

  boot.blacklistedKernelModules = [ "radeon" ];
  boot.kernelParams = [
    "radeon.cik_support=0"
    "amdgpu.cik_support=1"
    "quiet"
    "splash"
    "loglevel=3"
    "systemd.show_status=auto"
    "rd.udev.log_level=3"
    "zswap.enabled=1"
    "zswap.compressor=zstd"
    "zswap.zpool=z3fold"
    "zswap.max_pool_percent=40"
  ];
}

