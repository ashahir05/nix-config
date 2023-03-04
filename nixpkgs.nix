{ outputs, ... }: {
  nixpkgs = {
    # You can add overlays here
    overlays = [
      outputs.overlays.modifications
      outputs.overlays.additions
    ];
    config = {
      allowUnfree = true;
    };
  };
}
