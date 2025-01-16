
        .org $0801                ; Start address for BASIC programs in memory

        ; BASIC program header
        .word $0809               ; Pointer to the next BASIC line
        .byte $0C, $08            ; Line number 2048
        .byte $9E                 ; SYS token (BASIC's "SYS" command)
        .byte $32, $31, $36, $32  ; "2062" in ASCII (start of machine code)
        .byte $00                 ; End of BASIC line

        ; Machine code start
        .org $0810                ; Assembly code at $0810
Start:
        LDX #$00                  ; Initialize X register (index)

PrintLoop:
        LDA Message, X            ; Load a character from the message
        BEQ Done                  ; If zero (end of string), exit
        JSR $FFD2                 ; Call C64's Kernal CHROUT routine
        INX                       ; Increment X to the next character
        JMP PrintLoop             ; Loop to print the next character

Done:
        RTS                       ; Return to BASIC (ends program)

Message:
        .byte "Hello, World!", 0  ; Null-terminated string
