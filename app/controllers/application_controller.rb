require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    register Sinatra::ActiveRecordExtension
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'skibbidy_paps'
    set :show_exceptions, false
  end

  not_found do
    status 404
    erb :error
  end

  error ActiveRecord::RecordNotFound do
    redirect to "/"
  end

  get "/" do
    erb :index
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
