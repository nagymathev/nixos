{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    git
    wget
    curl
    ripgrep
    fzf
    btop-rocm
    just
    tree
    dig

    kitty
    chromium
    brave

    vscode
    libreoffice
    vlc
    texliveFull

    gdu
    kdePackages.filelight

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
    cmake
    nodejs
    kubectl
    kubectx
    treefmt
    nixfmt-rfc-style
    lua5_4
  ];
}
