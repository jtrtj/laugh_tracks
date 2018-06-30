class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    @comedians = Comedian.all.includes(:specials)
    erb :'comedians/index'
  end

end
