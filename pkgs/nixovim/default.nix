{
  stdenv,
  neovim,
  fetchFromGitHub,
  ...
}:
stdenv.mkDerivation {
  pname = "nixovim";
  version = "0.1.6";

  src = fetchFromGitHub {
    owner = "nvim-lua";
    repo = "kickstart.nvim";
    rev = "bc4ad1218b908ec4efc3b0f6ea6e3cb4940b0084";
    sha256 = "sha256-lkDwjCX2KheZy/JT/CZsBEVIMdifmjR25/IXYXQFADA=";
  };

  dontPatch = true;
  dontConfigure = true;

  nativeBuildInputs = [neovim];
  buildPhase = ''
    runHook preBuild
    nvim --headless "+Lazy! sync" +qa
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -aR $src/{lua,init.lua} $out

    runHook postInstall
  '';
}
