{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ./binaries.nix
    ./compositor.nix
    #./gaming.nix
    #./idevice-tools.nix
    #./lanzaboote.nix
    #./nvidia.nix
    ./obs.nix
    #./sunshine.nix
    ./thunar.nix
    ./uxplay.nix
    ./virt-manager.nix
  ];
  # update system state version
  system.stateVersion = "";
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.trusted-users = [
    "root"
    "@wheel"
  ];
  nixpkgs.config.allowUnfree = true;

  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.kernelModules = [
    "v4l2loopback"
  ];
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [
    "mitigations=off"
  ];
  boot.kernel.sysctl = {
    "vm.swappiness" = 200;
    "vm.page-cluster" = 0;
  };

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  boot.tmp.cleanOnBoot = true;

  console.useXkbConfig = true;

  environment.systemPackages = with pkgs; [
    aria2
    fd ffmpeg file fzf
    git
    imagemagick img2pdf
    libarchive
    mediainfo
    ncdu neovim nnn
    poppler-utils
    ripgrep rsync
    tmux
    wireguard-tools
    yt-dlp
  ];

  fonts.fontconfig.defaultFonts.sansSerif = [
    "Inter"
  ];
  fonts.fontconfig.defaultFonts.serif = [
    "Noto Serif"
  ];
  fonts.fontconfig.defaultFonts.monospace = [
    "Noto Sans Mono"
  ];
  fonts.packages = with pkgs; [
    font-awesome
    inter
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];

  hardware.firmware = [
    pkgs.linux-firmware
  ];
  hardware.block.defaultScheduler = "kyber";
  hardware.block.defaultSchedulerRotational = "bfq";
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  hardware.graphics.enable = true;
  hardware.i2c.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";

  networking.firewall.enable = false;
  # update hostname
  networking.hostName = "";
  networking.nameservers = [
    "76.76.2.11#x-oisd.freedns.controld.com"
  ];
  networking.timeServers = [
    "time.cloudflare.com"
  ];
  networking.useDHCP = false;
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    DriverQuirks = {
      PowerSaveDisable = "*";
    };
  };

  programs.java.enable = true;

  security.polkit.enable = true;
  security.rtkit.enable = true;

  services.flatpak.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.enable = true;
  services.pipewire.jack.enable = true;
  services.pipewire.pulse.enable = true;
  services.power-profiles-daemon.enable = true;
  services.printing.enable = true;
  services.resolved.settings.Resolve.DNSOverTLS = "true";
  services.resolved.settings.Resolve.DNSSEC = "false";
  services.resolved.settings.Resolve.Domains = [
    "~."
  ];
  services.resolved.settings.Resolve.FallbackDNS = [
    "76.76.2.11#x-oisd.freedns.controld.com"
  ];
  services.resolved.enable = true;

  systemd.network.enable = true;
  systemd.network.networks."50-wlan" = {
    matchConfig.Name = "wlan0";
    networkConfig.DHCP = "yes";
    networkConfig.IgnoreCarrierLoss = "3s";
  };

  time.timeZone = "Asia/Manila";

  users.users.la.extraGroups = [
    "wheel"
  ];
  users.users.la.isNormalUser = true;
  users.users.la.initialPassword = "la";

  zramSwap.algorithm = "lz4";
  zramSwap.enable = true;
  zramSwap.memoryPercent = 50;
}
