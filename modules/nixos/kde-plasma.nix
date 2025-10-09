{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.kde-plasma;
in {
  options.custom.programs.kde-plasma = {
    enable = lib.mkEnableOption "KDE Plasma";
  };

  config = lib.mkIf cfg.enable {
    services.desktopManager.plasma6.enable = true;
  };
}
