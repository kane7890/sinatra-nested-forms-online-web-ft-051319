require './environment'
require 'pry'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/new' do
      erb :'pirates/new'
    end

    get '/' do
      erb :root
    end

    post '/pirates' do
#      binding.pry
      @pirate = Pirate.new(params[:pirate][:name], params[:pirate][:weight], params[:pirate][:height])


      params[:pirate][:ships].each do |shipdetails|
        # binding.pry
        Ship.new(shipdetails[:name], shipdetails[:type], shipdetails[:booty])
      end

      @ships = Ship.all
      erb :'pirates/show'
    end

  end
end
