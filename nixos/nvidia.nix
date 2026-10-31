{ config, pkgs, ... }:
{
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = false;
  hardware.nvidia.branch = "legacy_580";

  services.xserver.videoDrivers = [
    "nvidia"
  ];
}