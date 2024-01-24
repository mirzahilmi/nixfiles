{ stdenv, pkgs, ...}:
{
  nvchad = stdenv.mkDerivation rec {
    pname = "nvchad";
    version = "2.0";
    dontBuild = true;

    src = pkgs.fetchFromGitHub {
      owner = "NvChad";
      repo = "NvChad";
      rev = "v2.0";
      sha256 = "sha256-J4SGwo/XkKFXvq+Va1EEBm8YOQwIPPGWH3JqCGpFnxY=";
    };

    installPhase = ''
      mkdir $out
      cp -aR $src/* $out/
    '';
  };
}