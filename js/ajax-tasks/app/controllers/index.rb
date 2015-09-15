get '/' do
  @tasks = Task.all
  erb :index
end

post '/tasks/create' do
  task = Task.new(params)
  if task.save
    redirect '/'
  end
end