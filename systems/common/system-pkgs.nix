{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim
    neovim
    git
    wget
    curl
    ripgrep
    fzf
    btop
    just
    tree
    dig

    kitty
    chromium

    vscode
    libreoffice
    vlc
    texliveFull
    texmaker

    # utils
    zip
    xz
    unzip
    p7zip
    file
    fd
    xdelta

    adwaita-qt6
    adwaita-qt

    pciutils
    usbutils
    lm_sensors

    libclang
    cargo
    rustc
    gcc
    nodejs
  ];
}
