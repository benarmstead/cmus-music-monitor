# Cmus Music Monitor

Shell script to monitor music playing in Cmus and write it to a CSV

# Installation

`git clone https://github.com/benarmstead/cmus-music-monitor/`

`cd cmus-music-monitor`

`chmod +x musicMonitor.sh`

`./musicMonitor`

# Output
`<Title>, <Artist>,	<Album>,	<Genre>,	<Song Length>,	<Track number>,	<Year>,	<Play date>,	<Play time>,	<Volume>`

When a tag is not found, then nothing is added except "," , meaning that the colums are always the same for each feild
