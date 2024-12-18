{
  lib,
  config,
  ...
}: let
  cfg = config.custom.services.printer;
in {
  options.custom.services.printer = {
    enable = lib.mkEnableOption "Printing";
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
