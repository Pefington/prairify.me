class SelectedPlant < ApplicationRecord
  validates :inaturalist_id, uniqueness: { scope: :user_id }
  belongs_to :user
end
