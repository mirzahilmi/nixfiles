{
  inputs,
  pkgs,
  osConfig,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.lenovo-legion-15arh05h
    inputs.disko.nixosModules.disko
    (import ./disko.nix {device = "/dev/sda";})
    ../shared
    ./hardware-configuration.nix
    ../../users/mirza/nixos.nix
  ];

  networking.hostName = "nixsina";
  services.pulseaudio.enable = false;
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
  fonts.packages = builtins.attrValues {
    inherit
      (pkgs)
      ibm-plex
      times-newer-roman
      ;
    inherit
      (pkgs.nerd-fonts)
      blex-mono
      iosevka
      iosevka-term
      ;
  };

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
      bootloader.enable = true;
      docker.enable = true;
      locale.enable = true;
      virt-manager.enable = true;
      cloudflare-warp.enable = true;
    };
    services = {
      printer.enable = true;
    };
  };

  services.openssh.enable = true;
  networking = {
    defaultGateway = "10.34.238.1";
    nameservers = [
      "10.34.0.53"
      "175.45.184.73"
      "175.45.184.165"
    ];
    interfaces.eno1.ipv4.addresses = [
      {
        address = "10.34.239.56";
        prefixLength = 23;
      }
    ];
  };
  services.logind.lidSwitch = "lock";
}
