import 'package:flutter/material.dart';
import 'package:sesehat_flutter/components/chat/feed_item.dart';
import 'package:sesehat_flutter/models/chat.dart';
import 'package:sesehat_flutter/services/chat_feed.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Chat> _chatList = <Chat>[];

  Widget _buildChatFeed(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemBuilder: (context, i) {
        final int index = i ~/ 2;
        if (_chatList.length <= index) {
          _chatList.addAll(chatFeed());
        }

        return i.isEven ? ChatFeedItem(_chatList[index]) : Divider();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sesehat'),
      ),
      body: _buildChatFeed(context),
    );
  }
}
