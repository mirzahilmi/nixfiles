{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.wbg;
in {
  options.custom.programs.wbg = {
    enable = lib.mkEnableOption "wbg";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.wbg];
    # see https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup
    systemd.user.services.wbg = {
      Install.WantedBy = ["graphical-session.target"];
      Unit = {
        PartOf = "graphical-session.target";
        After = "graphical-session.target";
        Requisite = "graphical-session.target";
      };
      Service = {
        ExecStart = "${pkgs.wbg}/bin/wbg /home/mirza/Downloads/sceenery.png";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
