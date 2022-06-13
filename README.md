# Ghost Busters
**Harry Zhu, James Yu**

#### [Project Document](https://docs.google.com/document/d/1SI7rlL_8qbEuAJo9Ib5VmHNQ4d3TBTAfAFEkWnc8iSY/edit?usp=sharing)

### Project Description

This project will be an imitation of the game “Pac-Man”. There will be Pac-Man and 4 ghosts: Clyde (Orange), Blinky (Red), Pinky (Pink), and Inky (Cyan). The ghosts each have their behaviors and target depending on the position of Pac Man and themselves. They will not reverse directions unless they change to either scatter, frightened, or chase mode. They will take the direction that will be the closest linearly to their target. The target of Blinky will be Pac-Man's position. The target of Pinky will be 4 units ahead of Pac-Man. If Pac-Man is facing upwards, then the target value of Pinky will be 4 units up and 4 units left of Pac-Man's position. The target of Inky will depend on the position of Pac-Man and Blinky. Inky's target will be 2 units ahead of Pac-Man (2 units up and 2 units left if Pac-Man is facing upwards) and then you reflect Blink's position over it. This will give you the target of Inky. Clyde's target will be Pac-Man's position, but if Clyde gets within 8 units of Pac-Man his target will be the bottom left corner. That is his corner in scatter mode. Scatter mode was implemented by the creator to give players a breather. In Scatter mode, Pinky will go to the top left corner, Clyde to the bottom left corner, Blinky to the top right corner, and Inky to the bottom right corner. If the ghosts come into contact with Pac-Man when they're not in frightened mode, Pac-Man loses a life. The map will go back to the original except for all the orbs that have been eaten. The goal of the player is to make Pac-Man traverse the map and try to eat all the orbs in a level. The orbs will give points and special orbs will give Pac-Man the ability to eat the ghosts. Once all of the orbs are gone, you beat the level and move on to the next level. Once you reach level 3, the speed of the ghosts and Pac-Man will increase to make it harder for the players.

### Instructions
When you first run the program in processing, an introduction screen will pop up. You can press spacebar to play the game. The W,A,S, and D keys will determine the direction that Pac-Man will take. You are able to press a direction that Pac-Man can't go in currently and it will save it until either you press another direction or that direction becomes available to you. This feature allows players to turn corners easier especially when the speed of the game increases.

You can restart anytime by pressing spacebar.

The '1' key will decrement PacMan's life by one. 

The '2' key will get rid of every orb except for one (allows you to level up faster).

### Development Log
5/23/22 (James) - Created the Pac-Man board and the display function to display the board.

5/23/22 (Harry Zhu) - I increased the size of the screen and added a variable that would shift the Pac-Man map downwards so that enough space is created to display the level and the score. I made it display the score and the level after.

5/24/22 (James) - I finished pacman movement with the W,A,S,and D keys changing directions. I also fixed the board.

5/24/22 (Harry) - I created a new PacMan variable and an int array called direction. I implemented the keyPressed function so that Pac Man will change its direction every time I click either w, a, s, or d. Pac Man's first move in the original game is always right so I gave the int array a value that would make Pac Man go right. The array was made a size of 1 because in the original Pac-Man game, PacMan is capable of storing a single direction that is the most recent. I added a bunch of if statements in the display method so that PacMan will move depending on the value of the first index in the int array, direction. I completed the rest of the move methods for each of the directions. I also made the points increase when Pac Man is on a spot with an orb or special orb(they will give a different amount of points). The spot Pac man is on will always become an empty space.

5/25/22 (Harry) - I added the Lives text so that you know what the numbers in the middle of the screen means. I changed the move method for PacMan because PacMan isn't supposed to stop moving if you tell it to go in a direction where there is a wall blocking it. Pac Man will keep going in the most recent correct direction that it has been given.

5/25/22 (James) - I added Pac-Man and ghost interactions. For example, Pac-Man can die to a ghost and respawn, it can also kill ghosts with the powerup.

5/26/22 (James) - I added a point system for killing the ghosts and also sprites for each of the characters.

5/26/22 (Harry) - I made it so that Pac Man wouldn't be able to change its direction when there is a wall there.

5/27/22 (Harry) - I fixed the horizontal movement of Pac Man. Before it would stop too early when it encounters a wall and it looked weird.

5/27/22 (James) - I fixed Blinky's respawn. He respawns inside the ghost house when he gets eaten, but he respawns outside if Pac-man dies.

5/28/22 (Harry) - I placed in all the remaining stuff that wasn't in the first map. Now it exactly resembles that of the original map in terms of size and orb placements.

5/28/22 (James) - Fixed Pac-Man's movement and added a bunch of graphical features. Changed lives counter, added game over screen, and changed the background.

5/29/22 (Harry) - I added new code that enabled users to make Pac Man go in a direction preemptively. Before it was hard to make Pac Man turn corners especially when the game speed increased after each level. That movement storing also mimics that of the original game.

5/30/22 (James) - I added a lose lives function (1 key) and a increase level function (2 key) for demo purposes.

5/30/22 (Harry) - I created a high score system that will be displayed in the gameover screen.

5/31/22 (James) - I created a random direction picker which will pick a random neighboring grid to go to.

6/1/22 (James) - I created a random move function for the ghosts. They will change direction(or not) at each intersection.

6/1/22 (Harry) - I created a method that will look at all the directions Blinky can take and calculate which is the closest linearly to Pac Man.

6/2/22 (James) - I fixed the chase mode for Blinky and added chase modes for Pinky and Clyde.

6/2/22 (Harry) - I added another int array to Blinky that will store the direction that is opposite from the way the ghost is moving. I fixed some of the move method so that Blinky won't reverse direction when it finds out that the reverse way is the shortest distance linearly to Pac Man.

6/3/22 (James) - I added a get out of spawn method which makes the ghosts move out of spawn.

6/3/22 (Harry) - I made Inky behave like the original pac man game. I calculated by taking the grid that is 2 grid in front of pac man. I use Blinky's position to reflect it over that grid. The resulting point from the reflection will be Inky's target.

6/4/22 (Harry) - I changed values to the move method since I previously didn't account for the fact that Pac Man's position wouldn't be like an origin.

6/6/22 (James) - I added an intro screen that resembles that of the original PacMan.

6/7/22 (Harry) - I created a new variable that will keep track of the amount of dots eaten in a level. This will allow me to know when the ghosts should be released in the game.

6/8/22 (Harry) - I created a bunch of accessor method and mutator methods to access the direction and reverse direction in all the ghost classes. I used them to create a method in the PacMan class to make the ghost reverse on their direction when Pac Man eats a special orb. This is one of the few times that the ghosts breaks the rule of never reversing in direction.

6/8/22 (James) - I tweaked how the movement scaling works, instead of every level, it is every two levels.

6/9/22 (Harry) - I made it so that the ghosts would go to their corners if they enter scatter mode. This is a feature in the game that makes it easier for the players on earlier stages.

6/10/22 (James) - I added a timer that determines whether the ghosts are chasing or scattering.

6/10/22 (Harry) - I created a blue text that shows the amount of points you get when you eat a ghost. I also made the ghost reverse in directions every time they changed modes.

6/11/22 (Harry) - I made the ghosts walk back to the ghost house with increased speed instead of them spawning there.
