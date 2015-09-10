class Offie < Sinatra::Base

  # Index
  get '/' do
    @wines = Wines.all
    erb(:"wines/index")
  end

  # Home
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
    #binding.pry
    @wine = Wines.new(params[:wine])
    if @wine.save
      @message = "New taste saved!"
      erb(:"/wines/show")    ############### send us to a view
    else
      @message = "Sorry, couldn't save it! Try it again!"
      redirect(:"wines/new")  ########### redirects to a get or post here 
    end
  end

  # Edit
  get '/wines/:id' do
    @wine = Wines.find(params[:id])
    # erb(:"wines/edit")
    erb :"wines/edit"
  end

  # Update
  post '/wines/:id' do
    #binding.pry
    @wine = Wines.find(params[:id])

    if @wine.update_attributes(params[:wine])
      @message = "Your taste has been updated!"
      erb :"/wines/show"
    else
      redirect(:"/wines/#{@wine.id}")
    end
  end

  # Delete
  post '/wines/delete/:id' do
    @wine = Wines.find(params[:id])
    if @wine.destroy
      @control = "done"
    else
      @control = "fail"
    end
    redirect(:"/wines/delete/#{@control}")
  end

  # Home after Delete
  get '/wines/delete/:control' do
    control = params[:control]
    if control == "done"
      @message = "Record deleted!"
    else
      @message = "Couldn't delete it!"
    end
    @wines = Wines.all
    erb(:"wines/index")
  end

end
