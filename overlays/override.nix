{
  finalPkgs,
  prevPkgs,
}: {
  btop = prevPkgs.btop.override {cudaSupport = true;};
  monaspace = prevPkgs.monaspace.overrideAttrs (final: previous: {
    version = "1.200";
    src = finalPkgs.fetchzip {
      url = "https://github.com/githubnext/monaspace/releases/download/v${final.version}/monaspace-v${final.version}.zip";
      stripRoot = false;
      hash = "sha256-j1xQYVxfTNDVuzCKvT5FbU29t8XsH4XqcZ477sjydts=";
    };
  });
  vesktop = prevPkgs.vesktop.overrideAttrs (_: prev: {
    desktopItems = (builtins.elemAt prev.desktopItems 0).override {
      icon = "${../imgs/discord.svg}";
      desktopName = "Discord";
    };
  });
}
