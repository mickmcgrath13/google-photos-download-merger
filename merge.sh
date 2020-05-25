#!/bin/bash
cd /home/tron/Projects/google-photos-download-merger
# SRC_FOLDER should be from $PHOTOS_ROOT





####### TESTING
PHOTOS_ROOT="/media/tron/Seagate Expansion Drive/GooglePhotos/test_run"
DEST_FOLDER="$PHOTOS_ROOT/test_merge_dist"
LOG_FOLDER="$PHOTOS_ROOT/test_merge_log"
SRC_FOLDER="test"




####### FOR REALS
# PHOTOS_ROOT="/media/tron/Seagate Expansion Drive/GooglePhotos/raw"
# DEST_FOLDER="/media/tron/Seagate Expansion Drive/GooglePhotos/dist"
# LOG_FOLDER="/media/tron/Seagate Expansion Drive/GooglePhotos/log"
# SRC_FOLDER="takeout-20200509T174750Z-001"




####### FOR REALS - parameterized
# SRC_FOLDER="$1"




if [ -n "$CLEAN_TEST" ]; then
	echo "cleaning DEST_FOLDER: $DEST_FOLDER"
	rm -rf "$DEST_FOLDER"/*
	echo "cleaning LOG_FOLDER: $LOG_FOLDER"
	rm -rf "$LOG_FOLDER"/*
	exit 0
fi







current_date_str=$(date +'%Y-%m-%d-%H%M%S')
log_file_name="${current_date_str}_${SRC_FOLDER}.log"
echo "log_file_name: $log_file_name"

touch "$LOG_FOLDER/${log_file_name}"

# IMAGE_ORGANIZER_MOVE="1" \
./run.sh \
"$PHOTOS_ROOT/$SRC_FOLDER" \
"$DEST_FOLDER" | tee -a "$LOG_FOLDER/${log_file_name}"