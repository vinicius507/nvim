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

    nvimOverlay = final: prev: {
      neovim = neovim.packages.${final.stdenv.hostPlatform.system}.neovim;
      nvim = import ./nix/pkgs/neovim.nix {pkgs = final;};
    };

    forEachSystem = f:
      nixpkgs.lib.genAttrs allSystems (system:
        f {
          pkgs = import nixpkgs {
            inherit system;
            overlays = [nvimOverlay];
          };
        });
  in {
    apps = forEachSystem ({pkgs}: {
      default = {
        type = "app";
        program = "${pkgs.nvim}/bin/nvim";
      };
    });
    packages = forEachSystem ({pkgs}: {default = pkgs.nvim;});
  };
}
