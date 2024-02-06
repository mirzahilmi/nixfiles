{
  buildVimPlugin,
  fetchFromGitHub,
  ...
}:
buildVimPlugin {
  pname = "telescope-fzf-native";
  version = "2023-09-10";
  src = fetchFromGitHub {
    owner = "nvim-telescope";
    repo = "telescope-fzf-native.nvim";
    rev = "6c921ca12321edaa773e324ef64ea301a1d0da62";
    sha256 = "101dxn7jfyg2wdzkw5cnrw475mg0p3w475l1hplqfhghz33zb1hy";
  };
  meta.homepage = "https://github.com/nvim-telescope/telescope-fzf-native.nvim/";

  buildPhase = ''
    make all
  '';
}
