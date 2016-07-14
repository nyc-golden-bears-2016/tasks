get '/' do
  redirect '/tasks'
end

get '/tasks' do
  @tasks = Task.all
  erb :'/tasks/index'
end

get '/tasks/new' do
  @task = Task.new
  erb :'/tasks/new'
end

post '/tasks' do
  @task = Task.new(params[:task])
  if @task.save
    redirect "/tasks/#{@task.id}"
  else
    erb :'/tasks/new'
  end
end

get '/tasks/:id' do
  @task = Task.find_by(id: params[:id])
  erb :'/tasks/show'
end
