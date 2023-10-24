{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with nixpkgs.legacyPackages.x86_64-linux;

      mkShell {
        name = "digital-design-dev";

        nativeBuildInputs = [
          cmake ninja verilator
        ];

        buildInputs = [
          abseil-cpp zlib
        ];
      };
  };
}
