class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/recipes' do 
    erb :index
  end
  get '/recipes/new' do 
    erb :new
  end

  get '/recipes/:id' do
    @r = Recipe.find_by_id(params[:id])
    erb :show
  end
  get '/recipes/:id/edit' do 
    @r = Recipe.find_by_id(params[:id])
    erb :edit
  end
  patch '/recipes/:id' do 
    @r = Recipes.find_by_id(params[:id])
    @r.name = params[:name]
    @r.ingredients = params[:ingredients]
    @r.cook_time = params[:cook_time]
    @r.save
  end
  post '/recipes' do
    @r = Recipe.new(params)
    @r.save
     redirect "/recipes/#{ @r.id }"
   end
   delete '/recipes/:id' do
    @r = Recipe.find_by_id(params[:id])
    @r.delete
    redirect "/recipes"
   end

  # code actions here!

end
