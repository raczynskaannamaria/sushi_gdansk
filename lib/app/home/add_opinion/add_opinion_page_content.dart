import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

var restaurantName = '';
var sushiName = '';
var rating = 3.0;

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'restaurant name'),
            onChanged: (newValue) {
              setState(() {
                restaurantName = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'sushi name'),
            onChanged: (newValue) {
              setState(() {
                sushiName = newValue;
              });
            },
          ),
          const SizedBox(height: 20),
          Slider(
            onChanged: (newValue) {
              setState(() {
                rating = newValue;
              });
            },
            value: rating,
            min: 1.0,
            max: 6.0,
            divisions: 10,
            label: rating.toString(),
            activeColor: Color(0xFFe07a5f),
            inactiveColor: Color(0xFFf2cc8f),
            thumbColor: Color(0xFF3d405b),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (() {
              FirebaseFirestore.instance.collection('restaurants').add({
                'name': restaurantName,
                'sushi': sushiName,
                'rating': 3.0,
              });
            }),
            child: Text('Add'),
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF81b29a)),
          ),
        ],
      ),
    );
  }
}
