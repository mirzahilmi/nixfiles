{...}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    initExtraFirst = ''
    '';

    initExtra = ''
    '';
  };
}
