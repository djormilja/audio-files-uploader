class AudioFilesUploader < Sinatra::Base
  get '/' do
    erb :index
  end

  put '/upload-complete' do
    data = JSON.parse request.body.read
    data.each do |uploaded_file_metadata|
      if uploaded_file_metadata&.dig('name')
        $pg_conn.exec_prepared('insert_to_audios', [uploaded_file_metadata['name']])
      end
    end
  end
end
