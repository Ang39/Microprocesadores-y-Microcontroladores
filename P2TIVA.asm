	  .global main; Declaring the main function
		.data; Declaring the data section (RAM)
		.text; Declaring the program code section (EEPROM)
main
		MOVW R3, #0X0008  ; Load the lower 16 bits of R3 with 0x0008
		MOVT R3, #0X2000  ; Load the upper 16 bits of R3 with 0x2000 (R3 = 0x20000008)
		MOVW R2, #0X000C  ; Load the lower 16 bits of R2 with 0x000C
		MOVT R2, #0X2000  ; Load the upper 16 bits of R2 with 0x2000 (R2 = 0x2000000C)
		MOV R4, #0XFA05   ; Load R4 with the value 0xFA05

		STR R4, [R3]	     ; Store the value in R4 (0xFA05) at the memory address pointed by R3 (0x20000008)
		LDR R4, [R3]	     ; Load R4 with the value from the memory address pointed by R3 (0x20000008)

		ADD R0, R4, #0X05FA ; R0 = R4 (0xFA05) + 0x05FA → 0xFFFF
		MOV R1, R0          ; Move the result (0xFFFF) into R1
		STR R1, [R2], #0x04 ; Store the value in R1 (0xFFFF) at the address pointed by R2 (0x2000000C)
                             ; After storing, R2 is post-incremented by 4 (R2 becomes 0x20000010)
		SUB R4, R4, #0X05FA ; R4 = R4 (0xFA05) - 0x05FA → 0xFA0B
		STR R4, [R3]        ; Store the value in R4 (0xFA0B) at the memory address pointed by R3 (0x20000008)

Stop

		b Stop; Infinite loop to stop execution
		.end; End of the program
