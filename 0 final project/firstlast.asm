section .data
    prompt db "Enter your first and last name: ", 0
    prompt_len equ $ - prompt
    output db "Your initials are: ", 0
    output_len equ $ - output
    dot db ".", 0
    newline db 10, 0

section .bss
    full_name resb 64   ; Buffer to store full name
    first_name resb 32  ; Buffer to store first name
    last_name resb 32   ; Buffer to store last name

section .text
    global _start

_start:
    ; Prompt for full name
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, prompt     ; message to write
    mov edx, prompt_len ; length of message
    int 0x80            ; call kernel

    ; Read full name
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, full_name  ; buffer to store full name
    mov edx, 64         ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Remove newline from full name
    mov ecx, full_name
    call remove_newline

    ; Split full name into first and last name
    mov ecx, full_name  ; Point to full name
    mov edi, first_name ; Point to first name buffer
    call copy_until_space ; Copy first name
    inc ecx             ; Skip the space
    mov edi, last_name  ; Point to last name buffer
    call copy_until_null ; Copy last name

    ; Convert first initial to lowercase
    mov al, [first_name] ; Load first character of first name
    call to_lowercase    ; Convert to lowercase
    mov [first_name], al ; Store back

    ; Convert last initial to lowercase
    mov al, [last_name]  ; Load first character of last name
    call to_lowercase    ; Convert to lowercase
    mov [last_name], al  ; Store back

    ; Print output message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, output     ; message to write
    mov edx, output_len ; length of message
    int 0x80            ; call kernel

    ; Print first initial (lowercase)
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, first_name ; first character of first name
    mov edx, 1          ; print only one character
    int 0x80            ; call kernel

    ; Print dot
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, dot        ; dot character
    mov edx, 1          ; length of dot
    int 0x80            ; call kernel

    ; Print last name (lowercase initial)
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, last_name  ; last name
    mov edx, 32         ; maximum length
    int 0x80            ; call kernel

    ; Print newline
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, newline    ; newline character
    mov edx, 1          ; length of newline
    int 0x80            ; call kernel

    ; Exit program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

; Function to remove newline from input
remove_newline:
    mov al, [ecx]       ; Load character
    cmp al, 10          ; Check if it's a newline
    je .done            ; If newline, end
    cmp al, 0           ; Check if it's null terminator
    je .done            ; If null, end
    inc ecx             ; Move to next character
    jmp remove_newline  ; Repeat
.done:
    mov byte [ecx], 0   ; Replace newline with null terminator
    ret

; Function to copy characters until space is found
copy_until_space:
    mov al, [ecx]       ; Load character
    cmp al, ' '         ; Check if it's a space
    je .done            ; If space, end
    cmp al, 0           ; Check if it's null terminator
    je .done            ; If null, end
    mov [edi], al       ; Copy character to destination
    inc ecx             ; Move to next character in source
    inc edi             ; Move to next position in destination
    jmp copy_until_space ; Repeat
.done:
    mov byte [edi], 0   ; Add null terminator
    ret

; Function to copy characters until null terminator is found
copy_until_null:
    mov al, [ecx]       ; Load character
    cmp al, 0           ; Check if it's null terminator
    je .done            ; If null, end
    mov [edi], al       ; Copy character to destination
    inc ecx             ; Move to next character in source
    inc edi             ; Move to next position in destination
    jmp copy_until_null ; Repeat
.done:
    mov byte [edi], 0   ; Add null terminator
    ret

; Function to convert character to lowercase
to_lowercase:
    cmp al, 'A'         ; Check if character is uppercase
    jb .done            ; If below 'A', skip
    cmp al, 'Z'         ; Check if character is uppercase
    ja .done            ; If above 'Z', skip
    add al, 32          ; Convert to lowercase
.done:
    ret