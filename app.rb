class Offie < Sinatra::Base

  get '/' do
    @wines = Wines.all
    erb(:"wines/index")
  end

  get '/wines' do
    @wines = Wines.all
    erb(:"wines/index")
  end

  get '/wines/new' do
    @wine = Wines.new
    erb(:"wines/new")
  end

  # create
  post '/wines' do
    @wine = Wines.new(params[:wine])
    @wine.save
    #  redirect("/wines/#{@wine.id}")
    #else
    erb(:"wines/new")
    #end
  end

  # show
  get '/wines/:id' do
    @wine = Wines.find(params[:id])
    erb(:"wines/edit")
  end

  # update
  put '/wines/:id' do
    @wine = Wines.find(params[:id])
    if @wines.update_attributes(params[:wine])
      redirect("/wines/#{wine.id}")
    else
    erb(:"wines/edit")
    end
  end














end
