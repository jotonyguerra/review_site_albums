class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string, :name
      t.integer :length
      t.belongs_to :album, foreign_key: true

      t.timestamps
    end
  end
end
