// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final List<Widget> cards = [
    Card(
      child: Container(
        padding: EdgeInsets.all(15),
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 96, 209, 247),
              Color.fromARGB(255, 173, 224, 244)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Row(
            children: [
              Container(
                width: 80,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(75, 230, 239, 247)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "25",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Wen",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 25, 5, 22),
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("12:30 PM",
                        style: TextStyle(
                            color: Color.fromARGB(110, 255, 255, 255),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Dr. Djakour Arij",
                        style: TextStyle(
                            color: Color.fromARGB(249, 255, 255, 255),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Cardiologue",
                        style: TextStyle(
                            color: Color.fromARGB(110, 255, 255, 255),
                            fontSize: 12,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.keyboard_control_rounded,
                    color: Color.fromARGB(136, 255, 255, 255),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
    Card(
      child: Container(
        padding: EdgeInsets.all(15),
        width: 300,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 245, 154, 19)),
        child: Center(
          child: Row(children: [
            Container(
              width: 80,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(75, 230, 239, 247)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "30",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Thu",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 25, 5, 22),
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("15:30 PM",
                      style: TextStyle(
                          color: Color.fromARGB(110, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Dr. Ayadi Nidhal",
                      style: TextStyle(
                          color: Color.fromARGB(249, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Cardiologue",
                      style: TextStyle(
                          color: Color.fromARGB(110, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.keyboard_control_rounded,
                  color: Color.fromARGB(136, 255, 255, 255),
                )
              ],
            )
          ]),
        ),
      ),
    ),
    Card(
      child: Container(
        padding: EdgeInsets.all(15),
        width: 300,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 15, 129, 223)),
        child: Center(
          child: Row(children: [
            Container(
              width: 80,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(75, 230, 239, 247)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "25",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Wen",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 25, 5, 22),
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("12:30 PM",
                      style: TextStyle(
                          color: Color.fromARGB(110, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Dr. Djakour Arij",
                      style: TextStyle(
                          color: Color.fromARGB(249, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Cardiologue",
                      style: TextStyle(
                          color: Color.fromARGB(110, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.keyboard_control_rounded,
                  color: Color.fromARGB(136, 255, 255, 255),
                )
              ],
            )
          ]),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                //hello to user and notif butto
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, Nidhal !",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "how are you today?",
                          style: TextStyle(
                              color: Color.fromARGB(145, 68, 68, 68),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(122, 238, 238, 238),
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.notifications))
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                // search bar
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(122, 238, 238, 238),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.search,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // the list of icons
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.pink[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(14),
                        child: Icon(
                          Icons.assignment,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.green[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.calendar_today,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.description,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.orange[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.person,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // the poster undderneith
                Container(
                  padding: EdgeInsets.all(16),
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/doct.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Get the Best',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(199, 0, 0, 0),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Medical Service',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(199, 0, 0, 0),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'at the comfort of your Home',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(189, 107, 106, 106),
                              ),
                            ),
                            SizedBox(height: 6),
                            Container(
                              padding: EdgeInsets.fromLTRB(12, 6, 0, 6),
                              decoration: BoxDecoration(
                                  // color: Color.fromARGB(28, 74, 0, 0),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Row(
                                children: [
                                  Text(
                                    'Set Appointment Now!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 9, 2, 71),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color.fromARGB(255, 9, 2, 71),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upcoming Appointments",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          HorizontalCardList(cards: cards),
        ],
      )),
    );
  }
}

class HorizontalCardList extends StatelessWidget {
  final List<Widget> cards;

  HorizontalCardList({required this.cards});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: cards[index],
          );
        },
      ),
    );
  }
}
