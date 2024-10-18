{ pkgs, disko, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
    ./disk-config.nix
  ];

  powerManagement.cpuFreqGovernor = "performance";


}
