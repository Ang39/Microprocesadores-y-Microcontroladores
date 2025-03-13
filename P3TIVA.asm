		.global main
		.data
		.text

main
	    MOVW R3, #0X0008 ; Loads the lower 16 bits of R3 with 0x0008
	    MOVT R3, #0X2000 ; Loads the upper 16 bits of R3 with 0x2000 (R3 = 0x20000008)
	    MOVW R2, #0X000C ; Loads the lower 16 bits of R2 with 0x000C
	    MOVT R2, #0X2000 ; Loads the upper 16 bits of R2 with 0x2000 (R2 = 0x2000000C)

	    MOV R4, #0X405A ; Loads the value 0x405A into R4
	    STR R4, [R3] ; Stores the value of R4 (0x405A) at the memory address pointed by R3 (0x20000008)
	    MOVW R5, #0X2F6A ; Loads the value 0x2F6A into the lower 16 bits of R5
	    STR R5, [R2], #0X04 ; Stores the value of R5 (0x2F6A) at the address pointed by R2 (0x2000000C) and then post-increments R2 by 4 (R2 becomes 0x20000010)
	    ADD R6, R4, R5 ; Adds the values in R4 (0x405A) and R5 (0x2F6A) together (0x405A + 0x2F6A = 0x6CCA) and stores the result in R6
	    STR R6, [R2], #0X04 ; Stores the result (0x6CCA) at the address pointed by R2 (0x20000010) and post-increments R2 by 4 (R2 becomes 0x20000014)
	    ORR R6, R4, R5 ; Performs a bitwise OR on R4 (0x405A) and R5 (0x2F6A) (0x405A | 0x2F6A = 0x7F7A) and stores the result in R6
	    STR R6, [R2], #0X04 ; Stores the result (0x7F7A) at the address pointed by R2 (0x20000014) and post-increments R2 by 4 (R2 becomes 0x20000018)
	    AND R6, R4, R5 ; Performs a bitwise AND on R4 (0x405A) and R5 (0x2F6A) (0x405A & 0x2F6A = 0x206A) and stores the result in R6
	    STR R6, [R2] ; Stores the result (0x206A) at the address pointed by R2 (0x20000018)

Stop
    	B Stop ; Infinite loop to halt program execution (halts the program here, preventing it from running further)
    	.end
