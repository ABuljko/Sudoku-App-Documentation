import 'package:flutter/material.dart';
import 'package:sudoku_app/screens/sudoku_widget.dart';
import 'package:sudoku_app/screens/how_to_play.dart';
import 'package:sudoku_app/screens/settings.dart'; // Import the SettingsScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SudokuHomePage(),
    );
  }
}

class SudokuHomePage extends StatelessWidget {
  const SudokuHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> themeNotifier =
        ValueNotifier<String>("light"); // Add ValueNotifier here
    final double buttonWidth = MediaQuery.of(context).size.width * 0.5;

    return Scaffold(
      backgroundColor: Colors.blueAccent, // Set background color
      appBar: AppBar(
        title: const Text('Sudoku Game'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // Match the theme
      ),
      body: Center(
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
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SudokuWidget(themeNotifier: themeNotifier),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Button color
                    foregroundColor: Colors.black, // Text color
                  ),
                  child: const Text('Start New Game'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the "Settings" page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('Settings'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the "How to Play" page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HowToPlayPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('How to Play'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
