{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.custom.programs.i3;
in {
  options.custom.programs.i3 = {
    enable = lib.mkEnableOption "i3";
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;
      windowManager.i3 = {
        enable = true;
      };
    };
  };
}
