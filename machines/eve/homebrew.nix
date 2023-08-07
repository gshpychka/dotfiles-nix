{
  config,
  pkgs,
  lib,
  ...
}: {
  homebrew = {
    enable = true;
    onActivation = {
      # "zap" removes manually installed brews and casks
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    caskArgs = {no_quarantine = true;};
    brews = [
      {
        name = "autoraise";
        args = ["with-dexperimental_focus_first"];
        restart_service = true;
      }
    ];
    casks = [
      # utilities
      #"browserosaurus" # choose browser on each link
      # "hammerspoon"
      "vmware-fusion"
      "balenaetcher"
      "transmission"
      "via"
      "qmk-toolbox"
      "adobe-acrobat-reader"

      # communication
      "telegram"
      "krisp"
      #"beeper"

      "1password"
      "firefox"
      #"visual-studio-code"
      "vlc" # media player
      #"wireshark" # network sniffer
      "leapp"
      "slack"
    ];
    taps = [
      "homebrew/services"
      # "cmacrae/formulae" # spacebar
      "Dimentium/homebrew-autoraise" # AutoRaise
    ];
    masApps = {
      "1Password for Safari" = 1569813296;
    };
  };
}
