# Bootloader (GRUB) configuration
{ pkgs, outputs, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda"; # FIXME Change to the correct disk path
    useOSProber = true;

    theme = outputs.grub-themes.fallout;
  };
}
