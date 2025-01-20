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
    tldr # less overwhleming man pages

    # Terminal help tools
    brightnessctl # Brightness tool for terminall
    acpi # Check battery from terminal

    # productivity
    btop # replaces htop/nmon
    obsidian

    # RSS
    liferea
    libsecret # Necessary for liferea
    seahorse # GUI for gnome-keyring
    gnome-keyring # Necessary for libsecret

    # Chats
    vesktop

    # For laptop
    # https://nixos.wiki/wiki/Laptop

    # For stable versions
    # pkgs-stable.a etc.
  ];
}
