# Bootloader (GRUB) configuration
{ pkgs, outputs, ... }:
{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };

    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 20;
      theme = outputs.grub-themes.fallout;
    };

    timeout = 10;
  };
}
