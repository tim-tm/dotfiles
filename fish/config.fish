if status is-interactive
	if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ];
		read -l -P 'Start sway? [Y/n]' confirm
		if [ "$confirm" != "N" ] && [ "$confirm" != "n" ];
			exec sway
		end
	end
	set -gx EDITOR nvim
	set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
end
