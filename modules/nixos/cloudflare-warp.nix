{
  inputs,
  config,
  lib,
  ...
}: let
  cfg = config._services.warp-svc;
in {
  imports = [(inputs.nixpkgs-unstable + "/nixos/modules/services/networking/cloudflare-warp.nix")];

  options._services.warp-svc = {
    enable = lib.mkEnableOption "Cloudflare Zero Trust client daemon";
  };

  config = lib.mkIf cfg.enable {
    services.cloudflare-warp = {
      enable = true;
    };
  };
}
