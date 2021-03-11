class BooksController < ApplicationController  
  
  #show all books
  get '/books' do
    @books = Book.all
    erb :'/books/index'
  end
  

  #render form to create books
  get '/books/new' do
    erb :'/books/new'
  end
  
  
  #show single book
  get '/books/:id' do
    @book = Book.find_by_id(params[:id])
    erb :'/books/show'
  end
  
 #create books
  post '/books' do
    @book = Book.new(params)
    @book.user_id = session[:user_id]
    @book.save
    redirect "/books/#{@book.id}"
  end
      
    #renders form to edit book
  get '/books/:id/edit' do 
    @book = Book.find_by(id: params[:id])
    erb :'/books/edit'
  end
  
    #updates book
  patch '/books/:id' do
    @book = Book.find_by(id: params[:id])
    @book.update(title: params[:title], author: params[:author], summary: params[:summary])
    redirect "/books/#{@book.id}"
  end
  
    #deletes existing user
  delete '/books/:id' do
    book = Book.find_by(id:params[:id])
    book.delete 
    redirect "/books"
  end

  def get_book 
    @book = Book.find_by(id:params[:id])
end 

def redirect_if_not_authorized
    if @book.user_id != current_user
        flash[:error] = "You cant make this edit, you don't own this"
        redirect '/posts'
    end 

  end 

end  

  