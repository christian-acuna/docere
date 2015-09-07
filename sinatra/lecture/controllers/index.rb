# all coaches
get '/' do
  @coaches = Coach.all
  erb :index
end

# new coaches form
get '/new' do
  erb :new
end

# "actually" adds a coach to our DB
post '/create' do
  coach_name = params[:coach_name]
  Coach.create(coach_name)
  redirect '/'
end

get '/coach/:name' do
  @coach = Coach.find_by_name(params[:name])
  erb :show
end

get '/coach/:name/edit' do
  @coach = Coach.find_by_name(params[:name])
  erb :edit
end

post '/coach/:name/update' do
  Coach.replace(params[:old_name], params[:new_name])
  redirect "/coach/#{params[:new_name]}"
end

post '/coach/:name/delete' do
  Coach.delete(params[:name])
  redirect '/'
end









