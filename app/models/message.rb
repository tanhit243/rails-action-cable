# frozen_string_literal: true

# Model for Message
class Message < ApplicationRecord
  belongs_to :user
  has_many :comments
end
