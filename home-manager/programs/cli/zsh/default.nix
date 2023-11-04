{config, ...}: {
  imports = [./zimfw.nix];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    initExtraFirst = ''
      if [[ -z "$TMUX" && -z "$EMACS" && -z "$VIM" && -z "$INSIDE_EMACS" && "$TERM_PROGRAM" != "vscode" ]]; then
        exec tmux new-session -A -s workspace
      fi

      if [[ -r "${config.xdg.cacheHome}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "${config.xdg.cacheHome}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
      source ${config.programs.zsh.zimfw.homeDir}/modules/powerlevel10k/powerlevel10k.zsh-theme
      source ~/.config/zsh/p10k.zsh
    '';

    initExtra = ''
      export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
      export DIRENV_LOG_FORMAT=""
      flakify() {
        if [ ! -e flake.nix ]; then
          nix flake new -t github:nix-community/nix-direnv .
        elif [ ! -e .envrc ]; then
          echo "use flake" > .envrc
          direnv allow
        fi
      }
    '';

    history = {
      path = "${config.xdg.configHome}/zsh/history";
      size = 1000;
    };
  };

  xdg.configFile."zsh/p10k.zsh".source = ./p10k.zsh;
}
