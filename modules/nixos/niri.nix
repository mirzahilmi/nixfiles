{
  lib,
  config,
  inputs,
  pkgs,
  ...
}: let
  cfg = config.custom.programs.niri;
in {
  imports = [inputs.niri.nixosModules.niri];

  options.custom.programs.niri = {
    enable = lib.mkEnableOption "niri";
  };

  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;
      # see https://github.com/sodiboo/niri-flake?tab=readme-ov-file#using-niri-unstable
      package = pkgs.niri-stable;
    };
  };
}
