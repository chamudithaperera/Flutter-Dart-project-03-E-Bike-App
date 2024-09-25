import 'package:flutter/material.dart';
import 'register.dart';
import 'user.dart';
import 'home.dart'; // Import the HomePage
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final List<User> registeredUsers;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({required this.registeredUsers});

  // Load registered users from shared preferences
  Future<List<User>> loadRegisteredUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? usersJson = prefs.getStringList('registeredUsers');
    if (usersJson != null) {
      return usersJson.map((user) {
        final parts = user.split(',');
        return User(username: parts[0], email: parts[1], password: parts[2]);
      }).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<List<User>>(
          future: loadRegisteredUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            List<User> registeredUsers = snapshot.data ?? [];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo and tagline
                Image.asset('assets/logo.png'),
                SizedBox(height: 80),
                // Username/Email field
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'User name / Email',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 59, 59, 59), fontSize: 12,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 252, 226).withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                // Password field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 59, 59, 59), fontSize: 12,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 252, 226).withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // Login button
                ElevatedButton(
                  onPressed: () {
                    // Validate login
                    bool loggedIn = registeredUsers.any((user) =>
                        (user.username == emailController.text || user.email == emailController.text) &&
                        user.password == passwordController.text);

                    if (loggedIn) {
                      // Navigate to the HomePage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      // Show an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid credentials! Please try again.')),
                      );
                    }
                  },
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color(0xFFFFFFFF), // White for contrast
                    foregroundColor: Color(0xFFFF6A00), // Text color to match the theme
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Signup redirect
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Signup",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      backgroundColor: Color(0xFFFF6A00), // Background color
    );
  }
}
