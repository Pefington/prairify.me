class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :projects
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  enum role: { user: 0, admin: 1 }
  after_initialize :set_default_role, if: :new_record?
  has_many :likes
  has_many :projects, through: :likes

  def set_default_role
    self.role ||= :user
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    user ||= User.create(email: data['email'],
                         password: Devise.friendly_token[0, 20])
    user
  end
end
