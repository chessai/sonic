{ nixpkgs ? import <nixpkgs> {
    config.packageOverrides = pkgs: {
      defaultCrateOverrides = {
        librocksdb = attrs: { buildInputs = [ pkgs.clang.cc.lib ]; };
      }; 
    };
  }
}:

(import ./Cargo.nix { inherit nixpkgs; }).sonic_server {}
