{
  lib,
  fetchFromGitHub,
  buildGoModule,
}: let
  version = "1.2.1";
in
  buildGoModule {
    pname = "bccli";
    inherit version;

    src = fetchFromGitHub {
      owner = "bccfilkom-be";
      repo = "bccli";
      rev = "v${version}";
      hash = "sha256-sSEK5Sub5Nnuy17HI5xaqPTxLmtcUvZhPTOXS+KiZ6E=";
    };

    vendorHash = "sha256-jxmmuXIvQfo9ZYhOowZMPYcjj0yPIZRkhKSF6pMqudc=";

    meta = with lib; {
      homepage = "https://github.com/bccfilkom-be/bccli";
      description = "artisan like cli for gophers ";
      license = licenses.mit;
      maintainers = with maintainers; [mirzahilmi];
    };
  }
