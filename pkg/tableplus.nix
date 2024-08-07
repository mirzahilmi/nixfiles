{pkgs, ...}: let
  tableplus = pkgs.stdenv.mkDerivation {
    name = "TablePlus";
    src = pkgs.fetchurl {
      url = "https://deb.tableplus.com/debian/pool/main/t/tableplus/tableplus_0.1.84_amd64.deb";
      sha256 = "01bfrv91hrigq5rni9vignlnhfr33zwhya5nivqi545cjmqfrv2w";
    };
    sourceRoot = "opt/tableplus";

    unpackPhase = ''
      runHook preUnpack
      dpkg-deb -x $src .
      runHook postUnpack
    '';

    installPhase = ''
      runHook preInstall
      ls -la
      mkdir -p "$out/bin"
      mkdir -p "$out/resource"
      cp -R "tableplus" "$out/bin/tableplus"
      cp -R "resource/" "$out/resource"
      chmod -R g-w "$out"
      # # Desktop file
      # mkdir -p "$out/share/applications"
      # cp "$desktopItem}/share/applications/"* "$out/share/applications"
      runHook postInstall
    '';

    nativeBuildInputs = with pkgs; [
      autoPatchelfHook
      dpkg
      makeWrapper
      wrapGAppsHook
    ];
    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      libgee
      json-glib
      openldap
      gtksourceview4
      gnome.libsecret
      gnome.gtksourceview
    ];
  };
in
  with pkgs;
    stdenv.mkDerivation {
      name = "testproj";
      buildInputs = [
        tableplus
      ];
      nativeBuildInputs = [
      ];
      shellHook = ''
        ${tableplus}/bin/.tableplus-wrapped
      '';
    }
