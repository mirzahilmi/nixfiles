{config, ...}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    history = {
      path = "${config.xdg.configHome}/zsh/history";
      size = 2500;
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      share = true;
    };
    antidote = {
      enable = true;
      useFriendlyNames = true;
      plugins = [
        "mattmc3/zephyr path:plugins/completion"
        "belak/zsh-utils path:editor"
        "zsh-users/zsh-autosuggestions kind:defer"
        "zdharma-continuum/fast-syntax-highlighting kind:defer"
      ];
    };
    initExtra = ''
      bindkey -e
    '';
  };
}
