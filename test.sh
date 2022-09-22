#!/bin/bash

while [ true ]; do
        mkdir -p ./.tmp
        mkdir -p ./mp3

        # Demander vidéo YT
        echo -n "Youtube video URL: "
        read URL

        # Téléchargement de la vidéo en MP4
        youtube-dl -f mp4 -o './.tmp/%(title)s.%(ext)s' $URL

        # Conversion au format MP3
        FILE="$(youtube-dl -f mp4 -o './.tmp/%(title)s.%(ext)s' $URL --get-filename)"
        echo "Traitement de $FILE"
        NAME=$(basename "$FILE")
        ffmpeg -i "$FILE" "./mp3/${NAME%.*}.mp3"

        rm "$FILE"
done