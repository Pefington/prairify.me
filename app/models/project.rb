class Project < ApplicationRecord
  has_many :plants
  has_many :likes
  has_many :users, through: :likes
  has_many_attached :photos
  belongs_to :user

end
