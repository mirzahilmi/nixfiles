# Bootloader (GRUB) configuration
{
  pkgs,
  inputs,
  ...
}: {
  boot.loader = {
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
      theme = inputs.grub-themes.packages.${pkgs.system}.fallout;
    };

    timeout = 10;
  };
  boot.kernelParams = [
    "sysrq_always_enabled=1"
  ];
}
