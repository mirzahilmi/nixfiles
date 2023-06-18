{inputs, ...}: {
  # This one brings custom packages from the 'pkgs' directory
  extras = final: _prev: import ../pkgs {pkgs = final;};

  # Unstable nixpkgs set (declared in the flake inputs) are
  # accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
