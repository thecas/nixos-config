{ pkgs, disko, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
    ./disk-config.nix
  ];

  environment.systemPackages = with pkgs; [
    cryptsetup
  ];

  powerManagement.cpuFreqGovernor = "performance";


}
