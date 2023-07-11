{
  inputs = {
    nixpkgs.url = "nixpkgs";
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    neovim,
  }: let
    allSystems = [
      "x86_64-linux"
      "aarch64-linux"
    ];

    forEachSystem = f:
      nixpkgs.lib.genAttrs allSystems (system:
        f {
          pkgs = import nixpkgs {
            inherit system;
            overlays = [self.overlays.neovim];
          };
        });
  in {
    apps = forEachSystem ({pkgs}: {
      default = {
        type = "app";
        program = "${self.packages.${pkgs.system}.neovim}/bin/nvim";
      };
    });
    overlays = {
      neovim = final: prev: {
        neovim = neovim.packages.${prev.system}.default;
      };
    };
    packages = forEachSystem ({pkgs}: {default = self.lib.${pkgs.system}.makeNeovimBundle {};});
    lib = forEachSystem ({pkgs}: {
      makeNeovimBundle = args: (pkgs.callPackage ./pkgs/bundle.nix args);
    });
    homeManagerModules.default = import ./modules/home-manager.nix self;
  };
}
