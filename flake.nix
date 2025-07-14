{
  description = "Camalote";

  inputs = {
    nixpkgs.url      = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, ... }: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system     = "x86_64-linux";
        modules    = [ ./hosts/laptop/default.nix ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}

