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
    inputs.hardware.nixosModules.lenovo-legion-15arh05h

    ./hardware-configuration.nix
    ../common/global
    ../common/extras/gnome-wayland.nix
    ../common/extras/pipewire.nix
    ../common/extras/docker.nix
    ../common/extras/zsh.nix
    ../common/extras/gnupg.nix
    ../common/users/mirza
  ];

  networking = {
    hostName = "nixsina";
    networkmanager.enable = true;
  };

  services.strongswan = {
    enable = true;
    secrets = [
      "ipsec.d/ipsec.nm-l2tp.secrets"
    ];
  };
}
