{config, ...}: {
  imports = [./zimfw.nix];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    initExtraFirst = ''
      ##############################
      if [[ -r "${config.xdg.cacheHome}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "${config.xdg.cacheHome}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
      source ${config.programs.zsh.zimfw.homeDir}/modules/powerlevel10k/powerlevel10k.zsh-theme
      source ~/.config/zsh/p10k.zsh
      ##############################
    '';

    initExtra = builtins.readFile ./zshrc;

    history = {
      path = "${config.xdg.configHome}/zsh/history";
      size = 1000;
    };
  };

  xdg.configFile."zsh/p10k.zsh".source = ./p10k.zsh;
}
