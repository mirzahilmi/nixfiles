{config, ...}: {
  programs.zsh.zimfw = {
    enable = true;

    # TODO: Fix git/curl command not found upon module fetch
    modules = [
      "archive"
      "completion"
      "fzf"
      "utility"

      "romkatv/powerlevel10k --name powerlevel10k"
      "zdharma-continuum/fast-syntax-highlighting --name fast-syntax-highlighting"
      "zsh-users/zsh-autosuggestions --name zsh-autosuggestions"
      "sorin-ionescu/prezto --name prezto-modules --root modules/editor"
      "sorin-ionescu/prezto --name prezto-modules --root modules/tmux"
    ];
  };
}
