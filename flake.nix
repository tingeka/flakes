{
  description = "Camalote";

  inputs = {
    home-manager = {
	url = "github:nix-community/home-manager/release-25.05";
	inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak?ref=latest";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager,nix-flatpak, flake-utils, ... }: {

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [
		./hosts/laptop/hardware-configuration.nix
		.hosts/laptop/configuration.nix
	];
    };
  };
}
