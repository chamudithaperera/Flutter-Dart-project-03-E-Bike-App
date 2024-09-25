import 'package:flutter/material.dart';
import 'login.dart';
import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
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
                SizedBox(height: 50),
                // Username field
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'User name',
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
                // Email field
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
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
                SizedBox(height: 15),
                // Address field
                // ... (Address field as per your original code)
                SizedBox(height: 30),
                // Signup button
                ElevatedButton(
                  onPressed: () async {
                    // Create a new user
                    User newUser = User(
                      username: usernameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    // Add the new user to the list
                    registeredUsers.add(newUser);

                    // Save registered users to shared preferences
                    final prefs = await SharedPreferences.getInstance();
                    List<String> usersJson = registeredUsers.map((user) {
                      return '${user.username},${user.email},${user.password}';
                    }).toList();
                    await prefs.setStringList('registeredUsers', usersJson);

                    // Navigate to the login page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage(registeredUsers: registeredUsers)),
                    );
                  },
                  child: const Text('SignUp'),
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
                // Login redirect
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage(registeredUsers: registeredUsers)),
                    );
                  },
                  child: const Text(
                    "Already have an account? Login",
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
