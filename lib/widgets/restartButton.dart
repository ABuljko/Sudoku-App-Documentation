import 'package:flutter/material.dart';

class RestartButton extends StatelessWidget {
  final VoidCallback onReload;

  const RestartButton({required this.onReload, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onReload, // Trigger the reload function
      child: const Icon(Icons.refresh),
    );
  }
}
