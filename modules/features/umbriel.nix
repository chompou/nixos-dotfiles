{ ... }:
{
  flake.nixosModules.umbriel =
    { inputs, ... }:
    {
      imports = [ inputs.umbriel.hjemModules.default ];

      services.displayManager.defaultSession = "umbriel";

      programs.umbriel = {
        enable = true;
        settings = {
          general.autostart = [ "noctalia" ];
          colors = {
            background = "#16161DF0";
            text_primary = "#E0DEF4FF";
            text_muted = "#908CAAFF";
            accent_primary = "#9CCFD8FF";
            accent_secondary = "#31748FFF";
            warning = "#F6C177FF";
            error = "#EB6F92FF";
            insert_hint = "#31748F80";
            backdrop = "#000000FF";
            shadow = "#00000088";
            border = {
              focused = "#9CCFD8FF";
              unfocused = "#524F67FF";
              outer = "#00000000";
            };
            overview = {
              background_tint = "#524F6788";
              workspace_background = "#00000044";
            };
          };

          appearance = {
            prefer_no_csd = true;
            border_width = 1;
            outer_border_width = 0;
            corner_radius = 16;
            blur = {
              enabled = true;
              optimized = true;
              passes = 2;
              radius = 5;
              noise = 0.03;
              brightness = 0.9;
              contrast = 0.9;
              saturation = 1.0;
            };
            shadow = {
              enabled = true;
              softness = 20;
              offset_x = 0;
              offset_y = 10;
            };
          };

          layout = {
            mode = "scrolling";
            gap = 16;
            extent_presets = [
              0.333
              0.5
              0.667
            ];
            scrolling = {
              default_extent_fraction = 1.0;
              center_underfull_strip = true;
            };
          };
          input = {
            keyboard.layout = "no";
            mouse = {
              accel_profile = "flat";
              sensitivity = 0.0;
              scroll_wheel_step = 60;
            };
            focus = {
              follows_mouse = true;
              follows_mouse_max_scroll = 0.0;
            };
          };
          output = {
            DP-1 = {
              mode = "1920x1080@143.981";
              scale = 1.0;
              transform = "90";
              position = [
                1920
                0
              ];
            };
          };
          DP-2 = {
            mode = "1920x1080@239.760";
            scale = 1.0;
            position = [
              0
              540
            ];
          };
          keybinds = {
            "Mod+T" = "spawn:ghostty";
            "Mod+E" = "spawn:emacs";
            "Mod+G" = "spawn:vivaldi";
            "Mod+Space" = "window-toggle-floating";
            "Mod+Shift+S" = "spawn:noctalia msg screenshot-region";
            "Mod+Escape" = "spawn:noctalia msg panel-toggle session";
            "Mod+MouseMiddle" = {
              action = "overview-toggle";
              repeat = false;
            };
            "Mod+W" = "spawn:noctalia msg panel-toggle wallpaper";
            "Mod+D" = "spawn:noctalia msg panel-toggle launcher";
            "Mod+Z" = "spawn:noctalia msg panel-toggle launcher /emo";
            "Mod+V" = "spawn:noctalia msg panel-toggle clipboard";
            "Mod+X" = "spawn:noctalia msg bar-toggle";
            "Mod+Shift+W" = "spawn:noctalia msg desktop-widgets-toggle-edit";
            "Mod+Shift+T" = "spawn:noctalia msg panel-toggle test";
            "Mod+Shift+E" = "session-quit:skip-confirmation";
            "Mod+Q" = {
              action = "window-close";
              repeat = false;
            };
            "Mod+O" = {
              action = "overview-toggle";
              repeat = false;
            };
            "Mod+R" = "window-cycle-primary-extent";
            "Mod+A" = "window-set-primary-extent:0.333";
            "Mod+S" = "window-set-primary-extent:0.5";
            "Mod+F" = "window-set-primary-extent:1.0";
            "Mod+Left" = "window-focus-left";
            "Mod+Down" = "window-focus-down";
            "Mod+Up" = "window-focus-up";
            "Mod+Right" = "window-focus-right";
            "Mod+H" = "window-focus-left";
            "Mod+J" = "window-focus-down";
            "Mod+K" = "window-focus-up";
            "Mod+L" = "window-focus-right";
            "Mod+Shift+Left" = "column-move-left";
            "Mod+Shift+Down" = "window-move-down";
            "Mod+Shift+Up" = "window-move-up";
            "Mod+Shift+Right" = "column-move-right";
            "Mod+U" = "workspace-previous";
            "Mod+I" = "workspace-next";
            "Mod+Ctrl+Left" = "output-focus-left";
            "Mod+Ctrl+Down" = "output-focus-down";
            "Mod+Ctrl+Up" = "output-focus-up";
            "Mod+Ctrl+Right" = "output-focus-right";
            "Mod+Ctrl+H" = "output-focus-left";
            "Mod+Ctrl+J" = "output-focus-down";
            "Mod+Ctrl+K" = "output-focus-up";
            "Mod+Ctrl+L" = "output-focus-right";
            "Mod+1" = "workspace-switch:1";
            "Mod+2" = "workspace-switch:2";
            "Mod+3" = "workspace-switch:3";
            "Mod+4" = "workspace-switch:4";
            "Mod+5" = "workspace-switch:5";
            "Mod+6" = "workspace-switch:6";
            "Mod+7" = "workspace-switch:7";
            "Mod+8" = "workspace-switch:8";
            "Mod+9" = "workspace-switch:9";

            "Mod+Shift+1" = "window-move-to-workspace:1";
            "Mod+Shift+2" = "window-move-to-workspace:2";
            "Mod+Shift+3" = "window-move-to-workspace:3";
            "Mod+Shift+4" = "window-move-to-workspace:4";
            "Mod+Shift+5" = "window-move-to-workspace:5";
            "Mod+Shift+6" = "window-move-to-workspace:6";
            "Mod+Shift+7" = "window-move-to-workspace:7";
            "Mod+Shift+8" = "window-move-to-workspace:8";
            "Mod+Shift+9" = "window-move-to-workspace:9";
            "Mod+WheelUp" = "window-focus-left";
            "Mod+WheelDown" = "window-focus-right";
            "Mod+Shift+WheelUp" = "column-move-left";
            "Mod+Shift+WheelDown" = "column-move-right";
          };
        };
      };
    };
}
