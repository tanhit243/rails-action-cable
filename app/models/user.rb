# frozen_string_literal: true

# Model for User
class User < ApplicationRecord
  has_many :comments
  has_many :messages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  class << self
    def from_omniauth(auth)
      user = find_or_initialize_by provider: auth.provider, uid: auth.uid
      user.assign_attributes email: auth.info.email, password: Devise.friendly_token[0, 20],
                             name: auth.info.name, avatar: auth.info.image
      user.save
      user
    end
  end
end
