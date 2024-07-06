{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "native-vim-colorschemes";
  src = fetchFromGitHub {
    owner = "vim";
    repo = "colorschemes";
    rev = "c8bc289fc391c622b4b1395641c678041c114682";
    sha256 = "sha256-BIT4FdXUS8YEeL4eNc6rzO8b5Tz4ztzjZMalzPMOgOs=";
  };
}
