{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.custom.programs.lazydocker;
in {
  options.custom.programs.lazydocker = {
    enable = lib.mkEnableOption "lazydocker";
  };
  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.lazydocker];
  };
}
