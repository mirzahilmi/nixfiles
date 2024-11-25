{outputs, ...}: {
  imports = [
    ../../modules/home-manager
    ./xdgify.nix
  ];

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
}
