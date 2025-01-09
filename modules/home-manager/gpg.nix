{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.gpg;
in {
  options.custom.programs.gpg = {
    enable = lib.mkEnableOption "gpg";
    cacheTime = lib.mkOption {
      type = lib.types.int;
      default = 86400;
      example = 3600;
    };
  };
  config = lib.mkIf cfg.enable {
    programs.gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
    };
    services.gpg-agent = {
      enable = true;
      verbose = true;
      defaultCacheTtl = 3600;
      maxCacheTtl = cfg.cacheTime;
      pinentryPackage = pkgs.pinentry-gnome3;
    };
  };
}
