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
    clock24 = true;
    plugins = with pkgs.tmuxPlugins; [
      gruvbox
      resurrect
    ];
  };
}
