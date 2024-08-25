{inputs, ...}: {
  # This one brings custom packages from the 'pkg' directory
  extra = pkgs: prev:
    import ../pkgs {inherit pkgs prev inputs;};

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
