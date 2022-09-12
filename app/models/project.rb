class Project < ApplicationRecord
  has_many :plants, dependent: :destroy
  has_many :likes, dependent: :destroy # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :users, through: :likes
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites
  has_many :project_updates, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
  belongs_to :user

  after_create :project_post

  def project_post
    UserMailer.email_project(self).deliver_now
    AdminMailer.project_email(self).deliver_now
  end

end
