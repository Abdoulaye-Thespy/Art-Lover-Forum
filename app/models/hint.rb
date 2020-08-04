class Hint < ApplicationRecord
  belongs_to :user
  validates :text, length: { in: 4..600 }
end
