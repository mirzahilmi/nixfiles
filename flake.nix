{
  description = "github.com/MirzaHilmi nixfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs :
  let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      "nixsina" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [ ./hosts/nixsina ];
      };
    };
  };
}
