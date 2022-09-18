class SelectedPlant < ApplicationRecord
  belongs_to :user
  validates :inaturalist_id, presence: true
  validates :inaturalist_id, uniqueness: { scope: :user }
  validates :common_name, presence: true
  validates :english_name, presence: true
  validates :scientific_name, presence: true
  validates :picture_url, presence: true
end
