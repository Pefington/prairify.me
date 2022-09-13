class Project < ApplicationRecord
  has_many :plants, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :project_updates, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
  belongs_to :user
  
  after_create :project_post

  def project_post
    UserMailer.email_project(self).deliver_now
    AdminMailer.project_email(self).deliver_now
  end

end
