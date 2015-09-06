get '/' do
  @coaches = Coach.all
  erb :index
end