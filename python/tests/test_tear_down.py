import unittest
from unittest.mock import patch, MagicMock
from tear_down import delete_all_versions, delete_bucket

class TestS3Cleanup(unittest.TestCase):
    
    @patch("boto3.client")
    def test_delete_all_versions(self, mock_boto_client):
        mock_s3 = mock_boto_client.return_value
        mock_paginator = mock_s3.get_paginator.return_value
        
        # Simulate paginated response with versions and delete markers
        mock_paginator.paginate.return_value = [
            {"Versions": [{"Key": "test.txt", "VersionId": "123"}], "DeleteMarkers": []}
        ]
        
        delete_all_versions("test-bucket")
        
        mock_s3.delete_object.assert_called_with(Bucket="test-bucket", Key="test.txt", VersionId="123")
    
    @patch("boto3.client")
    def test_delete_all_versions_no_versions(self, mock_boto_client):
        mock_s3 = mock_boto_client.return_value
        mock_paginator = mock_s3.get_paginator.return_value
        
        # Simulate empty paginated response
        mock_paginator.paginate.return_value = [{"Versions": [], "DeleteMarkers": []}]
        
        delete_all_versions("test-bucket")
        
        mock_s3.delete_object.assert_not_called()
    
    @patch("boto3.client")
    def test_delete_bucket(self, mock_boto_client):
        mock_s3 = mock_boto_client.return_value
        
        delete_bucket("test-bucket")
        
        mock_s3.delete_bucket.assert_called_with(Bucket="test-bucket")
    
    @patch("boto3.client")
    def test_delete_bucket_error(self, mock_boto_client):
        mock_s3 = mock_boto_client.return_value
        mock_s3.delete_bucket.side_effect = botocore.exceptions.ClientError(
            {"Error": {"Code": "BucketNotEmpty", "Message": "The bucket is not empty"}}, "DeleteBucket"
        )
        
        delete_bucket("test-bucket")
        
        mock_s3.delete_bucket.assert_called_with(Bucket="test-bucket")

if __name__ == "__main__":
    unittest.main()
