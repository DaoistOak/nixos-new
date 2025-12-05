{pkgs,inputs,... }:

let
  catppuccin-sddm-custom = pkgs.catppuccin-sddm.override {
    flavor = "macchiato";
    accent = "mauve";
    font = "JetBrains Mono";
    fontSize = "9";
    background = "${./sddm/wallpaper}";
    loginBackground = true;
  };
in {

  # Nixpkgs settings
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnsupportedSystem = true;
      # packageOverrides = pkgs: {
      # nur = inputs.nur { inherit pkgs; }; };
  };
  };
  environment.systemPackages = with pkgs; [
    # GUI Applications
    adi1090x-plymouth-themes
    appimage-run
    arduino-ide
    brave
    catppuccin-cursors.macchiatoLight
    catppuccin-kvantum
    catppuccin-papirus-folders
    catppuccin-sddm-custom
    code-cursor
    fuse3
    firefox
    gamescope
    genymotion
    kdePackages.bluedevil
    kdePackages.bluez-qt
    kdePackages.dragon
    kdePackages.flatpak-kcm
    kdePackages.kate
    kdePackages.kpmcore
    kdePackages.kwallet-pam
    kdePackages.plasma-nm
    kdePackages.plasma-pa
    kdePackages.plymouth-kcm
    kdePackages.qtstyleplugin-kvantum
    kdePackages.sddm-kcm
    kdePackages.yakuake
    keepassxc
    kitty
    lact
    lutris
    networkmanagerapplet
    nexusmods-app
    nur.repos.mikilio.ttf-ms-fonts
    nur.repos.shadowrz.klassy-qt6
    papirus-folders
    popcorntime
    protonvpn-gui
    qbittorrent
    spotube
    syncthingtray
    terminus_font
    thunderbird
    times-newer-roman
    ungoogled-chromium
    vesktop
    viber
    virt-manager
    vscodium
    waydroid
    webcord-vencord
    winboat
    wineWowPackages.full

    # GUI (NUR)
    inputs.zen-browser.packages."x86_64-linux".default

    # TUI Applications
    alsa-utils
    amdgpu_top
    auto-cpufreq
    automake
    bat
    brightnessctl
    busybox
    btop
    cargo
    cmake
    cpufrequtils
    curl
    distrobox
    docker-compose
    eza
    ffmpeg
    fish
    freerdp
    fzf
    gcc
    gdb
    git
    gnirehtet
    gnumake
    gnumake42
    home-manager
    jre
    kbd
    killall
    lazydocker
    lazygit
    lm_sensors
    mesa-demos
    mpv
    neovim
    ninja
    nodejs
    ntfs3g
    oh-my-zsh
    ollama
    openssl
    p7zip
    pciutils
    powertop
    qemu
    qemu_kvm
    speechd
    steam-run
    swayidle
    syncthing
    tgpt
    thermald
    tlp
    tmux
    unzip
    upower
    util-linux
    vim
    vimPlugins.nvchad
    wget
    wl-clipboard
    xclip
    zoxide
    zsh

    # Libraries
    binutils
    bintools
    coreutils-full
    dxvk
    glibc
    glibc.dev
    icu77
    libdrm
    libgcc
    libgccjit
    libvirt
    libxkbcommon
    luarocks
    libva
    libvdpau
    libvdpau-va-gl
    mesa
    nil
    pkg-config
    radeontop
    virglrenderer
    virtiofsd
    vkd3d
    vkd3d-proton
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
    zlib
    arduino-cli
    picocom
    screen

    # Dependencies
    dnsmasq
    flatpak
    fprintd
    ocl-icd
    intel-compute-runtime
    libnotify
    pocl
    pulseaudio
    rocmPackages.clr
    spice
    spice-gtk
    spice-vdagent
    speechd
    terminus_font
    ];
  virtualisation.docker.enable = true;
  services.flatpak.enable = true;
  users.extraGroups.docker.members = [ "zeph" ];
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
     # Core Latin + Western languages
     noto-fonts

     # Optional: High-quality fallback fonts
     liberation_ttf
     dejavu_fonts
    ];
  };
  chaotic={
    # mesa-git.enable = true;
    nyx={
      cache.enable=true;
      overlay.enable=true;
      nixPath.enable=true;

    };
  };
}
