# frozen_string_literal: true

# CommentRelayJob
class CommentRelayJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "messages:#{comment.message_id}:comments",
                                 comment: CommentsController.render(partial: 'comments/comment',
                                                                    locals: { comment: comment })
  end
end
