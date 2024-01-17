{
  description = "Nixsina's Flake"

  inputs = {
    hardware.url  = "github:NixOS/nixos-hardware/master";
    nixpkgs.url   = "github:nixos/nixpkgs/nixos-23.11";
  }

  outputs = { self, nixpkgs, ... } @inputs: {
    nixosConfigurations = {
      # Primary Laptop
      nixsina = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/nixsina ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}