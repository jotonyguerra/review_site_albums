class AddColumnsToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :user_id, :integer, null: false
    add_column :reviews, :album_id, :integer, null: false
    add_column :reviews, :rating, :integer, null: false

  end
end
