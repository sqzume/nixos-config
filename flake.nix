{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { nixpkgs, ... }: {
    nixosConfigurations.nixos-vm = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
	./hosts/nixos-vm
      ];
    };
  };
}

