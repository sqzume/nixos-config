{ pkgs, ... }:
{
  imports = [
    ./nvim.nix
    ./hyprland.nix
  ];

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    firefox
  ];

  programs.kitty.enable = true;
  programs.gh.enable = true;
  programs.git = {
    enable = true;
    settings.user = {
      name = "sqzume";
      email = "173809390+sqzume@users.noreply.github.com";
    };
  };
}
