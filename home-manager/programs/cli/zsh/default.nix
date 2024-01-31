{
  pkgs,
  config,
  ...
}: {
  imports = [./zimfw.nix];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    initExtraFirst = builtins.readFile ./p10k.config.zsh;
    initExtra = builtins.readFile ./zshrc;

    history = {
      path = "${config.xdg.configHome}/zsh/history";
      size = 1000;
    };
  };

  xdg.configFile."zsh/p10k.zsh".source = ./p10k.zsh;
}
