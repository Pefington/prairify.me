class Project < ApplicationRecord
  has_many :join_table_project_plants
  has_many :likes
  has_many :users, through: :likes
  has_many :comments
  has_many :projects, through: :comments
end
