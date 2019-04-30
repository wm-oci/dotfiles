{ pkgs ? import <nixpkgs> {} }:

let
  myEmacs = pkgs.lib.overrideDerivation (pkgs.emacs25.override {
  }) (attrs: {});

  linuxEmacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;

  myEmacsPackages = epkgs: (with epkgs.melpaPackages; [
    exec-path-from-shell
    evil
    helm
    helm-core
    powerline
    projectile
    spaceline
    solarized-theme
    magit
  ]) ++ (with epkgs.orgPackages; [
    org-plus-contrib
  ]);

# install one of these with "nix-env -f /path/to/emacs.nix -iA emacsLinux"
in {
  emacsLinux = linuxEmacsWithPackages (myEmacsPackages);
}

