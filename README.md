1. Install ruby 2.4 and required gems (MacOS, Linux)

gem install sinatra
gem install uppy-s3_multipart

2. Update the bucket's CORS configuration. In the AWS S3 Console go to your bucket, click on "Permissions" tab and then on "CORS configuration". There paste in the following:
```
[
    {
        "AllowedHeaders": [
            "content-type",
            "x-amz-content-sha256",
            "x-amz-date"
        ],
        "AllowedMethods": [
            "GET",
            "POST",
            "PUT"
        ],
        "AllowedOrigins": [
            "*"
        ],
        "ExposeHeaders": [
            "ETag"
        ],
        "MaxAgeSeconds": 3000
    },
    {
        "AllowedHeaders": [],
        "AllowedMethods": [
            "GET"
        ],
        "AllowedOrigins": [
            "*"
        ],
        "ExposeHeaders": [],
        "MaxAgeSeconds": 3000
    }
]
```
3. Create .env file from .env.example and your AWS credentials

4. Run application
rackup -p 4567

5. Open 
http://localhost:4567