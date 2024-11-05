{...} @ args: {
  imports = ["${args.inputs.nixpkgs-unstable}/nixos/modules/services/networking/cloudflare-warp.nix"];
  services.cloudflare-warp = {
    enable = true;
  };
}
