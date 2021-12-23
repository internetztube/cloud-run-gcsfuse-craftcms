mkdir -p $MNT_DIR
gcsfuse -o rw,allow_other --file-mode 777 --dir-mode 777 --foreground --implicit-dirs $DISK_BUCKET $MNT_DIR
