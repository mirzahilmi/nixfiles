{
  description = "github.com/mirzahilmi/nixfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    disko.url = "github:nix-community/disko";
    ghostty.url = "github:ghostty-org/ghostty";
    grub-themes.url = "github:luisnquin/grub-themes";
    hardware.url = "github:nixos/nixos-hardware";
    nvim.url = "git+file:///home/mirza/.config/nvim";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    # pin this specific rev because the latest throws segfault in my machine :)
    zen-browser.url = "github:0xc000022070/zen-browser-flake/85596d964350861825f642de9fc2154ac06bfc05";
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

    mkHome = {
      username,
      hostname,
      system,
    }:
      home-manager.lib.homeManagerConfiguration {
        modules = [
          ./users/${username}
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
    inherit overlays;

    nixosConfigurations = {
      nixsina = nixpkgs.lib.nixosSystem {
        system = x86;
        modules = [./machines/nixsina];
        specialArgs = {inherit inputs outputs;};
      };
      t4s = nixpkgs.lib.nixosSystem {
        system = x86;
        modules = [./machines/t4s];
        specialArgs = {inherit inputs outputs;};
      };
      t4nix = nixpkgs.lib.nixosSystem {
        system = x86;
        modules = [./machines/t4nix];
        specialArgs = {inherit inputs outputs;};
      };
    };

    homeConfigurations = {
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

    # modified from https://github.com/the-nix-way/dev-templates
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
    };
  };
}
