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
    haskell-language-server
    hlint
    cabal-install
  ];
}
