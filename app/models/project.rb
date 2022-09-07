class Project < ApplicationRecord
  has_many :join_table_project_plants
  has_many_attached :photos
  belongs_to :user
end
