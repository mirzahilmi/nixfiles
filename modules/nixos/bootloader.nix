{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.bootloader;
in {
  options.custom.programs.bootloader = {
    enable = lib.mkEnableOption "Bootloader";
    timeout = lib.mkOption {
      type = lib.types.int;
      default = 10;
      example = 5;
    };
  };

  config = lib.mkIf cfg.enable {
    boot.loader = {
      timeout = cfg.timeout;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        theme = pkgs.grubThemes.fallout;
        backgroundColor = "#000000";
      };
    };
  };
}
