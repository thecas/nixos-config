{ ... }:
{
    programs.regreet = {
        enable = true;

	#only one monitor
        #cageArgs = [ "-s" "-m" "last" ];

	settings = {
            background.path = "/usr/share/backgrounds/greeter.jpg";
            GTK = {
                application_prefer_dark_theme = true;

            };
        };
    };
}
