{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.lazygit;
in {
  options.custom.programs.lazygit = {
    enable = lib.mkEnableOption "lazygit";
  };
  config = lib.mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
      settings = {
        git = {
          overrideGpg = true;
          paging = {
            colorArg = "always";
            pager = "delta --dark --paging=never";
          };
        };
      };
    };
  };
}
