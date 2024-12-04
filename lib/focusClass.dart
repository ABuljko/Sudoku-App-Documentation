// ignore_for_file: file_names

// Class to handle focus state for a specific box and character in a Sudoku grid.
class FocusClass {
  int? indexBox; // The index of the box to which the focus applies.
  int? indexChar; // The index of the character (cell) to which the focus applies.

  // Method to set the data for the focus, initializing the indexBox and indexChar.
  setData(int indexBox, int indexChar) {
    this.indexBox = indexBox; // Set the index of the box.
    this.indexChar = indexChar; // Set the index of the character (cell).
  }

  // Method to check if the current focus matches the provided box and character indices.
  focusOn(int indexBox, int indexChar) {
    // Returns true if both the box index and character index match the current focus.
    return this.indexBox == indexBox && this.indexChar == indexChar;
  }
}
