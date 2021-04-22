require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'user security'
  end

  get "/" do
    erb :"users/index"
  end

  get '/signup' do
    erb :"users/new"
  end

  post '/signup' do
    current_user = User.new(username: params["username"], password: params["password"])
    if current_user.username.blank? || current_user.password.blank? || User.find(params["username"])
      "Sorry, it looks like there was an issue with your signup attempt"
      redirect '/signup'
    else
      current_user.save
      session["user_id"] = current_user.id
      redirect '/meals'
    end
  end

  get '/login' do
    erb :"users/login"
  end

  post '/login' do
  end


end
