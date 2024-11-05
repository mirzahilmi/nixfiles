{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config._services.gns3-server;
in {
  options._services.gns3-server = {
    enable = lib.mkEnableOption "GNS3 Server";
    gui = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Enable GNS3 GUI";
    };
  };

  config = lib.mkIf cfg.enable {
    services.gns3-server = {
      enable = true;
      vpcs.enable = true;
      ubridge.enable = true;
      dynamips.enable = true;
    };
    environment.systemPackages = lib.mkIf cfg.gui [pkgs.gns3-gui];
  };
}
