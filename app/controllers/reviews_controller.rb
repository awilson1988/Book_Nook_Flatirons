class ReviewsController < ApplicationController    
  
#create review
post '/reviews' do
  @book = Book.find_by(book: params[:book_id])
  review = @book.reviews.build(comments: params[:comments])
  @reviews = @book.reviews
  
  if review.save
    redirect "/books/#{@book}"
  end 
end

    #render form to edit review
    get '/reviews/:id/edit' do
      @review = Review.find_by(id:params[:id])
      erb :'reviews/edit'
    end
    
    #updates review
    patch '/reviews/:id' do
      book = Book.find_by(id:params[:id])
      review = Review.find_by(id:params[:id])
      review.update(comments: params[:comments])
      redirect "/users/#{user.id}"
    end 
  
    #deletes review
    delete '/reviews/:id' do
      user = current_user
      book = Book.find_by(id:params[:id])
      review = Review.find_by(id:params[:id])
      review.delete
      redirect "/users/#{user.id}"
    end
  
  end 