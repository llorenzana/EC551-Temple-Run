# How to Build the Arduiono Controller Module 

## Table of Contents
[What You Will Need](#what-you-will-need)   
[How To Build](#how-to-build)   

## You Will Need
- 1 Arduino Uno R3
- 4 1k Ohm Resistors
- 4 Push Buttons (One for each corresponding key)
- MPU-6500 3-axis Accelerometer
- Jumper Cables and Wires
- 16x2 IC2 LCD Screen
- USB-A to USB-B Cable

  
## How To Build

### Step 1: Upload Code to Arduino 
Navigate to the [Accelerometer.ino](https://github.com/llorenzana/EC551-Temple-Run/blob/main/sources/Lea/Arduino/Accelerometer.ino) file and either open or copy the file contents into an Arduino IDE sketch. Then verify and upload code to your Arduino Uno R3. 

### Step 2: Wiring and Building Circuit 
Follow the following circuit diagram to correspond to the code provided. 
![Circuit](https://github.com/llorenzana/EC551-Temple-Run/blob/main/sources/Lea/Arduino/images/Circuit.png) 

### Step 3: Reprogram the Arduino Flash 
Set the board to DFU mode so we can reporgram the flash and turn our board into a HID keyboard for fun game play. 
1. Connect the board to your computer
2. Install [JRE - Flip Installer - 3.4.7.112.exe](https://www.microchip.com/en-us/development-tool/flip)
3. FLIP - Device Selection   

![FLIP](https://github.com/llorenzana/EC551-Temple-Run/blob/main/sources/Lea/Arduino/images/Flip%20chip%20selection.png)

4. Set device into DFU mode. Find the RESET and GND pins for the ATmega USB-Serial Processor. They are the innermost two pins of the six located close to the USB port.

![DFU](https://github.com/llorenzana/EC551-Temple-Run/blob/main/sources/Lea/Arduino/images/UNO-DFU-reset-pins.png)

5.  Briefly short the pins
6.  FLIP - Press the USB Icon in FLIP and Then Open   
![USB Select](https://github.com/llorenzana/EC551-Temple-Run/blob/main/sources/Lea/Arduino/images/open%20USB%20port.png)   

7.  FLIP - Parse the Firmware HEX. Load the [arduino-keyboard.hex](https://github.com/llorenzana/EC551-Temple-Run/blob/main/sources/Lea/Arduino/HEX/Arduino-keyboard-0.3.hex) into FLIP. You will see at the bottom USB ON, this is that the Arduino is connected through DFU Mode.

![Hex](https://github.com/llorenzana/EC551-Temple-Run/blob/main/sources/Lea/Arduino/images/load%20HEX%20file.png)
 
8.  FLIP - Press RUN Not Start Application

![Run](https://github.com/llorenzana/EC551-Temple-Run/blob/main/sources/Lea/Arduino/images/Run.png)

9. FLIP - Unplug and Replug USB

### Step 4: Test and Verify its working


