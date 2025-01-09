{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.obs;
in {
  options.custom.programs.obs = {
    enable = lib.mkEnableOption "obs";
  };
  config = lib.mkIf cfg.enable {
    programs.obs-studio = {
      enable = true;
      plugins = builtins.attrValues {
        inherit
          (pkgs.obs-studio-plugins)
          wlrobs
          input-overlay
          obs-backgroundremoval
          obs-pipewire-audio-capture
          ;
      };
    };
  };
}
