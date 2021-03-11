class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t| 
      t.text :comments
      t.references :book, foreign_key: {on_delete: :cascade} 
    end
  end
end
