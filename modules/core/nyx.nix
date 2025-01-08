{ pkgs, inputs, ... }:
{
  environment.systemPackages = [ inputs.chaotic.pkgs.lan-mouse_git ];
  inputs.chaotic.mesa-git.enable = true;
  boot.kernelPackages = inputs.chaotic.pkgs.linuxPackages_cachyos;
}
