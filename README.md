# Jabaquiz
Jabaquiz is a two-player game inspired by Supaquiz designed for players to have fun and gain knowledge while playing the game with friends using Trivia API to get all the questions. This app is built by using Flutter and Dart for Android, iOS, but right now Web Application is the most suitable platform. In addition, this project is a self-hosting which requires you to install Docker Desktop, and Supabase for the database and the authenication. 

_(FYI: This project's purpose is solely for class submission, we add many functions and constraints to make the code better than it was. For instance, exceptions to validate setting's inputs, limit the number of the player to two players per game at maximum, get number of current players in the game, and clear the data for each questions, answers once the game has been completed, and more. We did not only copy and paste!)_

## Prerequisites
* Flutter SDK
* Dart SDK Version >= 2.18.5 < 3.0.0
* Node JS
* Supabase Account
* Docker Desktop

## How to play
1. Firstly, player have to create a nickname. Player can accept the nickname that game provides for player, or making a new name that player wants.
2. Next, player can select mode to play either "join a game" or "create a game".
3. If player choose to create a game, then player will have to setup the game setting first. There are two setting that player can change such as number of questions and time per question. For constraints, player cannot exceed 20 questions, and 60 seconds per question. After player have done with the setting then player can create a game and share the gamecode to player's friend to play together.
4. If player choose to join a game instead, then player have to type the correct gamecode to join the game. Otherwise, the game will display error.
5. After creating a room, a host is the only person that can start the game. Therefore, if player joins game by using gamecode, then player will need to wait for the host to start the game. The maximum for room is limited to 2 players.
6. Once the game has already started, player will have time limit to select one of four choices for each question, if player answers each question correctly, player will gain 100 score for one correct answer, If player answer it wrong, then there is no given point and it will show the right answer. 
7. Lastly, when the game is over, the game will display the score of each player and rank them from highest score to lowest score.

## Getting Started
To play the Jabaquiz, please follow these simple steps:
  1. Install Visual Studio Code
  2. Clone this repository by using this command in Window
  ```
    git clone https://github.com/NoodlesCupCake/jabaquiz.git
  ```
  3. Follow this link for installing and initializing Supabase https://supabase.com/docs/guides/getting-started/local-development
  4. Seeding the data into database
  5. Run the application using this command
```
flutter run
```

## Limitation
* This project still has a bug that prevent me from buidling for mobile application such as, the android emulator/device cannot connect to a localhost directly since I use localhost(127.0.0.1) instead of using 10.0.2.2.
* The access-token can last only 1 hour for each authenicated user.
