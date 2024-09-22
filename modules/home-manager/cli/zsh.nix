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
        "Aloxaf/fzf-tab kind:defer"
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
      # if [ -x "$(command -v tmux)" ] && [ -n "''${DISPLAY}" ] && [ -z "''${TMUX}" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
      #     exec tmux new-session -A -s ''${USER} >/dev/null 2>&1
      # fi
      bindkey -e
      autoload -z edit-command-line
      zle -N edit-command-line
      bindkey "^X^E" edit-command-line

      [[ -n "''${ZSH_DEBUGRC+1}" ]] && zprof
    '';
  };
}
