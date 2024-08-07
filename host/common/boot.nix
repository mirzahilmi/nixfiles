# Bootloader (GRUB) configuration
{pkgs, ...}: {
  boot = {
    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
    ];
    plymouth = {
      enable = true;
      theme = "bgrt";
    };
    loader = {
      timeout = 10;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/EFI";
      };
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 20;
        theme = pkgs.grubThemes.fallout;
      };
    };
  };
}
