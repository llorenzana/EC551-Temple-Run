# EC551 Final Project - Temple Run
### Team Evil Demon Monkeys
### Julia Hua, Lea Lorenzana-Garcia, Cole Wentzel, Juncheng Cao

## Table of Contents
[Overview](#Overview)    
[Our Adaptation](#our-adaptation)   
[Temple Run Final Game](#temple-run-final-game)   
[Video](#Video)   
[Presentation](#Presentation)    

## Overview 
"Temple Run" is a popular “endless-runner” mobile game known for its simplicity of game controls combined with its challenging and addictive nature.  The original game is set in a temple environment, and the character must navigate through various obstacles by swiping on the touchscreen or tilting the device. The player controls a character who is fleeing from a group of **Evil Demon Monkeys** trying to steal and **IDOL**.

## Our Adaptation
Our goal was to create a functional Temple Run game using Verilog and the lab FPGA’s. However due to lab issues, we decided to pivot to creating a simulated game environment using Verilator and creating our own Arduino controller. 

### 1. Basic Gameplay:   
The [player](https://github.com/llorenzana/EC551-Temple-Run/blob/01039bae203b92ea97bb5b006a89ae75101e59b7/artwork/runningGuy.png) controls a character who is fleeing from a group of **Evil Demon Monkeys**. The game takes place on a 3-lane pathway in which the player must navigate through various obstacles by using an associated keyboard key or using our arduino game controller.

### 2. Obstacles & Mechanics:      
The path is filled with obstacles such as [rocks](https://github.com/llorenzana/EC551-Temple-Run/blob/ba1a577e85239d2e4d2718023eed6645fe025ff0/artwork/rock.png) and [trees](https://github.com/llorenzana/EC551-Temple-Run/blob/ba1a577e85239d2e4d2718023eed6645fe025ff0/artwork/tree.png). The obstacles are generated using a pseudo-random generator with three states indicating where it is on the screen. The player can press a **W**  to jump, hold **A** or tilt the controller left to move into the leftmost lane, or hold **D** or tilt the controller left to move into the right most lane.

### 3. Coins:      
As the character runs, they can collect [coins](https://github.com/llorenzana/EC551-Temple-Run/blob/ba1a577e85239d2e4d2718023eed6645fe025ff0/artwork/coin.png). These coins are added to the scorekeeper that prints to the terminal. These coins are generated using the same pseudo-random generator that spawns the rocks and tree roots. 

### 4. Graphics:   
Our game uses [sprites](https://github.com/llorenzana/EC551-Temple-Run/tree/ba1a577e85239d2e4d2718023eed6645fe025ff0/artwork) created by one of our team members and uses memory optimization techniques based off  of Nintendo NES games. We mirror frames to make the character emulate walking, flip coins to give them a **shining** effect,  and flipping obstacles to ensure proper lane adjustments. 

### 5. Endless Running:    
The game has no end – the goal is to run as far as possible before the character meets an untimely end by  running into an obstacle.

## Temple Run Final Game

Final game files and instructions on how to run it can be found [here.](https://github.com/llorenzana/EC551-Temple-Run/tree/8493f946432f0184e7320c690e4eb9cdb64fa4bf/TempleRun) 

## Video
Our demo video can be found [here](https://drive.google.com/file/d/1vWfCZZATm9TVDm4s-_InY8upbGKc-1SO/view?usp=sharing):

## Presentation
### PowerPoint:    
[EvilDemonMonkeys_EC551_FinalProject (1).pptx](https://github.com/llorenzana/EC551-Temple-Run/files/13567512/EvilDemonMonkeys_EC551_FinalProject.1.pptx)

### PDF:   
[EvilDemonMonkeys_EC551_FinalProject (2).pdf](https://github.com/llorenzana/EC551-Temple-Run/files/13567506/EvilDemonMonkeys_EC551_FinalProject.2.pdf)
