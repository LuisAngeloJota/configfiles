{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    uxplay
  ];

  services.avahi.enable = true;
  services.avahi.settings.publish.disable-publishing = false;
  services.avahi.settings.publish.disable-user-service-publishing = false;
}
