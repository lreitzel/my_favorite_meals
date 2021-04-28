require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    register Sinatra::ActiveRecordExtension
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'user security'
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

    def wrong_user?
      if @review.user != current_user
          redirect to '/login'
      end
    end
  end


end
