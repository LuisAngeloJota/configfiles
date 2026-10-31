{ config, pkgs, ... }:
{
  services.sunshine.capSysAdmin = true;
  services.sunshine.enable = true;

  users.users.la.extraGroups = [
    "uinput"
  ];
}