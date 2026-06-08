{ self, inputs, ... }:
{
  flake.nixosConfigurations.silverpine = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.silverpineConfiguration
    ];
  };
}
