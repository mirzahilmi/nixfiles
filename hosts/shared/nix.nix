{pkgs, ...}: {
  nix = {
    package = pkgs.nixVersions.latest;
    optimise.automatic = true;
    settings = {
      experimental-features = toString [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
      trusted-users = ["root" "@wheel"];
      auto-optimise-store = true;
      warn-dirty = false;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
    # extraOptions = ''
    #   !include ${config.sops.secrets.nixAccessTokens.path}
    # '';
  };
}
