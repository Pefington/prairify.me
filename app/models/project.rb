class Project < ApplicationRecord
  has_many :join_table_project_plants
  belongs_to :user
end
