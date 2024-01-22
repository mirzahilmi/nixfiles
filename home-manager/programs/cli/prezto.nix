{
  programs.zsh.prezto = {
    enable = true;
    pmodules = pmodules ++ [
      "syntax-highlighting"
      "history-substring-search"
      "autosuggestions"
    ];
    prompt.theme = "powerlevel10k";
  };
}