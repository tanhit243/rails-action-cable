# frozen_string_literal: true

# Model for Comment
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :message

  after_commit { CommentRelayJob.perform_later(self) }
end
