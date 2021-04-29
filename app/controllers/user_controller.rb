class UserController < ApplicationController

  get '/homepage' do
    erb :"users/home"
  end
  
  get '/signup' do
    erb :"users/new"
  end

  post '/signup' do
    current_user = User.new(username: params[:username], password: params[:password], name: params[:name])
    if User.find_by(username: params[:username])
      redirect to '/'
    else
      current_user.save
      session[:user_id] = current_user.id
      erb :"users/home"
    end
  end

  get '/login' do
    erb :"users/login"
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      erb :'users/home'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

end