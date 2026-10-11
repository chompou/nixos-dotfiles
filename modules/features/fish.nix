{ self, ... }:
{
  flake.nixosModules.fish =
    { config, ... }:
    {
      imports = [ self.nixosModules.starship ];

      programs.fish.enable = true;

      environment.shells = [ config.programs.fish.package ];
      users.defaultUserShell = config.programs.fish.package;
    };
}
