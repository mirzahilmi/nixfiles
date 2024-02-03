{
  stdenv,
  neovim,
  ...
}:
stdenv.mkDerivation {
  pname = "nixovim";
  version = "0.1.0";

  src = fetchGit {
    url = "https://github.com/nvim-lua/kickstart.nvim.git";
  };

  buildInputs = [neovim];
  buildPhase = ''
    runHook preBuild
    nvim --headless "+Lazy! sync" +qa
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir $out
    cp -a $src/. $out
    runHook postInstall
  '';
}
