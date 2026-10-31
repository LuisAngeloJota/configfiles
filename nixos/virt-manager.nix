{ config, pkgs, ... }:
{
  programs.virt-manager.enable = true;

  users.users.la.extraGroups = [
    "libvirtd"
  ];

  virtualisation.libvirtd.enable = true;
}
