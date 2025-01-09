{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.tldr;
in {
  options.custom.programs.tldr = {
    enable = lib.mkEnableOption "tldr";
    autoUpdate = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
    };
  };
  config = lib.mkIf cfg.enable {
    programs.tealdeer = {
      enable = true;
      settings = {
        updates.auto_update = cfg.autoUpdate;
      };
    };
  };
}
