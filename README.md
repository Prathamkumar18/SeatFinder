# Seat Finder App

The Seat Finder App is a simple Flutter application that helps users find seats in a seating arrangement. It displays seat blocks with seat numbers and allows users to search for specific seats.

## Methodology

The Seat Finder App is built using the Flutter framework, which allows for cross-platform development of mobile applications. The app follows a modular approach with separate components for different UI elements.

- The main entry point of the app is defined in the `main()` function.
- The `SeatFinderApp` class represents the root widget of the application. It sets up the app's theme and initial screen.
- The `SeatFinderScreen` class is a stateful widget that represents the main screen of the app. It contains the search functionality and the list of seat blocks.
- The `SeatBlock` class represents a block of seats. It is responsible for displaying the seat items within the block.
- The `SeatItem` class represents an individual seat item. It displays the seat number and its type.

The app allows users to enter a seat number in the search box and click the "Find" button to search for the seat. The app will scroll to the corresponding seat block and highlight the searched seat.

## Instructions

To run the Seat Finder App, follow these steps:

1. Ensure you have Flutter installed on your machine.
2. Clone the repository or download the source code.
3. Open the project in your preferred IDE or text editor.
4. Run the following command in the terminal to fetch the project dependencies: flutter pub get
5. Connect a physical device or start an emulator.
6. Run the following command to launch the app:flutter run
This will build and run the app on the connected device or emulator.
7. The Seat Finder App will open on the device/emulator, and you can interact with it to search for seats.






