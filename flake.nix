{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let pkgs = import nixpkgs { inherit system; }; in with pkgs; {
        devShell = (mkShell.override { stdenv = gcc13Stdenv; }) {
          nativeBuildInputs = [ cmake verilator clang-tools verible ];
          buildInputs = [ SDL2 ];
        };
      });
}
