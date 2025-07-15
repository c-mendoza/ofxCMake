![ofxCMake Logo](ofxCMake_Logo.jpg)

# CMake for OpenFrameworks
ofxCMake2 enables you to easily compile [openFrameworks](http://openframeworks.cc) projects using [CMake](https://cmake.org).





This fork was originally created to give [almul0's fork](https://github.com/almul0/ofxCMake) of BuildPeter's [ofxCMake](https://github.com/BildPeter/ofxCMake) compatibility with OpenFrameworks 0.10.0, but it has evolved to work in a slightly different way than both.

The primary goal for its creation was to enable the use of Jetbrains' [CLion](https://www.jetbrains.com/clion/) in OF application development, but it should work in any other IDE that supports CMake, as well as in the command line.



Tested on macOS 10.11, 10.13, OF "0.10.0" (the master branch as of January 2018).

## Usage
### Basics:
1. Clone into `[OF DIR]/addons/ofxCMake`
2. Create a project using OF's Project Generator
3. Copy `ofxCMake/project/CMakeLists.txt` into your project's folder.
4. In your copy of `CMakeLists.txt`:
 1. Verify path of your OF folder.
 2. Set the name of your app.
4. Open with CLion or compile via terminal.
- Any `.cpp` file that is in your project's `src` folder will automatically be added to the project.  

### Options
* If you need to add your own static libraries add its path to the USER_LIBS list.
* If you need to add your own include directories, use the CMake command `include_directories`

### Addons
ofxCMake splits OF addons between *Internal Addons* (the ones that are distributed with OF) and *External Addons* (the ones that aren't).

#### Using Addons
- Add the name of the addon you want to use to the `OFX_ADDONS_ACTIVE` list in `CMakeLists.txt`. All sources, headers, and libs will be automatically added to your project.

#### Making your own addons

1. Create a `.cmake` file for your addon (e.g. `ofxNAME.cmake`). Check the supplied templates in `ofxCMake/addOns` for assistance.
2. Copy the file into `ofxCMake/addOns/external`.
3. Include your addon in `ofxCMake/modules/addOnsExternal.cmake` – e.g.
`include( ${OF_CMAKE_ADDONS}/external/ofxNAME.cmake`
4. You will now be able to use your addon in any OF project.

<!-- ## Description

This "addon" enables you to use CMake to build OpenFrameworks projects. It is not a traditional addon that you use to add functionality yo your apps; rather, it takes advantage of where addons are typically stored to more easily build your projects. -->

### Using the CLion IDE
1. Prepare your project as explained above.
2. Choose via CLion in the 'Open File or Project' the `CMakeLists.txt`.
- A prompt might ask, if you want to change the 'project root'. Ignore this.
- The CLion project files will be saved in  a '.idea' folder. If you want, you can ignore that in your git repo.


<!--
### Command Line Compilation
- Create a new directory in your project folder – e.g.: `mkdir build`
- Go into that folder
- type `cmake ..`
- **Compile:**  `make` (optional `-j4` to compile with 4 cores)

	```bash
	$ cd of/apps/myApps/newApp
	$ mkdir build
	$ cd build
	$ cmake ..
	$ make -j4
	```
- -->

## Development Philosophy
- The project file `CMakeLists.txt` is simplified for readability.
- Modular approach in which each OS has it's own .cmake files.
- Having all ofxCMake files in the addons folder has the following advantages:
	- Can easily be installed
	- It works within OF's file structure, without having to change anything that isn't supposed to be modified. Thus, OF can be updated easily.



## Compatibility
At the moment (Jan 2018) only Mac OS is fully tested.

The infrastructure for other OS's (Linux, Windows) is already set up.

<!-- Tested on MacOS 10.11 with cMake 3.2.1 and of 0.9.8 -->

## Special Thanks
**[Avilleret](https://github.com/avilleret)**
