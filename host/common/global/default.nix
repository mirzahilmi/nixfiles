{...}: {
  imports = [
    ./bootloader.nix
    ./fonts.nix
    ./kernel.nix
    ./locale.nix
    ./nix.nix
    ./xdg-spec.nix
  ];

  system.stateVersion = "23.11";
}
