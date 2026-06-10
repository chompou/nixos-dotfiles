{ self, inputs, ... }:
{
  flake.nixosModules.niri =
    { pkgs, lib, ... }:
    {
      programs.niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
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
      packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;

        settings = {
          spawn-at-startup = [
            (lib.getExe self'.packages.myNoctalia)
            (lib.getExe pkgs.vesktop)
          ];

          xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

          input = {
            keyboard = {
              xkb.layout = "no";
            };
            mouse = {
              accel-profile = "flat";
              accel-speed = 0.0;
            };
          };

          prefer-no-csd = true;

          layout = {
            preset-column-widths = [
              { proportion = 0.33333; }
              { proportion = 0.5; }
              { proportion = 0.66667; }
            ];
            gaps = 6;
          };

          window-rules = [
            {
              matches = [
                { app-id = "vivaldi"; }
              ];
              open-maximized = true;
            }
            {
              matches = [
                { is-active = false; }
              ];
              opacity = 0.96;
            }
            {
              matches = [
                { app-id = ".*"; }
              ];
              geometry-corner-radius = 10;
              clip-to-geometry = true;
            }
          ];

          outputs = {
            "DP-2" = {
              mode = "1920x1080@239.760";
              scale = 1;
              transform = "normal";
              position = _: {
                props = {
                  x = 0;
                  y = 540;
                };
              };
            };

            "DP-1" = {
              mode = "1920x1080@143.981";
              scale = 1;
              transform = "90";
              position = _: {
                props = {
                  x = 1920;
                  y = 0;
                };
              };
            };
          };

          binds = {
            "Mod+T".spawn-sh = lib.getExe pkgs.ghostty;
            "Super+D".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
            "Mod+G".spawn-sh = "vivaldi";

            "Mod+Q".close-window = _: { };
            "Mod+F".maximize-column = _: { };
            "Mod+Shift+F".toggle-window-floating = _: { };
            "Mod+C".center-column = _: { };

            "Mod+Shift+S".screenshot = _: { };

            "Mod+H".focus-column-left = _: { };
            "Mod+L".focus-column-right = _: { };
            "Mod+K".focus-window-up = _: { };
            "Mod+J".focus-window-down = _: { };

            "Mod+Left".focus-column-left = _: { };
            "Mod+Right".focus-column-right = _: { };
            "Mod+Up".focus-window-up = _: { };
            "Mod+Down".focus-window-down = _: { };

            "Mod+Shift+H".move-column-left = _: { };
            "Mod+Shift+L".move-column-right = _: { };
            "Mod+Shift+K".move-window-up = _: { };
            "Mod+Shift+J".move-window-down = _: { };

            "Mod+1".focus-workspace = "w0";
            "Mod+2".focus-workspace = "w1";
            "Mod+3".focus-workspace = "w2";
            "Mod+4".focus-workspace = "w3";
            "Mod+5".focus-workspace = "w4";
            "Mod+6".focus-workspace = "w5";
            "Mod+7".focus-workspace = "w6";
            "Mod+8".focus-workspace = "w7";
            "Mod+9".focus-workspace = "w8";
            "Mod+0".focus-workspace = "w9";

            "Mod+Shift+1".move-column-to-workspace = "w0";
            "Mod+Shift+2".move-column-to-workspace = "w1";
            "Mod+Shift+3".move-column-to-workspace = "w2";
            "Mod+Shift+4".move-column-to-workspace = "w3";
            "Mod+Shift+5".move-column-to-workspace = "w4";
            "Mod+Shift+6".move-column-to-workspace = "w5";
            "Mod+Shift+7".move-column-to-workspace = "w6";
            "Mod+Shift+8".move-column-to-workspace = "w7";
            "Mod+Shift+9".move-column-to-workspace = "w8";
            "Mod+Shift+0".move-column-to-workspace = "w9";

            "Mod+Ctrl+H".set-column-width = "-5%";
            "Mod+Ctrl+L".set-column-width = "+5%";
            "Mod+Ctrl+J".set-window-height = "-5%";
            "Mod+Ctrl+K".set-window-height = "+5%";

            "Mod+WheelScrollDown".focus-column-left = _: { };
            "Mod+WheelScrollUp".focus-column-right = _: { };
            "Mod+Ctrl+WheelScrollDown".focus-workspace-down = _: { };
            "Mod+Ctrl+WheelScrollUp".focus-workspace-up = _: { };
          };
        };
      };
    };
}
