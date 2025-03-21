{
  description = "FrostPhoenix's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    iio-hyprland.url = "github:JeanSchoeller/iio-hyprland";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    nix-gaming.url = "github:fufexan/nix-gaming";

    #zen-browser.url = "github:ch4og/zen-browser-flake";
    #zen-browser.url = "github:fufexan/zen-browser-flake";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprmag.url = "github:SIMULATAN/hyprmag";

    wezterm = {
      url = "github:wez/wezterm/main?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    yazi.url = "github:sxyazi/yazi";

    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };

  };

  outputs = { nixpkgs, self, disko, ...} @ inputs:
  let
    usernames = [ "cas" "ryan" ];
    system = "x86_64-linux";

  in
  {
    nixosConfigurations = {
      cas-desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/desktop
          disko.nixosModules.disko
        ];
        specialArgs = { host="cas-desktop"; inherit self inputs usernames ; };
      };
      cas-laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
            ./hosts/laptop
            disko.nixosModules.disko
        ];
        specialArgs = { host="cas-laptop"; inherit self inputs usernames ; };
      };
       vm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/vm ];
        specialArgs = { host="vm"; inherit self inputs usernames ; };
      };
    };
  };
}
