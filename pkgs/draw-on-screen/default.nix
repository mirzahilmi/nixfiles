{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "draw-on-screen";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "zhrexl";
    repo = "DrawOnYourScreen2";
    rev = "a7469e21ce2b7cc08bbc018c92124c7ba17fad4b";
    sha256 = "sha256-1oFfHQyGKlMSyN7pItDOeyqjoxpDZW55QeIfwh9SPYk=";
  };

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/gnome-shell/extensions/
    cp -r -T . $out/share/gnome-shell/extensions/draw-on-your-screen2@zhrexl.github.com
    runHook postInstall
  '';
}
