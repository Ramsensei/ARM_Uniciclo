             ;Set    Test Data
             SUB     R0, R14, R14
             ADD     R1, R0, #0X1200
             ADD     R2, R0, #5
             STR     R2, [R1], #4
             ADD     R2, R0, #5
             STR     R2, [R1], #4
             ADD     R2, R0, #25
             STR     R2, [R1], #4
             ADD     R2, R0, #5
             STR     R2, [R1], #4
             ADD     R2, R0, #9
             STR     R2, [R1], #4
             ADD     R2, R0, #21
             STR     R2, [R1], #4
             ADD     R2, R0, #17
             STR     R2, [R1], #4
             ADD     R2, R0, #25
             STR     R2, [R1], #4
             ADD     R2, R0, #21
             STR     R2, [R1], #4
             ADD     R2, R0, #19
             STR     R2, [R1], #4
             ADD     R2, R0, #16
             STR     R2, [R1], #4
             ADD     R2, R0, #8
             STR     R2, [R1], #4
             ADD     R2, R0, #6
             STR     R2, [R1], #4
             ADD     R2, R0, #11
             STR     R2, [R1], #4
             ADD     R2, R0, #12
             STR     R2, [R1], #4
             ADD     R2, R0, #18
             STR     R2, [R1], #4
             ADD     R2, R0, #13
             STR     R2, [R1], #4
             ADD     R2, R0, #22
             STR     R2, [R1], #4
             ADD     R2, R0, #23
             STR     R2, [R1], #4
             ADD     R2, R0, #12
             STR     R2, [R1], #4
             ADD     R2, R0, #23
             STR     R2, [R1], #4
             ADD     R2, R0, #9
             STR     R2, [R1], #4
             ADD     R2, R0, #9
             STR     R2, [R1], #4
             ADD     R2, R0, #22
             STR     R2, [R1], #4
             ADD     R2, R0, #8
             STR     R2, [R1], #4
             ADD     R2, R0, #3
             STR     R2, [R1], #4
             ADD     R2, R0, #12
             STR     R2, [R1], #4
             ADD     R2, R0, #5
             STR     R2, [R1], #4


             ;Processing data
             ADD     R2, R0, #0X1200
             ADD     R10, R0, #0X1300

             LDR     R3, [R2]
             ADD     R2, R2, #4
             LDR     R4, [R2]
             ADD     R2, R2, #4
             ADD     R5, R4, R4
             ADD     R5, R5, R5
             ADD     R2, R2, #4

             SUB     R3, R3, #2
             SUB     R4, R4, #2 ;Quita 2 a los contadores para saltarse los bordes
             STR     R3, [R10]
             ADD     R10, R10, #4
             STR     R4, [R10]
             ADD     R10, R10, #4
             ADD     R2, R2, #4
             ADD     R2, R2, R5


MAIN_LOOP    
             ADD     R1, R0, #0X1100
             ADD     R6, R0, #3
             SUB     R7, R2, R5
             SUB     R7, R7, #4
EXTRACT_LOOP 
             LDR     R8, [R7]
             STR     R8, [R1]
             ADD     R1, R1, #4
             LDR     R8, [R7, #4]
             STR     R8, [R1]
             ADD     R1, R1, #4
             LDR     R8, [R7, #8]
             STR     R8, [R1]
             ADD     R1, R1, #4
             ADD     R7, R7, R5
             SUBS    R6, R6, #1
             BNE     EXTRACT_LOOP
             ;GuardarMediana
             ;R1,    R6, R7, R8, R9, R10, R11, R12
SORT_LOOP    
             ADD     R1, R0, #0X1100
             ADD     R12, R0, R0
             ADD     R9, R0, #8
NEXT_NUM     
             LDR     R6, [R1]
             LDR     R7, [R1, #4]
             SUBS    R8, R6, R7
             STRGT   R6, [R1, #4]
             STRGT   R7, [R1]
             ADDGT   R12, R12, #1
             ADD     R1, R1, #4
             SUBS    R9, R9, #1
             BNE     NEXT_NUM
             SUBS    R8, R12, R0
             BNE     SORT_LOOP

             ADD     R1, R0, #0X1100
             LDR     R6, [R1, #0X20]
             STR     R6, [R10]
             ADD     R10, R10, #4


COMP_COLS    
             SUBS    R4, R4, #1
             ADD     R2, R2, #4
             BNE     MAIN_LOOP
COMP_ROWS    
             SUBS    R3, R3, #1
             ADD     R9, R0, #0X1200
             ADD     R2, R2, #8
             LDR     R4, [R9]
             SUB     R4, R4, #2
             BNE     MAIN_LOOP