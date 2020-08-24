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
  bool _isSearching = false;
  String _searchQuery = "";
  TextEditingController _searchQueryController = TextEditingController();

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

  void _startSearch(BuildContext context) {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    if (!(_searchQueryController == null ||
        !_searchQueryController.hasListeners)) {
      _clearSearchQuery();
      setState(() {
        _isSearching = false;
      });
    }
  }

  Widget _buildSearchField(BuildContext context) {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Tulis nama teman / grup ...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white),
      ),
      onChanged: updateSearchQuery,
      onSubmitted: (value) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('TODO: Implement search chat by value $value!'),
          ),
        );
      },
      style: TextStyle(color: Colors.white),
    );
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery('');
    });
  }

  List<Widget> _buildActions(BuildContext context) {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return null;
            }
            _clearSearchQuery();
          },
        ),
        // TODO BUG
        // the Icons.clear won't remove when changing screen from bottom bar
        // step to reproduce:
        // 1. Click search button
        // 2. Click Beranda or Lainnya from bottom bar
        // 3. Then you will see the clear button is still there.
      ];
    }
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () => _startSearch(context),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? _buildSearchField(context) : Text('Logo'),
        actions: _buildActions(context),
      ),
      body: _buildChatFeed(context),
    );
  }
}
