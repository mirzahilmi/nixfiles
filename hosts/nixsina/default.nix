# Host-level configuration
# (it replaces /etc/nixos/configuration.nix)
{inputs, ...}: {
  imports = [
    inputs.hardware.nixosModules.lenovo-legion-15arh05h

    ./hardware-configuration.nix
    ../common/global

    ../common/users/mirza

    ../common/extras/docker.nix
    ../common/extras/gnome-wayland.nix
    ../common/extras/pipewire.nix
    ../common/extras/zsh.nix
  ];

  networking = {
    hostName = "nixsina";
    networkmanager = {
      enable = true;
      enableStrongSwan = true;
    };
  };

  services.xl2tpd.enable = true;
  services.strongswan = {
    enable = true;
    secrets = [
      "ipsec.d/ipsec.nm-l2tp.secrets"
    ];
  };
}
