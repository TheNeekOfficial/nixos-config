{
  config, 
  pkgs, 
  pkgs-stable,
  ... 
  }:

{
  imports = [
    ./modules/bundle.nix
  ];
  # please change the username & home directory to your own
  home.username = "dylan";
  home.homeDirectory = "/home/dylan";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

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
        
        # productivity
	btop # replaces htop/nmon
        qownnotes

	# Chats
        vesktop

        # KDE
        kdePackages.kdeconnect-kde

	# For laptop
	# https://nixos.wiki/wiki/Laptop 

	# For stable versions
	# pkgs-stable.a etc.
  ];
  
  #home.file.".config/discord" = {
  #  source = ./discord;
  #  recursive = true;
  #};

  programs.git = {
  	enable = true;
	userName = "TheNeekOfficial";
	userEmail = "dylan_leslie05@yahoo.com.au";

	# TO use stable version
	# package = pkgs-stable.git;
  };

 # alacritty - a cross-platform, GPU-accelerated terminal emulator
  # programs.alacritty = {
  #   enable = true;
  #   # custom settings
  #   settings = {
  #     env.TERM = "xterm-256color";
  #     font = {
  #       size = 12;
  #       draw_bold_text_with_bright_colors = true;
  #     };
  #     scrolling.multiplier = 5;
  #     selection.save_to_clipboard = true;
  #   };
  # };

  # programs.bash = {
  #   enable = true;
  #   enableCompletion = true;
  #   # TODO add your custom bashrc here
  #   bashrcExtra = ''
  #     export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
  #   '';

    # set some aliases, feel free to add more or remove some
    # shellAliases = {
    #   k = "kubectl";
    #   urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
    #   urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    # };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}

