{
  description = "Nixsina's Flake"

  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  }

  outputs = { self, nixpkgs, nixos-hardware }: {
    nixosConfigurations = { 
      nixsina = nixpkgs.lib.nixosSystem {
        modules = [
          nixos-hardware.nixosModules.lenovo-legion-15arh05h
        ];
      };
    };
  };
}