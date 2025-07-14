/*{
  description = "Camalote";

  inputs = {
    nixpkgs.url      = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, ... } @ inputs:
    let
      # Map of host names → NixOS system identifiers
      hosts = {
        laptop = "x86_64-linux";
        # rpi4   = "aarch64-linux";
      };
    in {
      nixosConfigurations = builtins.mapAttrs
        (host: system:
          nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [ ./hosts/${host}/default.nix ];
            specialArgs = { inherit inputs; };
          }
        )
        hosts;
    };
}
*/
/*
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
        system = "x86_64-linux";
        modules = [
          ./hosts/laptop/default.nix
          inputs.home-manager.nixosModules.home-manager
        ];
        specialArgs = { inherit inputs; };
      };
      # later you can add rpi4 = … here
    };
  };
}*/
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
        # Explicitly point at your existing file:
        modules    = [ ./hosts/laptop/default.nix ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}

