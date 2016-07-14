get '/' do
  redirect '/tasks'
end

get '/tasks' do
  @tasks = Task.order(:created_at)
  erb :'/tasks/index'
end

get '/tasks/new' do
  @task = Task.new
  erb :'/tasks/new'
end

post '/tasks' do
  @task = Task.new(params[:task])
  if @task.save
    redirect "/tasks"
  else
    erb :'/tasks/new'
  end
end

put '/tasks/:id/toggle_complete' do
  task = Task.find(params[:id])
  task.toggle_completeness
  redirect '/'
end

get '/tasks/:id/edit' do
  @task = Task.find(params[:id])
  erb :'/tasks/edit'
end

put '/tasks/:id' do
  @task = Task.find(params[:id])
  @task.assign_attributes(params[:task])
  if @task.save
    redirect '/'
  else
    erb :'/tasks/edit'
  end
end
