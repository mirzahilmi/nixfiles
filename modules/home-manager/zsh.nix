{
  pkgs,
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
    home.packages = [pkgs.nix-zsh-completions];
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
          "mattmc3/ez-compinit"
          "zsh-users/zsh-completions kind:fpath path:src"
          "belak/zsh-utils path:editor"
          "zsh-users/zsh-autosuggestions kind:defer"
          "zdharma-continuum/fast-syntax-highlighting kind:defer"
          "Aloxaf/fzf-tab kind:defer"
        ];
      };
      shellAliases = {
        v = "nvim";
        lg = "lazygit";
        mk = "make";
        k9 = "k9s";
      };
      initContent = let
        zshConfigFirst = lib.mkBefore ''
          ## Profiling zsh startup
          [[ -n "''${ZSH_DEBUGRC+1}" ]] && zmodload zsh/zprof
        '';
        zshConfig = ''
          if [ -x "$(command -v tmux)" ] && [ -n "''${WAYLAND_DISPLAY}" ] && [ -z "''${TMUX}" ]; then
            exec tmux new-session -A -s ''${USER} >/dev/null 2>&1
          fi

          fpath=($XDG_CACHE_HOME/zsh/completions $fpath)

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
      in
        lib.mkMerge [zshConfigFirst zshConfig];
    };
  };
}
