{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    idevicerestore
    ifuse
    libimobiledevice
  ];

  services.usbmuxd.enable = true;
}
