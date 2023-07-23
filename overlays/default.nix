{ pkgs, lib ? pkgs.lib, inputs, ... }: final: prev:
  let
    overlayFileNames = lib.lists.remove null (lib.mapAttrsToList (key: value: if key != "default.nix" && value == "regular" && lib.strings.hasSuffix ".nix" key then key else null) (builtins.readDir ./.));
    pkgsFileNames = lib.lists.remove null (lib.mapAttrsToList (key: value: if (value == "directory") then key else null) (builtins.readDir ../packages));
    overlayFiles = lib.lists.forEach overlayFileNames (file: lib.strings.removeSuffix ".nix" file);
    pkgsFiles = lib.lists.forEach pkgsFileNames (file: lib.strings.removeSuffix ".nix" file);
    overlaysSet = file:
      let
        parts = lib.strings.splitString "." file;
        reversedParts = lib.lists.reverseList parts;
      in
        lib.foldl (x: y: if y == (lib.lists.last parts) then { ${y} = import ./${file}.nix { inherit  prev final inputs; }; } else { ${y} = x; }) {} reversedParts;
    pkgsSet = file:
      { ${lib.lists.last (lib.strings.splitString "." file)} = pkgs.callPackage ../pkgs/${file} {}; };
  in
    let
      overlays = (lib.foldl (a: b: a // b) {} (lib.lists.forEach overlayFiles (file: overlaysSet file)));
      pkgsOverlays = (lib.foldl (a: b: a // b) {} (lib.lists.forEach pkgsFiles (file: pkgsSet file)));
    in
      overlays // pkgsOverlays
