{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    shellAliases = {
      g = "git";
      gs = "git status";
      ga = "git add";
      gd = "git diff";
      gds = "git diff --staged";
      gc = "git commit -m";
      gp = "git push";

      ll = "ls -l";
      la = "ls -al";

      j = "just";
      k = "kubectl";
      kns = "kubens";
      ktx = "kubectx";
      ssh = "kitty +kitten ssh";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "direnv"
        "kubectl"
        "docker-compose"
      ];
      theme = "philips";
    };

    initExtra = ''
      bindkey '\e[H' beginning-of-line
      bindkey '\eOH' beginning-of-line
      bindkey '\e[F' end-of-line
      bindkey '\eOF' end-of-line
    '';
  };
}
