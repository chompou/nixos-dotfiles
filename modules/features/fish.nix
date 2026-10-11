{ self, ... }:
{
  flake.nixosModules.fish =
    { config, ... }:
    {
      imports = [ self.nixosModules.starship ];

      programs.fish.enable = true;

      environment.shells = [ config.programs.fish.package ];
      users.defaultUserShell = config.programs.fish.package;

      hjem.users.chompou.xdg.config.files."fish/config.fish".text = ''
        status is-interactive; and begin

            # Aliases
            alias ... 'cd ../..'
            alias g git
            alias doom "$HOME/.emacs.d/bin/doom"

            # Interactive shell initialisation
            set fish_greeting

        end
      '';
    };
}
