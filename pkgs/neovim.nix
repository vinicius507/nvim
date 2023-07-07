{
  pkgs,
  lib,
  appName,
  config,
  viAlias,
  vimAlias,
  isolated,
}: let
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
