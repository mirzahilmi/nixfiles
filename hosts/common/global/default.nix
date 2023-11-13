{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    
    ./bootloader.nix
    ./kernel.nix
    ./locale.nix
  ];

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  system.stateVersion = "23.11";
}
