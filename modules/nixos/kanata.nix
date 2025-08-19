{
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.kanata;
in {
  options.custom.programs.kanata = {
    enable = lib.mkEnableOption "Kanata";
  };

  config = lib.mkIf cfg.enable {
    services.kanata = {
      enable = true;
    };
  };
}
