{
  lib,
  fetchFromGitHub,
  buildGoModule,
}: let
  version = "1.1.1";
in
  buildGoModule {
    pname = "bccli";
    inherit version;

    src = fetchFromGitHub {
      owner = "bccfilkom-be";
      repo = "bccli";
      rev = "v${version}";
      hash = "sha256-GUhOs6jYfihy1IKQES5rtKvnhRQjnu4gAniurJxOX3Y=";
    };

    vendorHash = "sha256-jxmmuXIvQfo9ZYhOowZMPYcjj0yPIZRkhKSF6pMqudc=";

    meta = with lib; {
      homepage = "https://github.com/bccfilkom-be/bccli";
      description = "artisan like cli for gophers ";
      license = licenses.mit;
      maintainers = with maintainers; [mirzahilmi];
    };
  }
