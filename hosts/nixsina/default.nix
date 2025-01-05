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
  programs = {
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
    mtr.enable = true;
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  fonts.packages =
    builtins.attrValues {
      inherit
        (pkgs)
        ibm-plex
        times-newer-roman
        ;
    }
    ++ [(pkgs.nerdfonts.override {fonts = ["IBMPlexMono" "Iosevka"];})];

  desktop.gnome = {
    enable = true;
    excludePackages = builtins.attrValues {
      inherit
        (pkgs)
        atomix
        cheese
        epiphany
        geary
        gedit
        gnome-contacts
        gnome-maps
        gnome-music
        gnome-terminal
        gnome-text-editor
        gnome-tour
        hitori
        iagno
        tali
        xterm
        yelp
        ;
    };
  };
  custom = {
    programs = {
      virt-manager.enable = true;
      cloudflare-warp.enable = true;
    };
    services = {
      docker.enable = true;
      printer.enable = true;
    };
  };
}
