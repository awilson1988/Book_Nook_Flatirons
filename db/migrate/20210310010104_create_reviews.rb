class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t| 
      t.integer :user_id 
      t.integer :book_id 
      t.text :comments 
    end
  end
end
