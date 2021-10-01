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
    let messageId = this.collection().data('message-id');
    if (messageId) {
      return this.perform('follow', {
        message_id: messageId
      });
    } else {
      return this.perform('unfollow');
    }
  },
  installPageChangeCallback: function() {
    // When you use turbolinks, you have to subscribe again
    // Only execute in the first time reload page
    if (!this.installedPageChangeCallback) {
      this.installedPageChangeCallback = true;
      let subscriptionObject = this;
      $(document).on('turbolinks:load', function() {
        return subscriptionObject.followCurrentMessage();
      });
    }
  }
});
