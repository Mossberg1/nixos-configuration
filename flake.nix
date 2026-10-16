{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  inputs.home-manager.url = "github:nix-community/home-manager/release-26.05";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { nixpkgs, home-manager, ...  }: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/desktop/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.wmossberg = import ./home/wmossberg.nix;
        }
      ];
    };
  };
}
