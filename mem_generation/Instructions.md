# Memory Generation Instructions

---

## Overview

These instructions detail how to generate RAM and ROM for the nyu-processor 
design team. It is split up into the following sections:
* OpenRAM Installation
* RAM Generation
* ROM Generation (Experimental)
* Files Generated
* Extra Resources

## OpenRAM Installation

OpenRAM is an open-source memory compilation package which can read in a 
configuration file and generate RAM or ROM memory diagrams and verilog code from 
it. To install OpenRAM on your system follow these steps:
1. Clone the [OpenRAM repo](https://github.com/VLSIDA/OpenRAM).
2. (Recommended) Create and activate a python virtual environment. 
3. Navigate into where you cloned the OpenRAM repo in #1 and install the package 
by running:
```console
pip install .
```
4. Within that same OpenRAM repo directory run the following two commands:
```console
export OPENRAM_HOME="./compiler"
export PYTHONPATH="$PYTHONPATH:$OPENRAM_HOME"
```
After following the above four steps you should be all set and ready to begin 
generating memory!

## RAM Generation

Once the OpenRAM python package has been installed follow these steps in order 
to generate your own memory for a processor:
1. Change into the nyu-mem/mem_generation/RAM directory on your machine
2. (Recommended) Activate the python virtual environment where the OpenRAM 
package is installed
3. Run the following commands with the appropriate file paths:
```console
export OPENRAM_HOME="$<PATH_TO_OPENRAM_REPO>/openram/compiler"
export OPENRAM_TECH="$<PATH_TO_OPENRAM_REPO>/openram/technology"
```
4. Run the following command to generate memory. 
```console
python $OPENRAM_HOME/../sram_compiler.py RAM_Config.py
```
NOTE: This command could take a while depending on how much memory you are 
generating. It is recommended to look at the RAM_Config.py file within the 
nyu-mem/mem_generation/RAM directory and ensure that the "word_size" and 
"num_words" parameters are relatively small(both less than 16) if this is your 
first time generating memory. 

After following the above four steps you should have generated RAM memory. There 
should be a set of files within the generated_mem directory that were created as 
a result of following the above procedure

## ROM Generation (Experimental)

**As of 4/18/23 these instructions for generating ROM have not been verified to 
work. OpenRAM is in the process of overhauling the ROM generation documentation 
so it is recommended to check [here](https://github.com/VLSIDA/OpenRAM/tree/stable/docs/source)
and [here] (https://github.com/VLSIDA/OpenRAM/issues/191) for the most up to 
date documentation on how to generate ROM**

## Files Generated

After generating memory there should be a set of files found within the 
generated_mem directory were created as a result. The following three files have 
been the most useful in analyzing the memory generated:

### RAM_Mem.html
    
This html file shows useful data on all of the parameters used and tests run 
on the memory generated. You can open it in your favorite web browser and get 
a nice overview of the operation, timing data, and power data for the memory 
generated.

### RAM_Mem.v

This Verilog file shows how to call the various memory access operations within 
System Verilog and how these calls get sent to the memory generated. This code 
is what needs to be the bridge between the memory generated and the rest of the 
nyu processor design code in order to successfully access the memory generated.

### RAM_Mem.gds

This file gives a visual representation of the memory generated. Looking at this 
file is a good way to know if the memory generation worked and to see the 
layout of the memory generated. In order to view this file a gds viewing 
application must be installed. I found success using [Layout Editor](https://layouteditor.com/download)
but feel free to try other applications if you would like.

## Extra Resources

The following resources were found helpful while compiling the above guide:
* [OpenRAM Paper #1](https://escholarship.org/content/qt8x19c778/qt8x19c778_noSplash_b2b3fbbb57f1269f86d0de77865b0691.pdf)
  and [OpenRAM Paper #2](https://escholarship.org/content/qt2vv5q88z/qt2vv5q88z_noSplash_389063a5d89db05d7b42a63b528c7fc2.pdf).
  The previous two papers give a comprehensive explanation of OpenRAM and how it 
  works. If you are interested in the details of OpenRAMS exigence and 
  implementation I would recommend reading them
* [Official OpenRAM Documentation](https://github.com/VLSIDA/OpenRAM/tree/stable/docs/source)
  This is the official OpenRAM documentation that describes most of the above 
  steps. Specifically the basic_setup.md and basic_usage.md files were relied on 
  heavily.
* [Config file details](https://sourcecodeartisan.com/2020/07/25/openram.html) 
  This site gives a nice overview of the commonly used parameters within the 
  memory config file. It's a quick read and adds a bit more context to what each 
  line in the config file is doing.