class Album < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews
  validates_presence_of :title, :artist
  validates :release_year, numericality: { only_integer: true }
end
