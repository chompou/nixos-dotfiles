{ self, inputs, ... }:
{
  flake.nixosModules.fish =
    { pkgs, lib, ... }:
    {
      programs.fish = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.myFish;
      };
    };

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.myFish = inputs.wrapper-modules.wrappers.fish.wrap {
        inherit pkgs;

      };
    };
}
