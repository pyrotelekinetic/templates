{ haskellPackages
, ghc
, ghcid
, cabal-install
, callPackage
}:

haskellPackages.shellFor {
  packages = _: [ (callPackage ./package.nix {}) ];
  nativeBuildInputs = with haskellPackages; [
    ghc
    ghcid
    hlint
    cabal-install
  ];
}
