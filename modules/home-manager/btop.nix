{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.btop;
in {
  options.custom.programs.btop = {
    enable = lib.mkEnableOption "btop";
  };
  config = lib.mkIf cfg.enable {
    programs.btop = {
      enable = true;
      settings = {
        theme_background = false;
        proc_sorting = "memory";
      };
    };
  };
}
