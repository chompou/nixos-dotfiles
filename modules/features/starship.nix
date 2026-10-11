{ ... }:
{
  flake.nixosModules.starship =
    { ... }:
    {
      programs.starship.enable = true;

      hjem.users.chompou.files.".config/starship.toml".source = ./starship/tokyo-night.toml;
    };
}
