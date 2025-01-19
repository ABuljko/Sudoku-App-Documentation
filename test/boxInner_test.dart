import 'package:flutter_test/flutter_test.dart';
import 'package:sudoku_app/widgets/boxInner.dart';
import 'package:sudoku_app/widgets/blokChar.dart';

void main() {
  group('BoxInner Widget Tests', () {
    // Test Setup: Create BoxInner and BlokChar instances for testing
    late BoxInner boxInner;
    late BlokChar blokChar1;
    late BlokChar blokChar2;

    setUp(() {
      blokChar1 = BlokChar('5', index: 0, isDefault: false, isCorrect: true, correctText: '5');
      blokChar2 = BlokChar('3', index: 1, isDefault: false, isCorrect: true, correctText: '3');
      boxInner = BoxInner(0, [blokChar1, blokChar2]);
    });

    // Test for setting focus in a row (horizontal)
    test('setFocus should highlight the correct cells horizontally', () {
      boxInner.setFocus(0, Direction.Horizontal);  // Setting focus to row 0

      expect(blokChar1.isFocus, true);  // BlokChar1 should be focused
      expect(blokChar2.isFocus, true);  // BlokChar2 should be focused
    });

    // Test for clearing focus
    test('clearFocus should remove focus from all cells', () {
      boxInner.setFocus(0, Direction.Horizontal);  // Set focus first
      boxInner.clearFocus();  // Clear the focus

      expect(blokChar1.isFocus, false);  // BlokChar1 should not be focused
      expect(blokChar2.isFocus, false);  // BlokChar2 should not be focused
    });

    // Test for setting existence of values
    test('setExistValue should mark correct cells as existing', () {
      boxInner.setExistValue(0, 0, '5', Direction.Horizontal);  // Setting existence for value '5' in horizontal direction

      expect(blokChar1.isExist, true);  // BlokChar1 should be marked as existing
      expect(blokChar2.isExist, false);  // BlokChar2 should not be marked as existing
    });

    // Test for clearing existence of values
    test('clearExist should reset existence for all cells', () {
      boxInner.setExistValue(0, 0, '5', Direction.Horizontal);  // Set existence for '5'
      boxInner.clearExist();  // Clear existence

      expect(blokChar1.isExist, false);  // BlokChar1 should not be marked as existing
      expect(blokChar2.isExist, false);  // BlokChar2 should not be marked as existing
    });
  });
}
