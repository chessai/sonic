with import <nixpkgs> {};

((import ./Cargo.nix).sonic_server {}).override {
  crateOverrides = defaultCrateOverrides // {
    librocksdb = attrs: { buildInputs = [ clang ]; };
  };
}
