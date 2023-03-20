import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Color(0xFFf4f1de),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return Center(
            child: Text('First'),
          );
        }
        if (currentIndex == 1) {
          return Center(
            child: Text('Second'),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Jesteś zalogowany jako ${widget.user.email}'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text('Log out'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF81b29a)),
              ),
            ],
          ),
        );
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
