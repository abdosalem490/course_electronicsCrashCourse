Main README.TXT file for "Design Your Own Video Game Console"
A Beginners Guide to Video Game Console and Embedded System Design, Development, 
and Programming and other assorted eBooks.

Root Directory.

-------------------------------------------------------------------

License Agreement

CD-ROM and software copyright (C) 2004/2005 Nurve Networks LLC, 
Andre' LaMothe. All rights reserved. Individual programs are copyrighted 
by their respective owners and may require separate licensing. This CD-ROM may 
not be redistributed without prior written permission from the publisher. 
The right to redistribute the individual programs on the CD-ROM depends on 
each program's license. Consult each program for details.

Please refer to LICENSE.TXT for the complete license agreement.

Website

http://www.xgamestation.com

Support

support@nurve.net

-------------------------------------------------------------------

Table of Contents:

I.   INTRODUCTION
II.  INSTALLING THE CONTENT FROM THE CD
III. INSTALLING THE TOOLS
IV.  PROBLEMS YOU MIGHT ENCOUNTER (PLEASE READ!!!!!!)
V.   COMPATIBILITY.

I. INTRODUCTION

   Welcome to the "Design Your Own Video Game Console"! On this CD is all 
   designing your own game console with specific information about the 
   XGameStation Micro Edition design as well.

   The first thing you might notice is that isn't any kind of main installation
   program on the CD. I have found that 9 out of 10 times the best installer is
   the reader since only he/she knows what and where to install things, so I'm
   going to leave the actuall file copying and installation to you.

   However, within each directory there is a README.TXT file that explains what
   the files are and what they are for. The CD is set up like this:


   XGSME_HW_CD <DIR> - The main directory/CD root. 
      |
      \Datasheets          <DIR> - Contains datasheets for all chips.
      \General_Papers      <DIR> - Contains articles, papers, on SX and XGS programming.
      \Schematics_Circuits <DIR> - Contains XGS schematics and circuits.
      \SX_Docs_Books       <DIR> - Contains SX related docs and eBooks.
      \SX_Key_IDE          <DIR> - Contains Parallax Inc.'s SX-Key Software.
      \Tools               <DIR> - Contains various tools for engineering.
      \TricksI             <DIR> - Contains a complimentary eBook version of 
                                   "Tricks of the Windows game Programming Gurus" and all sources.
      \XGSME_Sources       <DIR> - Contains source code, demos, games.
      \XGSME_Studio        <DIR> - Contains complete XGS ME Studio Software and manual.
      \XGSME_Tutorials     <DIR> - Contains tutorials on XGS ME programming by various authors.

      IMPORTANT: In this root directory you will find the eBook chapter files as well as 
      the tutorials, and Programming the SX Microcontroller eBooks. The XGS eBook is contained
      as 11 seperate PDFs combined into a master document with the name:
 
      DESIGN_GAME_CONSOLE_011.PDF

      The tutorials are named *-tutorial.pdf.	

      All pdf files are in this root directory where this README.TXT is located.
      

III. INSTALLING THE CONTENT / SOURCE CODE FROM THE BOOK

     The source code and data for each chapter of this book are contained
     within the XGSME_SOURCES\ sub-directory. I suggest simply copying the entire
     directory as-is onto your hard drive by "dragging" it from
     the this CD or by using XCOPY or other similar technique. You may
     need to unzip the contents of each directory, if so make sure to
     enable directories.
     
IV.  INSTALLING THE APPLICATIONS AND TOOLS

     There are a number of awesome applications that are contained on this
     CD such as Labcenter's Proteus PCB design system, WinSpice, etc.
     Each one of these applications installs as a self extracting .EXE and
     takes just a couple minutes. Take a look at the README.TXT file for
     each application for details.

V.   PROBLEMS YOU MIGHT ENCOUNTER

     * Read Only Flag *

     This is a very important detail, so read on. When creating a CD ROM disk
     all the files will be written with the READ-ONLY flag enabled. This is 
     fine in most cases unless you copy the files to your hard drive (which you will)
     and then edit and try to write the files back to disk. You will get a 
     READ-ONLY protection error. 

     Fixing this is a snap. You simply need to clear the READ-ONLY flag on any 
     files that you want to modify. There are 3 ways to do it. First, you can 
     do it with Windows and simply navigate into the directory with the file 
     you want to clear the READ-ONLY flag and then select the file, press 
     the RIGHT mouse button to get the file properties and then clear the 
     READ-ONLY flag and APPLY you change. You can do this will more than one 
     file at once by selecting a group of files.

     The second way is to use the File Manager and perform a similar set of 
     operations as in the example above. The third and best way is to the DOS 
     ATTRIB command with a DOS/Command Shell prompt. Here's how: 

     Assume you have copied the entire SOURCE directory on your hard drive to the 
     location C:\SOURCE. To reset all the READ-ONLY attributes in one fell 
     swoop you can use the ATTRIB command. Here is the syntax:
    
     C:\SOURCE> ATTRIB -r *.* /s

     This instructs the command shell to clear the READ-ONLY flag "r" from all 
     files "*.*" and all lower sub-directories "/s".
                       

VI.  COMPATIBILITY

     The contents of this CD/book were tested on Windows 98/ME/XP/2000/2003 Pentium II, 
     III, IV, and equivalent AMD processors. 



VERSION 1.2
