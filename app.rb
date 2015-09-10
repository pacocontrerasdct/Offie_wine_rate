class Offie < Sinatra::Base

  # Index
  get '/' do
    @wines = Wines.all
    erb(:"wines/index")
  end
  # Show
  get '/wines' do
    @wines = Wines.all
    erb(:"wines/index")
  end
  # New
  get '/wines/new' do
    @wine = Wines.new
    erb(:"wines/new")
  end
  # Create
  post '/wines' do
    @wine = Wines.new(params[:wine])
    if @wine.save
      redirect(:"/wines/#{@wine.id}/show")
    else
      erb(:"wines/new")
    end
  end
  # Show
  get '/wines/:id/show' do
    @wine = Wines.find(params[:id])
    erb("/wines/#{@wine.id}/show")
  end

  # Update
  post '/wines/:id' do
    #binding.pry
    @wine = Wines.find(params[:id])
    if @wine.update_attributes(params[:wine])
      redirect(:"/wines/#{@wine.id}/show")
    else
    erb(:"/wines/#{@wine.id}")
    end
  end

  # Edit
  get '/wines/:id/edit' do
    @wine = Wines.find(params[:id])
    erb(:"wines/edit")
  end

  # Delete
  post '/wines/:id/delete' do
    @wine = Wines.find(params[:id])
    if @wine.destroy
      redirect(:'/wines')
    else
      redirect(:"/wines/#{@wine.id}")
    end
  end















end
