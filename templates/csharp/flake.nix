{
  description = "A Nix-flake-based .NET development environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forEachSupportedSystem = f:
      nixpkgs.lib.genAttrs supportedSystems (system:
        f {
          pkgs = import nixpkgs {
            inherit system;
            config.permittedInsecurePackages = [
              "dotnet-sdk-6.0.428"
            ];
          };
        });
  in {
    devShells = forEachSupportedSystem ({pkgs}: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          (
            # see https://nixos.org/manual/nixpkgs/unstable/#using-many-sdks-in-a-workflow
            with dotnetCorePackages;
              combinePackages [
                sdk_6_0
                sdk_8_0
                sdk_9_0
              ]
          )
          roslyn-ls
        ];
        ROSLYN_BIN = "${pkgs.roslyn-ls}/bin/Microsoft.CodeAnalysis.LanguageServer";
      };
    });
  };
}
