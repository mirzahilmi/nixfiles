{inputs, ...}: {
  libExtensions = final: prev: {
    libx = import ./lib.nix {inherit final prev;};
  };

  extra = final: prev: import ../pkgs {inherit inputs final prev;};

  overridenPackages = final: prev: import ./override.nix {inherit final prev;};

  unstablePackage = final: _: {
    unstable = import inputs.nixpkgs-unstable {
      inherit (final) system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };
  };

  niri = inputs.niri.overlays.niri;
}
