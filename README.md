# google-photos-download-merger

Moves files from a source directory to a destination directory putting files into buckets based on the files' parent directory names.

Used initially for a Google Takeout download of Google Photos where the download had to be split up into 50GB chunks, and some folders/albums were split up across "chunks"

Usage
```
./run $src $dest
```

## Settings

Settings are configured via environment variables

### Copy/Move

`IMAGE_ORGANIZER_MOVE`

If value present, move instead of copy