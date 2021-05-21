require_relative 'boot'

map('/s3/multipart') do
  run UPPY_S3_MULTIPART_APP
end

run AudioFilesUploader
