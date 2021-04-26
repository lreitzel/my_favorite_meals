class ReviewController < ApplicationController

    get '/reviews' do
        @reviews = Review.all
        erb :'/reviews/index'
    end

    get '/reviews/new' do
        if logged_in?
            erb :'/reviews/new'
        else
            redirect to '/users/login'
        end
    end

    post '/reviews/' do
        review = Review.new(params)
        if review.title.blank? || review.review_body.blank?
            erb :'/reviews/new'
        else
            review.user = current_user
            review.user_id = session[:user_id]
            current_user.reviews << review
            review.save
            erb :'/reviews'
        end
    end

end