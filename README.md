# Ghost Busters
**Harry Zhu, James Yu**

#### [Project Document](https://docs.google.com/document/d/1SI7rlL_8qbEuAJo9Ib5VmHNQ4d3TBTAfAFEkWnc8iSY/edit?usp=sharing)

### Project Description

This project will be an imitation of the game “Pac-Man”. There will be Pac-Man and 4 ghosts: Clyde (Orange), Blinky (Red), Pinky (Pink), and Inky (Cyan). The ghosts will move towards Pac-Man and when they collide, Pac-Man loses a life. Pac-Man will traverse the map trying to eat the orbs. The orbs will give points and some orbs will be bigger and give Pac-Man the ability to eat the ghosts. Once all of the orbs are gone, you beat the level and move on to the next level.

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
