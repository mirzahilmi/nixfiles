{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.lenovo-thinkpad-t480s
    ./hardware-configuration.nix
    ../shared
    ../../users/mirza/nixos.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "t4nix"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    (where-is-my-sddm-theme.override {
      variants = ["qt5"];
      themeConfig.General = {
        passwordCharacter = "*";
        passwordMask = true;
        passwordInputWidth = 0.5;
        passwordInputCursorVisible = false;
        passwordFontSize = 96;
        passwordCursorColor = "random";
        showSessionsByDefault = true;
        sessionsFontSize = 24;
        showUsersByDefault = true;
        usersFontSize = 48;
        backgroundFill = "#000000";
        backgroundFillMode = "aspect";
        basicTextColor = "#ffffff";
      };
    })
  ];

  # services.displayManager.ly = {
  #   enable = true;
  # };
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "where_is_my_sddm_theme_qt5";
  };

  fonts.packages = builtins.attrValues {
    inherit
      (pkgs.nerd-fonts)
      blex-mono
      iosevka
      ;
  };

  console = {
    packages = [pkgs.terminus_font];
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    keyMap = "us";
  };

  custom.programs = {
    sway.enable = true;
    docker.enable = true;
    niri.enable = true;
  };
}
