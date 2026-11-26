{ config, pkgs, ... }:
{
  networking.wg-quick.interfaces.wg0.autostart = true;
  networking.wg-quick.interfaces.wg0.configFile = "";
}
