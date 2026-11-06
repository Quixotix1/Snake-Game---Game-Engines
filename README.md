# Snake Game by Josh Geelen

The game (which is entirely unfinished) is a heavily event driven interpretation of Snake written in Godot. The game features a moving snake, functioning grid, interactable apple, and the basis for the remaining mechanics.

## OO Principles
Few OO principles are present in the project. You'd have to forgive me for this as Godot is generally not built around strong OO concepts such as encapsulation (though these features can be used). This implementation of snake is much more event driven, featuring the very important EventBus singleton. 
<img width="715" height="273" alt="image" src="https://github.com/user-attachments/assets/6a87d96e-e09b-4da3-859b-f4e15c9a7d4d" />

It is used in places such as the timer, which allows the game to tick at a set rate.
<img width="742" height="495" alt="image" src="https://github.com/user-attachments/assets/062fd966-3a91-4d9c-afef-5322b131a84c" />


This EventBus is used in places such as the fruit_handler.gd script. It is not, however, the most important singleton.

## Singletons

Alongside the EventBus, the Grid singleton is the primary singleton within which all scripts access information about the grid. It contains various helper functions, stores information about the game state, and allows the game to operate on a fundamental level.
<img width="1153" height="867" alt="image" src="https://github.com/user-attachments/assets/42c1ac12-a88b-4b2e-8f08-0af502498695" />

## Factory

The apple spawning, while non-functional in the current build, is driven primarily by a generic spawner script as linked below.
<img width="1159" height="672" alt="image" src="https://github.com/user-attachments/assets/f4bf7ddb-3392-4e35-ba19-a362c5c06e45" />
