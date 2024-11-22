{inputs, ...}: {
  extra = finalPkgs: _: import ../pkgs {inherit inputs finalPkgs;};
  custom = _: prevPkgs: import ./custom.nix {inherit inputs prevPkgs;};
  unstablePackage = finalPkgs: _: {
    unstable = import inputs.nixpkgs-unstable {
      inherit (finalPkgs) system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };
  };
}
