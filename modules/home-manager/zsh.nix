{config, ...}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = false;
    history = {
      path = "${config.xdg.configHome}/zsh/history";
      extended = true;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
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
      if [ -x "$(command -v tmux)" ] && [ -n "''${DISPLAY}" ] && [ -z "''${TMUX}" ]; then
        exec tmux new-session -A -s ''${USER} >/dev/null 2>&1
      fi
      bindkey -e
      # ref: https://github.com/rothgar/mastering-zsh/blob/master/docs/config/history.md#configuration
      setopt INC_APPEND_HISTORY
      setopt HIST_FIND_NO_DUPS
      setopt HIST_SAVE_NO_DUPS
      setopt HIST_VERIFY
      setopt APPEND_HISTORY
      setopt HIST_NO_STORE
      [[ -n "''${ZSH_DEBUGRC+1}" ]] && zprof
    '';
  };
}
