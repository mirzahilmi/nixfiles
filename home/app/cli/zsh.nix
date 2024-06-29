{config, ...}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    history = {
      path = "${config.xdg.configHome}/zsh/history";
      size = 2500;
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      ignoreDups = true;
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
        "Aloxaf/fzf-tab kind:defer"
      ];
    };
    completionInit = ''
      # See https://gist.github.com/ctechols/ca1035271ad134841284
      autoload -Uz compinit
      for dump in ~/.zcompdump(N.mh+24); do
        compinit
      done
      compinit -C
    '';
    initExtraFirst = ''
      # zmodload zsh/zprof
    '';
    initExtra = ''
      bindkey -e
      # zprof
    '';
  };
}
