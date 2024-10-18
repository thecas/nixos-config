{ pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,us";
    };

    displayManager.autoLogin = {
      enable = false;
    };
    libinput = {
      enable = true;
      # mouse = {
      #   accelProfile = "flat";
      # };
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
