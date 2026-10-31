{ config, pkgs, ... }:
{
  programs.obs-studio.enable = true;
  programs.obs-studio.package = ( pkgs.obs-studio.override { cudaSupport = true; } );
}