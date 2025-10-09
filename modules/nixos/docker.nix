{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.docker;
in {
  options.custom.programs.docker = {
    enable = lib.mkEnableOption "Docker";
    autoStart = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    storageDriver = lib.mkOption {
      type =
        lib.types.nullOr
        <| lib.types.enum [
          "aufs"
          "btrfs"
          "devicemapper"
          "overlay"
          "overlay2"
          "zfs"
        ];
      default = null;
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      enableOnBoot = cfg.autoStart;
      autoPrune.enable = true;
      storageDriver = cfg.storageDriver;
    };
  };
}
