import 'package:flutter/material.dart';
import 'login.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xFFFF6A00),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 252, 226).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                      
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/homeBike.png'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                onPressed: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage(registeredUsers: const [],)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.orange, backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: const Color(0xFFFF6A00),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}