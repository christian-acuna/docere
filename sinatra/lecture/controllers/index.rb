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
  ap params
  @coach = Coach.find_by_name(params[:name])
  erb :show
end











