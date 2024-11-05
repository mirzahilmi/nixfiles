{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.lenovo-legion-15arh05h
    inputs.disko.nixosModules.disko

    (import ./disko.nix {device = "/dev/sda";})
    ./hardware-configuration.nix
    ./font.nix

    ../shared
    ../shared/locales
    ../shared/users/mirza.nix

    ../../modules/nixos/cloudflare-warp.nix
    # ../../modules/nixos/docker.nix
    # ../../modules/nixos/gns3.nix
    ../../modules/nixos/libvirt.nix
    ../../modules/nixos/mtr.nix
    ../../modules/nixos/networkmanager.nix
    ../../modules/nixos/pipewire.nix
    ../../modules/nixos/podman.nix
    ../../modules/nixos/printer.nix
    ../../modules/nixos/sops.nix
    # ../../modules/nixos/virtualbox.nix
    ../../modules/nixos/wireshark.nix
    ../../modules/nixos/gnome-de.nix
  ];
  networking.hostName = "nixsina";
  de.gnome = {
    enable = true;
    tripleBuffering = true;
    excludePackages = with pkgs;
      [
        gnome-tour
        gnome-text-editor
        epiphany
        xterm
        gedit
      ]
      ++ (with gnome; [
        cheese
        gnome-music
        gnome-terminal
        gnome-contacts
        gnome-maps
        geary
        yelp
        epiphany
        geary
        tali
        iagno
        hitori
        atomix
      ]);
  };
}
