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

    zip
    xz
    unzip
    p7zip

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
