{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.hyprcursor;
in {
  options.custom.programs.hyprcursor = {
    enable = lib.mkEnableOption "hyprcursor";
  };

  config = lib.mkIf cfg.enable {
    home.pointerCursor = {
      enable = true;
      name = "Breeze Light";
    };
  };
}
