{...}: {
  imports = [
    ./bootloader.nix
    ./fonts.nix
    ./kernel.nix
    ./locale.nix
    ./optimization.nix
    ./xdg-spec.nix
  ];

  system.stateVersion = "23.11";
}
