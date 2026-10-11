{ self, ... }:

{
  flake.nixosModules.silverpineConfiguration =
    {
      pkgs,
      ...
    }:
    {
      imports = [
        self.nixosModules.silverpineHardware
        self.nixosModules.silverpineBoot
        self.nixosModules.niri
        self.nixosModules.users
        self.nixosModules.passwordManager
        self.nixosModules.fish
        self.nixosModules.nvidia
        self.nixosModules.silverpineHjem
        self.nixosModules.ghostty
      ];

      boot.kernelPackages = pkgs.linuxPackages_latest;

      networking.hostName = "silverpine";
      networking.networkmanager.enable = true;

      time.timeZone = "Europe/Oslo";

      i18n.defaultLocale = "en_US.UTF-8";

      services.xserver.enable = true;

      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;

      nixpkgs.config.allowUnfree = true;

      services.xserver.xkb = {
        layout = "no";
        variant = "";
      };

      console.keyMap = "no";

      services.printing.enable = true;

      services.pulseaudio.enable = false;

      security.rtkit.enable = true;
      security.polkit.enable = true;

      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;

      };

      hardware.opentabletdriver.enable = true;

      programs.steam.enable = true;
      programs.gamemode.enable = true;

      programs.kdeconnect.enable = true;

      environment.systemPackages = with pkgs; [
        vim
        fastfetch
        starship
        jujutsu
        wget
        ripgrep
        coreutils
        fd
        clang
        sbctl
        git
        efitools
        btop
        cmake
        python3
        godot
        nixd

        osu-lazer-bin
        lutris
        prismlauncher
        vivaldi
        pinta
      ];

      fonts.packages = with pkgs; [
        nerd-fonts.fira-code
        nerd-fonts.caskaydia-cove
        inter
        nerd-fonts.jetbrains-mono
      ];

      programs.nh = {
        enable = true;
        clean = {
          enable = true;
          extraArgs = "--keep 5";
        };
      };

      system.stateVersion = "25.11";

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
}
