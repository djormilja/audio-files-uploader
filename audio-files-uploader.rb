class AudioFilesUploader < Sinatra::Base
  get '/' do
    erb :index
  end
end