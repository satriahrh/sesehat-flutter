import 'package:flutter/material.dart';
import 'package:sesehat_flutter/models/chat.dart';
import 'package:sesehat_flutter/utils/date_time.dart';

class ChatFeedItem extends StatefulWidget {
  ChatFeedItem(this.chat);

  final Chat chat;
  @override
  _ChatFeedItemState createState() => _ChatFeedItemState();
}

class _ChatFeedItemState extends State<ChatFeedItem> {
  int _unread;

  @override
  Widget build(BuildContext context) {
    if (_unread == null) {
      setState(() {
        _unread = widget.chat.unread;
      });
    }

    final List<Widget> trailingChildren = [
      Text(humanizeDateTime(widget.chat.lastMessageSentAt)),
    ];
    if (_unread.toInt() > 0) {
      trailingChildren.add(
        Container(
          width: 30,
          alignment: Alignment.center,
          child: Text(
            _unread.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        if (_unread > 0) {
          setState(() {
            _unread = 0;
          });
        }
      },
      child: ListTile(
        leading: Image.network(widget.chat.icUrl),
        title: Text(
          widget.chat.displayName,
        ),
        subtitle: Text(
          widget.chat.lastMessage,
          maxLines: 2,
        ),
        // trailing: Text(humanizeDateTime(widget.chat.lastMessageSentAt)),
        trailing:
            Column(mainAxisSize: MainAxisSize.min, children: trailingChildren),
      ),
    );
  }
}
