{inputs, ...}: {
  extra = pkgs: prev: import ../pkgs {inherit pkgs prev inputs;};
  unstable-package = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config = {
        allowUnfree = true;
      };
    };
  };
}
