// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedTheme = 'Normal Mode'; // Default theme
  String selectedLanguage = 'English'; // Default language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // Remove AppBar shadow
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: selectedTheme == 'Dark Mode'
                      ? [Colors.black, Colors.grey.shade800]
                      : selectedTheme == 'Vintage Mode'
                          ? [Colors.brown.shade300, Colors.brown.shade600]
                          : [Colors.blueAccent, Colors.lightBlue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Theme Button
                    _buildButton(
                      context,
                      text: 'Theme: $selectedTheme',
                      onPressed: () {
                        _showThemePickerDialog(context);
                      },
                    ),
                    const SizedBox(height: 20),

                    // Language Button
                    _buildButton(
                      context,
                      text: 'Language: $selectedLanguage',
                      onPressed: () {
                        _showLanguagePickerDialog(context);
                      },
                    ),
                  ],
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

  void _showThemePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Theme'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildThemeOption(
                context,
                color: Colors.blueAccent,
                label: 'Normal Mode',
              ),
              _buildThemeOption(
                context,
                color: Colors.black,
                label: 'Dark Mode',
              ),
              _buildThemeOption(
                context,
                color: Colors.brown.shade300,
                label: 'Vintage Mode',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildThemeOption(BuildContext context,
      {required Color color, required String label}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedTheme = label;
            });
            Navigator.pop(context); // Close the dialog
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Circle background
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              // Checkmark overlay
              if (selectedTheme == label)
                const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 30,
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  void _showLanguagePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ['English', 'Spanish', 'German'].map((language) {
              return ListTile(
                title: Text(language),
                onTap: () {
                  setState(() {
                    selectedLanguage = language;
                  });
                  Navigator.pop(context); // Close the dialog
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
