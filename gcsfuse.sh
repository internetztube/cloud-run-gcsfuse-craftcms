# gcsfuse --foreground --debug_http --debug_gcs --debug_fuse --implicit-dirs --key-file /app/keyfile.json cloud-run-persistent-storage $MNT_DIR
# gcsfuse --foreground --debug_http --debug_gcs --debug_fuse --implicit-dirs $DISK_BUCKET $MNT_DIR

# https://stackoverflow.com/a/70430026/2421121
sudo gcsfuse --foreground --debug_http --debug_gcs --debug_fuse --implicit-dirs $DISK_BUCKET $MNT_DIR
