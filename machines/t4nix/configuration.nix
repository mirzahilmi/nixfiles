{
  pkgs,
  lib,
  ...
}: {
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
      iosevka-term
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

  # Suspend the system when battery level drops below 20%
  services.udev.extraRules = lib.strings.concatMapStringsSep "\n" (pattern: ''
    SUBSYSTEM=="power_supply", ATTR{status}=="Discharging", ATTR{capacity}=="${pattern}", RUN+="${pkgs.systemd}/bin/systemctl --check-inhibitors=no poweroff"
  '') ["[0-9]" "1[0-9]"];
}
