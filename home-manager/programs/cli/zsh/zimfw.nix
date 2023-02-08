{config, ...}: {
  programs.zsh.zimfw = {
    enable = true;
    homeDir = "${config.xdg.configHome}/zimfw";
    zmodules = [
      "completion"
      "archive"
      "utility"

      "romkatv/powerlevel10k --name powerlevel10k --use degit"
      "zdharma-continuum/fast-syntax-highlighting --name fast-syntax-highlighting --use degit"
      "zsh-users/zsh-autosuggestions --name zsh-autosuggestions --use degit"
      "sorin-ionescu/prezto --name prezto-keybindings --root modules/editor"
    ];
  };
}
