import 'package:flutter/material.dart';
import 'package:sesehat_flutter/components/post/feed_item.dart';
import 'package:sesehat_flutter/models/post.dart';
import 'package:sesehat_flutter/services/post_feed.dart';
import 'package:sesehat_flutter/screens/post_creation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> _postList = <Post>[];
  String _postListFilter = 'all';

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

  Widget _buildFilterOptions(BuildContext context) {
    return PopupMenuButton(
      tooltip: 'Filter postingan',
      itemBuilder: (context) => [
        PopupMenuItem(child: Text('Semua'), value: 'all'),
        PopupMenuItem(child: Text('Publik'), value: 'public'),
        PopupMenuItem(child: Text('Komunitas A'), value: 'komunitas-a'),
        PopupMenuItem(child: Text('Komunitas B'), value: 'komunitas-b'),
      ],
      icon: Icon(Icons.filter_list),
      initialValue: _postListFilter,
      onSelected: (value) {
        setState(() {
          _postListFilter = value;
        });
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('TODO: filter this value $value!'),
        ));
      },
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      _buildFilterOptions(context),
    ];
  }

  Widget _buildPostCreationTrigger(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostCreation()),
        );
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
