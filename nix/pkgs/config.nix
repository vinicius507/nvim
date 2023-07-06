{pkgs}:
pkgs.stdenv.mkDerivation rec {
  name = "nvim-config";
  src = builtins.path {
    inherit name;
    path = ../..;
    filter = path: type:
      !builtins.elem (/. + path) [
        ./nix
        ./flake.nix
        ./flake.lock
      ];
  };
  installPhase = ''
    cp -r $src $out
  '';
}
