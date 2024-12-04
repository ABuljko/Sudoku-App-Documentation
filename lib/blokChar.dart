// Class to represent each cell in the Sudoku grid (block character).
// ignore_for_file: file_names

class BlokChar {
  String? text;          // The text/number displayed in the cell.
  String? correctText;   // The correct solution text for the cell.
  int? index;            // The index of the cell in the grid.
  bool isFocus = false;  // A flag to indicate if the cell is currently focused by the user.
  bool isCorrect;        // A flag to indicate if the entered value is correct.
  bool isDefault;        // A flag to indicate if the cell contains a pre-filled value.
  bool isExist = false;  // A flag to indicate if the number exists somewhere in the same row/column.

  // Constructor to initialize the BlokChar object with an optional index, default value, correctText, and isCorrect flag.
  BlokChar(
    this.text, {
    this.index,                  // Index of the cell (optional).
    this.isDefault = false,      // Whether the value is default/pre-filled (default is false).
    this.correctText,            // The correct answer for the cell (optional).
    this.isCorrect = false,      // Whether the cell's value is correct (default is false).
  });

  // A getter to check if the current text matches the correct solution (this is used to check if the user input is correct).
  get isCorrectPos => correctText == text;

  // Method to set the text in the cell and update the isCorrect flag.
  setText(String text) {
    this.text = text;                 // Set the text of the block.
    isCorrect = isCorrectPos;         // Update isCorrect based on whether the text matches the correct solution.
  }

  // Method to clear the text and reset the correctness flag.
  setEmpty() {
    text = "";                        // Clear the text.
    isCorrect = false;                // Reset the correctness flag.
  }

  void setExist() {}
}
