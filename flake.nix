{
  description = "dev flake for random-flickr";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShells = rec {
          default = rf_shell;

          rf_shell = pkgs.mkShell {
            buildInputs = with pkgs; [
              openssl
              zlib
              libffi
              libyaml
            ];
          };
        };
      });
}
