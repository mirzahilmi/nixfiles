{...}: {
  imports = [
    ./boot.nix
    ./fonts.nix
    ./kernel.nix
    ./locale.nix
    ./nix.nix
    ./xdg.nix
  ];

  system.stateVersion = "23.11";
}
