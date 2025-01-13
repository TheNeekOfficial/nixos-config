{pkgs, ...}: {
  home.packages = with pkgs; [
    # terminal screens
    fastfetch
    cowsay
    cmatrix
    cbonsai

    # archives
    zip
    unzip

    # misc
    file
    which
    tree
    eza
    git
    bat

    # Terminal help tools
    brightnessctl # Brightness tool for terminall
    acpi # Check battery from terminal

    # productivity
    btop # replaces htop/nmon
    obsidian

    # Chats
    vesktop

    # KDE
    kdePackages.kdeconnect-kde

    # For laptop
    # https://nixos.wiki/wiki/Laptop

    # For stable versions
    # pkgs-stable.a etc.
  ];
}
