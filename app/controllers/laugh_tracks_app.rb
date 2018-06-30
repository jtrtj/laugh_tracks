class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    if params[:age]
      @comedians = Comedian.where(age: params[:age]).includes(:specials)
    else
      @comedians = Comedian.all.includes(:specials)
      @average_age = @comedians.avg_age
    end
    
    erb :'comedians/index'
  end

end
