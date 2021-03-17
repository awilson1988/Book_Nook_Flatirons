require './config/environment' 


class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end


  get "/" do
    erb :welcome
  end

  helpers do
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:error] = "Sorry it looks like your not logged in!"
        redirect "/"
      end
    end
  
    def book_owner?(book)
      if current_user != book.user
        flash[:error] = "Sorry, you can't make changes to that!" 
        redirect "/books"
      end 
    end

    def review_owner?(review)
      if current_user != review.user
        flash[:error] = "Sorry, you can't make changes to that!"
        redirect "/books"
      end 
    end 
  end 
end
