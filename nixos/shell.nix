## This script is to cross-compile audit for aarch64 but not working properly. So, I need to update this one. But to check this, follow steps below,
# docker run -it nixos/nix # If running on docker
# nix-env -i vim # if vim is not installed, there will be no collision with nvim, because I will run nix-shell with neovim
# vim shell.nix # paste following code
# nix-shell # just run this, it will follow the shell.nix file
# Now, inside nix-shell, I can clone the audit-userspace and cross-compile it for aarch64

{ pkgs ? import <nixpkgs> {} }:
  pkgs.pkgsCross.aarch64-multiplatform.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs; [ ripgrep neovim git gcc autoconf automake libtool gnumake go python3 swig openldap ];
    LADP = "${pkgs.openldap}";
}
