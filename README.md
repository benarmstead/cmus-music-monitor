# Cmus Music Monitor

---

I have re-written this project in rust. I recommend using the rust version, found [here](https://github.com/benarmstead/cmus-music-monitor-rs/).

The rust version will be supported in the future unlike this one.

The rust version also fixes bugs in this script and adds new features, it is also a drop in replacement.

---

Shell script for Cmus to monitor music listening habits.

Gets all the metadata of the song being listened to, and writes it to a csv.

## Program to analyze data

I have written a small python program utilizing matplotlib to analyze and effectively display the data stored in the .csv.

It can be found [here](https://github.com/benarmstead/music-grapher)

# Installation

`git clone https://github.com/benarmstead/cmus-music-monitor/`

`cd cmus-music-monitor`

`chmod +x musicMonitor.sh`

`./musicMonitor`

I recommend running this script on startup in the background in order for it to always be monitoring Cmus.

e.g. I added `exec ~/Scripts/musicMonitor/musicMonitor.sh` to my `.config/sway/config`

# Output
` <Title>, <Artist>,	<Album>,	<Genre>,	<Song Length>,	<Track number>,	<Year>,	<Play date>,	<Play time>,	<Volume>`

When a tag is not found, then nothing is added except "," , meaning that the columns are always the same for each field.
