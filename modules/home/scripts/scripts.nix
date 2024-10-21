{pkgs, host, ...}: let
  wall-change = pkgs.writeShellScriptBin "wall-change" (builtins.readFile ./scripts/wall-change.sh);
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker" (builtins.readFile ./scripts/wallpaper-picker.sh);

  runbg = pkgs.writeShellScriptBin "runbg" (builtins.readFile ./scripts/runbg.sh);
  music = pkgs.writeShellScriptBin "music" (builtins.readFile ./scripts/music.sh);
  lofi = pkgs.writeScriptBin "lofi" (builtins.readFile ./scripts/lofi.sh);

  toggle_blur = pkgs.writeScriptBin "toggle_blur" (builtins.readFile ./scripts/toggle_blur.sh);
  toggle_oppacity = pkgs.writeScriptBin "toggle_oppacity" (builtins.readFile ./scripts/toggle_oppacity.sh);
  toggle_waybar = pkgs.writeScriptBin "toggle_waybar" (builtins.readFile ./scripts/toggle_waybar.sh);
  toggle_float = pkgs.writeScriptBin "toggle_float" (builtins.readFile ./scripts/toggle_float.sh);

  maxfetch = pkgs.writeScriptBin "maxfetch" (builtins.readFile ./scripts/maxfetch.sh);

  compress = pkgs.writeScriptBin "compress" (builtins.readFile ./scripts/compress.sh);
  extract = pkgs.writeScriptBin "extract" (builtins.readFile ./scripts/extract.sh);

  shutdown-script = pkgs.writeScriptBin "shutdown-script" (builtins.readFile ./scripts/shutdown-script.sh);

  show-keybinds = pkgs.writeScriptBin "show-keybinds" (builtins.readFile ./scripts/keybinds.sh);

  vm-start = pkgs.writeScriptBin "vm-start" (builtins.readFile ./scripts/vm-start.sh);

  ascii = pkgs.writeScriptBin "ascii" (builtins.readFile ./scripts/ascii.sh);

  record = pkgs.writeScriptBin "record" (builtins.readFile ./scripts/record.sh);

  screenshot = pkgs.writeScriptBin "screenshot" (builtins.readFile ./scripts/screenshot.sh);

  rofi-power-menu = pkgs.writeScriptBin "rofi-power-menu" (builtins.readFile ./scripts/rofi-power-menu.sh);
  power-menu = pkgs.writeScriptBin "power-menu" (builtins.readFile ./scripts/power-menu.sh);

  sound = if host == "cas-laptop" then
    pkgs.writeScriptBin "sound" (builtins.readFile ./scripts/sound-laptop.sh)
  else
    pkgs.writeScriptBin "sound" (builtins.readFile ./scripts/sound-desktop.sh);

  screen = pkgs.writeScriptBin "screen" (builtins.readFile ./scripts/screen-desktop.sh);



  #sound = pkgs.writeScriptBin "sound" (builtins.readFile ./scripts/sound-laptop.sh);
in {
  home.packages = with pkgs; [
    wall-change
    wallpaper-picker

    runbg
    music
    lofi

    #laptop
    sound
    #sound-laptop-headphone-over-ear
    #sound-laptop-headphone-in-ear

    #screen-hdmi-mirror
    #screen-hdmi-dual
    #screen-usb-dual

    #desktop
    #sound-desktop-speaker
    #sound-desktop-overear
    #sound-desktop-soundbar

    #screen-desktop-monitor
    #screen-desktop-tv

    toggle_blur
    toggle_oppacity
    toggle_waybar
    toggle_float

    maxfetch

    compress
    extract

    shutdown-script

    show-keybinds

    vm-start

    ascii

    record

    screenshot

    rofi-power-menu
    power-menu
  ];
}
