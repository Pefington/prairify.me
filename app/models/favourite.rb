class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :project, presence: true
  validates :user, presence: true
  validates :user, uniqueness: { scope: :project }
end
