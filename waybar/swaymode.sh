#!/usr/bin/env fish

swaymsg -r -t get_binding_state | jq -c -M '{text: .name, class: "swaymode"}'
