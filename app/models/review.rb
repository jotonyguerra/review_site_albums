class Review < ApplicationRecord
  RATINGS = [5, 4, 3, 2, 1]
  belongs_to :user
  belongs_to :album

  validates :rating, inclusion: { in: RATINGS }
end
