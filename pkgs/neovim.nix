{
  pkgs,
  lib,
  appName ? "nvim",
  viAlias ? false,
  vimAlias ? false,
  isolated ? true,
}: let
  config = pkgs.callPackage ./neovim-config {inherit pkgs appName;};
  plugins = pkgs.callPackage ./plugins.nix {inherit pkgs;};
  nvimConfig = pkgs.neovimUtils.makeNeovimConfig {
    inherit plugins viAlias vimAlias;
    withPython3 = false;
    withRuby = false;
  };
in
  pkgs.wrapNeovimUnstable pkgs.neovim
  (nvimConfig
    // {
      wrapperArgs = lib.escapeShellArgs (nvimConfig.wrapperArgs
        ++ ["--set" "NVIM_APPNAME" appName]
        ++ lib.optionals isolated [
          "--set"
          "XDG_CONFIG_HOME"
          "${config}"
          "--set"
          "XDG_CACHE_HOME"
          "/tmp/${appName}-cache"
        ]);
      wrapRc = false;
    })
