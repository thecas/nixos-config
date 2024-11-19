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
    diskonaut			      # TUI disk space navigator like baobab
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
    yt-dlp-light
    xdg-utils
    xxd
    imgcat
    sshfs
    cheese

    ##Editor
    jetbrains.phpstorm
    zed-editor
    #vscode

    #development
    devbox

    #crypto
    exodus

    ## Browsers
    #firefox-unwrapped
    #firefox-esr-128-unwrapped
    #firefox-devedition-unwrapped
    #firefox-beta-unwrapped
    firefox
    vivaldi
    brave
    chromium
    inputs.zen-browser.packages."${system}".specific
    ferdium

    ## audio
    ncpamixer
    pavucontrol
    #spotify

    ## CLI
    cbonsai                           # terminal screensaver
    cmatrix
    pipes                             # terminal screensaver
    sl
    tty-clock                         # cli clock
    killall

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
    vlc
    mpv
    winetricks
    wineWowPackages.wayland
    zenity
    zoom-us
    obsidian

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
