{

description = "pyrotelekinetic's personal flake templates";

outputs = _: {
  templates = {
    haskell = {
      path = ./haskell;
      description = "Haskell flake using cabal2nix";
    };
    rust = {
      path = ./rust;
      description = "Rust flake using cargo";
    };
  };
};

}
