{
  inputs,
  outputs,
  ...
}: {
  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = ["root" "@wheel"];
      auto-optimise-store = true;
      warn-dirty = false;
      "use-xdg-base-directories" = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
    optimise.automatic = true;
  };
  nixpkgs = {
    overlays = [outputs.overlays.extra];
    config.allowUnfree = true;
  };
}
