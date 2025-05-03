{
  description = "A Nix-flake-based Python development environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forEachSupportedSystem = f:
      nixpkgs.lib.genAttrs supportedSystems (system:
        f {
          pkgs = import nixpkgs {inherit system;};
        });

    version = "3.13";
  in {
    devShells = forEachSupportedSystem ({pkgs}: let
      concatMajorMinor = v:
        pkgs.lib.pipe v [
          pkgs.lib.versions.splitVersion
          (pkgs.lib.sublist 0 2)
          pkgs.lib.concatStrings
        ];

      python = pkgs."python${concatMajorMinor version}";
    in {
      default = pkgs.mkShellNoCC {
        venvDir = ".venv";

        postShellHook = ''
          venvVersionWarn() {
                local venvVersion
                venvVersion="$("$venvDir/bin/python" -c 'import platform; print(platform.python_version())')"

                [[ "$venvVersion" == "${python.version}" ]] && return

                cat <<EOF
                Warning: Python version mismatch: [$venvVersion (venv)] != [${python.version}]
                       Delete '$venvDir' and reload to rebuild for version ${python.version}
                EOF
          }

          venvVersionWarn
        '';

        packages = [
          python.pkgs.venvShellHook
          python.pkgs.pip
          pkgs.basedpyright
          pkgs.black
        ];
      };
    });
  };
}
