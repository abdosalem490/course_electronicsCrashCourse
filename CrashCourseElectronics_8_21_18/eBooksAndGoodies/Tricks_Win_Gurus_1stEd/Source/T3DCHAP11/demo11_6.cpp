// DEMO11_6.CPP - A new version that creates 3 secondary threads of execution

// INCLUDES ///////////////////////////////////////////////////////////////////////////////

#define WIN32_LEAN_AND_MEAN  // make sure certain headers are included correctly

#include <windows.h>         // include the standard windows stuff
#include <windowsx.h>        // include the 32 bit stuff
#include <conio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdio.h>
#include <math.h>
#include <io.h>
#include <fcntl.h>

// DEFINES ////////////////////////////////////////////////////////////////////////////////

#define MAX_THREADS 3 

// PROTOTYPES /////////////////////////////////////////////////////////////////////////////

DWORD WINAPI Printer_Thread(LPVOID data);

// GLOBALS ////////////////////////////////////////////////////////////////////////////////


// FUNCTIONS //////////////////////////////////////////////////////////////////////////////

DWORD WINAPI Printer_Thread(LPVOID data)
{
// this thread function simply prints out data 25 times with a slight delay

for (int index=0; index<25; index++)
	{
	printf("%d ",(int)data+1); // output a single character
	Sleep(100);                  // sleep a little to slow things down
	} // end for index


// just return the data sent to the thread function

return((DWORD)data);

} // end Printer_Thread

// MAIN //////////////////////////////////////////////////////////////////////////////////

void main(void)
{

HANDLE thread_handle[MAX_THREADS];  // this holds the handles to the threads
DWORD  thread_id[MAX_THREADS];      // this holds the ids of the threads

// start with a blank line

printf("\nStarting all threads...\n");

// create the thread, IRL we would check for errors

for (int index=0; index<MAX_THREADS; index++)
	{

	thread_handle[index] = CreateThread(NULL,               // default security
					                    0,				    // default stack 
			   							Printer_Thread,     // use this thread function
										(LPVOID)index,      // user data sent to thread
										0,				    // creation flags, 0=start now.
										&thread_id[index]);	// send id back in this var
	} // end for index

// now enter into printing loop, make sure this takes longer than threads,
// so threads finish first, note that primary thread prints 4

for (index=0; index<75; index++)
	{
	printf("4 ");
	Sleep(100);

	} // end for index

// at this point the threads should all be dead, so close handles

for (index=0; index<MAX_THREADS; index++)
	CloseHandle(thread_handle[index]);

// end with a blank line

printf("\nAll threads terminated.\n");

} // end main
