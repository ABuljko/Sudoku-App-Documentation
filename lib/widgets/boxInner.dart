// ignore_for_file: file_names, constant_identifier_names

import 'package:sudoku_app/widgets/blokChar.dart';

// Class that represents a group of 9 cells (3x3 box) in the Sudoku grid.
class BoxInner {
  late int index;                // The index of the box in the grid.
  List<BlokChar> blokChars = List<BlokChar>.from([]); // List of BlokChar objects representing the cells in the box.

  // Constructor to initialize the index of the box and its list of BlokChars.
  BoxInner(this.index, this.blokChars);

  // Sets the focus state for all cells in a specific direction (horizontal or vertical).
  setFocus(int index, Direction direction) {
    List<BlokChar> temp; // Temporary list to store BlokChar objects that match the focus direction.

    // If the direction is horizontal, filter cells that are in the same row.
    if (direction == Direction.Horizontal) {
      temp = blokChars
          .where((element) => element.index! ~/ 3 == index ~/ 3)  // Cells with the same row index.
          .toList();
    } else { // If the direction is vertical, filter cells that are in the same column.
      temp = blokChars
          .where((element) => element.index! % 3 == index % 3)  // Cells with the same column index.
          .toList();
    }

    // Set the 'isFocus' flag to true for each filtered BlokChar.
    for (var element in temp) {
      element.isFocus = true;
    }
  }

  // Sets the 'isExist' flag for all cells in a specific direction based on the given input value.
  setExistValue(
      int index, int indexBox, String textInput, Direction direction) {
    List<BlokChar> temp; // Temporary list to store BlokChar objects that match the focus direction.

    // If the direction is horizontal, filter cells that are in the same row.
    if (direction == Direction.Horizontal) {
      temp = blokChars
          .where((element) => element.index! ~/ 3 == index ~/ 3) // Cells with the same row index.
          .toList();
    } else { // If the direction is vertical, filter cells that are in the same column.
      temp = blokChars
          .where((element) => element.index! % 3 == index % 3) // Cells with the same column index.
          .toList();
    }

    // Check if the current indexBox matches the one being worked on.
    if (this.index == indexBox) {
      // Find BlokChars that have the same text as the input.
      List<BlokChar> blokCharsBox =
          blokChars.where((element) => element.text == textInput).toList();

      // If there is exactly one match and no matching cells in the direction, clear it.
      if (blokCharsBox.length == 1 && temp.isEmpty) blokCharsBox.clear();

      // Add the matching BlokChars to the temporary list.
      temp.addAll(blokCharsBox);
    }

    // Set 'isExist' to true for each BlokChar where the text matches the input.
    temp.where((element) => element.text == textInput).forEach((element) {
      element.isExist = true;
    });
  }

  // Clears the focus from all cells in the box (sets 'isFocus' to false).
  clearFocus() {
    for (var element in blokChars) {
      element.isFocus = false;
    }
  }

  // Clears the 'isExist' flag from all cells in the box (sets 'isExist' to false).
  clearExist() {
    for (var element in blokChars) {
      element.isExist = false;
    }
  }

  // Placeholder method to set the text for cells in the same line (to be implemented).
  setTextOnSameLine(int i, String textInput) {}
}

// Enum to define the two possible directions (Horizontal or Vertical).
enum Direction { Horizontal, Vertical }
