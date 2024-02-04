{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.neovim;

  nixovimModule = types.submodule {
    options = {
      enable = mkEnableOption "nixovim";

      # TODO: Plugins option to add & customize neovim plugin
      # plugins = {
      #   type = types.listOf types.str;
      # };
    };
  };
in {
  meta.maintainers = [maintainers.mirzahilmi];

  options = {
    programs.neovim = {
      nixovim = mkOption {
        type = nixovimModule;
        default = {};
        description = "Options to configure nixovim.";
      };
    };
  };

  config = mkIf cfg.nixovim.enable {
    xdg.configFile."nvim".source = pkgs.nixovim;
  };
}
