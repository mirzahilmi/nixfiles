{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.lenovo-legion-15arh05h
    (import ./disko.nix {device = "/dev/sda";})
    ./hardware-configuration.nix
    ./font.nix
    ./sops.nix

    ../shared
    ../shared/locales
    ../shared/users/mirza.nix
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
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  _services = {
    warp-svc.enable = true;
    printer.enable = true;
  };
  programs = {
    wireshark.enable = true;
  };
  _programs = {
    virt-manager.enable = true;
    gns3.enable = true;
  };
  virtualization.docker.enable = true;
  orchestration.k3s.enable = true;
}
