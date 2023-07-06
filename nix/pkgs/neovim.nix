{pkgs}: let
  nvim = pkgs.wrapNeovim pkgs.neovim {
    configure = {
      packages.all.start = [
        treesitterWithParsers
      ];
    };
  };
  nvimConfig = import ./config.nix {inherit pkgs;};
  treesitterWithParsers = import ./treesitter.nix {inherit pkgs;};
in
  pkgs.writeShellApplication {
    name = "nvim";
    runtimeInputs = [nvimConfig];
    text = ''
      ${nvim}/bin/nvim -u ${nvimConfig}/init.lua "$@"
    '';
  }
