class Project < ApplicationRecord
  has_many :join_table_project_plantss
  has_many :users, through: :likes
  has_many_attached :photos
  belongs_to :user

end
