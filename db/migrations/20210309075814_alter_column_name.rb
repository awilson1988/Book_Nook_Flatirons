class AlterColumnName < ActiveRecord::Migration[5.2]
    def change
      rename_column :reviews, :comments, :remarks
    end
  end