{ pkgs, ... }:
{
    programs.regreet = {
        enable = true;
        settings = {
            background.path = "/usr/share/backgrounds/greeter.jpg";
            GTK = {
                application_prefer_dark_theme = true;

            };
        };
    };
}
