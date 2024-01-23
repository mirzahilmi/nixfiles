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

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  system.stateVersion = "23.11";
}
