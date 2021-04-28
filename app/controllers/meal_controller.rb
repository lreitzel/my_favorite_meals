class MealController < ApplicationController

    get '/meals' do
        @meals = Meal.all
        erb :'/meals/index'
    end

    get '/meals/new' do
        if logged_in?
            erb :'/meals/new'
        else
            redirect to '/users/login'
        end
    end

    post '/meals' do
        @meal = Meal.new(params)
        wrong_user?
        if @meal.title.blank?
            erb :'/meals/new'
        else
            @meal.save
            # session[:meal_id] = @meal.id
            erb :'/reviews/new'
        end
    end

    get '/meals/:id' do
        if logged_in?
            @meal = current_user.meals.find(params["id"])
            erb :'/meals/show'
        else
            redirect to '/users/login'
        end
    end

    get '/meals/:id/edit' do
        wrong_user?
        erb :'/meals/edit'
    end

    put '/meals/:id' do
        wrong_user?
    end

    delete '/meals/:id' do
        @meal = Meal.find(params[:id])
        wrong_user?
        @meal.destroy
        redirect to '/meals'
    end
    
end