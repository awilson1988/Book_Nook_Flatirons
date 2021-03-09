class BooksController < ApplicationController  


    #render form to create books
    get '/books/new/' do
      erb :'/books/new'
    end
     
    #create books
    post '/books' do
      review = Review.create(title: params[:title], comments: params[:comments])
      @review.user_id = session[user_id]
      @review.save
     redirect "/books/#{@book.id}"
   end
    
  
    #show all books
    get '/books' do
      @books = Book.all
      erb :'/books/index'
    end
    
    #show single book
      get '/books/:id' do
      @book = Book.find_by_id(params[:id])
      erb :'/books/show'
    end
      
    #renders form to edit book
      get '/books/:id/edit' do 
        erb :'/books/edit'
    end
  
    #updates book
    patch '/books/:id' do
      @book.update(title: params[:title], comments: params[:comments])
      redirect "/books/#{@book.id}"
  end
  
    #deletes existing user
    delete '/books/:id' do
      book = Book.find_by(id:params[:id])
      book.delete 
      redirect "/books/#{@book.id}"
    end
  
  end