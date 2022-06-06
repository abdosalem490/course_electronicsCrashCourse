;////////////////////////////////////////////////////////////////////////////
;   
; 6502 Blink Test Program
;
;/////////////////////////////////////////////////////////////////////////////


; Select the 65C02 overlay and the name of the target file and format

	.CR     65C02           
	
	.TF	6502EX02.s19,s19
	
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

; stack pointers
SYSTEM_SP	.EQ $01FF

; General I/O Base Address
IOBO		.EQ $4000


; SYSTEM VARIABLES/GLOBALS ////////////////////////////////////////////////////

; LOCAL/GLOBAL VARIABLES //////////////////////////////////////////////////////


		.ORG $0200	; let user memory start immediately after stack
		.DU		; start dummy section, do not generate code
count1		.BS 1		; counters
count2		.BS 1
leds		.BS 1		; state of LEDs
		.ED

; start code at begining of ROM ///////////////////////////////////////////////

CODE		.ORG $0000

; set link starting address to $8000 or 32K 

		.PH $8000

; /////////////////////////////////////////////////////////////////////////////
ROMVARS
; /////////////////////////////////////////////////////////////////////////////

; ROM tables go here...

; /////////////////////////////////////////////////////////////////////////////
; SUBROUTINES//////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////

DELAY:
; delay subroutine, delays 65536 iterations

		LDA #00			; count2 = 0
		STA count2
DELAY_1_INIT:

		LDA #00			; count1 = 0
		STA count1
DELAY_L1:
		
		DEC count1		; count1--
		BNE DELAY_L1		; if (count1 > 0) branch to DELAY_L1 
DELAY_L2:

		DEC count2		; count2--
		BNE DELAY_1_INIT	; if (count2 > 0) branch to DELAY_1_INIT 

		RTS			; return from subroutine

; /////////////////////////////////////////////////////////////////////////////
; MAIN LOOP ///////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////

MAIN:	

		LDA leds	; load the accumulator with led values
		STA IOBO	; write to output port
		EOR #$FF	; invert the accumulator
		STA leds	; store result back into leds var
		
		JSR DELAY	; delay
		JMP MAIN	; loop forever


; /////////////////////////////////////////////////////////////////////////////
; Reset / Initialization Entry Point///////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////

RESET	
		
; do general initializations here...

; set stack pointers

; program peripherals

; end system initialization ///////////////////////////////////////////////////

		JMP MAIN	; jump to mainline

; non-maskable interupt ///////////////////////////////////////////////////////

NMI		

; save machine state		

; isr goes here...

		NOP

; restore machine state

; return from interrupt

		CLI                 
		RTI

; standard interrupt request  + BRK ////////////////////////////////////////////	

IRQ		
	
; save machine state		

		; isr goes here...

		NOP
		
; return from interrupt

		CLI
		RTI

; vector interrupt table //////////////////////////////////////////////////////

		.NO $FFFA,$FF
		.DA NMI
		.DA RESET
		.DA IRQ



