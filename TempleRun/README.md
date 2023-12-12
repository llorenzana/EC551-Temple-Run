# Temple Run Game Play

[Play The Game](#play-the-game)   
[Game Instructions](#game-instructions)   
[Controller Options](#controller-options)   


## Play The Game: 
To play the game, clone the [GitHub](https://github.com/llorenzana/EC551-Temple-Run.git) and navigate to the [Temple Run Folder](https://github.com/llorenzana/EC551-Temple-Run/edit/main/TempleRun). Follow the below set of instructions to run the game using Verilator. 

### Dependencies
- cmake 
- verilator
- SDL2

Using a Linux terminal, i.e. Ubuntu and ensure you have a c and c++ compiler. In the terminal, 
```shell
# install NIX
sh <(curl -L https://nixos.org/nix/install) --no-daemon
mkdir -p ~/.config/nix
echo "extra-experimental-features = nix-command flakes"
```
Restart terminal once these steps are completed. 

### Create and Start Game in Command Line
```shell
# navigate to GitHub
cd <where ever the GitHub clone is>
nix develop

# navigate to game folder
cd TempleRun

# create build directory
mkdir build && cd build

# configure cmake project
cmake ..

# link resource files
ln -sr ../../../artwork/*.mem .
# build
make -j

#run game via integration test
./Vintegration
```

## Game Instructions 
To play, the user has 4-button controls. The goal is to avoid obstacles and collects as many **coins** as possible.   
  ### R --> Reset/Start Game
  ### W --> Jump
  ### A --> Move Left, Hold to Stay in Left Most Lane
  ### D --> Move Right, Hold to Stay in Right Most Lane 

## Controller Options: 
The user can choose to either use their keyboard or create the [Arduino Controller](https://github.com/llorenzana/EC551-Temple-Run/tree/main/sources/Lea/Arduino) we used in our demo. If using the arduino controller you can tilt left for **A** (move left), tilt right for **D** (move right), or use the associated push-buttons.  
