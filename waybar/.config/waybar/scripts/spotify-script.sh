#!/usr/bin/env bash

text=$(playerctl -p spotify_player metadata --format '{{artist}} - {{title}} {{duration(position)}}/{{duration(mpris:length)}}' 2>/dev/null)
echo "{\"text\":\"$text\"}"
