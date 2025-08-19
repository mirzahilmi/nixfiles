{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.swayidle;
in {
  options.custom.programs.swayidle = {
    enable = lib.mkEnableOption "swayidle";
  };

  config = lib.mkIf cfg.enable {
    services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 60 * 30;
          command = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };
}
