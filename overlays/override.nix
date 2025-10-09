{
  final,
  prev,
}: {
  btop = prev.btop.override {cudaSupport = true;};

  monaspace = prev.monaspace.overrideAttrs (finalAttrs: _: {
    version = "1.200";
    src = final.fetchzip {
      url = "https://github.com/githubnext/monaspace/releases/download/v${finalAttrs.version}/monaspace-v${finalAttrs.version}.zip";
      stripRoot = false;
      hash = "sha256-j1xQYVxfTNDVuzCKvT5FbU29t8XsH4XqcZ477sjydts=";
    };
  });

  vesktop = prev.vesktop.overrideAttrs (_: prevAttrs: {
    desktopItems = (builtins.elemAt prevAttrs.desktopItems 0).override {
      icon = "${../imgs/discord.svg}";
      desktopName = "Discord";
    };
  });

  freerdp = prev.freerdp.overrideAttrs (_: prevAttrs: {
    src = final.fetchFromGitHub {
      owner = "FreeRDP";
      repo = "FreeRDP";
      rev = "3.17.2";
      hash = "sha256-r9a+tQ3QIBfF4Vtyo4F4dwqLloxJTTFUQFV8J53ITZ4=";
    };
  });
}
