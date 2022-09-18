class Plant < ApplicationRecord
  validates :project_id, presence: true
  validates :inaturalist_id, presence: true
  validates :common_name, presence: true
  validates :english_name, presence: true
  validates :scientific_name, presence: true
  validates :picture_url, presence: true

  belongs_to :project
end
