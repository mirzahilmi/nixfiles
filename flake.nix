{
  description = "github.com/mirzahilmi/nixfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    # ghostty.url = "github:ghostty-org/ghostty";
    grub-themes.url = "github:luisnquin/grub-themes";
    hardware.url = "github:nixos/nixos-hardware";
    nvim.url = "/home/mirza/.config/nvim";
    # nvim.url = "github:mirzahilmi/nvim";
    # pin this specific rev because the latest throws segfault in my machine :)
    zen-browser.url = "github:0xc000022070/zen-browser-flake/85596d964350861825f642de9fc2154ac06bfc05";
    niri.url = "github:sodiboo/niri-flake";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-06cb-009a-fingerprint-sensor = {
      url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor?ref=25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    overlays = import ./overlays {inherit inputs;};
    x86 = "x86_64-linux";
  in {
    inherit overlays;

    nixosConfigurations = let
      mkSystem = {
        hostname,
        system,
        modules ? [],
      }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules =
            [
              ./machines/${hostname}/configuration.nix
              ./machines/${hostname}/hardware-configuration.nix
              ./machines/shared
              ./users/mirza/nixos.nix
            ]
            ++ modules;
          specialArgs = {inherit inputs outputs;};
        };
    in {
      nixsina = nixpkgs.lib.nixosSystem {
        system = x86;
        modules = [./machines/nixsina];
        specialArgs = {inherit inputs outputs;};
      };
      t4s = mkSystem {
        hostname = "t4nix";
        system = x86;
        modules = [inputs.nixos-wsl.nixosModules.default];
      };
      t4nix = mkSystem {
        hostname = "t4nix";
        system = x86;
        modules = [
          inputs.hardware.nixosModules.lenovo-thinkpad-t480s
          inputs.nixos-06cb-009a-fingerprint-sensor.nixosModules."06cb-009a-fingerprint-sensor"
        ];
      };
    };

    homeConfigurations = let
      mkHome = {
        username,
        hostname,
        system,
      }:
        home-manager.lib.homeManagerConfiguration {
          modules = [
            ./users/${username}/home-manager.nix
            ./users/${username}/${hostname}.nix
          ];
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = {
            inherit inputs outputs;
            current = {inherit username hostname;};
            osConfig = outputs.nixosConfigurations.${hostname}.config;
          };
        };
    in {
      "mirza@nixsina" = mkHome {
        system = x86;
        username = "mirza";
        hostname = "nixsina";
      };
      "mirza@t4s" = mkHome {
        system = x86;
        username = "mirza";
        hostname = "t4s";
      };
      "mirza@t4nix" = mkHome {
        system = x86;
        username = "mirza";
        hostname = "t4nix";
      };
    };

    # modified version of https://github.com/the-nix-way/dev-templates
    templates = {
      java = {
        path = ./templates/java;
        description = "A Nix-flake-based Java development environment";
        welcomeText = ''
          A Nix-flake-based Java development environment.

          More info check github.com/mirzahilmi/nixfiles
        '';
      };
      go = {
        path = ./templates/go;
        description = "A Nix-flake-based Go development environment";
        welcomeText = ''
          A Nix-flake-based Go development environment.

          More info check github.com/mirzahilmi/nixfiles
        '';
      };
      rust = {
        path = ./templates/rust;
        description = "A Nix-flake-based Rust development environment";
        welcomeText = ''
          A Nix-flake-based Rust development environment.

          More info check github.com/mirzahilmi/nixfiles
        '';
      };
      python = {
        path = ./templates/python;
        description = "A Nix-flake-based Python development environment";
        welcomeText = ''
          A Nix-flake-based Python development environment.

          More info check github.com/mirzahilmi/nixfiles
        '';
      };
      csharp = {
        path = ./templates/csharp;
        description = "A Nix-flake-based .NET development environment";
        welcomeText = ''
          A Nix-flake-based .NET development environment.

          More info check github.com/mirzahilmi/nixfiles
        '';
      };
    };
  };
}
