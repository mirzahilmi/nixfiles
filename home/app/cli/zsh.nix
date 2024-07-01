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
      ## See https://gist.github.com/ctechols/ca1035271ad134841284?permalink_comment_id=3994613#gistcomment-3994613
      autoload -Uz compinit
      for dump in ~/.zcompdump(N.mh+24); do
        compinit
      done
      compinit -C
    '';
    initExtraFirst = ''
      ## Profiling zsh startup
      if [ -n "''${ZSH_DEBUGRC+1}" ]; then
          zmodload zsh/zprof
      fi
    '';
    initExtra = ''
      if [ -x "$(command -v tmux)" ] && [ -n "''${DISPLAY}" ] && [ -z "''${TMUX}" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
          exec tmux new-session -A -s ''${USER} >/dev/null 2>&1
      fi
      bindkey -e
      zstyle ':fzf-tab:*' fzf-flags --height=90%
      autoload -z edit-command-line
      zle -N edit-command-line
      bindkey "^X^E" edit-command-line

      if [ -n "''${ZSH_DEBUGRC+1}" ]; then
          zprof
      fi
    '';
  };
}
