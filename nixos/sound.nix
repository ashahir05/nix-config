{ config, ... }:

{
  sound.enable = true;
  services.pipewire.audio.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire.alsa.enable = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.jack.enable = true;
}

