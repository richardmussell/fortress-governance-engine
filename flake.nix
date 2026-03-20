{
  description = "Fortress: Rust-based Systems Governance Engine";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, rust-overlay }:
    let
      system = "x86_64-linux";
      overlays = [ (import rust-overlay) ];
      pkgs = import nixpkgs { inherit system overlays; };
      rustVersion = pkgs.rust-bin.stable.latest.default;
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          rustVersion
          go-task
          shellcheck
          cargo-watch
          pkg-config
          openssl
        ];

        shellHook = ''
          echo "--- 🛡️ FORTRESS ELITE ENGINE LOADED ---"
          echo "Identity: Richard J. Mussell | Architect of the Zero-Lag Civilization"
          cargo --version
        '';
      };
    };
}