{pkgs, ...}: {
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "t4nix";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Jakarta";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
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
    sddm.enable = true;
  };
}
