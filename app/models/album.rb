class Album < ApplicationRecord
  has_many :tracks
  validates_presence_of :title, :artist
  validates :release_year, numericality: { only_integer: true }
end
