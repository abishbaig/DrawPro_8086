TITLE DrawPro 8086: ECHC PROGRAM

;|---------------------------------------------------------------------------------------------------------------|
;|---------------------------------------------------------------------------------------------------------------|   
;|                                                                                                               |
;|                                              ------------                                                     |
;|                                             |DrawPro 8086|                                                    |            
;|                                              ------------                                                     |
;|                                                                                                               |
;|                                                                                                               |
;|                                        Software Developer Team                                                |
;|                                        _______________________                                                |
;|                                                                                                               |
;|                                                                                                               |
;|                                        > Muhammad Abish Baig  F2022266126                                     |
;|                                        > Samroz Burhan        F2022266116                                     |
;|                                        > Muhammad Shahzad     F2022266152                                     |
;|                                                                                                               |
;|                                                                                                               |
;|                                        Project Supervisor                                                     |
;|                                        __________________                                                     |
;|                                                                                                               |
;|                                        > Mam Saima Shaheen                                                    |
;|                                                                                                               |
;|---------------------------------------------------------------------------------------------------------------|
;|---------------------------------------------------------------------------------------------------------------|

;-----------------------------------------------------------------------------------------------------------------
;                           Including External Files Containing Macros and Procedures
;-----------------------------------------------------------------------------------------------------------------
;include "shapes8086.inc"
;-----------------------------------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------------------------------
;                                      Defining Structure of our Program
;-----------------------------------------------------------------------------------------------------------------
.model small    ; 64 KB for Data & 64 KB for Code Segment
.stack 100h     ; Defining Stack size of 256 Bytes
;-----------------------------------------------------------------------------------------------------------------
 
;-----------------------------------------------------------------------------------------------------------------
;                                           Defining Data Segment
;-----------------------------------------------------------------------------------------------------------------
.Data
;-----------------------------------------------------------------------------------------------------------------
;                                               Global Strings
;-----------------------------------------------------------------------------------------------------------------
titleMsg db "DrawPro 8086",0ah,0dh,'$'
invalidInpt db "Invalid Input!!!",0ah,0dh,'$'
optInpt db "Option: ",'$'
pressAnyKey db "Press Any Key To Continue ",0ah,0dh,'$'


;----------------------------------------------------------------------------------------------------------------- 

;-----------------------------------------------------------------------------------------------------------------
;                                           Credit Screen Strings
;-----------------------------------------------------------------------------------------------------------------
crdMsg0 db "WELCOME",0ah,0dh,'$'
crdMsg1 db "TO",0ah,0dh,'$'
crdMsg2 db "SOFTWARE DEVELOPER TEAM",0ah,0dh,'$'
crdMsg3_1 db 249," Muhammad Abish Baig",0ah,0dh,'$'
crdMsg3_2 db "F2022266126",0ah,0dh,'$'
crdMsg4_1 db 249," Samroz Burhan",0ah,0dh,'$'
crdMsg4_2 db "F2022266116",0ah,0dh,'$'
crdMsg5_1 db 249," Muhammad Shahzad",0ah,0dh,'$'
crdMsg5_2 db "F2022266152",0ah,0dh,'$'
crdMsg6 db "PROJECT SUPERVISOR",0ah,0dh,'$'
crdMsg7 db 16," Mam Saima Shaheen",0ah,0dh,'$'
crdMsg8 db "Press Any Key To Continue ",'$'
;-----------------------------------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------------------------------
;                                           Load Screen Strings
;-----------------------------------------------------------------------------------------------------------------
loadingMsg1 db "Loading",0ah,0dh,'$'
loadingMsg2 db "Please Wait...",0ah,0dh,'$'
loadingMsg3 db "Press Any Key To Start Software ",'$'
;-----------------------------------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------------------------------
;                                           Exit Screen Strings
;-----------------------------------------------------------------------------------------------------------------
extMsg1 db "Exiting Program",0ah,0dh,'$'
extMsg2 db "Please Wait...",0ah,0dh,'$'
extMsg3 db 175," Thanks for Using Our Software ",174,'$'
;-----------------------------------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------------------------------
;                                         Main Menu Screen Strings
;-----------------------------------------------------------------------------------------------------------------
menuOp1 db "[1] Draw Mode",0ah,0dh,'$'
menuOp2 db "[2] ShapeBuilder Mode",0ah,0dh,'$'
menuOp3 db "[3] Exit",0ah,0dh,'$'
;-----------------------------------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------------------------------
;                                       ShapeBuilder Screen Strings
;-----------------------------------------------------------------------------------------------------------------
shpTitle db "ShapeBuilder Mode",0ah,0dh,'$'
shpOp1 db "[1] Draw Square",0ah,0dh,'$'
shpOp2 db "[2] Draw Rectangle",0ah,0dh,'$'
shpOp3 db "[3] Draw Circle",0ah,0dh,'$'
shpOp4 db "[4] Draw Triangle",0ah,0dh,'$'
shpOp5 db "[5] Back to Main Menu",0ah,0dh,'$'  
;-----------------------------------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------------------------------
;                                       Ask Pixel Color Screen Strings
;-----------------------------------------------------------------------------------------------------------------
pxlScrTitle db "Select Pixel Color",0ah,0dh,'$'
pxlScrOp1 db "[1] Blue",'$' ; light blue
pxlScrOp2 db "[2] Green",'$'; light green
pxlScrOp3 db "[3] Cyan",'$' ; light cyan
pxlScrOp4 db "[4] Red",'$'  ; light red
pxlScrOp5 db "[5] White",'$'
pxlScrOp6 db "[6] Brown",'$'
pxlScrOp7 db "[7] Yellow",'$'
pxlScrOp8 db "[8] Magenta",'$' ; light magenta
setDefaultClr db "Setting Color: White",0ah,0dh,'$'
pixelClrShp db 15
;-----------------------------------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------------------------------
;                                              Draw Square Strings 
;-----------------------------------------------------------------------------------------------------------------
drSqrMsg1 db "   ----- Drawing Square -----",0ah,0dh,'$'
drSqrMsg2 db "   Range (1pxl - 7pxl)",0ah,0dh,'$' ; 2 - 128
drSqrMsg3 db "Enter Side Length(pxl): ",'$'
drSqrLen dw 2
drSqrPxlClr db 15 
;-----------------------------------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------------------------------
;                                              Draw Rectangle Strings 
;-----------------------------------------------------------------------------------------------------------------
drRectMsg1 db "   ----- Drawing Rectangle -----",0ah,0dh,'$'
drRectMsg2 db "   Range (1pxl - 7pxl)",0ah,0dh,'$' ; 2 - 128
drRectMsg3 db "Enter Side Length(pxl): ",'$'
drRectMsg4 db "Width = Width/2^pxl (AUTO)",'$'
drRectLen dw 2
drRectWidt dw 1
drRectPxlClr db 15 
;-----------------------------------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------------------------------
;                                              Draw Circle Strings 
;-----------------------------------------------------------------------------------------------------------------
drCirMsg1 db "   ----- Drawing Circle -----",0ah,0dh,'$'
drCirMsg2 db "   Range (1pxl - 6pxl)",0ah,0dh,'$' ; 10 - 60
drCirMsg3 db "Enter Side Radius(pxl): ",'$'
drCirRad dw 2
drCirPxlClr db 15
drCirX dw 80
drCirY dw 80
balance dw 0
xoff dw 0
yoff dw 0 

xplusx dw 0
xminusx dw 0
yplusy dw 0
yminusy dw 0

xplusy dw 0
xminusy dw 0
yplusx dw 0
yminusx dw 0  
;-----------------------------------------------------------------------------------------------------------------


;-----------------------------------------------------------------------------------------------------------------
;                                              Draw Triangle Strings 
;-----------------------------------------------------------------------------------------------------------------
drTriPxlClr db 15 
;-----------------------------------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------------------------------
;                                              Draw Mode Strings 
;-----------------------------------------------------------------------------------------------------------------
drModX db 'X','$'
 
;-----------------------------------------------------------------------------------------------------------------


;-----------------------------------------------------------------------------------------------------------------
;                                              Draw Rect Sqr Strings
;-----------------------------------------------------------------------------------------------------------------
rowRngST dw 40  ; starting position of y-axis
rowRngED dw 40  ; length size

colRngST dw 40  ; starting position of x-axis
colRngED dw 40  ; width size                                                                                      
;-----------------------------------------------------------------------------------------------------------------



;-----------------------------------------------------------------------------------------------------------------
;                                               Defining Code Segment
;-----------------------------------------------------------------------------------------------------------------
.Code
;-----------------------------------------------------------------------------------------------------------------
;                                                       MACROS  
;-----------------------------------------------------------------------------------------------------------------
;                                       Macro for printing strings on screen
;----------------------------------------------------------------------------------------------------------------- 
printString MACRO string
    mov ah,9
    lea dx,string
    int 21h
    ENDM                                                                                                          

;------------------------------------------------------------------------------------------------------------------
;                             Macro for Drawing Rectangle or Square on Graphics Window
;------------------------------------------------------------------------------------------------------------------
DrawRectSqr MACRO length,width,color
    LOCAL PRINT_L1,PRINT_W1,PRINT_L2,PRINT_W2
    ; clearing bx
    xor bx,bx
    mov bx,rowRngST
    add bx,length   ; 40 + length = BX, done to start from 40 pxls
    mov rowRngED,bx 
    
    xor bx,bx
    mov bx,colRngST
    add bx,width    ; 40 + width = BX, done to start from 40 pxls
    mov colRngED,bx
    xor bx,bx
    
    mov ah,0Ch      ; Function for printing single pixel on screen
    mov al,color    ; defining color of pixel
    mov bx,rowRngST ; row start
    mov dx,colRngST ; col start
    
    ; Printing Top Horizontal Line
    PRINT_L1:
        mov cx,rowRngST    
        mov cx,10
        loop $
        mov cx,rowRngST
        int 10h
        mov bx,rowRngST
        inc bx
        mov rowRngST,bx
        
        cmp bx,rowRngED
        jne PRINT_L1
        
        xor bx,bx
        jmp PRINT_W1
    
    ; Printing Left Vertical Line    
    PRINT_W1:
        mov dx,colRngST
        mov bx,colRngST
        inc bx
        mov colRngST,bx
        int 10h
        
        cmp bx,colRngED
        jne PRINT_W1  
        xor bx,bx 
        jmp PRINT_L2
        
     ; Printing Bottom Horizontal Line
     PRINT_L2:
        mov bx,rowRngST
        dec bx
        mov rowRngST,bx
        mov cx,rowRngST
        int 10h
        
        cmp bx,40
        jne PRINT_L2
        
        xor bx,bx
        jmp PRINT_W2 
        
      ; Printing Right Vertical Line  
      PRINT_W2:
        
        mov bx,colRngST
        dec bx
        mov colRngST,bx
        mov dx,colRngST
        int 10h
        
        cmp bx,40
        jne PRINT_W2  
        xor bx,bx
      
      
      ; Printing msg for key to continue
      GOTOXY 3,24
      printString pressAnyKey
      
      ; Waiting for input without echo
      call nonEchoInpt
        
      ENDM
;------------------------------------------------------------------------------------------------------------------    


;-----------------------------------------------------------------------------------------------------------------
;                                Macro for drawing circle Using Behenson's Equation
;-----------------------------------------------------------------------------------------------------------------

; (x + h)2+ (y + k)2 = r2


; Assign variable b to a
Assign macro a, b
    mov ax, b
    mov a, ax    
endm

;a = -a 
Negate macro a
    mov ax, a
    neg ax
    mov a, ax    
endm

;a = a+1 
IncVar macro a
    mov ax, a
    inc ax
    mov a, ax    
endm

;a = a-1 
DecVar macro a
    mov ax, a
    dec ax
    mov a, ax    
endm

Compare2Variables macro a, b
    mov cx, a
    cmp cx, b
endm

CompareVariableAndNumber macro a, b
    mov cx, a
    cmp cx, b
endm

;c = a+b
AddAndAssign macro c, a, b
    mov ax, a
    add ax, b
    mov c, ax
endm 

;c = a-b
SubAndAssign macro c, a, b
    mov ax, a
    sub ax, b
    mov c, ax
endm

;d = a+b+c
Add3NumbersAndAssign macro d, a, b, c
    mov ax, a
    add ax, b
    add ax, c
    mov d, ax
endm 

;d = a-b-c
Sub3NumbersAndAssign macro d, a, b, c
    mov ax, a
    sub ax, b
    sub ax, c
    mov d, ax
endm

DrawPixelCircle macro x, y,clr
    
    mov cx, x  ; column  
    mov dx, y  ; row  
     
    mov al, clr  ; green
    mov ah, 0ch ; put pixel
    int 10h     
endm


;Paint Circle Macro

paintCircle macro circleCenterX, circleCenterY, radius,circleClr
    
   
    ;         xoff = 0;
    ;         yoff = radius;
    ;         balance = -radius;
    
    Assign yoff, radius
    
    Assign balance, radius
    Negate balance
    
    
    ;         while (xoff <= yoff)
    ;         {
    draw_circle_loop:
     
     AddAndAssign xplusx, circleCenterX, xoff
     SubAndAssign xminusx, circleCenterX, xoff
     AddAndAssign yplusy, circleCenterY, yoff
     SubAndAssign yminusy, circleCenterY, yoff
     
     AddAndAssign xplusy, circleCenterX, yoff
     SubAndAssign xminusy, circleCenterX, yoff
     AddAndAssign yplusx, circleCenterY, xoff
     SubAndAssign yminusx, circleCenterY, xoff
     
    ;        DrawPixel(circleCenterX + yoff, circleCenterY - xoff);
    ; part 1 from angle 0 to 45 counterclockwise
    DrawPixelCircle xplusy, yminusx,CircleClr
    
    ;C# Code
    ;       DrawPixel(circleCenterX + xoff, circleCenterY - yoff);
    ; part 2 from angle 90 to 45 clockwise
    DrawPixelCircle xplusx, yminusy,CircleClr
 
    ;       DrawPixel(circleCenterX - xoff, circleCenterY - yoff); 
    ; part 3 from angle 90 to 135 counterclockwise
    DrawPixelCircle xminusx, yminusy,CircleClr
   
    ;        DrawPixel(circleCenterX - yoff, circleCenterY - xoff); 
    ; part 4 from angle 180 to 135 clockwise
    DrawPixelCircle xminusy, yminusx,CircleClr
 
    ;       DrawPixel(circleCenterX - yoff, circleCenterY + xoff); 
    ; part 5 from angle 180 to 225 counterclockwise
    DrawPixelCircle xminusy, yplusx,CircleClr

    ;       DrawPixel(circleCenterX - xoff, circleCenterY + yoff); 
    ; part 6 from angle 270 to 225 clockwise
    DrawPixelCircle xminusx, yplusy,CircleClr

    ;       DrawPixel(circleCenterX + xoff, circleCenterY + yoff); 
    ; part 7 from angle 270 to 315 counterclockwise
    DrawPixelCircle xplusx, yplusy,CircleClr
    

    ;       DrawPixel(circleCenterX + yoff, circleCenterY + xoff); 
    ; part 8 from angle 360 to 315 clockwise
    DrawPixelCircle xplusy, yplusx,CircleClr


    ;        balance = balance + xoff + xoff;
    Add3NumbersAndAssign balance, balance, xoff, xoff

    ;            if (balance >= 0)
    ;            {
    ; 
    ;               yoff = yoff - 1;
    ;               balance = balance - yoff - yoff;
    ;               
    ;            }
    ; 
    ;            xoff = xoff + 1;
    CompareVariableAndNumber balance, 0
    jl balance_negative
    ;balance_positive:
    DecVar yoff
    
    Sub3NumbersAndAssign balance, balance, yoff, yoff
    
    balance_negative:
    IncVar xoff
    
    ;         while (xoff <= yoff)
    Compare2Variables xoff, yoff
    jg end_drawing
    jmp draw_circle_loop
    
    
    end_drawing:
    ; pause the screen for dos compatibility:
      mov balance,0
      mov xoff,0
      mov yoff,0 
      
      mov xplusx,0
      mov xminusx,0
      mov yplusy,0
      mov yminusy,0
      
      mov xplusy,0
      mov xminusy,0
      mov yplusx,0
      mov yminusx,0
    ; Printing msg for key to continue
      GOTOXY 3,24
      lea dx, pressAnyKey
      mov ah,9
      int 21h
      ; Waiting for input without echo
      call nonEchoInpt
           
endm

;-----------------------------------------------------------------------------------------------------------------
;                                       Macro for printing triangle
;-----------------------------------------------------------------------------------------------------------------
printtriangle macro trPxlClr
    mov cx,100   ; col
    mov dx,100  ; row
    
    mov bx,125
    push bx
    mov bx,150
    push bx
    pop bx
    mov ah,0ch
    mov al,trPxlClr

    line1:
        int 10h
        inc cx
        cmp cx,bx
        jnz line1
        pop bx
    line2:
        int 10h
        dec cx
        dec dx
        cmp cx,bx
        jnz line2
    line3:
        int 10h
        inc dx
        dec cx
        cmp cx,100
        jnz line3
        
    ; Printing msg for key to continue
      GOTOXY 3,24
      lea dx, pressAnyKey
      mov ah,9
      int 21h
      ; Waiting for input without echo
      call nonEchoInpt 
    endm

;-----------------------------------------------------------------------------------------------------------------
;                                   Macro for setting cursor position y,x col,row
;-----------------------------------------------------------------------------------------------------------------
GOTOXY MACRO x,y
    mov ah,2
    mov bh,0
    mov dh,y   ; Row->Set(Y)
    mov dl,x   ; Column->Set(X)
    int 10h
    ENDM
 
;-----------------------------------------------------------------------------------------------------------------
;                                             Non-Echo Interrupt Proc
;-----------------------------------------------------------------------------------------------------------------
nonEchoInpt proc
    ;Function for taking input without echo
    mov ah,0
    int 16h
    
    ret
    nonEchoInpt endp   


;-----------------------------------------------------------------------------------------------------------------
;                                               Non-Echo Interrupt Proc
;-----------------------------------------------------------------------------------------------------------------
echoInpt proc
    ; Fucntion for taking input with echo
    mov ah,1
    int 21h
    
    ret
    echoInpt endp   


;-----------------------------------------------------------------------------------------------------------------
;                                                   Text Color Macro
;-----------------------------------------------------------------------------------------------------------------
textColor MACRO color
    mov AH,6
    xor AL,AL
    xor CX,CX
    mov DX,184FH
    mov BH,color    ; 0 -15 for different colors 
    int 10H    
    
    ENDM

;-----------------------------------------------------------------------------------------------------------------  
;                                       Macro for printing line on screen (ASCII)
;                                                   loadline = 219
;                                                   doubleLine = 205
;-----------------------------------------------------------------------------------------------------------------
printLine MACRO ascii,count
    LOCAL FOR
    mov cx,count
    mov ah,2
    mov al,ascii
    mov dl,al
    ; For Loop for Printing Line
    FOR:
        int 21h
        Loop FOR
    ENDM   

;-----------------------------------------------------------------------------------------------------------------
;                                       Macro for printling line with delay
;-----------------------------------------------------------------------------------------------------------------
printLineSL MACRO ascii,count
    LOCAL FOR
    ;mov cx,count
    mov bx,count
    mov ah,2
    mov al,ascii
    mov dl,al
    ; For Loop for Printing Line
    FOR:
        mov cx,50
        loop $
        int 21h
        dec bx
        cmp bx,0
        jne FOR
        
    ENDM


;-----------------------------------------------------------------------------------------------------------------
;                                                   Procedures
;-----------------------------------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------------------------------
;                                       Procedure for opening graphics mode (320x280 Pixels)
;-----------------------------------------------------------------------------------------------------------------
graphicsModeON proc
    mov ah,0
    mov al,13h
    int 10h          
    ret
    graphicsModeON endp


;-----------------------------------------------------------------------------------------------------------------
;                                       Procedure for opening text mode (40x25 Chars) 
;-----------------------------------------------------------------------------------------------------------------
graphicsModeOFF proc
    mov ah,0
    mov al,1
    int 10h          
    ret
    graphicsModeOFF endp


;-----------------------------------------------------------------------------------------------------------------
;                                        Procedure for Asking Color Value 
;-----------------------------------------------------------------------------------------------------------------
pixelColorScreen proc
    ; Text Color for Main Menu Screen
    textColor 15
    
    GOTOXY 0,0   ; col,row -> y,x
    ; calling printline proc
    printLine 205,40
    
    ; printing title
    GOTOXY 10,2   ; -> col,row
    
    ; main title
    printString pxlScrTitle
    
    GOTOXY 0,4   ; col,row -> y,x
    printLine 205,40
    
    ; Menu Options (col,row)
    GOTOXY 2,6
    printString pxlScrOp1   ; light blue
    
    GOTOXY 2,8
    printString pxlScrOp2   ; light green
    
    GOTOXY 2,10
    printString pxlScrOp3   ; light cyan
    
    GOTOXY 2,12
    printString pxlScrOp4   ; light red
    
    GOTOXY 23,6
    printString pxlScrOp5   ; White
    
    GOTOXY 23,8  
    printString pxlScrOp6   ; Brown
    
    GOTOXY 23,10 
    printString pxlScrOp7   ; Yellow
    
    GOTOXY 23,12
    printString pxlScrOp8   ; Light Magenta
     
    
    ; Printine line at end of options for asking option input
    GOTOXY 0,14
    printLine 95,40
    
    ; Asking for input
    GOTOXY 1,16
    printString optInpt
    
    call echoInpt
    
    AND ax,11CFh  ; Masking AL bits with CFh to check input as it was in ASCII, not with 0Fh as it will convert some 
                ; other ascii values to whole numbers from 0-7 like 67(G) will be converted into 7, but 7 was
                ; not pressed
    
    ; checking what user has inputted
    cmp al,1
    je setPixel1
    cmp al,2
    je setPixel2
    cmp al,3
    je setPixel3
    cmp al,4
    je setPixel4
    cmp al,5
    je setPixel5
    cmp al,6
    je setPixel6
    cmp al,7
    je setPixel7
    cmp al,8
    je setPixel8
    
    GOTOXY 1,18
    printString invalidInpt
    GOTOXY 1,20
    printString setDefaultClr
    jmp setPixel5
    
    ; setting pixel color value and storing in global variable                
    setPixel1:
        mov pixelClrShp,9   ; light blue decimal value
        ret
    setPixel2:
        mov pixelClrShp,10  ; light green decimal value
        ret
    setPixel3:
        mov pixelClrShp,11  ; light cyan decimal value
        ret
    setPixel4:
        mov pixelClrShp,12  ; light red decimal value
        ret
    setPixel5:
        mov pixelClrShp,15  ; white decimal value
        ret
    setPixel6:
        mov pixelClrShp,6   ; brown decimal value
        ret
    setPixel7:
        mov pixelClrShp,14  ; yellow decimal value
        ret
    setPixel8:
        mov pixelClrShp,13  ; light magenta decimal value
        ret
    ret
    pixelColorScreen endp

;-----------------------------------------------------------------------------------------------------------------
;                                   Procedures for Length of Sqr = 2^n
;-----------------------------------------------------------------------------------------------------------------
procsetSqrLen2 proc
    xor ax,ax
    mov ax,[drSqrLen]
    mov ax,1
    shl ax,1  ; 2^1 = 2
    mov [drSqrLen],ax 
    ret
    procsetSqrLen2 endp

procsetSqrLen4 proc 
    xor ax,ax
    mov ax,[drSqrLen]
    mov ax,1  
    shl ax,1  ; 2^2 = 4
    shl ax,1
    mov [drSqrLen],ax
    ret
    procsetSqrLen4 endp

procsetSqrLen8 proc
    mov ax,[drSqrLen]
    mov ax,1
    shl ax,1  ; 2^3 = 8
    shl ax,1
    shl ax,1
    mov [drSqrLen],ax
    ret
    procsetSqrLen8 endp
    

procsetSqrLen16 proc
    mov ax,[drSqrLen]
    mov ax,1
    shl ax,1  ; 2^3 = 8
    shl ax,1
    shl ax,1
    shl ax,1
    mov [drSqrLen],ax
    ret
    procsetSqrLen16 endp

procsetSqrLen32 proc
    mov ax,[drSqrLen]
    mov ax,1
    shl ax,1  ; 2^3 = 8
    shl ax,1
    shl ax,1 
    shl ax,1
    shl ax,1
    mov [drSqrLen],ax
    ret
    procsetSqrLen32 endp

procsetSqrLen64 proc
    mov ax,[drSqrLen]
    mov ax,1
    shl ax,1  ; 2^3 = 8
    shl ax,1
    shl ax,1        
    shl ax,1
    shl ax,1
    shl ax,1
    mov [drSqrLen],ax
    
    ret
    procsetSqrLen64 endp

procsetSqrLen128 proc
    mov ax,[drSqrLen]
    mov ax,1
    shl ax,1  ; 2^3 = 8
    shl ax,1
    shl ax,1        
    shl ax,1
    shl ax,1
    shl ax,1       
    shl ax,1
    mov [drSqrLen],ax
    
    ret
    procsetSqrLen128 endp                        

;-----------------------------------------------------------------------------------------------------------------
;                                   Procedures for Length of Sqr = 2^n
;-----------------------------------------------------------------------------------------------------------------
procsetRectLen2 proc
    xor ax,ax
    mov ax,[drRectLen]
    mov ax,1
    shl ax,1  ; 2^1 = 2
    mov [drRectLen],ax
    shr ax,1
    mov [drRectWidt],ax 
    ret
    procsetRectLen2 endp

procsetRectLen4 proc 
    xor ax,ax
    mov ax,[drRectLen]
    mov ax,1  
    shl ax,1  ; 2^2 = 4
    shl ax,1
    mov [drRectLen],ax
    shr ax,1
    mov [drRectWidt],ax 
    ret
    procsetRectLen4 endp

procsetRectLen8 proc
    mov ax,[drRectLen]
    mov ax,1
    shl ax,1  ; 2^3 = 8
    shl ax,1
    shl ax,1
    mov [drRectLen],ax
    shr ax,1
    mov [drRectWidt],ax 
    ret
    procsetRectLen8 endp
    

procsetRectLen16 proc
    mov ax,[drRectLen]
    mov ax,1
    shl ax,1  ; 2^3 = 8
    shl ax,1
    shl ax,1
    shl ax,1
    mov [drRectLen],ax
    shr ax,1
    mov [drRectWidt],ax 
    ret
    procsetRectLen16 endp

procsetRectLen32 proc
    mov ax,[drRectLen]
    mov ax,1
    shl ax,1  ; 2^3 = 8
    shl ax,1
    shl ax,1 
    shl ax,1
    shl ax,1
    mov [drRectLen],ax
    shr ax,1
    mov [drRectWidt],ax 
    ret
    procsetRectLen32 endp

procsetRectLen64 proc
    mov ax,[drRectLen]
    mov ax,1
    shl ax,1  ; 2^3 = 8
    shl ax,1
    shl ax,1        
    shl ax,1
    shl ax,1
    shl ax,1
    mov [drRectLen],ax
    shr ax,1
    mov [drRectWidt],ax 
    ret
    procsetRectLen64 endp

procsetRectLen128 proc
    mov ax,[drRectLen]
    mov ax,1
    shl ax,1  ; 2^3 = 8
    shl ax,1
    shl ax,1        
    shl ax,1
    shl ax,1
    shl ax,1       
    shl ax,1
    mov [drRectLen],ax
    shr ax,1
    mov [drRectWidt],ax 
    
    ret
    procsetRectLen128 endp                        
 

;-----------------------------------------------------------------------------------------------------------------
;                                   Procedures for Radius of Rad = Rad+10
;-----------------------------------------------------------------------------------------------------------------
procsetCirRad10 proc
    xor ax,ax
    mov ax,[drCirRad]
    mov ax,10
    mov [drCirRad],ax 
    ret
    procsetCirRad10 endp

procsetCirRad20 proc 
    xor ax,ax
    mov ax,[drCirRad]
    mov ax,20
    mov [drCirRad],ax 
    ret
    procsetCirRad20 endp

procsetCirRad30 proc
    xor ax,ax
    mov ax,[drCirRad]
    mov ax,30
    mov [drCirRad],ax 
    ret
    procsetCirRad30 endp
    

procsetCirRad40 proc
    xor ax,ax
    mov ax,[drCirRad]
    mov ax,40
    mov [drCirRad],ax 
    ret
    procsetCirRad40 endp

procsetCirRad50 proc
    xor ax,ax
    mov ax,[drCirRad]
    mov ax,50
    mov [drCirRad],ax 
    ret
    procsetCirRad50 endp

procsetCirRad60 proc
    xor ax,ax
    mov ax,[drCirRad]
    mov ax,60
    mov [drCirRad],ax 
    ret
    procsetCirRad60 endp
                       
;-----------------------------------------------------------------------------------------------------------------
;                                           Procedure for Draw Square
;-----------------------------------------------------------------------------------------------------------------
DrawSquare proc
    call pixelColorScreen
    
    ; Storing the pixel color for drawing square
    mov al,pixelClrShp
    mov drSqrPxlClr,al
    mov pixelClrShp,15  ; setting it to its default value
    
    ; After Storing color asking dimensions
    ; text color for draw square screen
    textColor 15
    
    ; Setting Cursor Position  x,y col,row
    GOTOXY 0,6
    printLine 205,40
    
    ; Printing Sqr Msgs and Line
    GOTOXY 3,8
    printString drSqrMsg1
    
    GOTOXY 3,10
    printString drSqrMsg2
    
    GOTOXY 0,14
    printLine 205,40
    
    ; calling echo input interrupt proc
    GOTOXY 3,12 
    printString drSqrMsg3
    
    GOTOXY 27,12 
    call echoInpt
    
    AND ax,11CFh ; getting number
    
    ; Checking range 1 - 7
    cmp al,1
    je setSqrLen2
    cmp al,2
    je setSqrLen4 
    cmp al,3
    je setSqrLen8
    cmp al,4
    je setSqrLen16
    cmp al,5
    je setSqrLen32
    cmp al,6
    je setSqrLen64
    cmp al,7
    je setSqrLen128
    
    ; Invalid Input Handling
    GOTOXY 27,12
    printString invalidInpt
    call DrawSquare
    
    ; Storing the contents of al in drSqrLen by taking 2^N (Shift Left)
    setSqrLen2:
        call procsetSqrLen2
        jmp printSquare
        
    setSqrLen4:         
        call procsetSqrLen4
        jmp printSquare
        
    setSqrLen8:  
        call procsetSqrLen8    
        jmp printSquare
        
    setSqrLen16:    
        call procsetSqrLen16
        jmp printSquare
        
    setSqrLen32:   
        call procsetSqrLen32
        jmp printSquare
                       
    setSqrLen64: 
        call procsetSqrLen64
        jmp printSquare
        
    setSqrLen128:              
        call procsetSqrLen128 
        jmp printSquare
           
    ; Drawing Square Logic
    printSquare:
        call graphicsModeON; First Opening the Graphics Mode 
        DrawRectSqr drSqrLen,drSqrLen,drSqrPxlClr   ; Calling the macro
        
        call graphicsModeOFF    ; Reopening the text mode
        call ShapeBuilderMode   ; Returning back to the shape buildermode    
        ret
    
    ret
    DrawSquare endp

;-----------------------------------------------------------------------------------------------------------------
;                                           Procedure for Draw Rectangle                                                                                    
;-----------------------------------------------------------------------------------------------------------------
DrawRectangle proc
    call pixelColorScreen
    
    ; Storing the pixel color for drawing rectangle
    mov al,pixelClrShp
    mov drRectPxlClr,al
    mov pixelClrShp,15  ; setting it to its default value
    
    ; After Storing color asking dimensions
    ; text color for draw rect screen
    textColor 15
    
    ; Setting Cursor Position  x,y col,row
    GOTOXY 0,6
    printLine 205,40
    
    ; Printing Sqr Msgs and Line
    GOTOXY 3,8
    printString drRectMsg1
    
    GOTOXY 3,10
    printString drRectMsg2
    
    GOTOXY 0,16
    printLine 205,40
    
    ; calling echo input interrupt proc
    GOTOXY 3,12 
    printString drRectMsg3
    
    GOTOXY 3,14
    printString drRectMsg4
    
    GOTOXY 27,12 
    call echoInpt
    
    AND ax,11CFh ; getting number
    
    
    ; Checking range 1 - 7
    cmp al,1
    je setRectLen2
    cmp al,2
    je setRectLen4 
    cmp al,3
    je setRectLen8
    cmp al,4
    je setRectLen16
    cmp al,5
    je setRectLen32
    cmp al,6
    je setRectLen64
    cmp al,7
    je setRectLen128
    
    Rect_Invalid:
        ; Invalid Input Handling
        GOTOXY 27,12
        printString invalidInpt
        call DrawRectangle
    

    ; Storing the contents of al in drSqrLen by taking 2^N (Shift Left)
    setRectLen2:
        call procsetRectLen2
        jmp printRect
        
    setRectLen4:         
        call procsetRectLen4
        jmp printRect
        
    setRectLen8:  
        call procsetRectLen8    
        jmp printRect
        
    setRectLen16:    
        call procsetRectLen16
        jmp printRect
        
    setRectLen32:   
        call procsetRectLen32
        jmp printRect
                       
    setRectLen64: 
        call procsetRectLen64
        jmp printRect
        
    setRectLen128:              
        call procsetRectLen128 
        jmp printRect
           
    ; Drawing Square Logic
    printRect:
        call graphicsModeON; First Opening the Graphics Mode 
        DrawRectSqr drRectLen,drRectWidt,drRectPxlClr   ; Calling the macro
        
        call graphicsModeOFF    ; Reopening the text mode
        call ShapeBuilderMode   ; Returning back to the shape buildermode    
        ret
    
    ret
    DrawRectangle endp



;-----------------------------------------------------------------------------------------------------------------
;                                            Procedure for Draw Circle                                 
;-----------------------------------------------------------------------------------------------------------------
DrawCircle proc
    call pixelColorScreen
    
    ; Storing the pixel color for drawing circle
    mov al,pixelClrShp
    mov drCirPxlClr,al
    mov pixelClrShp,15  ; setting it to its default value
    
    ; After Storing color asking dimensions
    ; text color for draw circle screen
    textColor 15
    
    ; Setting Cursor Position  x,y col,row
    GOTOXY 0,6
    printLine 205,40
    
    ; Printing Sqr Msgs and Line
    GOTOXY 3,8
    printString drCirMsg1
    
    GOTOXY 3,10
    printString drCirMsg2
    
    GOTOXY 0,14
    printLine 205,40
    
    ; calling echo input interrupt proc
    GOTOXY 3,12 
    printString drCirMsg3
    
    GOTOXY 27,12 
    call echoInpt
    
    AND ax,11CFh ; getting number
    
    ; Checking range 1 - 6
    cmp al,1
    je setCirRad10
    cmp al,2
    je setCirRad20 
    cmp al,3
    je setCirRad30
    cmp al,4
    je setCirRad40
    cmp al,5
    je setCirRad50
    cmp al,6
    je setCirRad60
    
    ; Invalid Input Handling
    GOTOXY 27,12
    printString invalidInpt
    call DrawCircle
    
    ; Storing the contents of al in drSqrLen by taking 2^N (Shift Left)
    setCirRad10:
        call procsetCirRad10
        jmp printCircle
        
    setCirRad20:         
        call procsetCirRad20
        jmp printCircle
        
    setCirRad30:  
        call procsetCirRad30    
        jmp printCircle
        
    setCirRad40:    
        call procsetCirRad40
        jmp printCircle
        
    setCirRad50:   
        call procsetCirRad50
        jmp printCircle
                       
    setCirRad60: 
        call procsetCirRad60
        jmp printCircle
        
    ; Drawing Circle Logic
    printCircle:
        call graphicsModeON; First Opening the Graphics Mode 
        paintCircle drCirX,drCirY,drCirRad,drCirPxlClr   ; Calling the macro
        
        call graphicsModeOFF    ; Reopening the text mode
        call ShapeBuilderMode   ; Returning back to the shape buildermode    
        ret
    
    
    ret
    DrawCircle endp

;-----------------------------------------------------------------------------------------------------------------
;                                            Procedure for Draw Triangle                                                                                       
;-----------------------------------------------------------------------------------------------------------------
DrawTriangle proc
    call pixelColorScreen
    
    ; Storing the pixel color for drawing triangle
    mov al,pixelClrShp
    mov drTriPxlClr,al
    mov pixelClrShp,15  ; setting it to its default value
    
    ; After Storing color asking dimensions
    ; text color for draw square screen
    textColor 15
    
    
    ; Drawing Square Logic
    
    call graphicsModeON; First Opening the Graphics Mode 
    printtriangle drTriPxlClr   ; Calling the macro
        
    call graphicsModeOFF    ; Reopening the text mode
    call ShapeBuilderMode   ; Returning back to the shape buildermode    
    ret
    
    ret
    DrawTriangle endp


;-----------------------------------------------------------------------------------------------------------------
;                                           Procedure for Exiting Program
;-----------------------------------------------------------------------------------------------------------------
ExitProgram proc
    ; text color for loading screen
    textColor 11
    ; Setting Cursor Position  x,y
    GOTOXY 3,6
    
    ; Printing Exit Msg and Line
    printString extMsg1
     
    GOTOXY 3,7 
    
    
    printString extMsg2
    
    GOTOXY 3,9
    
    printLineSL 219,35
    
    GOTOXY 3,12
    
    printString extMsg3
    
    GOTOXY 3,13
    
    ; calling non echo interrupt proc
    call nonEchoInpt
    
    textColor 15
    ; exiting program 
    jmp END_MAIN
    
    ret
    ExitProgram endp
             
;-----------------------------------------------------------------------------------------------------------------
;                                           Procedure for Printing Pixel 
;-----------------------------------------------------------------------------------------------------------------             
putPixel proc
    mov ah,0Ch
    mov al,15
    int 10h
    dec cx
    int 10h
    inc dx
    int 10h
    inc cx
    int 10h
    ret
    putPixel endp 

;-----------------------------------------------------------------------------------------------------------------
;                                           Procedure for Unhiding Cursor 
;-----------------------------------------------------------------------------------------------------------------
showCursor proc
    mov ax,1
    int 33h
    ret
    showCursor endp

;-----------------------------------------------------------------------------------------------------------------
;                                           Procedure for hiding Cursor 
;-----------------------------------------------------------------------------------------------------------------
hideCursor proc
    mov ax,2
    int 33h
    ret
    hideCursor endp

;-------------------
DrawCross proc
    printString drModX

    ret
    DrawCross endp
    

;----------------------
checkDXPixels proc
    
    cmp dx,0001h
    je CHECKDX
    cmp dx,0002h
    je CHECKDX
    cmp dx,0003h
    je CHECKDX
    cmp dx,0004h
    je CHECKDX
    cmp dx,0005h
    je CHECKDX
    cmp dx,0006h
    je CHECKDX
    ret
    
    CHECKDX:
        call hideCursor
    
    ret
    checkDXPixels endp
    

;----------
checkPixels proc
    cmp dx,0001h
    je CHECKCX
    cmp dx,0002h
    je CHECKCX
    cmp dx,0003h
    je CHECKCX
    cmp dx,0004h
    je CHECKCX
    cmp dx,0005h
    je CHECKCX
    cmp dx,0006h
    je CHECKCX
    ret
    
    CHECKCX:
        ;call hideCursor
        cmp cx,0001h
        je ENDDRAW
        cmp cx,0002h
        je ENDDRAW
        cmp cx,0003h
        je ENDDRAW
        cmp cx,0004h
        je ENDDRAW
        cmp cx,0005h
        je ENDDRAW  
        
        jmp ENDCHECKPXL
        
    ENDDRAW:
    call graphicsModeOFF
    call mainMenu
    
    ENDCHECKPXL:
    ret
    checkPixels endp

;-----------------------------------------------------------------------------------------------------------------
;                                           Procedure for Draw Mode 
;-----------------------------------------------------------------------------------------------------------------
DrawMode proc
    ; setting textColor to white
    textColor 15
    
    ; setting video mode to 40x25 Graphics Mode 
    mov ah,0
    mov al,12h
    int 10h
    
    call DrawCross
    
    DrawUntil:
        call showCursor
        mov ax,3    ; BIOS Command for checking cursor position in cx,dx and bl for button status
        int 33h
        
        call checkDXPixels
        
        cmp bl,1
        jne DrawUntil
        
        call checkPixels
            
        
        call putPixel
        jmp DrawUntil
    
    ret
    DrawMode endp

;-----------------------------------------------------------------------------------------------------------------
;                                   Procedure for Shape Builder Mode Menu 
;-----------------------------------------------------------------------------------------------------------------
ShapeBuilderMode proc
    ; Text Color for Main Menu Screen
    textColor 15
    
    GOTOXY 0,0   ; col,row -> y,x
    ; calling printline proc
    printLine 205,40
    
    ; printing title
    GOTOXY 10,2   ; -> col,row
    
    ; main title
    printString shpTitle
    
    GOTOXY 0,4   ; col,row -> y,x
    printLine 205,40
    
    ; Menu Options
    GOTOXY 1,6
    printString shpOp1   ; square
    
    GOTOXY 1,8
    printString shpOp2   ; rectangle
    
    GOTOXY 1,10
    printString shpOp3   ; circle
    
    GOTOXY 1,12
    printString shpOp4   ; triangle
    
    GOTOXY 1,14
    printString shpOp5
    
    ; Printine line at end of options for asking option input
    GOTOXY 0,16
    printLine 95,40
    
    ; Asking for input
    GOTOXY 1,18
    printString optInpt
    
    call echoInpt
    
    AND ax,11CFh  ; Masking AL bits with CFh, as input was in ASCII
    
    ; checking what user has inputted
    cmp al,1
    je callDrawSquare     ;if al = 1
    cmp al,2
    je callDrawRectangle  ;if al = 2
    cmp al,3
    je callDrawCircle     ;if al = 3
    cmp al,4
    je callDrawTriangle   ;if al = 4
    cmp al,5
    je callmainMenu        ;if al = 5
    
    ; if no value matches then 
    GOTOXY 1,20
    printString invalidInpt
    jmp ShapeBuilderMode
    
    callDrawSquare:
        call DrawSquare
    callDrawRectangle:
        call DrawRectangle
    callDrawCircle:
        call DrawCircle
    callDrawTriangle:
        call DrawTriangle
    callmainMenu:
        call mainMenu
    
    ret
    ShapeBuilderMode endp
    


;-----------------------------------------------------------------------------------------------------------------
;                                       Procedure for loading screen display 
;-----------------------------------------------------------------------------------------------------------------
loadingScreen proc
    
    ; text color for loading screen
    textColor 10
    ; Setting Cursor Position  x,y
    GOTOXY 3,6
    
    ; Printing Loading Msgs and Line
    printString loadingMsg1
     
    GOTOXY 3,7 
    
    
    printString loadingMsg2
    
    GOTOXY 3,9
    
    printLineSL 219,35
    
    GOTOXY 3,12
    
    printString loadingMsg3
    
    GOTOXY 3,13
    
    ; calling non echo interrupt proc
    call nonEchoInpt
    
     
    ret
    loadingScreen endp   


;-----------------------------------------------------------------------------------------------------------------
;                                               Credit Screen Procedure
;-----------------------------------------------------------------------------------------------------------------
creditScreen proc
    
    ; text color for credit screen
    textColor 15
    
    ; Printing Line
    GOTOXY 0,0    ; -> col,row  x,y 
    printLine 205,40
    
    ; Welcome msg
    GOTOXY 15,2 ; x,y col,row
    printString crdMsg0
    GOTOXY 23,2
    printString crdMsg1
    
    ; title
    GOTOXY 14,4
    printString titleMsg
    
    ; Printing Line
    GOTOXY 0,6    ; -> col,row  x,y 
    printLine 205,40
    
    ; Printing Credits 
    ; Software Developer Team Title
    GOTOXY 3,8
    printString crdMsg2
    
    GOTOXY 0,9
    printLine 95,40
    
    ; Names + IDs
    GOTOXY 1,11
    printString crdMsg3_1
    
    GOTOXY 25,11
    printString crdMsg3_2
    
    GOTOXY 1,12
    printString crdMsg4_1
    
    GOTOXY 25,12
    printString crdMsg4_2
    
    GOTOXY 1,13
    printString crdMsg5_1
    
    GOTOXY 25,13
    printString crdMsg5_2
    
    ; Project Supervisor Title
    
    GOTOXY 0,14
    printLine 95,40
    
    GOTOXY 3,16
    printString crdMsg6
    
    GOTOXY 0,17
    printLine 95,40
    
    GOTOXY 1,19
    printString crdMsg7
     
    GOTOXY 0,21
    printLine 205,40
    
    ; Next Screen Load Interrupt
    GOTOXY 2,22
    printString crdMsg8
    
    ; mov ah,6 ; int 16h
    call nonEchoInpt
    
    
    ret
    creditScreen endp


draw_mode proc
    call DrawMode
 
;-----------------------------------------------------------------------------------------------------------------
;                                   Procedure for printing main menu on screen
;-----------------------------------------------------------------------------------------------------------------
mainMenu proc
    
    ; Text Color for Main Menu Screen
    textColor 15
    
    GOTOXY 0,0   ; col,row -> y,x
    ; calling printline proc
    printLine 205,40
    ; printing title
    GOTOXY 13,2   ; col,row -> y,x
    
    ; main title
    printString titleMsg
    
    GOTOXY 0,4   ; col,row -> y,x
    printLine 205,40
    
    ; Menu Options
    GOTOXY 1,6
    printString menuOp1
    
    GOTOXY 1,8
    printString menuOp2
    
    GOTOXY 1,10
    printString menuOp3
    
    ; Printine line at end of options for asking option input
    GOTOXY 0,12
    printLine 95,40
    
    ; Asking for input
    GOTOXY 1,14
    printString optInpt
    
    call echoInpt
    
    AND ax,11CFh  ; Masking AL bits with CFh as input was in ASCII
    
    
    
    ; OR Conditions for checking if user pressed 1 or 2 or 3
    cmp al,1
    je callDrawMode         ; if al = 1
    cmp al,2
    je callShapeBuilderMode ; if al = 2
    cmp al,3 
    je callExitProgram      ; if al = 3
    
    ; if the input is not of the following options then printing invalid input and asking input again
    GOTOXY 1,16
    printString invalidInpt
    jmp mainMenu
    
    callDrawMode:
        call DrawMode
    callShapeBuilderMode:
        call ShapeBuilderMode
    callExitProgram:
        call ExitProgram    
    
    ret
    mainMenu endp


;-----------------------------------------------------------------------------------------------------------------
;                                              Start Procedure
;-----------------------------------------------------------------------------------------------------------------
start proc
    ; credit screen
    call creditScreen
    
    ; loading screen
    call loadingScreen
    
    ; main menu screen
    call mainMenu
    
     
    ret
    start endp   



;-----------------------------------------------------------------------------------------------------------------
;                              Main Procedure -> Program Execution like int main() 
;-----------------------------------------------------------------------------------------------------------------
main proc
    
    ; Loading Data Segment Address
    mov ax,@Data
    mov ds,ax
    
    ; setting text mode to : 40x25 Chars TextMode
    mov ah,0
    mov al,1
    int 10h
    
    ; Calling Main Menu Procedure
    call start 
    
    
    ; Ending Program
    END_MAIN:
        mov ah,4Ch
        int 21h
        main endp

    
end main  
;-----------------------------------------------------------------------------------------------------------------