{ pkgs, inputs, usernames, host, ... }:
let
  lib = pkgs.lib;

  userConfig = username: {
    imports =
      if (host == "desktop") then
        [ ./../home/default.desktop.nix ]
      else [ ./../home ];
    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "24.05";
    programs.home-manager.enable = true;
  };

  systemUserConfig = username: {
    isNormalUser = true;
    description = username;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
in {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs usernames host; };

    users = lib.listToAttrs (map (username: {
      name = username;
      value = userConfig username;
    }) usernames);
  };

  users.users = lib.listToAttrs (map (username: {
    name = username;
    value = systemUserConfig username;
  }) usernames);

  nix.settings.allowed-users = usernames;
}
