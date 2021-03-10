ActiveRecord::Schema.define(version: 2021_03_09_055933) do

    create_table "books", force: :cascade do |t|
      t.string "title"
      t.string "author"
      t.string "summary"
    end
  
    create_table "reviews", force: :cascade do |t|
      t.integer "user_id"
      t.integer "book_id"
      t.text "comments"
      t.string "title"
      t.string "author"
    end
  
    create_table "users", force: :cascade do |t|
      t.string "name"
      t.string "email"
      t.string "password_digest"
      t.string "username"
    end
  
  end
  