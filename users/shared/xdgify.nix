{config, ...}: {
  xdg.enable = true;
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
    # # Kubernetes : ~/.kube
    KUBECACHEDIR = "${config.xdg.cacheHome}/kube";
    GRADLE_USER_HOME = "${config.xdg.dataHome}/gradle";
    # !/.bash_history
    HISTFILE = "${config.xdg.stateHome}/bash/history";
    # ~/.ansible
    ANSIBLE_HOME = "${config.xdg.dataHome}/ansible";
    # ~/.dotnet
    # ~/.templateengine
    DOTNET_CLI_HOME = "${config.xdg.dataHome}/dotnet";
    NUGET_PACKAGES = "${config.xdg.cacheHome}/NuGetPackages";
    # ~/.python_history
    PYTHONSTARTUP = "${config.xdg.configHome}/python/pythonrc";
    # ~/.kube
    KUBECONFIG = "${config.xdg.configHome}/kube/config";
  };

  # NPM : ~/.npm
  xdg.configFile."npm/npmrc".text = ''
    prefix=${config.xdg.dataHome}/npm
    cache=${config.xdg.cacheHome}/npm
    init-module=${config.xdg.configHome}/npm/config/npm-init.js
    logs-dir=${config.xdg.stateHome}/npm/logs
  '';

  # ~/.python_history
  xdg.configFile."python/pythonrc".text =
    # Python
    ''
      def is_vanilla() -> bool:
          """ :return: whether running "vanilla" Python <3.13 """
          import sys
          return not hasattr(__builtins__, '__IPYTHON__') and 'bpython' not in sys.argv[0] and sys.version_info < (3, 13)


      def setup_history():
          """ read and write history from state file """
          import os
          import atexit
          import readline
          from pathlib import Path

          # Check PYTHON_HISTORY for future-compatibility with Python 3.13
          if history := os.environ.get('PYTHON_HISTORY'):
              history = Path(history)
          # https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables
          elif state_home := os.environ.get('XDG_STATE_HOME'):
              state_home = Path(state_home)
          else:
              state_home = Path.home() / '.local' / 'state'

          history: Path = history or state_home / 'python_history'

          # https://github.com/python/cpython/issues/105694
          if not history.is_file():
              readline.write_history_file(str(history)) # breaks on macos + python3 without this.

          readline.read_history_file(history)
          atexit.register(readline.write_history_file, history)


      if is_vanilla():
          setup_history()
    '';
}
