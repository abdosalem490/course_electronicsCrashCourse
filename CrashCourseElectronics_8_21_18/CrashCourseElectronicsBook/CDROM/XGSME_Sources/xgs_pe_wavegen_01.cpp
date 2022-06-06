// P R O G R A M /////////////////////////////////////////////////////////////
// xgs_pe_wavegen_01.cpp - This program generates waveform data and outputs
// the data in SX asm format at the end of the program run. To use compile
// and redirect output to a text file and then copy and paste the last 
// lines with the data statements into your code.
// This program was just hacked together, but shows how you can use a 
// C/C++ program to generate your procedural wave table data and
// export to SX asm data statements for importation into your code.
// Also, uses ASCI art to print out the waveforms vertically, so you can
// see what they look like. Should compile under any ANSI compiler.
// ///////////////////////////////////////////////////////////////////////////


// I N C L U D E S ///////////////////////////////////////////////////////////

#include <objbase.h>
#include <iostream.h> // include important C/C++ stuff
#include <conio.h>
#include <stdlib.h>
#include <malloc.h>
#include <memory.h>
#include <string.h>
#include <stdarg.h>
#include <stdio.h>
#include <math.h>
#include <io.h>
#include <fcntl.h>
#include <direct.h>
#include <wchar.h>
#include <limits.h>
#include <float.h>

// DEFINES ////////////////////////////////////////////////////////////////////

CONST double PI = 3.14159;

// CLASSES ////////////////////////////////////////////////////////////////////

// TYPES //////////////////////////////////////////////////////////////////////

// MACROS /////////////////////////////////////////////////////////////////////

// PROTOTYPES /////////////////////////////////////////////////////////////////



// GLOBALS ////////////////////////////////////////////////////////////////////


// FUNCTIONS //////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////

 
// MAIN ///////////////////////////////////////////////////////////////////////


int sine_table[32];     // holds a single 0-15 valued sine wave     
int sawtooth_table[32]; // holds a single 0-15 valued sawtooth wave 
int square_table[32];   // holds a single 0-15 valued square wave   

void main(int argc, char *argv[])
{
int index; // array index

// generate and print sine table //////////////////////////////////////////////
printf("\nSine Wave Data");

// reset data pointer
index = 0;

// iterate 32 values around 360 degrees / 2*PI radians
for (float curr_ang = 0, delta_ang = 2.0f*PI/32.0f;  curr_ang < 2*PI; curr_ang += delta_ang)
    {
    // compute the value 0-15 for the sine of angle, non-negative valued
    int audio_intensity = (int)((8+7*sin(curr_ang))+0.5);

    // start line
    printf("\n"); 

    // pretty print asterisk's to represent values with actual numeric values to right
    
    // move cursor out to right.....
    for (int spaces = 0; spaces < audio_intensity; spaces++, printf("."))
        printf(".");

    // draw data point
    printf("*");
    printf(" - Angle = %f, Sine(%f) = %d", curr_ang, curr_ang, audio_intensity);

    // insert data point into storage array
    sine_table[index++] = audio_intensity;

    } // end for

// end print out
printf("\n");


// generate and print sawtooth wave
printf("\nSawtooth Wave Data");

// reset data pointer
index = 0;

// iterate 32 values from 0 - 15 linearly
for (float curr_value = 0, delta_value = 15.0f/32.0f;  curr_value <= 15; curr_value += delta_value)
    {
    // compute the value 0-15 for the sine of angle, non-negative valued
    int audio_intensity = (int)(curr_value+0.5);

    // start line
    printf("\n"); 

    // pretty print asterisk's to represent values with actual numeric values to right
    
    // move cursor out to right.....
    for (int spaces = 0; spaces < audio_intensity; spaces++, printf("."))
        printf(".");

    // draw data point
    printf("*");
    printf(" - Value = %d", audio_intensity);

    // insert data point into storage array
    sawtooth_table[index++] = audio_intensity;

    } // end for


// generate and print square wave
printf("\nSquare Wave Data");

// reset data pointer
index = 0;

// iterate 32 values from 0 - 15 that oscillates from between 0/15 with a duty cycle
// of duty_on, where duty_on is the percentage of iterations the signal is HIGH 
double duty_on = 10; // 50 - 50 duty cycle

for (int iteration = 0;  iteration <= 31; iteration++)
    {
    // compute the value for the square wave based on the duty cycle as the "step function"
    int audio_intensity;

    // test for duty cycle
    if (iteration < (int)(duty_on*(32.0f/100.0f) ) )
       audio_intensity = 15; // HIGH
    else
       audio_intensity = 0; // LOW

    // start line
    printf("\n"); 

    // pretty print asterisk's to represent values with actual numeric values to right
    
    // move cursor out to right.....
    for (int spaces = 0; spaces < audio_intensity; spaces++, printf("."))
        printf(".");

    // draw data point
    printf("*");
    printf(" - Value = %d", audio_intensity);

    // insert data point into storage array
    square_table[index++] = audio_intensity;

    } // end for

printf("\n");

// at this point we have all the data, so now its time to print it out
// in data statements that are more condusive to the SX28 assembler

printf("\nsine_table DW ");
for (index=0; index < 32; index++)
    printf("%d, ", sine_table[index]);

printf("\nsawtooth_table DW ");
for (index=0; index < 32; index++)
    printf("%d, ", sawtooth_table[index]);

printf("\nsquare_table DW ");
for (index=0; index < 32; index++)
    printf("%d, ", square_table[index]);


} // end main

