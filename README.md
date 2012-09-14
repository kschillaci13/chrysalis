chrysalis
=========

open source grasshopper to processing converter

IMPORTANT
Chrysalis is not under current devopment and is not compatible with processing 2 or versions of grasshopper after 0.8.0066.
It has been posted here with issues and comments closed. Please feel free to fork and update to newer versions, add features etc... I will be happy to merge in any working updates.

This project is licenses under creative commons v3 share and share alike. See license info in header and instructions below.

//Chrysalis proof of concept - March 2012 - Chris Chalmers 
//This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
//http://creativecommons.org - http:fabripod.com/chrysalis
//incorporates content from the following sources:
//1) "saveData.pde" - Marius Watz - http://workshop.evolutionzone.com

//Description:
//this proof of concept reads a grasshopper 'ghx' file and outputs a processing sketch with the same parametric
//associative functionality. For the moment, only supports sliders, points, panels, math functions and 4point surfaces. 
//This has ben tested using Processing 1.5.1 and grasshopper build 0.8.0066 Jan 2012 on WindowsXP no guarantee of results with other systems or versions
//****IMPORTANT:
// 1) - First open the 'ghx'file in 'notepad' and save-as with ANSI encoding selected! Processing will not read default UTF8
// 2) - make sure there are no spaces or hyphens in ghx flename - also cannot begin with a number