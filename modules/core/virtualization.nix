{ config, pkgs, usernames, ... }:

let
  lib = pkgs.lib;
in
{
  # Add user to libvirtd group
  users.users = lib.listToAttrs (map (username: {
    name = username;
    value = {
      isNormalUser = true;
      extraGroups = [ "libvirtd docker" ];
    };
  }) usernames);

  virtualisation.docker.enable = true;

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    adwaita-icon-theme
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };

  services.spice-vdagentd.enable = true;
}
