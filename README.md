# Sudoku

## Table of Contents
- [1. Git](#1-git)
- [2. UML](#2-uml)
- [3. Requirements](#3-requirements)
- [4. Analysis](#4-analysis)
- [5. Event-Storming](#5-event-storming)
- [6. Metrics](#6-metrics)
- [7. Clean Code Development CCD](#7-clean-code-development-ccd)
- [8. Refactoring](#8-refactoring)
- [9. BUILD](#9-build)
- [10. Continuous Delivery](#10-continuous-delivery)
- [11. Integrate some nice unit tests](#11-integrate-some-nice-unit-tests)
- [12. IDE](#12-ide)
- [13. AI Coding](#13-ai-coding)
- [14. Functional Programming](#14-functional-programming)
- [15. AI Coding environment](#15-ai-coding-environment)
- [My Thoughts](my.thoughts)

---

## 1. Git
Use and understand **Git**! Apply the basic commands, and experiment with time traveling, branches, and merges.  

I’ve used Git to manage version control on my project, which has made it easier to stay organized and keep track of my work. Features like commits, and merges have been really helpful for managing changes and progress over time.

![Image](https://github.com/user-attachments/assets/046704fb-e9ad-479b-b14a-dea01be2a5e7)
## 2. UML

- **Use-Case Diagram**
![UMLUseCase](https://github.com/user-attachments/assets/d4860f5f-c304-4c1b-9ced-a5d1744bbe4d)

- **Class Diagram**
![UMLClassDiagram](https://github.com/user-attachments/assets/b4c90d50-08a4-4a81-b38b-258937d0cbff)

- **Activity Diagram**
![Image](https://github.com/user-attachments/assets/b55f7f3f-687f-4636-a7d0-12cfd3b2a413)

## 3. Requirements

### Tool Trello
- Requirments to start
  
![Image](https://github.com/user-attachments/assets/ebe63b59-1aea-4d19-bc36-bfed80a04de4)
### Tool Jira
- Requirments to start
![Image](https://github.com/user-attachments/assets/33adca82-6126-41b0-8070-699b2b9b0e3d)

### Current Requirements
- [Sudoku App Requirements - Trello Board](https://trello.com/b/jywhwyZK/task-3-requirements)
- [Sudoku App Requirements - Jira Board](https://ajdinbuljko17.atlassian.net/jira/software/projects/BTS/boards/1)
## 4. Analysis
Include a detailed analysis of the project requirements and challenges.
    
    Target Audience
    Core Features
    Monetization Strategy
    Technical Feasibility
    Data Privacy and Security
    Scalability
    Market Validation
    Development Timeline
    Risks and Challenges
    Innovation Potential
    Future Expansion

[Sudoku App Analysis Link](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/Project-Analysis-Checklist.pdf)
## 5. Event-Storming
Conduct **Event-Storming** as part of Domain-Driven Design (DDD):
- **(A)** Identify your domains. If the domain is too small, invent others around it.
- **(B)** Develop a strategic design with mappings/relationships between domains.
- **(C)** Visualize the mappings in a Core Domain Chart.

### Examples:
- **DDD Diagram**  
![Image](https://github.com/user-attachments/assets/d87af7db-405d-4e1e-a3e8-8ef8cbab401c)

---

- **DDD Event Diagram**  
![DDD Event Diagram](https://github.com/user-attachments/assets/16360093-c6dc-40c0-b280-582ba2ccd10c)  

---

- **Core Domain Chart**  
![Core Domain Chart](https://github.com/user-attachments/assets/de8a96c8-1bff-41fe-b53e-ae63722dc753)  

---

### Miro Board:
Visit the interactive chart: [MIRO Board](https://miro.com/app/board/uXjVLMGPOiA=/)

## 6. Metrics
I used Dart's linter to check for best practices, and the results confirm a clean codebase with minimal warnings or errors.
![Image](https://github.com/user-attachments/assets/7d5b90db-8212-4845-8656-1efb848ed203)
![Image](https://github.com/user-attachments/assets/104b9093-c709-44e3-8ac7-756c59182dff)

## 7. Clean Code Development (CCD)
Document and demonstrate **Clean Code Development**:
1. List at least five points showcasing clean code practices and their benefits.
2. Provide a personal **CCD Cheat Sheet** with at least ten points (e.g., as a PDF).

- Single Responsibility Principle: [BlokChar](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/lib/widgets/blokChar.dart) manages the state and behavior of a single Sudoku cells
- Encapsulation: [FocusClass](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/lib/widgets/focusClass.dart) keeps the focus details inside and only shows needed methods
- User-Centric Design: The code uses [setFocus](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/lib/screens/sudoku_widget.dart) to highlight selected boxes and [setInput](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/lib/screens/sudoku_widget.dart) for real-time feedback, enhancing user experience
- Readable Names: [RestartButton](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/lib/widgets/restartButton.dart) represents a button that triggers a restart action, and [onReload](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/lib/widgets/restartButton.dart) is the function that gets called when the button is pressed
- Efficient State Management: [setState](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/lib/screens/sudoku_widget.dart) is used only when necessary to trigger UI updates, optimizing performance

[Clean Code Development Cheat Sheet](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/CCD-Cheat-Sheet.pdf)

## 8. Refactoring
Show me two (non-trivial) Refactoring Examples of your code! Showing the original content and the refactored code! Explain what happened, why and how it has improved!

### 1. generatePuzzle()
#### Original Code
The generatePuzzle() was designed to create a Sudoku puzzles by going through a solved grid and adding numbers to BoxInner objects. It calculates an index for each number and adds it to BlokChar. But it checks if boxInners is empty each time and uses boxInners.first, which isn’t efficient. The code also not flexible enough to handle different puzzle sizes.

      void generatePuzzle() {
      boxInners.clear();
    
      var sudokuGenerator = SudokuGenerator(emptySquares: 54); 
      var solvedSudoku = sudokuGenerator.newSudokuSolved;
    
      for (int i = 0; i < solvedSudoku.length; i++) {
        for (int j = 0; j < solvedSudoku[i].length; j++) {
          int index = i * sqrt(solvedSudoku.length).toInt() + j ~/ 3;
          if (boxInners.isEmpty) {
            boxInners.add(BoxInner(index, []));
          }
  
        BoxInner boxInner = boxInners.first;
        boxInner.blokChars.add(BlokChar(
          solvedSudoku[i][j] == 0 ? "" : solvedSudoku[i][j].toString(),
          index: boxInner.blokChars.length,
          isDefault: solvedSudoku[i][j] != 0,
          isCorrect: solvedSudoku[i][j] != 0,
          correctText: solvedSudoku[i][j].toString(),
        ));
      }  
        }
      }

#### Refactored Code
By removing unnecessary checks, making it faster and easier to read. It uses simpler methods like partition and expand to handle the grid and accesses the correct BoxInner more efficiently.
        void generatePuzzle() {
        boxInners.clear();
      
        var sudokuGenerator = SudokuGenerator(emptySquares: 54); 
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
          List<int> completedValues = completedGrid[entry.key].expand((e) => e).toList();
          List<int> currentPuzzleValues = entry.value.expand((e) => e).toList();
      
          currentPuzzleValues.asMap().entries.forEach((entryIn) {
            int index = entry.key * sqrt(sudokuGenerator.newSudoku.length).toInt() +
                (entryIn.key % 9) ~/ 3;
      
            if (boxInners.where((element) => element.index == index).isEmpty) {
              boxInners.add(BoxInner(index, []));
            }
      
            BoxInner boxInner = boxInners.firstWhere((element) => element.index == index);
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
#### Why I Refactored
I refactored the code to make it faster by removing unnecessary checks and simplifying the logic. It also improves how boxInners.first is accessed and works better with different puzzle sizes.

---

### 2. setFocus()
#### Original Code
The original setFocus() updated the focus by setting tapBoxIndex and updating focusClass, then triggered a state update. However, it lacked flexibility and didn’t support additional functionality like feedback or highlighting the focused area

      void setFocus(int index, int indexChar) {
        tapBoxIndex = "$index-$indexChar";
        focusClass.indexBox = index;
        focusClass.indexChar = indexChar;
        setState(() {});
      }
#### Refactored Code
The refactored setFocus() improved focus handling by using focusClass.setData() for cleaner updates and adding showFocusCenter() for better feedback.

      void setFocus(int index, int indexChar) {
        tapBoxIndex = "$index-$indexChar";
        focusClass.setData(index, indexChar);
        showFocusCenter();
        setState(() {});
      }
#### Why I Refactored
I refactored the code to make it more functional and easier to understand. Adding showFocusCenter() improved feedback, and using focusClass.setData() made focus updates cleaner and more organized.

---

### How These Changes Improved the Code
#### 1. generatePuzzle()
- It splits the grid properly using **partition()**
- It checks both the solved and current puzzle to make sure everything matches
- As well as properly creating and managing the puzzle boxes
- And finally it makes sure everything works correctly and is well-organized
#### 2. setFocus()
- The code is simpler to modify and/or build up
- It directly updates focusClass, which makes it easier to understand
- Also it voids the overhead of calling additional functions like **setData**
## 9. BUILD
BUILD Management with any Build System as Ant, Maven, Gradle, etc. (only Travis is perhaps not enough) Do e.g. generate Docs, call tests, etc. (it could also be disconnected from the project just to learn a build tool!)

The project uses Gradle for building and managing the project. Key files include:
- [build.gradle](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/android/build.gradle): The root-level Gradle file that sets up repositories and shared dependencies for the entire project.
- [app/build.gradle](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/android/app/build.gradle): The module-level Gradle file for the app, which includes configurations such as dependencies, build types, and product flavors.
- [gradle.properties](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/android/gradle.properties): Holds project-level properties, including JVM arguments and AndroidX settings.
- [settings.gradle](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/android/settings.gradle): Configures the Gradle modules and specifies which modules are included in the project.

## 10. Continuous Delivery
Create a **Continuous Delivery Pipeline** with tools such as:
- **Jenkins**
- **Travis-CI**
- **GitHub Actions**
- **GitLab CI**

The pipeline should include at least two script calls, such as invoking a build tool or running tests.

## 11. Integrate some nice unit tests
Develop and integrate meaningful **unit tests** into your code. Ensure they are included in the build pipeline.

- [box_inner_test.dart](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/test/boxInner_test.dart): tests the BoxInner class to make sure it correctly handles setting focus, value existence, and clearing states for Sudoku grid cells.
- [widget_test.dart](https://github.com/ABuljko/Sudoku-App-Documentation/blob/main/test/widget_test.dart): Verifies that widgets function as expected.

These tests ensure that the components of your app, like buttons, text fields, and other widgets, behave correctly. They check if the widgets appear, respond to user interactions, and update the UI as expected.
## 12. IDE
Use a modern IDE like **VSCode** or **IntelliJ**. Highlight your favorite shortcuts and features you’ve learned to use efficiently.

Key Features Used:
- Extensions: Flutter, Dart, GitLens, Prettier

- Integrated Terminal: Running **flutter run** and Git commands

- Debugging: Setting breakpoints, inspecting variables, and hot-reload

My Favorite Shortcuts:
- Ctrl + P: Quick open files

- Ctrl + /: Comment or uncomment the code

- Ctrl + A: Select the current line  or the entire code

- Ctrl + V: Paste the copied content

- Ctrl + C: Copy the current line  or the entire code

- Ctrl + X: Cut the current line  or the entire code

- Ctrl + Enter: Commit changes

- F5: Start debugging

- Ctrl + .: Suggest code fixes for highlighted code errors

## 13. AI Coding
 Set Up an AI-coding environment on your computer like ZED, Aider, free Cursor / Windsurf programs, etc. Show your steps and personal experiences! (ref)

### Tools Used
I selected GitHub Copilot as my AI coding assistant due to its smooth integration with VS Code. It improved my coding speed by providing real-time suggestions for snippets, refactorings, and patterns.

### Personal Experience
Setting up Copilot took less than 1 minute, and it quickly began supporting my project. I used it for:

- To comment out my codes
- As well as to fix some of the bugs I had in my sudoku code

### Example: Creating a Search Bar is shown in Question 15

## 14. Functional Programming
Demonstrate **functional programming** principles in your project, such as:

### Using only final data structures.
In blokChar.dart, the BlokChar class uses final for fields, making them immutable. This ensures that once an instance is created, its state cannot be changed.

      class BlokChar {
        final String? correctText;  // Correct solution for the cell.
        final bool isDefault;       // Indicates if the cell is pre-filled.
        BlokChar(
          String? text, {
          this.correctText,
          this.isDefault = false,
        }) : super(text: text);
      }

### Writing side-effect-free functions.
The isCorrectPos function in blokChar.dart is a side effect free function. It simply returns a value based on the inputs and does not modify any external states.

      bool get isCorrectPos => correctText == text;

-  In sudoku_widget.dart, the showSameInputOnSameLine function processes input without modifying external states.
        
        void showSameInputOnSameLine() {
          String textInput = boxInners[focusClass.indexBox!]
              .blokChars[focusClass.indexChar!].text!;
        
          boxInners.forEach((element) => element.clearExist());
          boxInners
              .where((e) => e.index ~/ 3 == focusClass.indexBox! ~/ 3)
              .forEach((e) => e.setExistValue(focusClass.indexChar!, textInput));
        }
### Utilizing higher-order functions.
In sudoku_widget.dart, you are using higher-order functions such as forEach, map, and where. These are applied to lists of Sudoku cells, processing each cell using the provided functions.

    boxInners.forEach((box) {
      box.blokChars
          .where((char) => char.isCorrect == false)
          .forEach((char) => char.setEmpty());
    });


### Closures and Anonymous Functions.
In home_page.dart, you are using anonymous functions (closures) in the _buildButton method for state management and handling callbacks.

    _buildButton(
      context,
      text: 'Start New Game',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SudokuWidget(themeNotifier: themeNotifier),
          ),
        );
      },
    );

Similarly, in sudoku_widget.dart, anonymous functions are used inside the GridView.builder to handle button clicks.

    GridView.builder(
      itemCount: boxInners.length,
      itemBuilder: (context, index) {
        return Container(
          child: GridView.builder(
            itemCount: boxInners[index].blokChars.length,
            itemBuilder: (context, charIndex) {
              return TextButton(
                onPressed: () => setFocus(index, charIndex),
                child: Text(boxInners[index].blokChars[charIndex].text ?? ""),
              );
            },
          ),
        );
      },
    );
    
### Functions as Parameters and Return Values.
In restartButton.dart, the RestartButton widget receives a function (VoidCallback) as a parameter, which it calls when the button is pressed.

    class RestartButton extends StatelessWidget {
      final VoidCallback onReload;
    
      const RestartButton({required this.onReload});
    
      @override
      Widget build(BuildContext context) {
        return ElevatedButton(
          onPressed: onReload,
          child: const Icon(Icons.refresh),
        );
      }
    }
In sudoku_widget.dart, the setFocus function is used as part of the game logic, passing parameters to update the focus position.

    void setFocus(int index, int charIndex) {
      tapBoxIndex = "$index-$charIndex";
      focusClass.setData(index, charIndex);
      setState(() {});
    }
## 15. AI Coding environment
Set up a running AI Coding environment! Prove it by “coding” something iteratively
- This is all part of one chat, I just did not properly edit the picture
![Image](https://github.com/user-attachments/assets/75e02a44-fcf6-4116-9c97-cdd68c5bd5f7)
![Image](https://github.com/user-attachments/assets/66a38a75-9062-4750-8d2f-cc819ff8d989)
## My Thoughts
Share personal experiences, screenshots, and personalized text.

I had alot of fun making this project, but sometimes I wanted to throw my laptop throught the window because to be honest I hate making charts. Although it was somthing that i wanted to do for a long time, I realise that as I was doing the project that I ended up learning a lot, and earning about the different ways to utalize Github repositories, mistakes, nad most importantly setting up the AI assistant in my VS Code were honestly the best parts of this project.

I personaly do use GitHub for storing my projects and mapping out my activity, but if I am honest I would only use it for basic things. Now that I had to do all of these things with my code and documentinnng everything I found so many interesting and new features in GitHub. In the end, I'm grateful for this project as it gave me the push I needed to work on an idea I had been thinking about for a long time, because I really always wanted to make a sudoku app, but was always pushed back for some reason. It also taught me what it takes to build and organize a project from start to finish. I will definitely be using this in the future.
![Image](https://github.com/user-attachments/assets/acc78fad-491b-4f1a-87ff-b3b19af18c8f)
![Image](https://github.com/user-attachments/assets/4ad632e5-7f02-4182-80ca-d72d1bb3524d)
