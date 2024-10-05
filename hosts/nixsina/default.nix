# Host-level configuration
# (it replaces /etc/nixos/configuration.nix)
{inputs, ...}: {
  imports = [
    inputs.hardware.nixosModules.lenovo-legion-15arh05h
    inputs.disko.nixosModules.disko

    (import ./disko.nix {device = "/dev/sda";})
    ./hardware-configuration.nix
    ./font.nix

    ../shared
    ../shared/locales
    ../shared/users/mirza.nix

    ../../modules/nixos/gnome
    ../../modules/nixos/libvirt.nix
    ../../modules/nixos/networkmanager.nix
    ../../modules/nixos/pipewire.nix
    ../../modules/nixos/podman.nix
    ../../modules/nixos/printer.nix
    ../../modules/nixos/sops.nix
    ../../modules/nixos/virtmanager.nix
  ];
  networking.hostName = "nixsina";
}
