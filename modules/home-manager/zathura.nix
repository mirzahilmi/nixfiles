{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.zathura;
in {
  options.custom.programs.zathura = {
    enable = lib.mkEnableOption "zathura";
  };

  config = lib.mkIf cfg.enable {
    programs.zathura = {
      enable = true;
    };
  };
}
