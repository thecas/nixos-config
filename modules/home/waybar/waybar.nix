{ pkgs, ... }:
{
  home.packages = (with pkgs; [ tailscale-systray ]);

  programs.waybar = {
    enable = true;
  };
  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
  });
}
