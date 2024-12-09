{self, config, ...}:
{
  programs.waybar.style = ''
      * {
	font-size: 20px;
	font-family: JetBrains Mono;
      }

      window#waybar {
	background: #292b2e;
	color: #fdf6e3;
      }

      #custom-right-arrow-dark,
      #custom-left-arrow-dark {
	color: #1a1a1a;
      }
      #custom-right-arrow-light,
      #custom-left-arrow-light {
	background: #1a1a1a;
      }

      #workspaces,
      #clock.1,
      #clock.2,
      #clock.3,
      #pulseaudio,
      #memory,
      #cpu,
      #battery,
      #disk,
      #tray {
	background: #1a1a1a;
      }

      #workspaces button {
	padding: 0 2px;
	color: #fdf6e3;
      }
      #workspaces button.focused {
	color: #268bd2;
      }
      #workspaces button:hover {
	box-shadow: inherit;
	text-shadow: inherit;
      }
      #workspaces button:hover {
	background: #1a1a1a;
	border: #1a1a1a;
	padding: 0 3px;
      }

      #pulseaudio {
	color: #268bd2;
      }
      #memory {
	color: #2aa198;
      }
      #cpu {
	color: #6c71c4;
      }
      #battery {
	color: #859900;
      }
      #disk {
	color: #b58900;
      }

      #clock,
      #pulseaudio,
      #memory,
      #cpu,
      #battery,
      #disk {
	padding: 0 10px;
      }
  '';
}
