{
  description = "github.com/mirzahilmi/nixfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    disko.inputs.nixpkgs.follows = "nixpkgs";
    disko.url = "github:nix-community/disko";
    grub-themes.url = "github:luisnquin/grub-themes";
    hardware.url = "github:nixos/nixos-hardware";
    nvim.url = "github:mirzahilmi/nvim";
    sops-nix.url = "github:Mic92/sops-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations = {
      "nixsina" = nixpkgs.lib.nixosSystem {
        modules = [./hosts/nixsina];
        specialArgs = {inherit inputs outputs;};
      };
      "test" = nixpkgs.lib.nixosSystem {
        modules = [./hosts/test];
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
