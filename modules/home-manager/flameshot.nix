{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.flameshot;
in {
  options.custom.programs.flameshot = {
    enable = lib.mkEnableOption "flameshot";
  };

  config = lib.mkIf cfg.enable {
    services.flameshot = {
      enable = true;
    };
  };
}
