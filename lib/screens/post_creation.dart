import 'package:flutter/material.dart';

class PostCreation extends StatefulWidget {
  @override
  _PostCreationState createState() => _PostCreationState();
}

class _PostCreationState extends State<PostCreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Post'),
        actions: [_buildPublicityOptions(context)],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildPublicityOptions(BuildContext context) {
    return PopupMenuButton(
      tooltip: 'Filter postingan',
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Row(
            children: [
              Icon(Icons.public, color: Theme.of(context).accentColor),
              Text('Publik')
            ],
          ),
          value: 'public',
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(Icons.nature_people, color: Theme.of(context).accentColor),
              Text('Teman')
            ],
          ),
          value: 'friend',
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(Icons.group, color: Theme.of(context).accentColor),
              Text('Komunitas A')
            ],
          ),
          value: 'komunitas-a',
        ),
      ],
      icon: Icon(Icons.send),
      onSelected: (value) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('TODO: select publicity to this value $value!'),
        ));
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return Text('Hello');
  }
}
