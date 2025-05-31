{pkgs, ...}: {
  nix = {
    package = pkgs.nixVersions.latest;
    optimise.automatic = true;
    settings = {
      auto-optimise-store = true;
      warn-dirty = false;
      trusted-users = ["root" "@wheel"];
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      experimental-features = toString [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
    };
  };
}
