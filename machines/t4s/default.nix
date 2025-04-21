{pkgs, ...}: {
  imports = [
    ../shared
    ../../users/mirza/nixos.nix
  ];
  wsl.enable = true;
  wsl.defaultUser = "mirza";
  networking.hostName = "t4s";
}
