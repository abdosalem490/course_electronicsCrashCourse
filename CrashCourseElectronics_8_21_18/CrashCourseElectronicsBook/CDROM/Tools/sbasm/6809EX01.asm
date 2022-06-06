;////////////////////////////////////////////////////////////////////////////
;   
; 6809 Blink Test Program
;
;/////////////////////////////////////////////////////////////////////////////

; Select the 6809 overlay

	.CR     6809           
	.TF	6809EX01.S19,S19
	
; defines and constants for memory map ////////////////////////////////////////

; system memory

; RAM 0-16K
RAMSTART	.EQ $0000
RAMEND		.EQ $3FFF
RAMSIZE		.EQ $4000

; I/O Space 16-32K

IOSTART		.EQ $4000
IOEND		.EQ $7FFF
IOSIZE		.EQ $4000

; ROM 32-64K
ROMSTART	.EQ $8000
ROMEND		.EQ $FFFF 
ROMSIZE		.EQ $8000

; General I/O Base Address
IOBO		.EQ $4000


; stack pointers
USER_SP		.EQ $0100 
SYSTEM_SP	.EQ $0200

; SYSTEM VARIABLES/GLOBALS ////////////////////////////////////////////////////

; LOCAL/GLOBAL VARIABLES //////////////////////////////////////////////////////


		.ORG $0200	; let user memory start immediately after stack
		.DU		; start dummy section, do not generate code
count1		.BS 1		; counters
count2		.BS 1
count3		.BS 2		; 16-bit counter
leds		.BS 1		; state of leds
		.ED

; start code at begining of ROM ///////////////////////////////////////////////

CODE		.ORG $0000

; set link starting address to $8000 or 32K 

		.PH $8000
		
; /////////////////////////////////////////////////////////////////////////////
; main entry point  ///////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////

SYSTEM_INIT	
		
; do general initializations here...

; set stack pointers

		LDS #SYSTEM_SP
		LDU #USER_SP

; jump to mainline

		JMP MAIN
; enable interrupts if desired...

; end system initialization ///////////////////////////////////////////////////

; /////////////////////////////////////////////////////////////////////////////
; MAIN LOOP ///////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////

MAIN	

		LDA leds	; load the accumulator with led values
		STA IOBO	; write to output port
		EORA #$FF	; invert the accumulator
		STA leds	; store result back into leds var

		LDD #10000	; load D accumulator with 10,000  
		STD count3	; count3 = delay iterations
		JSR DELAY	; call delay
		JMP MAIN	; loop forever

; /////////////////////////////////////////////////////////////////////////////

DELAY 	; parms (count3 is number of iterations)
	; each iteration is 60 us units with 8 mhz EXTAL

		LDX count3
DELAY0		
		MUL	; these take up 11 cycles each
		MUL
		MUL
		MUL
		MUL
		MUL
		MUL
		MUL
		MUL
		MUL
		DEX
		BNE DELAY0
		RTS

; /////////////////////////////////////////////////////////////////////////////
; SYSTEM INTERRUPT HANDLERS ///////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////

; system reset  ///////////////////////////////////////////////////////////////

RESET				
		NOP	; kill a little time before jumping to mainline
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		
		; extra reset code goes here...
		
		JMP SYSTEM_INIT	; start execution at main entry point

; non-maskable interupt ///////////////////////////////////////////////////////

NMI		

; save machine state		

; isr goes here...

; restore machine state

; return from interrupt
                 
		RTI

; SWI interrupt request	///////////////////////////////////////////////////////

SWI		

; save machine state		

; isr goes here...

; restore machine state

; return from interrupt

		RTI

; standard interrupt request //////////////////////////////////////////////////	

IRQ		

; save machine state		

; isr goes here...

; restore machine state

; return from interrupt

		RTI

; FIRQ interrupt request //////////////////////////////////////////////////////		

FIRQ		; only FIRQ doesn't save machine state

; save machine state		

		PSHS x
		PSHS y
		PSHS a
		PSHS b		

; isr goes here... 

; restore machine state

		PULS b
		PULS a
		PULS y		
		PULS x

; return from interrupt

		RTI

; SWI2 interrupt request		

SWI2		
; save machine state		

; isr goes here...

; restore machine state

; return from interrupt

		RTI

; SWI3 interrupt request		

SWI3		
; save machine state		

; isr goes here...

; restore machine state

; return from interrupt

		RTI

; vector interrupt table //////////////////////////////////////////////////////

		.NO $FFF2,$FF
		.DA SWI3
		.DA SWI2 
		.DA FIRQ
		.DA IRQ
		.DA SWI
		.DA NMI
		.DA RESET
		
		
		
