{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.anyrun;
in {
  options.custom.programs.anyrun = {
    enable = lib.mkEnableOption "anyrun";
  };

  config = lib.mkIf cfg.enable {
    programs.anyrun = {
      enable = true;
      config = {
        plugins = with pkgs.anyrun-plugins; [applications];
        closeOnClick = true;
        width.absolute = 600;
        height.absolute = 0;
      };
    };
  };
}
