get '/' do
  redirect '/tasks'
end

get '/tasks' do
  redirect '/login' unless logged_in?
  @tasks = current_user.tasks.order(:created_at)
  # @tasks = Task.where(user: current_user).order(:created_at) # the version Alex suggested which also works
  erb :'/tasks/index'
end

get '/tasks/new' do
  redirect '/login' unless logged_in?
  @task = Task.new
  erb :'/tasks/new'
end

post '/tasks' do
  halt(401, "must be logged in. stop trying to hack us") unless logged_in?
  @task = Task.new(params[:task].merge(user: current_user))
  # @task.user = current_user # alternative way to assign the current user to this task
  if @task.save
    redirect "/tasks"
  else
    erb :'/tasks/new'
  end
end

put '/tasks/:id/toggle_complete' do
  task = Task.find(params[:id])
  halt(401, "you don't own this") unless @task.user == current_user
  task.toggle_completeness
  redirect '/'
end

get '/tasks/:id/edit' do
  @task = Task.find(params[:id])
  halt(401, "you don't own this") unless @task.user == current_user
  erb :'/tasks/edit'
end

put '/tasks/:id' do
  @task = Task.find(params[:id])
  halt(401, "you don't own this") unless @task.user == current_user
  @task.assign_attributes(params[:task])
  if @task.save
    redirect '/'
  else
    erb :'/tasks/edit'
  end
end
