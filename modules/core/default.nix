{ inputs, nixpkgs, self, usernames, host, ...}:
{
  imports = [
    ./bootloader.nix
    ./hardware.nix
    ./xserver.nix
    ./network.nix
    ./nh.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./steam.nix
    ./system.nix
    ./user.nix
    ./wayland.nix
    ./virtualization.nix
  ];
}
