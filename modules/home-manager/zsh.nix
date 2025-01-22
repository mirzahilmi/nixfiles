{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.zsh;
in {
  options.custom.programs.zsh = {
    enable = lib.mkEnableOption "zsh";
    cleanHistory = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
    };
  };
  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      dotDir = ".config/zsh";
      enableCompletion = false;
      history = {
        path = "${config.xdg.configHome}/zsh/history";
        extended = cfg.cleanHistory;
        expireDuplicatesFirst = cfg.cleanHistory;
        ignoreDups = cfg.cleanHistory;
        ignoreAllDups = cfg.cleanHistory;
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
        zstyle ':completion:*' menu no
        [[ -n "''${ZSH_DEBUGRC+1}" ]] && zprof
      '';
    };
  };
}
