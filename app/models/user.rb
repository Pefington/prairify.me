class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  after_initialize :set_default_role, if: :new_record?
  has_many :projects, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
    
  validates :username, :password,
  presence: true,
	length: { in: 6..15 },
	format: { without: /[!@#%*+;,?&()=]/ }

  validates :password,
            length: { minimum: 6 }

  after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  enum role: { user: 0, admin: 1 }

  def set_default_role
    self.role ||= :user
  end

  enum provider: { null: 0, google_oauth2: 1 }

  def set_default_provider
    self.provider ||= :null
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user ||= User.create(email: data['email'],
                         password: Devise.friendly_token[0, 20],
                         provider: User.providers[:google_oauth2])
    user
  end
end
