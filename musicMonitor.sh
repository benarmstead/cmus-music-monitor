#!/bin/sh
last_title="OcmICSmalcapq"

# Modify the line below to where you wish to store the .csv generated by cmus
direc=~/music.csv
# This could be re-written as direc=$1 if you wish to pass the file to be saved in as an argument


while true ; do # Loop forever

    if ! cmus-remote -C >/dev/null 2>&1 ; then
        sleep 120 # Cmus isnt running, wait 120 seconds and then try again
    fi

    info=$(cmus-remote -Q) # Get information about current playing song in cmus
    if [ "$(echo "$info" | sed -n 's/^status //p')" = "stopped" ] ; then
        sleep 60 # Cmus is stopped, but open, wait for 60 seconds and try again to see if a song is playing
    fi

    title=$(echo "$info" | sed -n 's/^tag title //p')
    title="$(sed s/[\,]//g <<< $title)"

    if [ "$title" != "$last_title" ] ; then # If the title is not the same as the last one (a different song is playing)
        # Gets the information needed to save the record
	file=$(echo "$info" | sed -n 's/^file //p')
        artist=$(echo "$info" | sed -n 's/^tag artist //p')
        album=$(echo "$info" | sed -n 's/^tag album //p')

        genre=$(echo "$info" | sed -n 's/^tag genre //p')
        duration=$(echo "$info" | sed -n 's/^duration //p')
        tracknumber=$(echo "$info" | sed -n 's/^tag tracknumber //p')
        year=$(echo "$info" | sed -n 's/^tag date //p')

        datenow=$(date +"%Y-%m-%d")
        timenow=$(date +"%H:%M")
        volume=$(amixer sget Master -c 0 | grep 'Mono:' | awk -F'[][]' '{ print $2 }') # Gets the volume from alsamixer

        volume=${volume::-1} # Removes % sign
        genre="$(sed s/[\,]//g <<< $genre)"

	# Sets the last title to the one just played so that the same song does not get recorded 2x
        last_title=$title

        printf "$title,$artist,$album,$genre,$duration,$tracknumber,$year,$datenow,$timenow,$volume\n" >> $direc 
	# Saves the output to the given directory
    else
        sleep 60 # If title != last one, then wait 60 seconds to see if the song has changed
	# This could be changed to a lower figure, for less chance of missing a song. However, for my needs, 60 seconds is fine
    fi
done
