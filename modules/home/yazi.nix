{ inputs, pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.default;
    enableZshIntegration = true;
    # package = pkgs.yazi-unwrapped;

    settings = {
      manager = {
        linemode = "size";
        show_hidden = true;
        show_symlink = true;
        sort_by = "natural";
        sort_dir_first = true;
        sort_reverse = false;
        sort_sensitive = false;
      };
      
      plugin.prepend_fetchers = [
	{
	  id = "git";
	  name = "*";
	  run = "git";
	}
	{
	  id = "git";
	  name = "*/";
	  run = "git";
        }
      ];
    };

    plugins = {
      full-border = "${inputs.yazi-plugins}/full-border.yazi";
      git = "${inputs.yazi-plugins}/git.yazi";
    };
  };

  xdg.configFile."yazi/init.lua".text = ''
      require("full-border"):setup()
      require("git"):setup()
  '';

}
