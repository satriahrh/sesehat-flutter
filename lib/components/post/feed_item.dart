import 'package:flutter/material.dart';
import 'package:sesehat_flutter/components/post/reactions/like.dart';
import 'package:sesehat_flutter/components/post/reactions/stateless_reaction.dart';
import 'package:sesehat_flutter/models/post.dart';
import 'package:sesehat_flutter/utils/number.dart';

class FeedItem extends StatefulWidget {
  FeedItem(this.post) : super();

  final Post post;

  @override
  _FeedItemState createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  DateTime _currentDateTime = DateTime.now();
  Post _post;

  @override
  Widget build(BuildContext context) {
    _currentDateTime = DateTime.now();
    _post = widget.post;

    return Card(
      elevation: 1,
      child: Column(children: [
        _theHeader(context),
        _theBody(context),
        Divider(),
        _theActions(context),
      ]),
    );
  }

  Widget _theHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(children: [
        Container(
          width: 50,
          height: 50,
          child: Image.network(widget.post.author.icUrl),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => print('TODO'),
                child: Text(widget.post.author.displayName,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline6),
              ),
              Row(children: [
                InkWell(
                  onTap: () => print('TODO'),
                  child: Text(
                    _humanizeUnixTime(widget.post.createdAt),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                Text('\u00b7'),
                InkWell(
                  onTap: () => print('TODO'),
                  child: Text(
                    widget.post.scope,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ]),
    );
  }

  String _humanizeUnixTime(int unixTime) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    Duration difference = _currentDateTime.difference(dateTime);
    if (difference.inDays > 7) {
      return dateTime.toLocal().toString();
    } else if (difference.inDays > 0) {
      return '${difference.inDays}hari';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}jam';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}';
    } else {
      return '${difference.inSeconds}';
    }
  }

  Widget _theBody(BuildContext context) {
    String summary =
        '${widget.post.body.substring(0, 140)}... baca lebih lanjut';
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    Widget child = widget.post.body.length <= summary.length
        ? Text(
            widget.post.body,
            style: textStyle,
          )
        : InkWell(
            onTap: () => print('TODO'),
            child: Text(
              summary,
              style: textStyle,
            ),
          );
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: child,
    );
  }

  Widget _theActions(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 8),
        child: Row(
          children: [
            LikeReaction(widget.post),
            StatelessReaction(widget.post.commented, Icons.comment,
                () => print('TODO: go to comment screen')),
            StatelessReaction(widget.post.shared, Icons.share,
                () => print('TODO: copy deeplink to clipboard')),
          ],
        ));
  }
}
