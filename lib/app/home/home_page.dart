import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sushi_gdansk/app/home/add_opinion/add_opinion_page_content.dart';
import 'package:sushi_gdansk/app/home/my_account/my_account_page_content.dart';
import 'package:sushi_gdansk/app/home/restaurants/restaurants_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

var currentIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Sushi Gdańsk')),
        backgroundColor: Color(0xFF81b29a),
      ),
      backgroundColor: Color(0xFFf4f1de),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return RestaurantsPageContent();
        }
        if (currentIndex == 1) {
          return AddOpinionPageContent(onSave: () {
            setState(() {
              currentIndex = 0;
            });
          });
        }
        return MyAccountPageContent(email: widget.user.email);
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews, color: Color(0xFF3d405b)),
            label: 'Reviews',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Color(0xFF3d405b)),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFF3d405b)),
            label: 'My account',
          ),
        ],
        backgroundColor: Color(0xFFf2cc8f),
      ),
    );
  }
}
