{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  
  outputs = { nixpkgs, ...  }: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      modules = [ ./hosts/desktop/configuration.nix ];
    };
  };
}
