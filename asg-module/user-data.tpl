#!/bin/bash
EFS_FILE_SYSTEM_ID="${efs_dns_name}"
MOUNT_DIR="/efs"
sudo mkdir -p $MOUNT_DIR
sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $EFS_FILE_SYSTEM_ID:/ $MOUNT_DIR
sudo chmod go+rw $MOUNT_DIR