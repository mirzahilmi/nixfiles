{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.orchestration.kubernetes;
in {
  options.orchestration.kubernetes = {
    enable = lib.mkEnableOption "Local Kubernetes";
    aliasKubectl = lib.mkOption {
      type = lib.types.string;
      default = "";
      example = "kube";
      description = "Alias for kubectl";
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = builtins.attrValues {
      inherit (pkgs.unstable) kind kubectl kubernetes-helm;
    };
    programs.zsh.shellAliases = lib.mkIf (cfg.aliasKubectl != "") {
      "${cfg.aliasKubectl}" = "kubectl";
    };

    home.sessionVariables.KUBECONFIG = "${config.xdg.configHome}/kube/config";
  };
}
