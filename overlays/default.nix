{inputs, ...}: {
  # This one brings custom packages from the 'pkg' directory
  extra = final: prev:
    import ../pkgs {
      pkgs = final;
      inherit inputs prev;
    };

  # Unstable nixpkgs set (declared in the flake inputs) are
  # accessible through 'pkgs.unstable'
  unstable-package = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config = {
        allowUnfree = true;
      };
    };
  };

  lib = final: prev: {
    final.lib.extend = self: _: (import ../lib self);
  };
}
