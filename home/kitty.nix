{ config, ... }:

{

 xdg.configFile."kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink
 	"${config.home.homeDirectory}/nixos/home/config/kitty.conf";

programs.kitty.enable = true;
programs.kitty.shellIntegration.enableZshIntegration = true;

}
