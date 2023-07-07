{
  pkgs,
  lib,
  appName ? "nvim",
  viAlias ? false,
  vimAlias ? false,
  isolated ? true,
  extraPackages ? [],
}: rec {
  neovim = pkgs.callPackage ./neovim {
    inherit pkgs lib appName viAlias vimAlias isolated extraPackages;
    config = neovim-config;
  };
  neovim-config = pkgs.callPackage ./neovim-config {inherit pkgs appName;};
}
