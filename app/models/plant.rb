class Plant < ApplicationRecord
  validates :inaturalist_id, presence: true
  belongs_to :project
end
