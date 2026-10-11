{ self, inputs, ... }:
{
  flake.nixosConfigurations.silverpine = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.silverpineConfiguration
      inputs.hjem.nixosModules.default
    ];
  };
}
