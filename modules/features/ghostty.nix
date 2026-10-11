{ ... }:
{
  flake.nixosModules.ghostty =
    { pkgs, ... }:
    {
      hjem.users.chompou = {
        packages = [ pkgs.ghostty ];

        xdg.config.files."ghostty/config.ghostty".text = ''
          theme = TokyoNight Storm
          font-family = CaskaydiaCove Nerd Font Mono
          font-size = 12
        '';
      };
    };
}
