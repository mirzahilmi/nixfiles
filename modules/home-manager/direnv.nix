{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.direnv;
in {
  options.custom.programs.direnv = {
    enable = lib.mkEnableOption "direnv";
  };
  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = false;
      enableFishIntegration = false;
      enableNushellIntegration = false;
      nix-direnv.enable = true;
      config.global.hide_env_diff = true;
      stdlib = ''
        : "${config.xdg.cacheHome}"
        declare -A direnv_layout_dirs
        direnv_layout_dir() {
            local hash path
            echo "''${direnv_layout_dirs[$PWD]:=$(
                hash="$(sha1sum - <<< "$PWD" | head -c40)"
                path="''${PWD//[^a-zA-Z0-9]/-}"
                echo "${config.xdg.cacheHome}/direnv/layouts/''${hash}''${path}"
            )}"
        }
      '';
    };
  };
}
