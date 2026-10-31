{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    uxplay
  ];

  services.avahi.enable = true;
  services.avahi.publish.enable = true;
  services.avahi.publish.userServices = true;
}
