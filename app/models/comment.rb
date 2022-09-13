class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user
<<<<<<< HEAD

  validates :content, presence: true,
                      length: { in: 10..150 }
=======
  validates :content, presence: true,
                      length: { in: 2..150 }
>>>>>>> main
end
