{
  inputs,
  prevPkgs,
}: let
  # pkgs = import inputs.nixpkgs {
  #   inherit (finalPkgs) system;
  #   config = {
  #     allowUnfree = true;
  #     allowUnfreePredicate = _: true;
  #   };
  # };
  overrideArg = pkg: args: pkg.override args;
in {
  vesktop =
    prevPkgs.vesktop.overrideAttrs (_: prev: {
        desktopItems = (builtins.elemAt prev.desktopItems 0 |> overrideArg) {
          icon = "${../imgs/discord.svg}";
          desktopName = "Discord";
        };
    });
}
