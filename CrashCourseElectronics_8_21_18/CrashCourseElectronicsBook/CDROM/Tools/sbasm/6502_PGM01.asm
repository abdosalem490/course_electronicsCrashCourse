;////////////////////////////////////////////////////////////////////////////
;   
; 6502 skelaton, ROM 32K located from 0x8000 - 0xFFFF
;
;/////////////////////////////////////////////////////////////////////////////


; Select the 65C02 overlay

	.CR     65C02           
	.TF	6502EX01.s19,s19
	

; start code at begining of ROM ///////////////////////////////////////////////

CODE		.ORG $0000

; set link starting address to $8000 or 32K 

		.PH $8000


MAIN:	

		NOP
		JMP MAIN

; system reset  ///////////////////////////////////////////////////////////////

RESET		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		
		; isr goes here...
		JMP MAIN	; start execution at main entry point

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



