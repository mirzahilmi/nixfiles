{
  nix = {
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

    optimise.automatic = true;
  };

  use-xdg-base-directories = true;

  nixpkgs.config.allowUnfree = true;
}
