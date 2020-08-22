import 'package:flutter/material.dart';
import 'package:sesehat_flutter/screens/home.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  List<Widget> _screenOptions = <Widget>[
    Home(),
    Text('TODO: chat screen'),
    Text('TODO: lainnya screen')
  ];

  void _onTapBottomNavigationBarItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenOptions.elementAt(_selectedIndex), // TODO perform lazy initialization
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Beranda'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert),
            title: Text('Lainnya'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onTapBottomNavigationBarItem,
      ),
    );
  }
}
