class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,:confirmable,authentication_keys: [:user]
  
  devise :omniauthable, :omniauth_providers => [:facebook,:google_oauth2]

  attr_accessor :user
  has_many :posts
  has_many :comments

  has_many :user_roles,dependent: :destroy
  has_many :roles ,through: :user_roles

  def role? user
    self.roles.collect(&:name).first == user
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.username = provider_data.info.email.split("@gmail.com")[0]
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
      user.save!
    end
  end

  def generate_jwt
    JWT.encode({id: id, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
  end
end