{
  pkgs,
  lib,
  appName ? "nvim",
  viAlias ? false,
  vimAlias ? false,
  isolated ? true,
}: rec {
  neovim = pkgs.callPackage ./neovim.nix {
    inherit pkgs lib appName viAlias vimAlias isolated;
    config = neovim-config;
  };
  neovim-config = pkgs.callPackage ./neovim-config {inherit pkgs appName;};
}
