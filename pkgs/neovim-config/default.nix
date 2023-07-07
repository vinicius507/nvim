{
  pkgs,
  appName,
}:
pkgs.stdenv.mkDerivation rec {
  name = "${appName}-config";
  src = builtins.path {
    inherit name;
    path = ./.;
    filter = path: type: baseNameOf path != "default.nix";
  };
  installPhase = ''
    mkdir -p $out/${appName}
    cp -r $src/* $out/${appName}
  '';
}
