class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/recipes'
  end
  
  #index (show index/all)
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #new (load new form)
  get '/recipes/new' do
    @recipe = Recipe.new
    erb :new
  end

  #show (load show page)
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  #create (create recipe)
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  #delete (delete recipe)
  delete '/recipes/:id' do
    # Recipe.destroy(params[:id])
    @recipe= Recipe.find_by_id(params[:id])
    @recipe.destroy  
    redirect to '/recipes'
  end

  #edit (load edit form)
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end
  
  #update
  patch '/recipes/:id' do  #updates a recipe
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
   
    redirect to "/recipes/#{@recipe.id}"
  end



end
