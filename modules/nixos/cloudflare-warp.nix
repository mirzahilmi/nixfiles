{
  config,
  lib,
  ...
}: let
  cfg = config._services.warp-svc;
in {
  options._services.warp-svc = {
    enable = lib.mkEnableOption "Cloudflare Zero Trust client daemon";
  };

  config = lib.mkIf cfg.enable {
    services.cloudflare-warp = {
      enable = true;
    };
  };
}
