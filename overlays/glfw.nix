{ prev, inputs, ... }: prev.glfw.overrideAttrs (old: rec {
  name = "glfw-${version}";
  version = inputs.glfw-src.shortRev;
  src = inputs.glfw-src;
  hash = inputs.glfw-src.narHash;
})
