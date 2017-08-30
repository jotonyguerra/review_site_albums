class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :artist, null: false
      t.integer :release_year
    end
  end
end
