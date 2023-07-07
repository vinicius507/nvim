self: {
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf mkOption types;
  inherit (self.lib.${pkgs.system}) makeNeovimBundle;

  cfg = config.programs.neovim;
in {
  disabledModules = ["programs/neovim.nix"];

  options = {
    enable = mkEnableOption "Neovim";
    appName = mkOption {
      type = types.str;
      default = "nvim";
      description = ''
        Neovim NVIM_APPNAME setting to use.
      '';
    };
    viAlias = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Symlink <command>vi</command> to <command>nvim</command> binary.
      '';
    };
    vimAlias = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Symlink <command>vim</command> to <command>nvim</command> binary.
      '';
    };
    isolated = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Executes Neovim with its config isolated into a nix store.
        It replaces XDG_{CONFIG,CACHE}_HOME for Neovim.
      '';
    };
  };

  config = let
    bundle = makeNeovimBundle {
      inherit (cfg) appName isolated viAlias vimAlias;
    };
  in
    mkIf cfg.enable {
      home.packages = [bundle.neovim];
      xdg.configFile.${cfg.appName} = {
        enable = !cfg.isolated;
        source = bundle.neovim-config;
        recursive = true;
        onChange = ''
          rm -rf ${config.xdg.cacheHome}/${cfg.appName}
        '';
      };
    };
}
