{ self, pkgs, ... }:
{
	home.packages = with pkgs; [
		kdePackages.dolphin		
		libreoffice
		lazygit
	];
}
