    AREA mycode, CODE, READONLY
    ENTRY
    EXPORT __main
__main
    MOV R1, #4	     ; a
    MOV R2, #6		 ; b
    MOV R3, #5		 ; c
    MOV R4, #3		 ; d
    MOV R5, #0      ; e
    MOV R6, #0      ; f
    BL fun1	 
    MOV R5, R0
 
    BL fun2
    MOV R6, R0
 
    MOV R1, R5
    MOV R2, R6
    MOV R3, #5
    BL fun1
    MOV R5, R0
STOP
    BAL STOP		 ; infinite loop
fun1
    STMFD SP!, {R1, R2, R3, R5, LR}   ;   backup the registers
 
    ADD R5, R1, R2      ; e = a + b
    SUB R5, R5, R3      ; e = e - c
    MOV R0, R5
    LDMFD SP!, {R1, R2, R3, R5, LR}   ; reload the register values
    MOV PC, LR
fun2
    STMFD SP!, {R4, R6, LR}   ;   backup the registers
    ADD R6, R4, R4      ; f = 2d
    MOV R0, R6
    LDMFD SP!, {R4, R6, LR}   ; reload the register values
    MOV PC, LR
 END

