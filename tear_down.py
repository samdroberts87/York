import boto3
import botocore

BUCKET_NAME = "york-demo-tf-state-bucket-storage"


def main():
    try:
        delete_all_versions(BUCKET_NAME)
        delete_bucket(BUCKET_NAME)
    except Exception as e:
        print(f"Unexpected error: {e}")


def delete_all_versions(bucket_name=str):
    """Deletes all object versions and delete markers from the S3 bucket."""
    s3 = boto3.client("s3")
    paginator = s3.get_paginator("list_object_versions")

    deleted_any = False  # Track if any objects were deleted

    for page in paginator.paginate(Bucket=bucket_name):
        versions = page.get("Versions", []) + page.get("DeleteMarkers", [])

        if not versions:
            print("No object versions or delete markers found. Skipping deletion.")
            return

        for version in versions:
            key = version["Key"]
            version_id = version["VersionId"]
            print(f"Deleting version {version_id} of object {key}...")
            s3.delete_object(Bucket=bucket_name, Key=key, VersionId=version_id)
            deleted_any = True

    if deleted_any:
        print("All versions and delete markers have been removed.")


def delete_bucket(bucket_name=str):
    """Deletes the S3 bucket after ensuring it's empty."""
    s3 = boto3.client("s3")
    try:
        print("Attempting to delete bucket...")
        s3.delete_bucket(Bucket=bucket_name)
        print(f"Bucket '{bucket_name}' removed successfully.")
    except botocore.exceptions.ClientError as e:
        print(f"Error deleting bucket: {e}")


if __name__ == "__main__":
    main()
