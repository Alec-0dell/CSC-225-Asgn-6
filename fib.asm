; Recursively computes Fibonacci numbers.
; CSC 225, Assignment 6
; Given code, Winter '24

        .ORIG x4000

; int fib(int)
; TODO: Implement this function.
FIBFN
    ADD R6, R6, #-1; PUSH SPACE FOR RET VAL
    ADD R6, R6, #-1
    STR R7, R6, #0; PUSH RET ADRESS 
    ADD R6, R6, #-1
    STR R5, R6, #0; PUSH DYNAMIC LINK
    ADD R5, R6, #-1; SET NEW FRAME POINTER
    ADD R6, R6, #-1; PUSH SPACE FOR LOCAL VARIABLE A
    ADD R6, R6, #-1; PUSH SPACE FRO LOCAL VARIABLE B
    ST R1, R1SAVER; STORE R1
    ST R2, R2SAVER; STORE R2
    ST R3, R3SAVER; STORE R3
    LDR R1, R5, #4; LOAD N INTO R1
    BRnz IFZORN
    ADD R1, R1, #-1;
    BRz IFONE
    ADD R1, R1, #1;
    ADD R1, R1, #-1; N-1
    ADD R6, R6, #-1;
    STR R1, R6, #0; PUSH ARGUMENTS ONTO THE STACK
    JSR FIBFN; CALL FUNCTION 
    LDR R2, R6, #0; LOAD RET VALUE
    STR R2, R5, #0; ;SET A TO fib(n - 1)
    ADD R6, R6, #1; POP RET VAL
    ADD R6, R6, #1; POP ARGUMENTS
    LDR R1, R5, #4; LOAD N INTO R1
    ADD R1, R1, #-2; N-2
    ADD R6, R6, #-1;
    STR R1, R6, #0; PUSH ARGUMENTS ONTO THE STACK
    JSR FIBFN; CALL FUNCTION 
    LDR R3, R6, #0; LOAD RET VALUE
    STR R3, R5, #-1; ;SET B TO fib(n - 2)
    ADD R6, R6, #1; POP RET VAL
    ADD R6, R6, #1; POP ARGUMENTS
    LDR R2, R5, #-1
    LDR R3, R5, #0
    ADD R2, R2, R3; ADD A+B
    STR R2, R5, #3; STORE RETURN VAL: A + B
    ADD R6, R5, #1; POP LOCALS
    LDR R5, R6, #0
    ADD R6, R6, #1;POP DYN LINK
    LDR R7, R6, #0
    ADD R6, R6, #1;POP RET ADRESS
    LD R1, R1SAVER;
    LD R2, R2SAVER;
    LD R3, R3SAVER;RESTORE REGISTERS
    RET;RETURN A + B
    
IFZORN;RETURN 0
    AND R2, R2, #0
    STR R2, R5, #3; STORE RETURN VAL: 0
    ADD R6, R5, #1; POP LOCALS
    LDR R5, R6, #0
    ADD R6, R6, #1;POP DYN LINK
    LDR R7, R6, #0
    ADD R6, R6, #1;POP RET ADRESS
    LD R1, R1SAVER;
    LD R2, R2SAVER;
    LD R3, R3SAVER;RESTORE REGISTERS
    RET; RETURN
    
    
    
IFONE ;RETURN 1
    AND R2, R2, #0
    ADD R2, R2, #1
    STR R2, R5, #3; STORE RETURN VAL: 1
    ADD R6, R5, #1; POP LOCALS
    LDR R5, R6, #0
    ADD R6, R6, #1;POP DYN LINK
    LDR R7, R6, #0
    ADD R6, R6, #1;POP RET ADRESS
    LD R1, R1SAVER;
    LD R2, R2SAVER;
    LD R3, R3SAVER;RESTORE REGISTERS
    RET; RETURN
    
    
R1SAVER    .FILL X0
R2SAVER    .FILL X0
R3SAVER    .FILL X0
        .END
