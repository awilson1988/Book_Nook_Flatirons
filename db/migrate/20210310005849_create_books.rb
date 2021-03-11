class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t| 
      t.string :title 
      t.string :author
      t.string :genre 
      t.text :summary 
      t.references :user, foreign_key: {on_delete: :cascade} 
    end
  end
end
