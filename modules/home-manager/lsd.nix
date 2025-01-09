{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.lsd;
in {
  options.custom.programs.lsd = {
    enable = lib.mkEnableOption "lsd";
  };
  config = lib.mkIf cfg.enable {
    programs.lsd = {
      enable = true;
      enableAliases = true;
    };
  };
}
