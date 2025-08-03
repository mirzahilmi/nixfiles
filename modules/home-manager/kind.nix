{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.kind;
in {
  options.custom.programs.kind = {
    enable = lib.mkEnableOption "Local Kubernetes";
    aliasKubectl = lib.mkOption {
      type = lib.types.str;
      default = "kube";
      example = "kube";
      description = "Alias for kubectl";
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = builtins.attrValues {
      inherit (pkgs.unstable) kind kubectl kubernetes-helm kubectl-explore;
    };
    programs.zsh.shellAliases = lib.mkIf (cfg.aliasKubectl != "") {
      "${cfg.aliasKubectl}" = "kubectl";
    };

    home.sessionVariables.KUBECONFIG = "${config.xdg.configHome}/kube/config";
  };
}
