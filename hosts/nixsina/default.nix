{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.lenovo-legion-15arh05h
    (import ./disko.nix {device = "/dev/sda";})
    ../shared/users/mirza.nix
    ../shared
    ./hardware-configuration.nix
  ];
  networking.hostName = "nixsina";
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
    mtr.enable = true;
  };
  _programs = {
    virt-manager.enable = true;
    gns3.enable = true;
  };
  virtualization.docker = {
    enable = true;
  };
  # orchestration.k3s.enable = true;
  fonts.packages = builtins.attrValues {
    inherit
      (pkgs)
      ibm-plex
      times-newer-roman
      ;
    _ = pkgs.nerdfonts.override {fonts = ["IBMPlexMono" "Iosevka"];};
  };
  de.gnome = {
    enable = true;
    excludePackages = builtins.attrValues {
      inherit
        (pkgs)
        gnome-tour
        gnome-text-editor
        epiphany
        xterm
        gedit
        atomix
        cheese
        geary
        gnome-contacts
        gnome-maps
        gnome-music
        gnome-terminal
        hitori
        yelp
        tali
        iagno
        ;
    };
  };
}
