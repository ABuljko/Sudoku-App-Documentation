# Sudoku

## Table of Contents
- [1. Git](#1-git)
- [2. UML](#2-uml)
- [3. Requirements](#3-requirements)
- [4. Analysis](#4-analysis)
- [5. Event-Storming](#5-event-storming)
- [6. Metrics](#6-metrics)
- [7. Clean Code Development](#7-clean-code-development)
- [8. Build](#8-build)
- [9. Continuous Delivery](#9-continuous-delivery)
- [10. Integrate some nice unit tests](#10-integrate-some-nice-unit-tests)
- [11. IDE](#11-ide)
- [12. DSL](#12-dsl)
- [13. Functional Programming](#13-functional-programming)

---

## 1. Git
Use and understand **Git**! Apply the basic commands, and experiment with time traveling, branches, and merges.  

I’ve used Git to manage version control on my project, which has made it easier to stay organized and keep track of my work. Features like branches, commits, and merges have been really helpful for managing changes and progress over time.

## 2. UML
Create at least **three UML diagrams**:
- **Use-Case Diagram**
- **Component Diagram**
- **Class Diagram**
- **Activity Diagram**

Export the diagrams as images so they can be viewed without installing additional tools.

## 3. Requirements
### I.Technical Part:
- A functioning mobile device is required.
- The device must be compatible with the app.
- The device must have a working touch screen.

### II.Play the Game:
- The user **MUST** be able to select a square on the Sudoku board.
- The user **MUST** be able to input a number into the selected square by pressing one of the number buttons.
- The user **MUST** be able to erase an already inputted number from the selected square.

### III.Mobile App Development Using Flutter:
- The app **MUST** be developed using Flutter and built to run on Android devices.
- Implement Flutter widgets and best practices for a smooth and responsive UI.

## 4. Analysis
Include a detailed analysis of the project requirements and challenges.

Target Audience
- Casual Gamers: People looking for quick and fun puzzles to pass time
- Puzzle Enthusiasts (Preferred way of being called in the community): Sudoku lovers
  
Core Features
- Puzzle Generator: Randomly generate sudoku puzzles
- Established Rules: Making sure that all the basic rules of sudoku are applied in the game
- Outcome: Making sure that there is only one possible outcome
  
Monetization Strategy
- Advertisements: Put a small box above or on the sides of the game that will continuously display ads (I need to make a profit, but I also hate it when an add pops up in the middle of a good game)
- In-App Purchases: Unlock themes, or puzzle packs.
  
Technical Feasibility
- Platforms: Mobile phones first (such as iOS and Android), with potential expansion to the web
- Backend: AWS, Firebase for user data storage, leaderboards, and multiplayer features (just like Netflix did with AWS, which is using AWS for almost all of its computing and storage needs)
  
Data Privacy and Security
- Guest Mode: Allow users to play without creating an account
- Data Encryption: Secure user progress and preference

Scalability
- Cloud Support: Use cloud solutions for data storage and processing
- Server Infrastructure: Design backend to handle millions of users at the same time

Market Validation
- Surveys: Survey the target audiences
- Beta Testing: Launch a beta version for feedback

Development Timeline
- Phase 1: Prototype development
- Phase 2: Core feature development
- Phase 3: UX/UI design and integration
- Phase 4: Beta testing and debugging
- Phase 5: Launch
- Phase 6: Release updates
  
Risks and Challenges
- Market Problem: Standing out in a crowded (most sudoku apps are all very simillar tbh)
- Retention: Sustaining user engagement over time (you do get bored from time to time)
  
Innovation Potential
- Collaborative Option: Solve puzzles with friends in real-time (I guess it coould be fun)
- AI Personalization: Puzzles match user skill levels (basically like your very own personal Essay, Normal, and Hard modes if you will)
  
Future Expansion
- Multiplayer Mode: Sudoku tournaments!!!!
- Language Mode: Support for multiple languages
- Samurai Sudoku: If you love the extreme stuff))) (explanation is not needed, you just have to google it to understand)

## 5. Event-Storming
Conduct **Event-Storming** as part of Domain-Driven Design (DDD):
- **(A)** Identify your domains. If the domain is too small, invent others around it.
- **(B)** Develop a strategic design with mappings/relationships between domains.
- **(C)** Visualize the mappings in a Core Domain Chart.

### Examples:
- **DDD Diagram**  
![DDD Diagram](https://github.com/user-attachments/assets/18213b2e-b731-42ab-a30a-05c94572b758)  

- **DDD Event Diagram**  
![DDD Event Diagram](https://github.com/user-attachments/assets/16360093-c6dc-40c0-b280-582ba2ccd10c)  

- **Core Domain Chart**  
![Core Domain Chart](https://github.com/user-attachments/assets/de8a96c8-1bff-41fe-b53e-ae63722dc753)  

### Miro Board:
Visit the interactive chart: [MIRO Board](https://miro.com/app/board/uXjVLMGPOiA=/)

## 6. Metrics
Use at least two meaningful metrics, such as:
- **SonarQube** for code analysis and quality assurance.
- Other non-trivial metrics for in-depth project evaluation.

## 7. Clean Code Development
Document and demonstrate **Clean Code Development**:
1. List at least five points showcasing clean code practices and their benefits.
2. Provide a personal **CCD Cheat Sheet** with at least ten points (e.g., as a PDF).

## 8. Build
Use a build management tool like **Ant**, **Maven**, or **Gradle** to:
- Manage dependencies.
- Generate documentation.
- Call tests as part of your build process.

## 9. Continuous Delivery
Create a **Continuous Delivery Pipeline** with tools such as:
- **Jenkins**
- **Travis-CI**
- **GitHub Actions**
- **GitLab CI**

The pipeline should include at least two script calls, such as invoking a build tool or running tests.

## 10. Integrate some nice unit tests
Develop and integrate meaningful **unit tests** into your code. Ensure they are included in the build pipeline.

## 11. IDE
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

## 12. DSL
Create a small **Domain-Specific Language (DSL)** demo, even if it doesn’t directly contribute to the project. This can be in another programming language.

This project uses a DSL-like structure to handle Sudoku-specific tasks such as grid generation, user input, validation, focus management, and puzzle completion checks. Custom classes (BoxInner, BlokChar, FocusClass) and functions (generatePuzzle(), setInput(), checkFinish()) simplify working with Sudoku grids, ensuring clean and focused code.

## 13. Functional Programming
Demonstrate **functional programming** principles in your project, such as:
- Using only final data structures.
- Writing side-effect-free functions.
- Utilizing higher-order functions.
- Passing functions as parameters or return values.
- Employing closures or anonymous functions.

You may also explore functional programming in other languages like **F#**, **Clojure**, or **Julia**.
