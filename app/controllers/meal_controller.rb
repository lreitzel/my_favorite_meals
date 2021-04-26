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
        meal = Meal.new(params)
        if meal.title.blank?
            erb :'/meals/new'
        else
            meal.save
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
        erb :'/meals/edit'
    end

    put '/meals/:id' do
    end

    delete '/meals/:id' do
    end
    
end