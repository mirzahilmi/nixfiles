{config, ...}: {
  programs.zsh.zimfw = {
    enable = true;
    homeDir = "${config.xdg.configHome}/zimfw";

    # TODO: Fix git/curl command not found upon module fetch
    zmodules = [
      "archive"
      "completion"
      "fzf"
      "utility"

      "romkatv/powerlevel10k --name powerlevel10k --use degit"
      "zdharma-continuum/fast-syntax-highlighting --name fast-syntax-highlighting"
      "zsh-users/zsh-autosuggestions --name zsh-autosuggestions"
      "sorin-ionescu/prezto --name prezto-keybindings --root modules/editor"
    ];
  };
}
