{ ... }:
{
  flake.nixosModules.starship =
    { ... }:
    {
      programs.starship.enable = true;

      hjem.users.chompou.xdg.config.files."starship.toml".source = ./starship/tokyo-night.toml;
    };
}
