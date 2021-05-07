# Cmus Music Monitor

Shell script for Cmus to monitor music listening habits.

Gets all the metadata of the song being listened to, and writes it to a CSV.

# Installation

`git clone https://github.com/benarmstead/cmus-music-monitor/`

`cd cmus-music-monitor`

`chmod +x musicMonitor.sh`

`./musicMonitor`

I recommend running this script on statup in the background in order for it to always be monitoring Cmus.

e.g. I added exec `~/Scripts/musicMonitor/musicMonitor.sh` to my `.config/sway/config`

# Output
` <Title>, <Artist>,	<Album>,	<Genre>,	<Song Length>,	<Track number>,	<Year>,	<Play date>,	<Play time>,	<Volume>`

When a tag is not found, then nothing is added except "," , meaning that the colums are always the same for each field.
