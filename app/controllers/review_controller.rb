class ReviewController < ApplicationController

    get '/reviews' do
        @reviews = current_user.reviews
        erb :'/reviews/index'
    end

    get '/reviews/new' do
        if logged_in?
            erb :'/reviews/new'
        else
            redirect to '/users/login'
        end
    end

    post '/reviews' do
        @review = Review.new(params)
        wrong_user?
        if @review.title.blank? || @review.body.blank?
            erb :'/reviews/new'
        else
            @review.user = current_user
            @review.user_id = session[:user_id]
            @review.meal_id = params[:review][:meal_id]
            current_user.reviews << @review
            @review.save
            erb :"/reviews/index"
        end
    end

    get '/reviews/:id' do
        wrong_user?
        @review = Review.find(params["id"])
        erb :'/reviews/show'
    end

    get '/reviews/:id/edit' do
        @review = Review.find(params["id"])
        wrong_user?
        erb :'/reviews/edit'
    end

    patch '/reviews/:id' do
        @review = Review.find(params["id"])
        wrong_user?
        @review.update(params["review"])
        redirect to "/reviews/#{@review.id}"
    end

    delete '/reviews/:id' do
        @review = Review.find(params["id"])
        wrong_user?
        @review.destroy
        redirect to '/reviews'
    end

    def wrong_user?
        if @review.user != current_user
            redirect to '/login'
        end
    end

end