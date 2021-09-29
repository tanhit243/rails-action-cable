# frozen_string_literal: true

# Channel for comment
class CommentChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "messages:#{data['message_id'].to_i}:comments"
  end

  def unfollow
    stop_all_streams
  end
end
