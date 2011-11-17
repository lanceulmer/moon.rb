# moon.rb #

Watches and compiles moon scripts with moonc.

## Installation ##

Install moonscript: [Instructions](http://moonscript.org/#installation)

Copy moon.rb to /usr/local/bin, and make it executable.

    sudo chmod +x /usr/local/bin/moon.rb

## Usage ##

moon.rb will watch and compile all moonscript files from the folder (and it's subfolders) in which it is called.

Due to limitations in moonc, it is recommended that you structure your project like this:

project  
  |  
  - moon  
  |  
  - lua  
  |  
  - etc  

In the terminal, change to the moon directory.

To start the script run:

    moon.rb

That will compile all moon files in 'moon' and place the output in the 'project' folder.

You can also specify an output directory:

    moon.rb ../lua

That's it. Now moon.rb will wait for changes. When you save a '.moon' file it will be compiled out automatically.

Close the terminal window or press control->c to end the script.