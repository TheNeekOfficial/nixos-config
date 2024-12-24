{ self, pkgs, inputs, dotfiles, ...}:

let 
	my-nvim = "${inputs.dotfiles}/.config/nvim";
in
{
	home.packages = with pkgs; [
		neovim
		zig
		fzf
		fd
		ripgrep
	];
	
	home.file.".config/nvim" = {
		recursive = true;
		source = my-nvim;
	};
}
