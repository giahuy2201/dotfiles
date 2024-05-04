{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      # useOSProber = true;
    };
  };

  networking.hostName = "kokomi"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.giahuy = {
    isNormalUser = true;
    description = "giahuy";
    extraGroups = [ "networkmanager" "wheel" "wireshark" "keyd"];
    shell = pkgs.zsh;
    useDefaultShell = true;
    packages = with pkgs; [
      firefox
    ];
  };

  users.groups.keyd = {};

  systemd.services.keyd.serviceConfig.CapabilityBoundingSet = lib.mkForce [
    "CAP_SYS_NICE"
    "CAP_SETGID"
  ];                                                           
  
  # qt
  qt.enable = true;
  qt.platformTheme = "gnome";
  qt.style = "adwaita-dark";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    pciutils
    usbutils
    wget
    neofetch
    htop
    btop
    iperf3
    powertop
    vscodium
    stow
    wireshark
    keyd
    xclip
    efibootmgr
    gnome.gnome-tweaks
    wireguard-tools
    nerdfonts
    gcc
    pipx
  ];

  programs.zsh.enable = true;
  programs.wireshark.enable = true;
  programs.git.enable = true;
  programs.tmux.enable = true;
  #programs.screen.enable = true;
  programs.flashrom.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.flatpak.enable = true;
  # services.keyd.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  system.stateVersion = "23.05";

  boot.initrd.luks.devices.home.device = "/dev/disk/by-uuid/21532a09-c135-41d2-83cf-0da701daa4a4";
  fileSystems."/home".device = "/dev/mapper/home";

}
