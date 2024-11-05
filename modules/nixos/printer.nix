{
  lib,
  config,
  ...
}: let
  cfg = config._services.printer;
in {
  options._services.printer = {
    enable = lib.mkEnableOption "Printing capability";
    autodiscover = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Enable autodiscovery of network printers via IPP";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      printing.enable = true;
      avahi = lib.mkIf cfg.autodiscover {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
  };
}
