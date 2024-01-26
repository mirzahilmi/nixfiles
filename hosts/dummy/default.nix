# Host-level configuration
# (it replaces /etc/nixos/configuration.nix)
{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/extras/gnome-wayland.nix
    ../common/extras/wayland-tweaks.nix
    ../common/extras/pipewire.nix
    ../common/extras/docker.nix
    ../common/extras/zsh.nix
    ../common/users/mirza
  ];

  networking = {
    hostName = "dummy";
    networkmanager.enable = true;
  };

  services.openssh.enable = true;
}
