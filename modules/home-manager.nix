self: {
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf mkOption types;
  inherit (self.lib.${pkgs.system}) makeNeovimBundle;

  cfg = config.programs.nvim;
in {
  options = {
    programs.nvim = {
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
      extraPackages = mkOption {
        type = types.list;
        default = with pkgs;[
          alejandra
          lua-language-server
          nil
          shfmt
          stylua
        ] ++ (with pkgs.nodePackages; [
          bash-language-server
          eslint
          prettier
        ]);
        description = ''
          Extra packages to be used in Neovim.
          Useful for common LSP servers and formatters.
        '';
      };
    };
  };

  config = let
    bundle = makeNeovimBundle {
      inherit (cfg) appName isolated viAlias vimAlias extraPackages;
    };
  in
    mkIf cfg.enable {
      home.packages = [bundle.neovim];
      xdg.configFile.${cfg.appName} = {
        enable = !cfg.isolated;
        source = "${bundle.neovim-config}/nvim";
        recursive = true;
        onChange = ''
          rm -rf ${config.xdg.cacheHome}/${cfg.appName}
        '';
      };
    };
}
