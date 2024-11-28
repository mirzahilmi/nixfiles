{inputs, ...}: {
  extra = finalPkgs: prevPkgs: import ../pkgs {inherit inputs finalPkgs prevPkgs;};
  custom = finalPkgs: prevPkgs: import ./custom.nix {inherit finalPkgs prevPkgs;};
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
