import 'package:flutter/material.dart';
import 'package:sesehat_flutter/components/post/feed_item.dart';
import 'package:sesehat_flutter/models/post.dart';
import 'package:sesehat_flutter/services/post_feed.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: PostFeed(),
    );
  }
}

class PostFeed extends StatefulWidget {
  @override
  _PostFeedState createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  List<Post> _postList = <Post>[];
  Widget _buildPostList(BuildContext context) {
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
      body: _buildPostList(context),
    );
  }
}
