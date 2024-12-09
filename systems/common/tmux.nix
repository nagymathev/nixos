{
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    shortcut = "a";
    baseIndex = 1;
    terminal = "screen-256color";
    clock24 = true;
    plugins = with pkgs.tmuxPlugins; [
      gruvbox
      resurrect
    ];
  };
}
