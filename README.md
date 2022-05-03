# Knights Travails
This repository is the implementation for the Knights Travails project for The Odin Project curriculum as seen [here](https://www.theodinproject.com/lessons/ruby-knights-travails). This project finds a knight's shortest path from one starting spot on a chess board to a destination spot. I decided to implement two separate solutions for this project. The first utilizes an adjacency list to represent a graph of a knights possible moves from every single location. The second utilizes more of a tree approach as it generates all possible moves from a given starting point.

## Adjacency List
The adjacency list labels each spot on the chess board as 1 through 64. These correspond to the indeces of the adjacency list, as well. Each element of the adjacency list is an array containing all neighbors of that index. Because the adjacency list uses a 1 through 64 system and the requirement was to accept coordinates from [0, 0] to [7, 7], conversions have to be done. The num_to_coord and coord_to_num methods provide these conversions. Now that the adjacency list is populated and proper conversions exist, the shortest path can be found via the classic Breadth First Search algorithm. The BFS algorithm utilizes a "prev" array that keeps track of all the previous locations for each node. At the end, we backtrack through the prev array to build the path.

## Tree
The tree solution utilizes nodes with parent pointers and the BFS algorithm to find the shortest path. The children of each dequeued node from the BFS queue are generated and added to the queue unless those coordinates were already visited. As soon as the destination coordinate is dequeued, the algorithm backtracks through each of the parent nodes until the starting node, building the array of the shortest path

### Rank and File notes
The rank and file variables are references to the rows and columns of the chess board. Read more [here](https://en.wikipedia.org/wiki/Chessboard)