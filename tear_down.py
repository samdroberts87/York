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
    s3 = boto3.client("s3")
    try:
        response = s3.list_object_versions(Bucket=bucket_name)
        versions = response.get("Versions", [])
        
        if not versions:
            print("No object versions found. Skipping deletion.")
            return

        for version in versions:
            key = version["Key"]
            version_id = version["VersionId"]
            print(f"Deleting version {version_id} of object {key}...")
            s3.delete_object(Bucket=bucket_name, Key=key, VersionId=version_id)
        
        print("All versions have been deleted.")
    except botocore.exceptions.ClientError as e:
        print(f"Error deleting object versions: {e}")

def delete_bucket(bucket_name=str):
    s3 = boto3.client("s3")
    try:
        s3.delete_bucket(Bucket=bucket_name)
        print("Bucket removed")
    except botocore.exceptions.ClientError as e:
        print(f"Error deleting bucket: {e}")

if __name__ == "__main__":
    main()
