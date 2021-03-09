class Sessions_Controller < ApplicationController
  
    
    post '/login' do
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Welcome back, #{user.username}!"
        redirect "/users/#{user.id}"
      else
        flash[:error] = "There was trouble logging in. Please try again."
        redirect to '/users/login'
      end
    end
  
  
    get '/logout' do
      if logged_in?
        session.clear
        redirect '/'
      else
        redirect '/'
      end
    end
  end