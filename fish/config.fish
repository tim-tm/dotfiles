if status is-interactive
    if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ];
        read -l -P 'Start sway? [Y/n]' confirm
        if [ "$confirm" != "N" ] && [ "$confirm" != "n" ];
            bash -c "DIR='$HOME/.config/sway/wallpaper' $HOME/.config/sway/scripts/randomize_wallpaper"
            exec sway
        end
    end
    set -gx EDITOR nvim
    set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
    set -gx SSH_ASKPASS $HOME/.config/fish/askpass.fish
    set -gx SSH_ASKPASS_REQUIRE prefer
    fish_add_path ~/.nix-profile/bin
end
