{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "oil-git-status-nvim";
  src = fetchFromGitHub {
    owner = "refractalize";
    repo = "oil-git-status.nvim";
    rev = "a7ea816bac0cc3b8b4c3605e2f2b87960be60a05";
    hash = "sha256-IXjpuzWipF7Pjp4N92ZuNKktYNe5oTYzyCykqkmNRkg=";
  };
}
