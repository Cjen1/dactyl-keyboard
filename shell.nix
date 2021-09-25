{ pkgs ? import <nixpkgs> {} }:

let 
  mach-nix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix/";
    ref = "3.3.0";
  }) {};
  mach-python = mach-nix.mkPython {
    requirements = ''
      solidpython
      numpy
      scipy
      setuptools
    '';
  };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    mach-python
  ];
}
