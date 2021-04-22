class MealController < ApplicationController

    get '/meals' do
        @meals = current_user.meals
        erb :'/meals/index'
    end

    get '/meals/:id' do
        @meal = current_user.meals.find(params["id"])
        erb :show
    end

    get '/meals/new' do
        erb :new
    end

    post '/meals' do
    end

    get '/meals/:id/edit' do
        erb :edit
    end

    put '/meals/:id' do
    end

    delete '/meals/:id' do
    end
    
end