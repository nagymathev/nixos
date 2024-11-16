{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    wl-clipboard
    tree-sitter
    nixd
    dockerfile-language-server-nodejs
    docker-compose-language-service
    yaml-language-server
    rust-analyzer
    lua-language-server
    bash-language-server
    pylyzer
    pyright
    basedpyright
    vscode-langservers-extracted
    typescript-language-server
    typescript
    emmet-language-server
  ];
}
