{ ... }:
{
  flake.nixosModules.starship =
    { ... }:
    {
      programs.starship = {
        enable = true;
        settings = builtins.fromTOML (builtins.readFile ./starship/tokyo-night.toml);
      };
    };
}
