class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    @comedians = Comedian.all
    erb :'comedians/index'
  end

end
