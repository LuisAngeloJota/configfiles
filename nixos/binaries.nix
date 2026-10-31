{ config, pkgs, ... }:
{
  programs.appimage.binfmt = true;
  programs.appimage.enable = true;

  programs.nix-ld.enable = true;
}