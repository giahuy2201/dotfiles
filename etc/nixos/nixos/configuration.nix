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
      extraEntries = ''
      menuentry 'Arch Linux (on /dev/nvme0n1p2)' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-7a008580-fefa-48d7-b134-8e179cdcc59a' {
        insmod part_gpt
        insmod ext2
        search --no-floppy --fs-uuid --set=root 7a008580-fefa-48d7-b134-8e179cdcc59a
        linux /boot/vmlinuz-linux root=UUID=7a008580-fefa-48d7-b134-8e179cdcc59a rw loglevel=3 quiet
        initrd /boot/initramfs-linux.img
      }
      menuentry 'Debian GNU/Linux 12 (bookworm) (on /dev/nvme0n1p3)' --class debian --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-a0ebae34-8ca7-4995-85a8-7a05827b379d' {
        insmod part_gpt
        insmod ext2
        search --no-floppy --fs-uuid --set=root a0ebae34-8ca7-4995-85a8-7a05827b379d
        linux /boot/vmlinuz-6.1.0-20-amd64 root=UUID=a0ebae34-8ca7-4995-85a8-7a05827b379d ro quiet
        initrd /boot/initrd.img-6.1.0-20-amd64
      }
      '';
    };
  };
  # Enable iommu

  boot.kernelParams = [
    # enable IOMMU
    "intel_iommu=on"
    "iommu=pt"
  ];

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

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  hardware.rtl-sdr.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.displayManager.defaultSession = "plasma";

  # Enable the KDE Desktop Environment.
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [
      pkgs.brlaser
    ];
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.giahuy = {
    isNormalUser = true;
    description = "giahuy";
    extraGroups = [ "networkmanager" "wheel" "wireshark" "keyd" "libvirtd" "plugdev" ];
    shell = pkgs.zsh;
    useDefaultShell = true;
    packages = with pkgs; [
      firefox
    ];
  };

  users.groups.keyd = {};
  
  services.udev = {
    extraRules = ''
      SUBSYSTEM=="usbmon", GROUP="wireshark", MODE="0640"
    '';
  };

  # Enable QT
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
};

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    binwalk
    btop
    dig
    efibootmgr
    gcc
    gnome.gnome-tweaks
    gparted
    htop
    iperf3
    keyd
    libvirt
    minicom
    neofetch
    nerdfonts
    nmap
    pciutils
    pipx
    powertop
    python3
    qbittorrent
    screen
    stow
    ubootTools
    unzip
    usbtop
    usbutils
    virt-manager
    vlc
    vscodium
    wget
    wineWowPackages.waylandFull
    wireguard-tools
    wireshark
    xclip
  ];

  programs.zsh.enable = true;
  programs.wireshark.enable = true;
  programs.git.enable = true;
  programs.tmux.enable = true;
  programs.flashrom.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Install CJK fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

  # Enable libvirt daemon
  virtualisation.libvirtd = {
  enable = true;
  qemu = {
    package = pkgs.qemu_kvm;
    runAsRoot = true;
    swtpm.enable = true;
    ovmf = {
      enable = true;
      packages = [(pkgs.OVMF.override {
        secureBoot = true;
        tpmSupport = true;
      }).fd];
    };
  };
};

  services.syncthing = {
    enable = true;
    user = "giahuy";
    configDir = "/home/giahuy/.config/syncthing";   # Folder for Syncthing's settings and keys
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.flatpak.enable = true;
  # services.keyd.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  programs.ssh.askPassword = lib.mkForce "${pkgs.gnome.seahorse}/libexec/seahorse/ssh-askpass";

  system.stateVersion = "24.05";
  system.autoUpgrade.enable  = true;

  boot.initrd.luks.devices.home.device = "/dev/disk/by-uuid/21532a09-c135-41d2-83cf-0da701daa4a4";
  fileSystems."/home".device = "/dev/mapper/home";

  fileSystems."/mnt/Data" = {
    device = "truenas.home:/mnt/Cold/Data";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" ];
  };

  fileSystems."/mnt/Backup" = {
    device = "truenas.home:/mnt/Cold/Backup";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" ];
  };

  fileSystems."/mnt/Flash" = {
    device = "truenas.home:/mnt/Hot/Flash";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" ];
  };

  fileSystems."/mnt/Config" = {
    device = "truenas.home:/mnt/Hot/Config";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" ];
  };

}
