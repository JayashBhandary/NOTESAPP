import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 225, 225, 225),
        leading: const Padding(
          padding: EdgeInsets.all(1.5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://vpmrzshahcollege.edu.in/images/collegelogo.png'),
            backgroundColor: Colors.transparent,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jayash Bhandary',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),
            ),
            Text(
              'SYBSC(CS)',
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.grey[800],fontSize: 10),
            ),
          ],
        ),
        titleSpacing: 8,
        elevation: 1,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              size: 37,
              Icons.search,
            ),
          ),
          PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("My Account"),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text("Settings"),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text("Logout"),
                  ),
                ];
              },
              initialValue: 0,
              onSelected: (value) {
                if (value == 0) {
                  print("My account menu is selected.");
                } else if (value == 1) {
                  print("Settings menu is selected.");
                } else if (value == 2) {
                  logOut();
                }
              }),
        ],
      ),
      body: Center(
          child: Container(
        child: Column(
          children: [],
        ),
      )),
    );
  }
}
