import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sprint2/home.doctor.dart';
import 'package:sprint2/profile.doctor.dart';
import 'Trips.docrtor.dart';
import 'functions.dart' as func;

class firstPage extends StatefulWidget {
  @override
  State<firstPage> createState() => _firstPageState();
}

Map<String, dynamic>? obj;

class _firstPageState extends State<firstPage> {
  int _currentIndex = 0;
  dynamic obj1 = {};
  List<Widget> pages = [
    doctorhome(),
    Tasks(),
    SecondPage(
      obj: obj,
    )
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   pages[2] = SecondPage(
  //     obj: obj,
  //   );
  //   _getData();
  // }

  // Future<void> _getData() async {
  //   // final response = await func.makeGetRequest();
  //   final responseData = json.decode(response);
  //   setState(() {
  //     obj = responseData['patient'];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.request_page),
              label: 'Request',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
