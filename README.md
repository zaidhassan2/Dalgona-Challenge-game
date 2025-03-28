# Dalgona-Challenge-game
This is game Dalgona Challenge in this differet shapes are presented and asked the user to guess the shaape. In this game there are 3 mode single mode , vs computer and  multiple user mode.  After guessing the shape a timer is set according to difficulty level as 8,6 and 4 sec. After time answer willl be wrong and user will loss chance otherwise win 10 points 

Dalgona Challenge - Project Manual (Shell Script)
1. Introduction

The Dalgona Challenge, inspired by the famous Squid Game, is a command-
line game built using Shell Scripting. In this challenge, the player must

correctly identify and input a randomly chosen shape within a limited time.
The game uses functions, arrays, loops, and time-based constraints to
create an engaging and interactive experience.
The game utilizes functions, arrays, loops, and conditional logic to create an
interactive experience. To add realism, it also features ASCII-based shape
displays so players can visualize their challenge.

2. Features of the Project
Feature Description
Random Shape Selection A function randomly selects a shape from an array
Timer Mechanism The player must respond within 8 seconds (read -t)
Limited Attempts The player has 3 chances to guess correctly
ASCII Art Representation The selected shape is displayed using ASCII characters
VS Computer The player competes against the computer, which also attempts

to guess the shape.

Replay Option The player can restart after each game session
Score Tracking A simple scoring system keeps track of wins

3. Gameplay Rules
i. The game starts with a randomly chosen shape from the list:
• Circle
• Star
• ☂ Umbrella
• Triangle
ii. The ASCII representation of the selected shape is displayed

iii. Single Player Mode Rules
• The player must type the correct shape name within 5 seconds
iv. Vs Computer Mode Rules
• The game runs in turns: the player guesses first, then the computer attempts.
• The computer makes a random guess from the available shapes.
• If the computer guesses correctly, it wins that round.
• If both fail, the correct answer is revealed.
• The player competes against the computer in multiple rounds to determine the final
winner.

4. ASCII Art Shapes Used in the Game
When a shape is chosen, it is displayed using ASCII characters like this:
Circle Example
*****
* *
* *
* *
*****

Umbrella Example
*****
*******
***
|
|

5. Step-by-Step Gameplay Example (Terminal Output)
Game Start
Welcome to the Dalgona Challenge!
Can you correctly identify the shape before time runs out?
You have 3 attempts.

Generating a random shape...

Displaying the Shape (Example: Star)
Here is your challenge shape:
*
***
*****
***
*
Enter the shape name:
> Triangle
Wrong guess! 2 attempts left.
Correct Answer
> Star
Correct! You have successfully identified the shape!
You earn 10 points.

Losing Scenario (Out of Time)
Time’s up! You failed to enter the shape name in time.
The correct answer was: Star
Game Over!

6. Bonus Features
Feature Description
Difficulty Levels Easy (8 sec), Medium (6 sec), Hard (4 sec)
Leaderboard System Saves high scores in a text file
Randomized ASCII Art
Variations

Different designs of the same shape for variety
Multiplayer Mode Competing with friends by taking turns
VS Computer Mode Compete against a computer bot that guesses shapes

randomly
