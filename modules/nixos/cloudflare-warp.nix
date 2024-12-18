{
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.cloudflare-warp;
in {
  options.custom.programs.cloudflare-warp = {
    enable = lib.mkEnableOption "Cloudflare Zero Trust client daemon";
  };

  config = lib.mkIf cfg.enable {
    services.cloudflare-warp = {
      enable = true;
    };
  };
}
