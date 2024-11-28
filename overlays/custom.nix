{
  finalPkgs,
  prevPkgs,
}: let
  overrideArg = pkg: args: pkg.override args;
in {
  btop = prevPkgs.btop.override {cudaSupport = true;};
  vesktop =
    prevPkgs.vesktop.overrideAttrs (_: prev: {
        desktopItems = (builtins.elemAt prev.desktopItems 0 |> overrideArg) {
          icon = "${../imgs/discord.svg}";
          desktopName = "Discord";
        };
    });
}
