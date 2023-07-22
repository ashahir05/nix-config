{ prev, inputs, ... }: prev.gnomeExtensions.paperwm.overrideAttrs (old: rec {
  name = "paperwm-${version}";
  version = inputs.paperwm-src.shortRev;
  src = inputs.paperwm-src;
  hash = inputs.paperwm-src.narHash;
})

