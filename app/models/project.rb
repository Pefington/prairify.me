class Project < ApplicationRecord
  has_many :join_table_project_plants
  has_many :likes
  has_many :users, through: :likes
end
