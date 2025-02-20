#!/bin/bash

BUCKET_NAME="york-demo-tf-state-bucket-storage"

BACKEND_PATH="/Users/sam/Developer/york_uni/terraform-backend"

aws s3api list-object-versions --bucket "$BUCKET_NAME" --query "Versions[].[Key,VersionId]" --output text | \
  awk '{print $1, $2}' | \
  while read -r key version_id; do
    echo "Deleting version $version_id of object $key..."
    aws s3api delete-object --bucket "$BUCKET_NAME" --key "$key" --version-id "$version_id"
  done

echo "All versions have been deleted."

aws s3 rb s3://york-demo-tf-state-bucket-storage --force --region ${{ secrets.AWS_REGION }}

echo "Bucket removed"
