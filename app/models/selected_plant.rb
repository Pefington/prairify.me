class SelectedPlant < ApplicationRecord
  belongs_to :user
  validates :inaturalist_id, presence: true
  validates :inaturalist_id, uniqueness: { scope: :user }
end
