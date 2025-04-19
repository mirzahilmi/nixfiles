{pkgs, ...}: {
  boot.loader = {
    timeout = 10;
    efi = {canTouchEfiVariables = true;};
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      theme = pkgs.grubThemes.fallout;
      backgroundColor = "#000000";
    };
  };
}
