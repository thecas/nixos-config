{ inputs, pkgs, ... }:
let
  _2048 = pkgs.callPackage ../../pkgs/2048/default.nix {};
in
{
  home.packages = (with pkgs; [
    _2048

    ## CLI utility
    ani-cli
    binsider
    bitwise                           # cli tool for bit / hex manipulation
    caligula                          # User-friendly, lightweight TUI for disk imaging
    dconf-editor
    docfd                             # TUI multiline fuzzy document finder
    eza                               # ls replacement
    entr                              # perform action when file change
    fd                                # find replacement
    ffmpeg
    file                              # Show file information
    gtt                               # google translate TUI
    gifsicle                          # gif utility
    gtrash                            # rm replacement, put deleted files in system trash
    hexdump
    imv                               # image viewer
    jq                                # JSON processor
    killall
    lazygit
    libnotify
	  man-pages					            	  # extra man pages
    mimeo
    mpv                               # video player
    ncdu                              # disk space
    nitch                             # systhem fetch util
    openssl
    onefetch                          # fetch utility for git repo
    pamixer                           # pulseaudio command line mixer
    playerctl                         # controller for media players
    poweralertd
    programmer-calculator
    ripgrep                           # grep replacement
    swappy                            # snapshot editing tool
    tdf                               # cli pdf viewer
    tldr
    todo                              # cli todo list
    toipe                             # typing test in the terminal
    ttyper                            # cli typing test
    unzip
    valgrind                          # c memory analyzer
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    wget
    yazi                              # terminal file manager
    yt-dlp-light
    xdg-utils
    xxd
    imgcat

    ##Editor
    jetbrains.phpstorm
    zed-editor
    #vscode

    ## Browsers
    #firefox-unwrapped
    #firefox-esr-128-unwrapped
    firefox-devedition-unwrapped
    #firefox-beta-unwrapped
    #firefox
    vivaldi
    brave
    ungoogled-chromium
    ferdium
    inputs.zen-browser.packages."${system}".specific


    ## CLI
    cbonsai                           # terminal screensaver
    cmatrix
    pipes                             # terminal screensaver
    sl
    tty-clock                         # cli clock

    ## GUI Apps
    audacity
    bleachbit                         # cache cleaner
    gimp
    libreoffice
    nix-prefetch-github
    obs-studio
    pavucontrol                       # pulseaudio volume controle (GUI)
    pitivi                            # video editing
    qalculate-gtk                     # calculator
    soundwireserver
    thunderbird
    vlc
    mpv
    winetricks
    wineWowPackages.wayland
    zenity


    # C / C++
    gcc
    gdb
    gnumake

    # Python
    python3
    python312Packages.ipython

    inputs.alejandra.defaultPackage.${system}
  ]);
}
