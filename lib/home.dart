import 'package:flutter/material.dart';
import 'bike_list.dart';
import 'bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF6A00), // Orange background
      appBar: AppBar(
        title: const Text("Choose Your Bike", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search, size: 28),
          )
        ],
      ),
      body: BikeList(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
