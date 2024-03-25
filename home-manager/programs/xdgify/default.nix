{config, ...}: {
  home.sessionVariables = {
    # Docker : ~/.docker
    DOCKER_CONFIG = "${config.xdg.configHome}/docker";
    # CUDA/NVIDIA : ~/.nv
    CUDA_CACHE_PATH = "${config.xdg.cacheHome}/nv";
    # Go : ~/go
    GOPATH = "${config.xdg.dataHome}/go";
    GOMODCACHE = "${config.xdg.cacheHome}/go/mod";
    # NPM : ~/.npm
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
    # Kubernetes : ~/.kube
    KUBECONFIG = "${config.xdg.configHome}/kube/config";
    KUBECACHEDIR = "${config.xdg.cacheHome}/kube";
    "_JAVA_OPTIONS=-Djava.util.prefs.userRoot" = "${config.xdg.configHome}/java";
    GRADLE_USER_HOME = "${config.xdg.dataHome}/gradle";
    # !/.bash_history
    HISTFILE = "${config.xdg.stateHome}/bash/history";
  };

  # NPM : ~/.npm
  xdg.configFile."npm/npmrc".text = ''
    prefix=${config.xdg.dataHome}/npm
    cache=${config.xdg.cacheHome}/npm
    init-module=${config.xdg.configHome}/npm/config/npm-init.js
    logs-dir=${config.xdg.stateHome}/npm/logs
  '';
}
