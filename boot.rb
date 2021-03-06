require 'sinatra/base'
require 'dotenv/load'
require 'uppy/s3_multipart'
require 'pg'

require_relative 'audio-files-uploader'

bucket = Aws::S3::Bucket.new(
  name: ENV.fetch('AWS_BUCKET_NAME'),
  access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
  secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
  region: ENV.fetch('AWS_REGION')
)

UPPY_S3_MULTIPART_APP = Uppy::S3Multipart::App.new(bucket: bucket)

$pg_conn = PG.connect(
  host: ENV.fetch('DBHOST'),
  dbname: ENV.fetch('DBNAME'),
  user: ENV.fetch('DBUSER'),
  password: ENV.fetch('DBPASSWORD')
)

$pg_conn.prepare('insert_to_audios', 'insert into audios (name) values ($1)')
