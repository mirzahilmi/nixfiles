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
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
      hyprcursor.enable = true;
    };
  };
}
