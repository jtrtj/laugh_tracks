class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    if params[:age]
      @comedians = Comedian.where(age: params[:age]).includes(:specials)
    else
      @comedians = Comedian.all.includes(:specials)
    end
    @average_age = @comedians.avg_age
    
    erb :'comedians/index'
  end

end
