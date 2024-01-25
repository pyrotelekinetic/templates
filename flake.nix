{

description = "pyrotelekinetic's personal flake templates";

outputs = _: {
  templates = {
    haskell = {
      path = ./haskell;
      description = "Haskell flake using cabal2nix";
    };
  };
};

}
