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

    kitty

    vscode
    libreoffice
    vlc

    # utils
    zip
    xz
    unzip
    p7zip
    file
    fd

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
