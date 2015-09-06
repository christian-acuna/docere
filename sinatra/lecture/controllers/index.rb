# all coaches
get '/' do
  @coaches = Coach.all
  erb :index
end

# new coaches form
get '/new' do
  erb :new
end

post '/create' do
  ap coach_name = params[:coach_name]
  Coach.create(coach_name)
  redirect '/'
end








