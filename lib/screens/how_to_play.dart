import 'package:flutter/material.dart';

class HowToPlayPage extends StatelessWidget {
  const HowToPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How to Play Sudoku'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Pops the current page from the stack.
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // Ensures the entire page can scroll.
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildStep(
                  title: "1. Understanding the Grid",
                  description:
                      "Sudoku consists of a 9x9 grid, divided into 9 smaller 3x3 subgrids. Your goal is to fill in the grid such that each row, each column, and each 3x3 subgrid contains the numbers 1 to 9, without any repetition. When you start a new game, some cells will already be filled with numbers. These are the starting clues that help you solve the puzzle.",
                  imagePath:
                      'images/EmptyGrid.jpg', // Replace with your actual image path.
                ),
                _buildStep(
                  title: "2. Inputting Numbers",
                  description:
                      "To fill in a number, tap on an empty cell. Then, use the number buttons at the bottom of the screen to input a value. Press the number button, and the number will appear in the selected cell. To erase a number which is already inputed you must select the number and the bress the 'Clear' button to erase it. If you wish to restart the game just press the restart symbol in the top-right corner, and to go back to the Home Page press the arrow in the top-left corner",
                  imagePath:
                      'images/FullView.jpg', // Replace with your actual image path.
                ),
                const SizedBox(height: 20),
                _buildStep(
                  title: "3. Mistake in the Columns or Rows",
                  description:
                      "Sudoku requires filling a 9x9 grid so that each row, and column contains the numbers 1 to 9 without repeats. Duplicates make the puzzle invalid. If you input a wrong number, it will be highlighted in red. You can change it by tapping on the cell again and entering the correct value.",
                  imagePath:
                      'images/ColumnMistake.jpg', // Replace with your actual image path.
                ),
                _buildStep(
                  title: "4. Mistake in the Subgrid",
                  description:
                      "Sudoku requires filling a 9x9 grid so that 3x3 subgrid contains the numbers 1 to 9 without repeats. Duplicates make the puzzle invalid. If you input a wrong number, it will be highlighted in red. You can change it by tapping on the cell again and entering the correct value.",
                  imagePath:
                      'images/SquareMistake.jpg', // Replace with your actual image path.
                ),
                const SizedBox(height: 20),
                _buildStep(
                  title: "5. Completing the Game",
                  description:
                      "The game is complete when all the cells are correctly filled, and there are no mistakes. When you finish all of the squares will turn from white to green!",
                  imagePath:
                      'images/CompletedGame.jpg', // Replace with your actual image path.
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStep({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 12),
          Center(
            child: Image.asset(
              imagePath,
              height: 300, // 25% bigger than the previous 200.
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
