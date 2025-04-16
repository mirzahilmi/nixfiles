{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nvim.url = "git+file:/home/nixos/.config/nvim?shallow=1";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
	inputs.nixos-wsl.nixosModules.default
        ./configuration.nix
      ];
      specialArgs = {inherit inputs;};
    };
  };
}
