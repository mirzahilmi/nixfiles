{outputs, ...}: {
  imports = [outputs.homeManagerModules.zimfw];
  programs.zsh.zimfw = {
    enable = true;

    # TODO: Fix git/curl command not found upon module fetch
    modules = [
      "archive"
      "completion"
      "input"
      "fzf"
      "utility"

      "romkatv/powerlevel10k --name powerlevel10k"
      "zsh-users/zsh-syntax-highlighting --name zsh-syntax-highlighting"
      "zsh-users/zsh-autosuggestions --name zsh-autosuggestions"
    ];
  };
}
