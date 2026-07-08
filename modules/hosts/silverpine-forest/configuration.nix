{ self, inputs, ... }:

{
  flake.nixosModules.silverpineConfiguration =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      imports = [
        self.nixosModules.silverpineHardware
        self.nixosModules.silverpineBoot
        self.nixosModules.niri
        self.nixosModules.users
        # self.nixosModules.fish
        # self.nixosModules.nvidia
      ];

      boot.kernelPackages = pkgs.linuxPackages_latest;

      networking.hostName = "silverpine";
      networking.networkmanager.enable = true;

      time.timeZone = "Europe/Oslo";

      i18n.defaultLocale = "en_US.UTF-8";

      services.xserver.enable = true;

      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;

      environment.shells = with pkgs; [ fish ];
      users.defaultUserShell = pkgs.fish;
      programs.fish.enable = true;

      services.xserver.xkb = {
        layout = "no";
        variant = "";
      };

      console.keyMap = "no";

      services.printing.enable = true;

      services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;

      };

      hardware.graphics.enable = true;
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.nvidia.open = true;

      hardware.nvidia.powerManagement.enable = true;

      programs.steam.enable = true;
      programs.gamemode.enable = true;

      programs.kdeconnect.enable = true;

      nixpkgs.config.allowUnfree = true;

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

        lutris
        prismlauncher
        qbz
        vivaldi
      ];

      fonts.packages = with pkgs; [
        nerd-fonts.fira-code
        nerd-fonts.caskaydia-cove
        inter
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
