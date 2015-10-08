;NEWWWxxxxxxxxxxxxxxxxxxxxxFAB BOARDxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	LIST P=18F85K22, N=48, T=ON, ST=OFF
	#INCLUDE <P18F85K22.INC> 
	CONFIG  XINST = OFF
	CONFIG	FOSC=HS1 		;Xtal OSCILLATOR 
	CONFIG	CP0=OFF			;CODE PROTECT DISABLED
	CONFIG 	SOSCEL=DIG		;Makes PORTC BITS 0&1 I/O pins
;*****************************************************************************
; RAM : GENERAL PURPOSE REGISTERS (GPR)
;*****************************************************************************
	CBLOCK 0X000
	TEMP1			;FILE REGISTER STORES THE FIRST NUMBER
	TEMP2			;FILE REGISTER STORES THE SECOND NUMBER
	RESULT			;FILE REGISTER STORES THE ANSWER (TEMP1+TEMP2)
	ENDC
;*****************************************************************************
; ROM : MAIN PROGRAM
;*****************************************************************************

    	ORG 0X000000		
RESET_V	GOTO	START	; RESET VECTOR
		NOP				; REQUIRED FOR ICD DEBUGGING
		NOP
	
START 
		MOVLW  	0x01	;SAVE THE FIRST NUMBER
		MOVWF  	TEMP1		
   		MOVLW  	0X02 	;SAVE THE SECOND NUMBER
		MOVWF   TEMP2

		MOVF	TEMP1,0	;LOAD 1ST NUMBER INTO WREG
		ADDWF	TEMP2,0	;WREG = 1ST # + 2ND #
		MOVWF	RESULT	;SAVE THE RESULT
FREEZE	GOTO 	FREEZE

	END