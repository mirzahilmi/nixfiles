{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.bat;
in {
  options.custom.programs.bat = {
    enable = lib.mkEnableOption "bat";
  };
  config = lib.mkIf cfg.enable {
    programs.bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [batman];
    };
  };
}
