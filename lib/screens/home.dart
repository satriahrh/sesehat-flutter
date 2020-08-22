import 'package:flutter/material.dart';
import 'package:sesehat_flutter/components/post/feed_item.dart';
import 'package:sesehat_flutter/models/post.dart';
import 'package:sesehat_flutter/services/post_feed.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> _postList = <Post>[];
  Widget _buildPostFeed(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (_postList.length <= i) {
          _postList..addAll(postFeed());
        }
        return FeedItem(_postList[i]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sesehat'),
      ),
      body: _buildPostFeed(context),
    );
  }
}
