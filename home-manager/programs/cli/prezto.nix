{
  programs.zsh.prezto = {
    enable = true;
    pmodules = programs.zsh.prezto.pmodules ++ [
      "syntax-highlighting"
      "history-substring-search"
      "autosuggestions"
    ];
    prompt.theme = "powerlevel10k";
  };
}