{inputs, ...}: {
  extra = finalPkgs: prevPkgs: import ../pkgs {inherit inputs finalPkgs prevPkgs;};
  override = finalPkgs: prevPkgs: import ./override.nix {inherit finalPkgs prevPkgs;};
  unstablePackage = finalPkgs: _: {
    unstable = import inputs.nixpkgs-unstable {
      inherit (finalPkgs) system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };
  };
  niri = inputs.niri.overlays.niri;
}
