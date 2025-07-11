{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.sway;
in {
  options.custom.programs.sway = {
    enable = lib.mkEnableOption "sway";
  };
  config = lib.mkIf cfg.enable {
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
  };
}
