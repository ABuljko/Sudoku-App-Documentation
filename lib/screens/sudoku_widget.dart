import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sudoku_app/widgets/blokChar.dart';
import 'package:sudoku_app/widgets/boxInner.dart';
import 'package:sudoku_app/widgets/focusClass.dart';
// ignore: depend_on_referenced_packages
import 'package:quiver/iterables.dart';
// ignore: depend_on_referenced_packages
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';
import 'package:sudoku_app/widgets/restartButton.dart'; // Import the new widget

// Main widget class for Sudoku game
class SudokuWidget extends StatefulWidget {
  const SudokuWidget({super.key, required ValueNotifier<String> themeNotifier});

  @override
  State<SudokuWidget> createState() => _SudokuWidgetState();
}

class _SudokuWidgetState extends State<SudokuWidget> {
  List<BoxInner> boxInners = [];
  FocusClass focusClass = FocusClass();
  bool isFinish = false;
  String? tapBoxIndex;

  @override
  void initState() {
    super.initState();
    generateSudoku(); // Generate a new Sudoku puzzle on startup
  }

  // Optimized function to generate a new Sudoku puzzle
  void generateSudoku() {
    setState(() {
      isFinish = false;
      focusClass = FocusClass();
      tapBoxIndex = null;
      generatePuzzle();
      checkFinish();
    });
  }

  // Function to generate the Sudoku puzzle (create initial grid and pre-filled numbers)
  void generatePuzzle() {
    boxInners.clear();

    var sudokuGenerator = SudokuGenerator(
        emptySquares: 54); // Generate a Sudoku puzzle with empty squares
    List<List<List<int>>> completedGrid = partition(
            sudokuGenerator.newSudokuSolved,
            sqrt(sudokuGenerator.newSudoku.length).toInt())
        .toList();

    partition(sudokuGenerator.newSudoku,
            sqrt(sudokuGenerator.newSudoku.length).toInt())
        .toList()
        .asMap()
        .entries
        .forEach((entry) {
      List<int> completedValues =
          completedGrid[entry.key].expand((e) => e).toList();
      List<int> currentPuzzleValues = entry.value.expand((e) => e).toList();

      currentPuzzleValues.asMap().entries.forEach((entryIn) {
        int index = entry.key * sqrt(sudokuGenerator.newSudoku.length).toInt() +
            (entryIn.key % 9) ~/ 3;

        if (boxInners.where((element) => element.index == index).isEmpty) {
          boxInners.add(BoxInner(index, []));
        }

        BoxInner boxInner =
            boxInners.firstWhere((element) => element.index == index);
        boxInner.blokChars.add(BlokChar(
          entryIn.value == 0 ? "" : entryIn.value.toString(),
          index: boxInner.blokChars.length,
          isDefault: entryIn.value != 0,
          isCorrect: entryIn.value != 0,
          correctText: completedValues[entryIn.key].toString(),
        ));
      });
    });
  }

  // Reload the game with a fresh Sudoku puzzle
  void reloadPuzzle() {
    generateSudoku(); // Generate a new puzzle
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          RestartButton(onReload: reloadPuzzle), // Use RestartButtonWidget here
        ],
      ),
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  color: Colors.black,
                  padding: const EdgeInsets.all(5),
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: GridView.builder(
                    itemCount: boxInners.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      BoxInner boxInner = boxInners[index];
                      return Container(
                        color: Colors.black,
                        alignment: Alignment.center,
                        child: GridView.builder(
                          itemCount: boxInner.blokChars.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, indexChar) {
                            BlokChar blokChar = boxInner.blokChars[indexChar];
                            Color color = Colors.white;
                            Color colorText = Colors.black;

                            if (isFinish) {
                              color = Colors.green;
                            } else if (blokChar.isDefault) {
                              color = Colors.grey;
                            } else if (blokChar.isFocus) {
                              color = Colors.brown.shade100;
                            }

                            if (tapBoxIndex == "$index-$indexChar" &&
                                !isFinish) {
                              color = Colors.blue.shade100;
                            }

                            if (isFinish) {
                              colorText = Colors.white;
                            } else if (blokChar.isExist) {
                              colorText = Colors.red;
                            }

                            return Container(
                              color: color,
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: blokChar.isDefault
                                    ? null
                                    : () => setFocus(index, indexChar),
                                child: Text(
                                  "${blokChar.text}",
                                  style:
                                      TextStyle(color: colorText, fontSize: 12),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GridView.builder(
                          itemCount: 9,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio:
                                1.5, // Increase aspect ratio to make buttons smaller
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            return ElevatedButton(
                              onPressed: () => setInput(index + 1),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                minimumSize: const Size(40,
                                    40), // Decrease size for smaller buttons
                              ),
                              child: Text(
                                "${index + 1}",
                                style: const TextStyle(
                                    fontSize:
                                        20), // Adjust font size for smaller buttons
                              ),
                            );
                          },
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                              onPressed: () => setInput(null),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                minimumSize: const Size(
                                    80, 50), // Increase size for Clear button
                              ),
                              child: const Text(
                                "Clear",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Set focus on a selected box in the Sudoku grid
  void setFocus(int index, int indexChar) {
    tapBoxIndex = "$index-$indexChar"; // Store the focused box index
    focusClass.setData(index, indexChar); // Update the focusClass data
    showFocusCenter(); // Highlight the row and column of the selected box
    setState(() {}); // Rebuild to reflect focus change
  }

  // Highlight the row and column of the selected box
  void showFocusCenter() {
    int rowNoBox = focusClass.indexBox! ~/ 3;
    int colNoBox = focusClass.indexBox! % 3;

    // Highlight boxes in the same row and column as the focused box
    boxInners.where((element) => element.index ~/ 3 == rowNoBox).forEach(
        (e) => e.setFocus(focusClass.indexChar!, Direction.Horizontal));

    boxInners
        .where((element) => element.index % 3 == colNoBox)
        .forEach((e) => e.setFocus(focusClass.indexChar!, Direction.Vertical));
  }

  // Set the value of a selected box
  void setInput(int? number) {
    if (focusClass.indexBox == null) return; // No box selected

    BlokChar focusedChar =
        boxInners[focusClass.indexBox!].blokChars[focusClass.indexChar!];

    if (focusedChar.text == number.toString() || number == null) {
      // Clear focus but retain error marking for invalid numbers
      for (var element in boxInners) {
        element.clearFocus();
      }

      // Only clear the value if it is not marked as an error
      if (number == null) {
        focusedChar.setEmpty();
      }

      tapBoxIndex = null; // Clear the selected box
      isFinish = false; // Reset the finished state
    } else {
      // Set the new number and check for correctness
      focusedChar.setText("$number");
      showSameInputOnSameLine(); // Check for duplicate inputs in the same line
      checkFinish(); // Check if the puzzle is complete
    }

    // Revalidate duplicate inputs without clearing error highlights
    showSameInputOnSameLine();

    setState(() {}); // Rebuild to reflect changes
  }

  // Highlight same number inputs on the same line (row/column)
  void showSameInputOnSameLine() {
    int rowNoBox = focusClass.indexBox! ~/ 3;
    int colNoBox = focusClass.indexBox! % 3;

    String textInput =
        boxInners[focusClass.indexBox!].blokChars[focusClass.indexChar!].text!;

    for (var element in boxInners) {
      element.clearExist(); // Clear all previous existence markings
    }

    // Mark all occurrences of the same input in the same row/column
    boxInners.where((element) => element.index ~/ 3 == rowNoBox).forEach((e) =>
        e.setExistValue(focusClass.indexChar!, focusClass.indexBox!, textInput,
            Direction.Horizontal));

    boxInners.where((element) => element.index % 3 == colNoBox).forEach((e) =>
        e.setExistValue(focusClass.indexChar!, focusClass.indexBox!, textInput,
            Direction.Vertical));

    List<BlokChar> exists = boxInners
        .map((element) => element.blokChars)
        .expand((element) => element)
        .where((element) =>
            element.isExist) // List all cells where the input exists
        .toList();

    if (exists.length == 1) {
      exists[0].isExist = false; // Clear existence if only one match found
    }
  }

  // Check if the Sudoku puzzle is completely solved
  void checkFinish() {
    int totalUnfinished = boxInners
        .map((e) => e.blokChars)
        .expand((element) => element)
        .where((element) => !element.isCorrect) // Count the unfinished cells
        .length;

    isFinish = totalUnfinished == 0; // If no incorrect cells remain, the puzzle is finished
  }
}
