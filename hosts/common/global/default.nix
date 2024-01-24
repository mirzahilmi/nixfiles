{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    
    ./bootloader.nix
    ./fonts.nix
    ./kernel.nix
    ./locale.nix
    ./xdg-spec.nix
  ];

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
    
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
  };

  system.stateVersion = "23.11";
}
