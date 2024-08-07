{
  description = "github.com/mirzahilmi/nixfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-24.05";
    grub-themes.url = "github:luisnquin/grub-themes";
    hardware.url = "github:nixos/nixos-hardware";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    st.url = "github:siduck/st";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    homeManagerModules = import ./module/home-manager;

    overlays = import ./overlay {inherit inputs;};

    nixosConfigurations = {
      "nixsina" = nixpkgs.lib.nixosSystem {
        modules = [./host/nixsina];
        specialArgs = {inherit inputs outputs;};
      };

      "dummy" = nixpkgs.lib.nixosSystem {
        modules = [./host/dummy];
        specialArgs = {inherit inputs outputs;};
      };
    };

    homeConfigurations = {
      "mirza@nixsina" = home-manager.lib.homeManagerConfiguration {
        modules = [./home/mirza.nix];
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
      };
    };
  };
}
