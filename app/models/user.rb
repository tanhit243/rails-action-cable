# frozen_string_literal: true

# Model for User
class User < ApplicationRecord
  has_many :comments
  has_many :messages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
