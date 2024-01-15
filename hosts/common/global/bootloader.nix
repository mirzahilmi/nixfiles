# Bootloader (GRUB) configuration
{ pkgs, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
    useOSProber = true;
  }
}
