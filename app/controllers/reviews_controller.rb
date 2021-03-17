class ReviewsController < ApplicationController    
  
#create review
post '/reviews' do
  redirect_if_not_logged_in
  @book = Book.find_by(id: params[:book_id])
  review = @book.reviews.build(comments: params[:comments])
  review.user = current_user
  if review.save
    redirect "/books/#{@book.id}"
  end 
end

    #render form to edit review
    get '/reviews/:id/edit' do
      redirect_if_not_logged_in
      @book = Book.find_by(id: params[:book_id])
      @review = Review.find_by(id:params[:id])
      owner?(@review)
        erb :'/reviews/edit'

  end
    #updates review
    patch '/reviews/:id' do
      @book = Book.find_by(id:params[:id])
      @review = Review.find_by(id:params[:id])
      if @review.user == current_user
      @review.update(comments: params[:comments])
      redirect "/books"
      else 
        flash[:error] = "You can't make changes to that! It doesn't belong to you!"
        redirect "/books"
      end 


    end 
  
    #deletes review
    delete '/reviews/:id' do
      @book = Book.find_by(id:params[:id])
      @review = Review.find_by(id:params[:id])
      if @review.user == current_user
      @review.delete
      redirect "/users/#{current_user.id}" 
      else 
        flash[:error] = "You can't make changes to that! It doesn't belong to you!"
        redirect "/books" 
      end

    end
  
  end 