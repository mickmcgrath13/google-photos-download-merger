#!/bin/bash
cd /home/tron/Projects/google-photos-download-merger
# SRC_FOLDER should be from $PHOTOS_ROOT





####### TESTING
# PHOTOS_ROOT="/media/tron/Seagate Expansion Drive/GooglePhotos/test_run"
# DEST_FOLDER="$PHOTOS_ROOT/test_merge_dist"
# LOG_FOLDER="$PHOTOS_ROOT/test_merge_log"
# SRC_FOLDER="test"




####### FOR REALS
PHOTOS_ROOT="/media/tron/Seagate Expansion Drive/GooglePhotos"
DEST_FOLDER="/media/tron/Seagate Expansion Drive/GooglePhotos/raw_merged"
LOG_FOLDER="/media/tron/Seagate Expansion Drive/GooglePhotos/log_merged"
SRC_FOLDER="raw"




####### FOR REALS - parameterized
# SRC_FOLDER="$1"




if [ -n "$CLEAN_TEST" ]; then
	echo "cleaning DEST_FOLDER: $DEST_FOLDER"
	rm -rf "$DEST_FOLDER"
	echo "cleaning LOG_FOLDER: $LOG_FOLDER"
	rm -rf "$LOG_FOLDER"
	exit 0
fi






echo ""
echo "Checkig if LOG_FOLDER exists ($LOG_FOLDER)"
if [ -d "$LOG_FOLDER" ]; then
  echo "   LOG_FOLDER exists"
else
  echo "   LOG_FOLDER does not exist.  Creating"
  mkdir -p "$LOG_FOLDER"
fi
echo ""


current_date_str=$(date +'%Y-%m-%d-%H%M%S')
log_file_name="${current_date_str}_${SRC_FOLDER}.log"
echo "log_file_name: $log_file_name"

touch "$LOG_FOLDER/${log_file_name}"

# IMAGE_ORGANIZER_MOVE="1" \
./run.sh \
"$PHOTOS_ROOT/$SRC_FOLDER" \
"$DEST_FOLDER" | tee -a "$LOG_FOLDER/${log_file_name}"