class Plant < ApplicationRecord
  validates :project_id, presence: true
  validates :inaturalist_id, presence: true
  validates :inaturalist_id, uniqueness: { scope: :project }
  validates :scientific_name, presence: true
  validates :picture_url, presence: true

  belongs_to :project
end
