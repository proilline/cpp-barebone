{
  description = "basic c++ development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:

    let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
      {

        devShells.${system}.default
        = pkgs.mkShell.override { stdenv = pkgs.clangStdenv; }
          {
            buildInputs = with pkgs; [
              cmake
              pkg-config
            ];
          };
      };
}
