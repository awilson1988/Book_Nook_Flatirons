class UsersController < ApplicationController

    get '/users/index' do
      @users = User.all
      erb :'/users/index'
    end
 
 
    #render signup form to create user
    get '/users/signup' do
      if logged_in?
        redirect "/users/#{@user.id}"
      else
        erb :'/users/signup'
      end
    end
  
    
    #create user
    post '/signup' do
      @user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password], about_me: params[:about_me])
      if @user.valid?
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
      elsif @user.invalid? && User.find_by(username: @user.username)
        flash[:error] = "Sorry, that username is already taken."
        erb :'/users/signup'
      else
        flash[:error] = "Please make sure to fill out all criteria."
        erb :'/users/signup'
      end
    end
  
    #show user profile
    get '/users/:id' do
      redirect_if_not_logged_in
      @user = User.find_by(id:params[:id])
      @books = @user.books
      erb :'/users/show'
    end
  
      #renders form to edit user
      get '/users/:id/edit' do 
        redirect_if_not_logged_in
        @user = User.find_by(id: params[:id])
        erb :'/users/edit'
      end
  
    #updates user
    patch '/users/:id' do
      user = current_user
      user.update(params["user"])
      redirect "/users/#{user.id}"
    end
  
    #deletes existing user
    delete '/users/:id' do
      user = User.find_by(id: params[:id])
      user.destroy
      session.clear
      redirect "/"
    end
  
  end
  