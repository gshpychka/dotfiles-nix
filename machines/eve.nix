{ config, pkgs, lib, ... }: {
  environment = {
    systemPackages = with pkgs; [ ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  programs = {
    zsh.enable = true;
  };

  networking = {
    hostName = "eve";
    computerName = "Eve";
    #knownNetworkServices = [ "Wi-Fi" "Thunderbolt Ethernet Slot 1" ];
    # disabled in favor of my pi-hole at home
    #dns = [
    #"9.9.9.9"
    #"1.1.1.1"
    #"8.8.8.8"
    #];
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
  };

  system = {
    defaults = {
      NSGlobalDomain = {
        AppleFontSmoothing = 2;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        AppleInterfaceStyle = "Dark";
        "com.apple.mouse.tapBehavior" = 1;

      };
      dock = {
        autohide = true;
        # autohide-delay = 0.0;
        # autohide-time-modifier = 0.0;
        minimize-to-application = true;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        ShowPathbar = true;
      };
      loginwindow.GuestEnabled = false;
      LaunchServices.LSQuarantine = false;
      spaces.spans-displays = false;
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
    build.applications = pkgs.lib.mkForce (pkgs.buildEnv {
        name = "applications";
        # link home-manager apps into /Applications instead of ~/Applications
        # fix from https://github.com/LnL7/nix-darwin/issues/139#issuecomment-663117229
        # TODO: parametrize the username
        paths = config.environment.systemPackages ++ config.home-manager.users.gshpychka.home.packages;
        pathsToLink = "/Applications";
    });
  };

  security.pam.enableSudoTouchIdAuth = true;
}
