{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.custom.programs.gromit-mpx;
in {
  options.custom.programs.gromit-mpx = {
    enable = lib.mkEnableOption "gromit-mpx";
  };

  config = lib.mkIf cfg.enable {
    services.gromit-mpx = {
      enable = true;
    };
  };
}
