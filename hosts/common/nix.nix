{
  config,
  inputs,
  outputs,
  ...
}: {
  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = ["root" "@wheel"];
      auto-optimise-store = true;
      warn-dirty = false;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
    extraOptions = ''
      !include ${config.sops.secrets.nixAccessTokens.path}
    '';
  };
  nixpkgs = {
    overlays = [
      outputs.overlays.extra
      outputs.overlays.unstable-package
    ];
  };
}
