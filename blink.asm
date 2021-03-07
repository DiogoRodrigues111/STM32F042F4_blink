_make_delay_ms:
;blink.c,18 :: 		unsigned short make_delay_ms(long ms) {
; ms start address is: 0 (R0)
SUB	SP, SP, #4
; ms end address is: 0 (R0)
; ms start address is: 0 (R0)
;blink.c,20 :: 		for(a=0; a<65000; a++)
; a start address is: 8 (R2)
MOVS	R2, #0
; ms end address is: 0 (R0)
; a end address is: 8 (R2)
MOV	R3, R0
L_make_delay_ms0:
; a start address is: 8 (R2)
; ms start address is: 12 (R3)
MOVW	R1, #65000
CMP	R2, R1
IT	GE
BGE	L_make_delay_ms1
;blink.c,21 :: 		for(b=0;b<ms; b++)
; b start address is: 0 (R0)
MOVS	R0, #0
; ms end address is: 12 (R3)
; b end address is: 0 (R0)
; a end address is: 8 (R2)
STR	R0, [SP, #0]
MOV	R0, R3
LDR	R3, [SP, #0]
L_make_delay_ms3:
; b start address is: 12 (R3)
; ms start address is: 0 (R0)
; a start address is: 8 (R2)
CMP	R3, R0
IT	GE
BGE	L_make_delay_ms4
ADDS	R3, R3, #1
;blink.c,22 :: 		;
; b end address is: 12 (R3)
IT	AL
BAL	L_make_delay_ms3
L_make_delay_ms4:
;blink.c,20 :: 		for(a=0; a<65000; a++)
ADDS	R2, R2, #1
;blink.c,22 :: 		;
MOV	R3, R0
; ms end address is: 0 (R0)
; a end address is: 8 (R2)
IT	AL
BAL	L_make_delay_ms0
L_make_delay_ms1:
;blink.c,23 :: 		return (unsigned int)ms;
; ms start address is: 12 (R3)
UXTB	R0, R3
; ms end address is: 12 (R3)
;blink.c,24 :: 		}
L_end_make_delay_ms:
ADD	SP, SP, #4
BX	LR
; end of _make_delay_ms
_main:
;blink.c,26 :: 		void main() {
;blink.c,27 :: 		while(1) {
L_main6:
;blink.c,28 :: 		PORTPA0_SUCCESS = 0x01;
MOVS	R1, #1
MOVW	R0, 1073872912
MOVT	R0, 16386
STR	R1, [R0, #0]
;blink.c,29 :: 		make_delay_ms(1000);
MOVW	R0, #1000
BL	_make_delay_ms+0
;blink.c,30 :: 		PORTPA0_SUCCESS = 0x00;
MOVS	R1, #0
MOVW	R0, 1073872912
MOVT	R0, 16386
STR	R1, [R0, #0]
;blink.c,31 :: 		make_delay_ms(1000);
MOVW	R0, #1000
BL	_make_delay_ms+0
;blink.c,32 :: 		}
IT	AL
BAL	L_main6
;blink.c,33 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
