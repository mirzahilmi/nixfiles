{config, ...}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = false;
    history = {
      path = "${config.xdg.configHome}/zsh/history";
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
      ];
    };
    completionInit = ''
      ## See https://gist.github.com/ctechols/ca1035271ad134841284
      autoload -Uz compinit
      [[ -n ''${ZDOTDIR}/.zcompdump(#qN.mh+24) ]] && compinit || compinit -C
    '';
    initExtraFirst = ''
      ## Profiling zsh startup
      [[ -n "''${ZSH_DEBUGRC+1}" ]] && zmodload zsh/zprof
    '';
    initExtra = ''
      bindkey -e
      [[ -n "''${ZSH_DEBUGRC+1}" ]] && zprof
    '';
  };
}
