class ProjectUpdate < ApplicationRecord
  belongs_to :project
  validates :title, presence: true
  validates :description, presence: true
  has_one_attached :photo
end
