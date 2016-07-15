get '/login' do
  erb :'/sessions/new'
end

post '/sessions' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["Username or password incorrect."]
    erb :'/sessions/new'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
