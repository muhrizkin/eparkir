import 'package:eparkir/screens/user/page/history.dart';
import 'package:eparkir/screens/user/page/home.dart';
import 'package:flutter/material.dart';

class HomeUser extends StatefulWidget {
  final String id;
  HomeUser({this.id});
  @override
  _HomeUserState createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    final _pageOption = [Home(id: widget.id), History()];
    return Scaffold(
      body: _pageOption[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), title: Text("History")),
        ],
      ),
    );
  }
}
