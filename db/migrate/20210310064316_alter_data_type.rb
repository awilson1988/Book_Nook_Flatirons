class AlterDataType < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :creator_id, :primary_key
  end
end
