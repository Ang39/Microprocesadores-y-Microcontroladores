    .global main
	    .data
	    .text

main:
	    MOVW R3, #0X0004        ; Load the lower 16 bits of the base memory address 0x20000004 into R3
	    MOVT R3, #0X2000        ; Load the upper 16 bits of the base memory address 0x20000004 into R3 (R3 = 0x20000004)

	    MOVW R2, #0X0004        ; Load the lower 16 bits of the base address for the sum calculation (0x20000084) into R2
	    MOVT R2, #0X2000        ; Load the upper 16 bits of the base address for the sum calculation (0x20000084) into R2 (R2 = 0x20000084)

	    MOV R1, #0X01           ; Initialize the counter to 1 (the first number to store)
	    MOV R4, #0X00              ; Initialize the accumulator for the sum (R4 will store the running sum, starting at 0)

	    MOV R5, #0X32             ; Set the number of iterations (32 times)
	    MOV R6, #0X02           ; Set the multiplication factor to 2 (R6 = 2)

store_numbers:
	    STR R1, [R3], #0X04     ; Store the value of R1 at the memory address pointed by R3, then post-increment R3 by 4 (move to the next memory location)
	    ADD R4, R4, R1          ; Add the value of R1 to the accumulator (R4 = R4 + R1)
	    ADD R1, R1, #1          ; Increment R1 by 1 (preparing the next number to store)

	    SUBS R5, R5, #1         ; Decrement R5 by 1 (remaining iterations)
	    BNE store_numbers       ; If R5 is not zero (i.e., there are still numbers to store), repeat the loop

	    STR R4, [R2], #0x04     ; Store the accumulated sum (R4) at the memory address pointed by R2 (0x20000084), then post-increment R2 by 4
	    MUL R4, R4, R6          ; Multiply the sum (R4) by 2 (R6 = 2), result stored in R4
	    STR R4, [R3]            ; Store the multiplied sum in the address pointed by R3 (overwriting previous value at R3)

Stop:
	    B Stop          
