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

  List<Widget> _buildActions(BuildContext context) {
    return [
      DropdownButton(
        // TODO: this dropdown is still not working
        icon: Icon(Icons.filter_list),
        items: [
          DropdownMenuItem(
            child: Text('Saya'),
            value: 'saya',
          ),
          DropdownMenuItem(
            child: Text('Publik'),
            value: 'publik',
          ),
          DropdownMenuItem(
            child: Text('Komunitas A'),
            value: 'komunitas-a',
          ),
          DropdownMenuItem(
            child: Text('Komunitas B'),
            value: 'komunitas-b',
          ),
        ],
        onChanged: null,
      ),
    ];
  }

  Widget _buildPostCreationTrigger(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              'TODO: post creation screen'), // TODO: post creation like this https://hackernoon.com/how-to-develop-a-wysiwyg-editor-in-android-just-like-medium-30e0d4c8471f
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logo'),
        actions: _buildActions(context),
      ),
      body: _buildPostFeed(context),
      floatingActionButton: _buildPostCreationTrigger(context),
    );
  }
}
