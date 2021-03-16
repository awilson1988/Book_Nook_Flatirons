class ReviewsController < ApplicationController    
  
#create review
post '/reviews' do
  @book = Book.find_by(id: params[:book_id])
  review = @book.reviews.build(comments: params[:comments])
  review.user = current_user
  if review.save
    redirect "/books/#{@book.id}"
  end 
end

    #render form to edit review
    get '/reviews/:id/edit' do
      @review = Review.find_by(id:params[:id])
      if @review.user == current_user
        erb :'/reviews/edit'
      else 
        flash[:error] = "You can't make changes to that! It doesn't belong to you!"
        redirect "/books/#{@book.id}"
    end
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