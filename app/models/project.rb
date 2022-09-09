class Project < ApplicationRecord
  has_many :plants # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :likes # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :users, through: :likes
  has_many :favourites
  has_many :users, through: :favourites
  has_many_attached :photos
  belongs_to :user

  after_create :project_post

  def project_post
    UserMailer.email_project(self).deliver_now
    AdminMailer.project_email(self).deliver_now
  end

end
