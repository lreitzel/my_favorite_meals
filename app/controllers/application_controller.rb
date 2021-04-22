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
      "Sorry, it looks like there was an issue with your signup attempt" #this isn't showing up on the website
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
    user = User.find_by(username: params["username"])
    if user && user.authenticate(params["password"])
      redirect '/meals'
    else
      "There was an issue with your login attempt."
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/:id' do
    @user = User.find_by(params)
    erb :"users/show"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end


end
