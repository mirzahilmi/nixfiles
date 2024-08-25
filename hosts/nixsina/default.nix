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
    ../common/de/gnome

    ../../modules/nixos/sops.nix
    ../../modules/nixos/networkmanager.nix

    ../common/extra/docker.nix
    ../common/extra/gns3.nix
    ../common/extra/nh.nix
    ../common/extra/pipewire.nix
    ../common/extra/v4l2loopback.nix
    ../common/extra/virt-manager.nix
    ../common/extra/zsh.nix
  ];
  networking.hostName = "nixsina";
}
