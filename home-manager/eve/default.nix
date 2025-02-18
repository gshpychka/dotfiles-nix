{
  config,
  pkgs,
  lib,
  inputs,
  system,
  ...
}: {
  imports = [
    # ./linkapps.nix
    ./finicky
    ./ghostty
    ./alacritty.nix
    ./1password.nix
    ./npm.nix
    ../common/tmux
    ../common/neovim
    ../common
  ];

  home = {
    packages = with pkgs; [
      yubikey-manager
      zstd
      pam-reattach
      awscli2
    ];
  };
  programs = {
    ssh = {
      enable = true;
      matchBlocks = {
        everything = {
          host = "*";
          setEnv = {
            TERM = "xterm-256color";
          };
        };
        ${config.shared.harborHost} = {
          host = "${config.shared.harborHost}.${config.shared.localDomain}";
          user = config.shared.harborUsername;
          port = config.shared.harborSshPort;
          extraOptions = {ForwardAgent = "yes";};
        };
        reaper = {
          host = "reaper.${config.shared.localDomain}";
          extraOptions = {ForwardAgent = "yes";};
          user = "gshpychka";
        };
        hoard = {
          host = "hoard.${config.shared.localDomain}";
          extraOptions = {ForwardAgent = "yes";};
          user = "gshpychka";
        };
      };
    };
    tmux = {
      # different prefix for eve to avoid conflicts
      shortcut = "n";
    };
  };

  modules.ghostty.enable = true;
}
