{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.ghostty;
in {
  options.custom.programs.ghostty = {
    enable = lib.mkEnableOption "ghostty";
  };

  config = lib.mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
    };
    xdg.configFile."ghostty/config".source =
      config.lib.file.mkOutOfStoreSymlink
      # must be absolute path, cant use actual nix path type
      # because it'll be evalutead as in the nix store path
      "/home/mirza/.config/nixfiles/modules/home-manager/ghostty";
  };
}
