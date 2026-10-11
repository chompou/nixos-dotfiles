# modules/programs/ghostty.nix (any path under modules/ works)
{ ... }:
{
  flake.nixosModules.ghostty =
    { pkgs, ... }:
    {
      hjem.users.chompou = {
        packages = [ pkgs.ghostty ];

        files.".config/ghostty/config.ghostty".text = ''
          theme = TokyoNight Storm
          font-family = CaskaydiaCove Nerd Font Mono
          font-size = 12
        '';
      };
    };
}
