#!/usr/bin/env fish

# 

jq --null-input -c -M \
	--argjson modes "$(swaymsg -r -t get_binding_modes)" \
	--argjson mode "$(swaymsg -r -t get_binding_state)" \
	--arg bgcolor "#ddc7a1" \
	--arg bgalpha "40%" \
	'{
		text: $mode.name,
		class: "swaymode",
		tooltip: $modes
			| map(
				if . == $mode.name then
					"<span background=\"" + $bgcolor + "\" background_alpha=\"" + $bgalpha + "\">"
					+ .
					+ "</span>"
				else
					.
				end)
			| join("\\n")}'
