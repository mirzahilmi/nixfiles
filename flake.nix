{
  description = "github.com/MirzaHilmi nixfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hardware.url = "github:nixos/nixos-hardware";
    grub-themes.url = "github:luisnquin/grub-themes";
    zimfw.url = "github:joedevivo/zimfw.nix";
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs :
  let
    inherit (self) outputs;
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      "nixsina" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs outputs; };
        modules = [ ./hosts/nixsina ];
      };

      "dummy" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs outputs; };
        modules = [ ./hosts/dummy ];
      };
    };

    grub-themes = inputs.grub-themes.packages.${system};  

    homeConfigurations = {
      "mirza@nixsina" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home-manager/mirza
        ];
      };
    };
  };
}
