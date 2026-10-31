{ config, pkgs, ... }:
{
  programs.thunar.enable = true;

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
        if (subject.isInGroup("wheel") && action.id == "org.freedesktop.udisks2.filesystem-mount-system")
            return polkit.Result.YES;
    });
  '';

  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
