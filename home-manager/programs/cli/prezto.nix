{
  programs.zsh.prezto = {
    enable = true;
    pmodules = [
      "environment"
      "terminal"
      "editor"
      "history"
      "directory"
      "spectrum"
      "utility"
      "completion"
      "prompt"
      "syntax-highlighting"
      "history-substring-search"
      "autosuggestions"
    ];
    prompt.theme = "powerlevel10k";
  };
}