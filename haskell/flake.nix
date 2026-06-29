{

description = "TODO";

inputs.nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";

outputs = { nixpkgs, ... }: let
  supportedSystems = nixpkgs.lib.systems.flakeExposed;
  allSystems = output: nixpkgs.lib.genAttrs supportedSystems
    (system: output nixpkgs.legacyPackages.${system});
in {
  packages = allSystems (pkgs: {
    default = pkgs.callPackage ./package.nix {};
  });

  devShells = allSystems (pkgs: {
    default = pkgs.callPackage ./shell.nix {};
  });
};

}
