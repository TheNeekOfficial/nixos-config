{ self, pkgs, ... }:
{
	home.packages = with pkgs; [
		kdePackages.dolphin
		kdePackages.systemsettings
		libreoffice
		lazygit
	];
}
