import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  collection: function() {
    return $("[data-channel='comments']");
  },
  connected: function() {
    return setTimeout((function(_this) {
      return function() {
        _this.followCurrentMessage();
        return _this.installPageChangeCallback();
      };
    })(this), 1000);
  },
  received: function(data) {
    if (!this.userIsCurrentUser(data.comment)) {
      return this.collection().append(data.comment);
    }
  },
  userIsCurrentUser: function(comment) {
    return $(comment).attr('data-user-id') === $('meta[name=current-user]').attr('id');
  },
  followCurrentMessage: function() {
    var messageId;
    if (messageId = this.collection().data('message-id')) {
      return this.perform('follow', {
        message_id: messageId
      });
    } else {
      return this.perform('unfollow');
    }
  },
  installPageChangeCallback: function() {
    if (!this.installedPageChangeCallback) {
      this.installedPageChangeCallback = true;
      return $(document).on('turbolinks:load', function() {
        return _this.followCurrentMessage();
      });
    }
  }
});
