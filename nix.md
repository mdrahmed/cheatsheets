# Nix configure
After downloading nix, I installed vim inside nix,
```
nix-env -i vim
```


Now, wrote this script to run nix-shell. Just run `vim shell.nix` and paste the following script and run `nix-shell`. Then you will be able to use `nvim, git` and super fast grep known as `rg` in nix.
```
{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs; [ ripgrep neovim git ];
}
```


## For cross-compilation I have updated the script with following code,
```
{ pkgs ? import <nixpkgs> {} }:
  pkgs.pkgsCross.aarch64-multiplatform.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs; [ ripgrep neovim git gcc autoconf automake libtool gnumake go python3 swig openldap ];
    LADP = "${pkgs.openldap}";
}
```
The `LADP` is used for library files.

[Note: if inside nix-shell, after updating the file just run `nix-shell`. It will be updated with other files]
