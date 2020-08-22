class Chat {
  final String icUrl = 'https://img.icons8.com/color/2x/login-as-user.png';
  final String displayName;
  final String lastMessage;
  final DateTime lastMessageSentAt = DateTime.now();
  final int unread;

  Chat(this.displayName, this.lastMessage, this.unread);
}
