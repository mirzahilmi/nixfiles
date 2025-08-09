{inputs, ...}: {
  libExtensions = final: prev: {
    libx = import ./lib.nix {inherit final prev;};
  };

  extra = final: prev: import ../pkgs {inherit inputs final prev;};

  overridenPackages = final: prev: import ./override.nix {inherit final prev;};

  versionedPackages = final: _: let
    pull = nixpkgs:
      import nixpkgs {
        inherit (final) system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = _: true;
        };
      };
  in {
    unstable = pull inputs.nixpkgs-unstable;
  };

  niri = inputs.niri.overlays.niri;
}
