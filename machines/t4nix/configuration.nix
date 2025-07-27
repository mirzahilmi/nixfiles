{pkgs, ...}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "t4nix";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Jakarta";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
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
