{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.lan-mouse_git ];
  chaotic.mesa-git.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
}
