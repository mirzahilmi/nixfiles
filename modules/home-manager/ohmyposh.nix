{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.ohmyposh;
in {
  options.custom.programs.ohmyposh = {
    enable = lib.mkEnableOption "ohmyposh";
  };
  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.oh-my-posh];
    xdg.configFile."oh-my-posh/config.json".source =
      config.lib.file.mkOutOfStoreSymlink
      "/home/mirza/.config/nixfiles/modules/home-manager/ohmyposh.json";
    programs.zsh.initContent = lib.mkIf config.custom.programs.zsh.enable ''
      eval "$(${lib.getExe pkgs.oh-my-posh} init zsh --config ${config.xdg.configHome}/oh-my-posh/config.json)"
    '';
  };
}
