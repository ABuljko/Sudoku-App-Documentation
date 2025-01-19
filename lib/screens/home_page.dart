// homePage.dart
import 'package:flutter/material.dart';
import 'package:sudoku_app/screens/sudoku_widget.dart';
import 'package:sudoku_app/screens/settings.dart';
import 'package:sudoku_app/screens/how_to_play.dart'; // Import the required screens

class SudokuHomePage extends StatelessWidget {
  const SudokuHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> themeNotifier =
        ValueNotifier<String>("light"); // Add ValueNotifier here
    // ignore: unused_local_variable
    final double buttonWidth = MediaQuery.of(context).size.width * 0.5;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // Remove AppBar shadow
        title: const Text(
          'Sudoku Game',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black), // Back arrow color
      ),
      body: Column(
        children: [
          // White stripe line
          Container(
            height: 2,
            color: Colors.white,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome to Sudoku!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color for contrast
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildButton(
                        context,
                        text: 'Start New Game',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SudokuWidget(themeNotifier: themeNotifier),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      _buildButton(
                        context,
                        text: 'Settings',
                        onPressed: () {
                          // Navigate to the "Settings" page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingsPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      _buildButton(
                        context,
                        text: 'How to Play',
                        onPressed: () {
                          // Navigate to the "How to Play" page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HowToPlayPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String text, required VoidCallback onPressed}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 5,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
