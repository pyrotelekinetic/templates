{

inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

outputs = { self, nixpkgs }: let
  supportedSystems = nixpkgs.lib.systems.flakeExposed;
  allSystems = output: nixpkgs.lib.genAttrs supportedSystems
    (system: output nixpkgs.legacyPackages.${system});
in {
  packages = allSystems (pkgs: {
    default = pkgs.rustPlatform.buildRustPackage {
      pname = "myPackage";
      version = "0.1.0";
      src = self;
      cargoLock.lockFile = ./Cargo.lock;
    };
  });

  devShells = allSystems (pkgs: {
    default = pkgs.mkShell {
      nativeBuildInputs = with pkgs; [
        rustc
        cargo
        cargo-watch
      ];
    };
  });
};

}