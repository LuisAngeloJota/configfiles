{ pkgs, lib, ... }:
let
  sources = import ./nix/sources.nix;
  lanzaboote = import sources.lanzaboote;
in
{
  imports = [
    lanzaboote.nixosModules.lanzaboote
  ];

  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote.enable = true;
  boot.lanzaboote.pkiBundle = "/etc/secureboot";
}
