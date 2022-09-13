class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :user, presence: true
  validates :project, presence: true
  validates :content, presence: true,
                      length: { in: 5..150 }
end
