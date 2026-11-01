{ config, pkgs, ... }:
{
  environment.etc."libinput/local-overrides.quirks".text = ''
    [NoMouseDebounce]
    MatchUdevType=mouse
    ModelBouncingKeys=1
  '';
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "Adwaita";
  };
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    btop
    ddcutil
    ghostty grim
    jay
    mpv
    noctalia
    slurp
    tesseract
    qpwgraph
    wiremix wl-clipboard
  ];

  programs.dconf.enable = true;
  programs.xwayland.enable = true;

  services.greetd.enable = true;
  services.greetd.settings = {
    default_session = {
      command = "agreety --cmd jay run";
    };
    initial_session = {
      command = "jay run";
      user = "la";
    };
    terminal = {
      vt = 1;
    };
  };
  security.wrappers.jay = {
    source = "${pkgs.jay}/bin/jay";
    capabilities = "cap_sys_nice=p";
    owner = "root";
    group = "root";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
  ];
}
