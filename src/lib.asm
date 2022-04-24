.8086						
.model small
.stack 100h
;-------------------------------------------------------- CONSTANTES --------------------------------------------------------
;colores letra solamente
NEGRO EQU 00h 
AZUL EQU 01h
VERDE EQU 02h
CYAN EQU 03h
ROJO EQU 04h
MAGENTA EQU 05h         
MARRON EQU 06h
GRISESITO EQU 07h                       ;COLORES PARA USAR EN IMPRIMIR CON COLOR
GRIS EQU 08h							; SE ENVIAN COMO PARAMETRO EN BX, HAY QUE COPIAR EN EL MAIN QUE COLOR QUERES
AZULCITO EQU 09h
VERDECITO EQU 0Ah
CYANCITO EQU 0Bh
COLORADITO EQU 0Ch    
MAGENTITA EQU 0Dh
AMARILLO EQU 0Eh
BLANCO EQU 0Fh
;titilan con color letra solamente             
NEGROt EQU 80h
AZULt EQU 81h
VERDEt EQU 82h
CYANt EQU 83h
ROJOt EQU 84h
MAGENTAt EQU 85h
MARRONt EQU 86h
GRISESITOt EQU 87h                       ;COLORES PARA USAR EN  IMPRIMIR CON COLOR
GRISt EQU 88h							; SE ENVIAN COMO PARAMETRO EN BX, HAY QUE COPIAR EN EL MAIN QUE COLOR QUERES
AZULCITOt EQU 89h
VERDECITOt EQU 8Ah
CYANCITOt EQU 8Bh
COLORADITOt EQU 8Ch
MAGENTITAt EQU 8Dh
AMARILLOt EQU 8Eh
BLANCOt EQU 8Fh
;-------------------------------------------------------- VARIABLES --------------------------------------------------------
.data
include var.inc

	varmenu db 0c9h,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0bbh,0dh,0ah,24h
			db 0bah,"                              MENU                              ",0bah,0dh,0ah,24h 
			db 0bah,"              Ingrese la opcion que desea ejecutar              ",0bah,0dh,0Ah,24h
			db 0cch,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0b9h,0dh,0ah,24h
			db 0bah,"     1: Suma de 2 nros Decimales (16 bits)                      ",0bah,0dh,0Ah,24h
			db 0bah,"     2:Conversión de Nros HEX a BIN                             ",0bah,0dh,0Ah,24h
			db 0bah,"     3:Busqueda de un caracter en una cadena y cuenta del mismo ",0bah,0dh,0Ah,24h
			db 0bah,"     4:Pasar una cadena de texto a mayusculas                   ",0bah,0dh,0Ah,24h
			;db 0bah,"     5:                                                         ",0bah,0dh,0Ah,24h
			;db 0bah,"     6:                                                         ",0bah,0dh,0Ah,24h
			;db 0bah,"     7:                                                         ",0bah,0dh,0Ah,24h
			;db 0bah,"     8:                                                         ",0bah,0dh,0Ah,24h
			;db 0bah,"     9:                                                         ",0bah,0dh,0Ah,24h
			db 0bah,"     0:  Salir                                                  ",0bah,0dh,0Ah,24h
			db 0c8h,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0bch,0dh,0ah,24h,24h
	
	errorMenu db "Error: no ha ingresado una opcion valida. Porfavor vuelva a ingresarla.",0dh,0ah,24h	; Funcion menu
	op db 1 dup (24h),24h 									
	errorbinario db "Error: No ha ingresado un 1 o un 0, solo cargamos binarios.",0dh,0Ah,24h 	; Funcion leerB
	NoesNum db "Error: no ha ingreso un dato valido, intente nuevamente",24h 					; Funcion LeerNum/LeerNumH
	fueraRango db "Error: fuera de rango, es de 000 hasta 255",24h
	fueraRango16 db "Error: fuera de rango, es de 00000 hasta 65535",24h
	unoB db "1",24h 																				; Funcion imprimirBinario
	ceroB db "0",24h
																				; Se usa en pushTodo y popTodo
;----------------------------------------------------VARIABLE PARA EL JUEGO------------------------------------------------------

;ESTAS NO SE VAN A USAR PORQUE VAMOS A HACER UN INCLUDE DEL ARCHIVO CON TODAS LAS VARIABLES.

;------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------- CODIGO --------------------------------------------------------
.code
; Menu
	public menu
; Auxiliares
	public pushTodo 	; Anda
	public PopTodo 		; Anda
; Conversores
	public asciiToReg 	; Anda
	public regToAscii 	; Anda
	public hAsciiToReg 	; Anda
	public regToAsciiH  ; en prueba
	public bAsciiToReg	; Parece que anda, habria que probarla bien
	public regToAsciiB 	; Parece que anda, habria que probarla bien
; Lectura
	public leer  		;ANDA
	public leerNum		;ANDA
	public leerNumH     ; ANDA, ya la probe bien
	public leerNumB		;ANDA
; Impresion 
	public imprimir         ;SI NO ANDA ESTA ES PORQUE YA NO SABEMOS PROGRAMAR
	public imprimirSalto    ;ANDA
	public imprimirBinario	;ANDA EN 8 BITS Y ES COMO SI FUERA UN regToAscii DE BINARIO SOLO QUE NO LO GUARDA, IMPRIME
	public ImprimirConColor ; ANDA RE LINDOOOOO :). La modifique un toque porque habia cosas de mas pero mantiene su esencia (?
; Cadenas y vectores
	public len 	 		; Anda 
	public ceros 		;Revisar
	public contador		;anda
	public modificador  ;anda
	public invertir		;anda
	public ToUpper     	;anda re bien
	public toLower      ;anda
	public contpalita	;anda
	public ordenar      ;anda
	;-------FUNCIONES ESPECIFICAS DEL JUEGO -----------------------------
	public random		;anda
	public posCursor    ;en prueba
	public ModoGrafico   ;anda
	public clear  		 ;anda solo para modo video ya que tiene fondo gris como predeterminado
	public ModoVideo	;anda cambia a modo video 320x200
	public Delay    
	public pantallaColor  ;de aca para abajo corroborarlas
	public cambiarColor    ;anda
	public	pixelColor		;anda
	public	leerPixel		;anda
	public impImagen
	public OpenFile
    public ReadHeader
    public ReadPalette
    public CopyPal
    public CopyBitmap
	public clearrosa
	public impPPT
	public leerScancode
	public selec_maquina
	public usVSmaq
	public impScore
	public delayTrans
	public cuentaRegresiva
	public Clearscreen
	public easterEgg
	public vaciarBuffer
		;ABRO EL ARCHIVO 
    ;public OpenFile1
    ;public ReadHeader1
    
;	No hace falta poner el main pero la libreria en vez de terminar con 'end main' termina con 'end'
;-------------------------------------------------------- FUNCIONES ----------------------------------------------------------------------

;-----------------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 		Imprime un menu. Pide que se ingrese un numero en un rango especifico 
;					(depende de las opciones) el numero esta fuera del rango vuelve a pedir que se ingreses otro,
;					al salir de esta funcion hay que saltar a donde quieras

;	Recibe: 		BX: Offset de la variable donde empieza el menu. Todas las variables del menu tienen que finalizar con 24h y
;					la ultima con 24h,24h

;	Devuelve: 		DX: El valor a comparar para saltar a la opcion requerida 
;-----------------------------------------------------------------------------------------------------------------------------------------
menu proc
			push ax
			push bx
			push cx
			push di
			push si
			pushf
			lea bx,varMenu 				; Esto hay que sacarlo despues y mandar el menu desde el main como parametro en BX ;;;;;;;;;,

			xor cx,cx 					; Limpio cl para usarlo como contador  lineas imprime. De ahi saco cuantas opciones hay

	impOp:	inc cl 						; Cuento cuantas lineas imprime. De ahi saco cuantas opciones hay

			call len 
			mov si,dx 					; Muevo el largo de la variable a SI para pasarlo como parametro
			add si,1 					; Para que se saltee el 24h

			mov dx,bx 					; Muevo el offset a DX para pasarlo como parametro			
			push bx
			mov bx, CYAN
			call ImprimirConColor
			pop bx 						; Recupero el offset de la cadena
			
			add bx,si 					; Para que pase a la siguiente variable
			cmp byte ptr [bx],24h 		; Me paro en la siguiente posicion de lo ultimo que imprimio, si es 24h ya no hay mas para imprimir
			jne impOp

			sub cl,6 					; A la cant de lineas le resto la cant de lineas del titulo,los bordes y la op. 0. Esto me da la cant de opciones
			add cl,30h 					; Convierto a ascii

	leerop:	mov ah,1 					
			int 21h
			cmp al,34h
			jg cErrorMenu
			cmp al,31h
			jl cErrorMenu
			xor dx,dx
			mov dl,al
			xor ax,ax
			jmp finmenu

cErrorMenu:	call imprimirSalto

			mov dx,offset errorMenu
			mov bx,ROJOt
			call imprimirConColor
			xor dx,dx
			jmp leerop

finmenu: 	popf
			pop si
			pop di
			pop cx
			pop bx
			pop ax 
			ret
menu endp 

;---------------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 		Pushea todo, registros y flags (Se usa con <PopTodo>). Sirve solo si no devuelve registros
;	
;	Recibe: 		Nada
;
;	Devuelve:		Nada
;											Si llego a trabajar con el stack tengo que ver que onda con esto
;---------------------------------------------------------------------------------------------------------------------------------------
pushTodo proc
		pop algo 			; Saco del stack la direccion a la que tiene que retornar la funcion
		push ax
		push bx
		push cx 
		push di 
		push dx
		push si
		pushf
		push algo 			; Devuelvo al stack la dirrecion. De esta manera puedo dejar pusheado todos los registros y la funcion vuelve a donde tiene que volver
		ret
pushTodo endp

;---------------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 		Popea todo, registros y flags (Se usa con <PushTdo>)
;	Recibe: 		Nada
;	Devuelve:		Nada
;---------------------------------------------------------------------------------------------------------------------------------------
popTodo proc
		pop algo
		popf
		pop si
		pop dx
		pop di 
		pop cx
		pop bx
		pop ax
		push algo
		ret
popTodo endp

;---------------------------------------------------------------------------------------------------------------------------
;	Funcion:  		Lee un numero binario de la cantidad de digitos que quieras 
;	
;	Recibe: 		Bx: el offset de la variable a guardar	
;					Cx: limite de carga (si vas a cargar un binario de 8 mov a cx,8 )
;
;	Devuelve: 		NADA, solo guarda en la variable var db dup "aca va el limite"(24h),24h
;--------------------------------------------------------------------------------------------------------------------------
leerNumB proc
	pushf
	push ax
iniciob:
	push bx	
	push cx	
	mov si, bx            ; en cx ya deberia tener la cantidad de veces que tengo que leer	
leerb:
	mov ah,1
	int 21h
	cmp al,30h
	je guardar
	cmp al, 31h
	je guardar
	jmp errorb
guardar:
	mov [bx],al
	inc bx
loop leerb
jmp finb
errorb:
	call imprimirSalto
	mov ah,9
	mov dx,offset errorbinario
	mov bx,ROJOt
	call ImprimirConColor
	pop cx
	pop bx

	jmp iniciob

finb:	
	pop cx
	pop bx
	pop ax
	popf
ret
leerNumB endp

;---------------------------------------------------------------------------------------------------------------
;	Funcion: 		-cambia de color la variable que vas a imprimir, dentro de la misma llama a imprimir para no tener
;				  	que llamar a la impresion luego de cambiar el color, (NO LLAMAR A IMPRESION LA IMPRESION ESTA ACA ADENTRO)
;	
;	Recibe:     	-Offset de la variabla a imprimir en DX
;	            	- color en BX, bh = 0 (pagina), bl color y/o fondo y/o titilar
;	
;	Devuelve:   	Nada, solo cambia el color de tu variable texto ascii y la imprime
;---------------------------------------------------------------------------------------------------------------------	
ImprimirConColor proc
	call pushtodo
		push dx 		; Guardo el inicio de la cadena para despues imprimirlo

		push bx 		; Guardo el color que se paso por registro para poder usar la funcion len
		mov bx,dx 		; Muevo el offset de la cadena a bx para pasarlo como parametro
		call len 		; Devuelve en dx el largo de la cadena
		pop bx 			; Recupero el color
		mov ah,9     	; Imprimir caracter con atributo
		mov al,' ' 		; Codigo del cracter a escribir. Cuando llame a imprimir se va a escibir sobre esto
		mov bh,0		; Pagina en la que se impime
		mov cx,dx 		; Cantidad de veces que se imprime el caracter 
		int 10h

    	pop dx
		call imprimir  
	
	call popTodo   		

	ret
ImprimirConColor endp

;----------------------------------------------------------------------------------------------------------
;	Funcion: 			Lee una cadena hasta ingresar un enter
;	Recibe: 			BX: Offset de la variable donde se va a guardar la cadena
;	Devuelve:		 	Nada
;---------------------------------------------------------------------------------------------------------
leer proc
		call pushTodo

	lee:mov ah,01h
		int 21h

		cmp al, 0dh 		; Comparo con enter
		je finLeer
		mov byte ptr[bx],al 
		inc bx
		jmp lee

	finLeer:call popTodo
		ret
leer endp

;----------------------------------------------------------------------------------------------------------
;	Funcion: 		Leer un numero desde 1 caracater hasta 5 maximo (rango de 0 hasta 65535)
;	
;	Recibe:  		BX offset de la variable
;	
;	Devuelve: 		Nada solo guarda el valor el la variable 
;
;						var db |1,2,3,4,5| dup ("0"),24h    
;						esto es depende el numero que vayas a cargar
;---------------------------------------------------------------------------------------------------------
leerNum proc 					; La quise hacer super general y termino siendo un bardo esta funcion
		call pushTodo
	

		mov si,bx    				; Guardo el offset de la variable

		call len 					; El offset de la variable ya esta en DX
		mov cx,dx  			
		cmp dx,5 			
		jl lectura 				
		
		maxLenD: mov cx,5    		; No deja cargar mas de 5 numeros (16 bits en registro) aunque la variable sea mas grande

lectura:mov ah,1
		int 21h		

		cmp al,0dh 					; Comparo con enter
		je termine

		cmp al,30h
		jl	errorNumD
		cmp al,39h
		jg	errorNumD
		mov [bx],al
		inc bx
		loop lectura 				; Lee tantas veces como el largo de la variable (Si no se ingreso enter antes)
		jmp termine

errorNumD:
		call imprimirSalto 						
		push dx
		mov dx, offset NoesNum
		mov bx, ROJOt
		call ImprimirConColor
		pop dx
		
		mov bx,si
		call imprimirSalto 
		mov cx,dx
		jmp lectura
			
termine:mov byte ptr [bx],24h 		; Guardo un 24h despues de la ultima posicion ingresada
		cmp dx,3 					; Si es 3 es porque estoy trabajando en 8 bits
		je rango8
		cmp dx,5
		je rango16
		jne auxD ;finLeerD 				
		mov bx,si 					; Recupero la primera posicion de la variable
		cmp byte ptr [bx],24h		; Si en la primera posicion hay un 24h es porque se ingreso un enter sin ingresar un numero
		je errorNumD

rango8:	mov bx,si 			; Recupero el offset de mi variable
		call len
		cmp dx,3 			; Si sigue siendo 3 es porque se ingresaron los 3 numeros y me tengo que fijar que este dentro del rango.   Si es 6 tengo que checkear que el numero sea menor a 65535 ;;;;;;;;;;;;;
		jne finLeerD 		; Menos de 8 bits, todo bien
		                
		cmp byte ptr[bx], 32h   ;comparo si es un 32h ya que trabajo hasta 255
		jl finLeerD 			;;; Si es menor esta todo bien, si es mayor me pase y si es igual sigo viendo
		;cmp byte ptr[bx], 32h
		jg mePase
		cmp byte ptr[bx+1],35h
		jl finLeerD 			;;
		;cmp byte ptr[bx+1],35h
		jg mePase
		cmp byte ptr[bx+2],35h
		jg mePase
		jmp finLeerD
mePase:
		call imprimirSalto
		mov dx, offset fueraRango
		mov bx, ROJOt
		call ImprimirConColor
	
		call imprimirSalto
		xor cx,cx
		mov cx,3
		mov dx,3

		mov bx,si
		jmp lectura

		jmp finLeerD

rango16:mov bx,si 			; Recupero el offset de mi variable
		cmp byte ptr[si], 36h   ;comparo si es un 36h ya que trabajo hasta 65535
		jl finLeerD
		jg mePase16
		cmp byte ptr[si+1],35h
		jl finLeerD
		jg mePase16
		cmp byte ptr[si+2],35h
		jl finLeerD
		jg mePase16
		cmp byte ptr[si+3],33h
		jl finLeerD
		jg mePase16
		cmp byte ptr[si+4],35h
		jg mePase16
auxD:	jmp finLeerD
	mePase16:
		call imprimirSalto
		mov dx, offset fueraRango16     ;imprimo cartel de fuera de rango 
		mov bx, ROJOt
		call ImprimirConColor
		
		mov bx, si                     ;recupero mi offset 
		call imprimirSalto
		xor cx,cx
		mov cx,5
		mov dx,5
		jmp lectura

finLeerD:
		call popTodo
		ret
leerNum endp

;----------------------------------------------------------------------------------------------------------
;	Funcion: 				Imprime un salto de linea
;	
;	Recibe: 				Nada
;	
;	Devuelve:			 	Nada
;----------------------------------------------------------------------------------------------------------
imprimirSalto proc
		call pushTodo

		mov ah,02h
		mov dx,0dh 				; Imprimo el enter
		int 21h
		mov ah,02h
		mov dx,0ah 				; Retorno el carro
		int 21h
		
		call popTodo
		ret
imprimirSalto endp

;----------------------------------------------------------------------------------------------------------
;	Funcion: 		Imprime hasta encontrar un 24h
;	
;	Recibe: 		DX: Offset de la variable a imprimir
;	
;	Devuelve:	 	Nada
;----------------------------------------------------------------------------------------------------
imprimir proc 
			call pushTodo

			mov ah,09h
			int 21h

			call popTodo
			ret
imprimir endp	

;-----------------------------------------------------------------------------------------------------------------------
;	Funcion: 		Imprime el numero en binario del registro pasado
;
;	Recibe: 		Bx: numero a imprimir
;	
;	DEVUELVE: NADA
;
;	SOLO SIRVE SI QUERES IMPRIMIR UN TEXTO EN BINARIO solo para eso NO LA USES PARA OTRA COSA
;	NO HAY VARIABLE SOLO LE DAS UN REGISTRO E IMPRIME ESE REGISRTRO BINARIO EN ASCII	
;---------------------------------------------------------------------------------------------------------------
imprimirBinario proc
	
	call pushTodo

		mov al,byte ptr[bx]
		mov bh, al	
		mov cx,8
shiftear:
		shl bh,1
		jc esUno
esCero:
		mov ah,9
		mov dx,offset ceroB
		int 21h
loop shiftear
jmp finalizar
esUno:
	mov ah,9
	mov dx, offset unoB
	int 21h
loop shiftear
finalizar:
		call popTodo
		ret
imprimirBinario endp

;------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 		Reg to ascii hasta 16 bits
;					Convierte un numero guardado en un registro de 16 bits a numero ASCII
;	
;	Recibe: 		BX: Offset de una variable finalizada en 24h si o si. El tamaño depende del tamaño del numero a convertir, 
;						ante la duda se le puede poner 5 bytes (mas de eso no va a usar) y no pasa nada.	Ej: VAR db "00000",24h
;					DX: Numero a convertir
;	
;	Devuelve:	 	El numero ASCII en la variable que se pasa por BX
;-----------------------------------------------------------------------------------------------------------------------------
regToAscii proc 		 
			call pushTodo

			mov ax,dx 			; Lo muevo para trabajar en AX
			mov si,bx 			; Guardo la primera posicion de la variable en si
			mov cx,10			; Operador de 16 bits para usar la division de 16 bits
			call len 			; Devuelve en DX el largo de la cadena. Le mando el offset de la variable que ya lo tengo en BX
			mov di,dx 			; Muevo el largo a DI porque DX lo voy a usar en la division
			sub di,1 			; ultima posicion = largo cadena - 1
			xor dx,dx
		 	add bx,di 			; Me posiciono en el ultimo caracter de la variable con el numero ASCII
dividir:	div cx 				; Divido DX:AX por CX, el resultado queda en AX y el resto en DX
			add dx,30h 			; Convierto numero a asciiToReg
			mov byte ptr[bx],dl ; El resto queda siempre en dl. Si pongo DX me pasa 2 bytes a la memoria y hace lio
			xor dx,dx 						
			dec bx
			cmp bx,si 			; BX vale menos que SI cuando ya se recorrio toda la cadena
			jge dividir

			call popTodo
			ret
regToAscii endp

;---------------------------------------------------------------------------------------------------------------------
;	Funcion: 		Ascii to reg hasta 16 bits
; 					Convierte un numero ASCII guardado en una variable a numero y lo guarda en un registro
;	
;	Recibe: 		BX: Offset de una variable de -hasta- 5 bytes con el numero a convertir finalizada si o si en 24h  Ej: VAR db "xxxxx",24h
;	
;	Devuelve:	 	DX: El numero (posta) 
;-----------------------------------------------------------------------------------------------------------------------
AsciiToReg proc 		
		pushf	
		push ax
		push bx
		push cx
		push di
		push si

		xor ax,ax
		mov cx,10 				; Para que multiplique por 10 en 16 bits (Guardo en CX y no en CL)

		call len 				; Devuelve en DX el largo de la cadena. Le mando el offset de la variable que ya lo tengo en BX
		mov si,dx				; Lo muevo a DI porque DX lo voy a usar para otras cosas
		sub si,1 				; Posicion = largo - 1
		mov di,si
		xor dx,dx 				; En DX voy a acumular las multipliciones para transformar el ascii a registro

convD:	xor ah,ah 				; Limpio AH porque al estar trabajando con 16 bits cuando multiplico pueden quedar cosas ahi
		mov al,[bx+si]			; Muevo el digito de la variable al registro. Siempre va a ser de 8 bits porque es un caracter solo
		sub al,30h
		push di 				; Guardo la ultima posicion de la variable en el stack
		sub di,si				; di= di-si Va a indicar las veces que hay que multiplicar
		cmp di,0
		je uniD 				; Si esta en la unidad no multiplica
		push dx 				; Guardo en el stack para poder ponerlo en 0 en la multiplicacion  
loopMul:xor dx,dx 				; Limpio DX porque voy a multiplicar por 16 bits
		mul cx
		dec di
		cmp di,0
		jg loopMul 		
		pop dx 					; Recupero el valor de DX
uniD:	pop di 					; DI vuelve a valer lo que valia antes

		add dx,ax
		dec si
		cmp si,0
		jge convD

		pop si
		pop di
		pop cx
		pop bx
		pop ax
		popf
		ret
AsciiToReg endp

;----------------------------------------------------------------------------------------------------------------------------
;	Funcion: 			Hexa ascii to reg hasta 16 bits
;						Convierte un numero ascii ingresado en hexa en una variable y lo pasa a un registro
;	
;	Recibe: 			BX: Offset de una variable de hasta 4 bytes con el numero en hexa a convertir	Ej: VAR dup "0000",24h
;	
;	Devuelve:			DX: El numero (posta) 
;--------------------------------------------------------------------------------------------------------------------------
hAsciiToReg proc 			
		pushf	
		push ax
		push bx
		push cx
		push di
		push si

		xor ax,ax
		mov cx,16 				; Para que multiplique por 16 en 16 bits (Guardo en CX y no en CL)

		call len 				; Devuelve en DX el largo de la cadena. Le mando el offset de la variable que ya lo tengo en BX
		mov si,dx				; Lo muevo a DI porque DX lo voy a usar para otras cosas
		sub si,1 				; Posicion = largo - 1
		mov di,si
		xor dx,dx 				; En DX voy a acumular las multipliciones para transformar el ascii a registro

convH:	xor ah,ah 				; Limpio AH porque al estar trabajando con 16 bits cuando multiplico pueden quedar cosas ahi
		mov al,[bx+si]
		cmp al,41h 				; Lo volvi mayuscula en la caja de lectura asi que las minusculas ya las tengo en cuenta
		jl esnumH			
		sub al,7h	 			; Si es mayor a 'A' le resta 1h y despues 30h para que si es A quede 10, si es B quede 11, etc	
esnumH:	sub al,30h
		push di
		sub di,si 				; DI= DI-SI
		cmp di,0
		je uniH 	
		push dx 				; Guardo en el stack para poder ponerlo en 0 en la multiplicacion			
loopMulH:xor dx,dx
		mul cx
		dec di
		cmp di,0
		jg loopMulH
		pop dx  				; Recupero el valor de DX

uniH:	pop di 					;DI vuelve a valer lo que valia antes (La ultima posicion)	
		add dx,ax
		dec si
		cmp si,0
		jge convH

		popf
		pop si
		pop di
		pop cx
		pop bx
		pop ax
		ret
hAsciiToReg endp

;----------------------------------------------------------------------------------------------------------
;	Funcion: 			Cuenta la cantidad de caracteres hasta encontrar un 24h.
;	
;	Recibe: 			BX: Offset de la cadena
;	
;	Devuelve:			 DX: Largo de la cadena
;------------------------------------------------------------------------------------------------------------
len proc
		push bx

		xor dx,dx 				; Inicializo el contador en 0

contarC:cmp byte ptr [bx],24h
		je finLen
		inc bx
		inc dx 			
		jmp contarC

finLen:	pop bx
		ret
len endp

;----------------------------------------------------------------------------------------------------------
;	Funcion: 				Cuenta la cantidad de caracteres que coinciden.
;	
;	Recibe: 				BX: Offset de la cadena con el texto a comparar
; 							SI: Offset de la cadena con los caracteres contra los que quiere comparar
;							DI: Offset del contador
;
;	Devuelve: 				DI: la cantidad contada de cada parametro
;
;			ejemplo de variables: -SI (var db "AEIOU" ,24h) si queres contar mayus y minus llamar 2 veces
;   							   -DI (var db 0,0,0,0,0 dependiendo de la cantidad de parametros)	
;
;				hacer esto:
;								mov bx, offset (cadena de texto)
;								mov si,offset (cadena de paramtetros)
;								mov di,offset (variable de DI)
;								call contador
;								mov cx,5       este 5 depende de los parametros
;	
;							loopear:
;								mov bx,offset a
;								xor dx, dx      ; si no xoreas cuenta cualquier cosa en la primera vez
;								mov dl, byte ptr[di]
;								call regToAscii
;								inc di
;								call imprimirsalto
;
;								mov dx,offset a
;								call imprimir
;	
;							loop loopear
;------------------------------------------------------------------------------------------------------------
contador proc 					
			push ax

	inicio:	push di
			push si
			mov al,[bx]
	comp:	cmp byte ptr[si],24h
			je proximo 				; Si no hay mas caracteres a comparar pasa al proximo caracter del texto a comparar
			cmp al,[si]
			je esIgual
			inc si 					; Pasa a el siguiente caracter a comparar
			inc di 					; Se posiciona en el siguiente contador
			jmp comp
	esIgual:add byte ptr[di],01h	; Si coincide el texto con el caracter a comparar el contador incrementa en 1
	proximo:inc bx
			pop si
			pop di 					; Para que al comparar el proximo caracter si se posicione en el contador que le corresponde
			cmp byte ptr[bx],24h
			jne inicio 				; Si no es "$" sigo comparando

			pop ax
			ret
contador endp
;------------------------------------------------------------------------------------------------------------------
;	Funcion: 				Modifica una cadena cambiando caracteres.
;	
;	Recibe: 				BX: Offset de la cadena con el texto a modificar finalizada en 24h
; 							SI: Offset de la cadena con los caracteres que se quieren cambiar finalizada en 24h
;							DI: Offset de los caracteres por los que se quiere cambiar finalizada en 24h
;
;								Ej: Si se quiere cambiar las 'a' por 'x' y las 'o' por 'y'
;									SI: offset VAR1 db "ao",24h
;									DI: offset VAR2 db "xy",24h
;	
;	Devuelve:			 	BX: Offset de la cadena modificada
;----------------------------------------------------------------------------------------------------------------	
modificador proc 
			call pushTodo				

	inicioM:push di
			push si
			mov al,[bx]
	compM:	cmp byte ptr[si],24h
			je proximoM 			; Si no hay mas caracteres a modificar pasa al proximo caracter del texto
			cmp al,[si]
			je esIgualM
			inc si 					; Pasa al siguiente caracter a comparar
			inc di 					; Pasa al siguiente caracter a intercambiar 
			jmp compM
	esIgualM:mov dh,[di]
			mov [bx],dh				; Si coincide el texto con el caracter a comparar lo cambia por el que esta en DI
	proximoM:inc bx
			pop si 					; Recupero el offset para volver a empezar a comparar
			pop di 					
			cmp byte ptr[bx],24h
			jne inicioM				; Si no es "$" sigo comparando

			call popTodo
			ret
modificador endp
;------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 				Lee un numero en hexa de hasta 2 bytes (16 bits en registro)
;	
;	Recibe: 				BX: Offset de una variable finalizada en 24h si o si. El tamaño depende del tamaño del numero con el que
;								se va a trabajar, ante la duda se le puede poner 4 bytes (mas de eso no) y no pasa nada.
;								Ej: VAR db "0000",24h
;	
;	Devuelve:			 	El numero cargado en la variable en BX
;------------------------------------------------------------------------------------------------------------------------------
leerNumH proc 			
		call pushTodo
	
		mov cx,bx 				; Guardo la primera posicion

		call len 				; Devuelve en DX el largo de la cadena. Le mando el offset de la variable que ya lo tengo en BX
		mov si,dx 				; Lo paso a SI para usarlo como puntero
		sub si,1
		add si,bx 				; SI apunta a la ultima posicion de la cadena

leeH:	mov ah,01h
		int 21h

		cmp al, 0dh 			; Si ingresa un enter sale
		je finLeerH
		cmp al, 30h
		jl errorNumH
		cmp al,39h
		jle numH
		cmp al, 41h 			; A
		jl errorNumH
		cmp al, 46h				; F
		jle numH
		cmp al,61h 				; a  
		jl errorNumH
		cmp al,66h 				;f 
		jle numH
		jg errorNumH		
numH:	mov [bx],al 
		inc bx
		cmp bx,si				; Si ya no hay mas lugar en la variable sale
		jle leeH
		call imprimirSalto 		; Si llego aca es que ocupo toda la variable y no ingreso un enter asi que le mando un salto para que quede parejo
		jmp finLeerH
errorNumH:
		call imprimirSalto
		mov dx,offset NoesNum   ;Paso offset de la viariable para imprimir el cartel de error.
		mov bx,ROJOt
		call ImprimirConColor 
		call imprimirSalto
		
		mov bx,cx 				; recupero la primera posicion de la variable
		jmp leeH
		
finLeerH:
		mov byte ptr [bx],24h 	; Termino con 24h
		mov bx,cx 				; Recupero la primera posicion de la variable
		cmp byte ptr [bx],24h	; Si en la primera posicion hay un 24h es porque se ingreso un enter sin ingresar un numero
		je errorNumH
		call toUpper 			; Convierto las letras a mayuscula, para que se imprima mas prolijo y para que funcione bien el hAsciiToReg

finfinH:
		call popTodo
		ret
leerNumH endp

;---------------------------------------------------------------------------------------------------------------------
;	Funcion: 				Pone en 30h los elementos de una cadena que se encuentren entre los limites BX y SI
;	
;	Recibe: 				BX: Offset del inicio de la cadena
; 							SI; Offset del final de la cadena
;	
;	Devuelve:			 	Nada
;--------------------------------------------------------------------------------------------------------------------
ceros proc
		call pushTodo

		cmp si,bx ;;;;;
		jle finCeros

movCero:mov byte ptr [si],30h
		dec si
		cmp si,bx
		jge movCero

finCeros:call popTodo
		ret
ceros endp

;------------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 		Se le da un registro de 8/16 bits y transforma en ascii
;	
;	Recibe :		-BX el offset de la variable a imprimir
;					-DX recibe el numero(registro) a convertir en ascii
;				
;	Devuelve: 		NADA, solo te carga la variable con el texto a imprimir en hexadecimal	
;	
;	ejemplo de variable: var db (2,3,4) dup (30h),24h (puede usar 2, 3 o 4 ascii depende de los bits que quieras enviar)	
;------------------------------------------------------------------------------------------------------------------------------------
regToAsciiH proc
		
			call pushTodo

			mov ax,dx 			; Lo muevo para trabajar en AX
			mov si,bx 			; Guardo la primera posicion de la variable en si
			mov cx,16			; Operador de 16 bits para usar la division de 16 bits
			call len 			; Devuelve en DX el largo de la cadena. Le mando el offset de la variable que ya lo tengo en BX
			mov di,dx 			; Musvo el largo a DI porque DX lo voy a usar en la division
			sub di,1 			; ultima posicion = largo cadena - 1
			xor dx,dx
		 	add bx,di 			; Me posiciono en el ultimo caracter de la variable con el numero ASCII
dividirh:	div cx
			cmp dx,10			; si es un numero simplemente le sumo 30h y ya tengo mi letra ascii
			jge esletra	 		; Divido DX:AX por CX, el resultado queda en AX y el resto en DX
			add dx,30h 			; Convierto numero a ascii
			mov byte ptr[bx],dl ; El resto queda siempre en dl. Si pongo DX me pasa 2 bytes a la memoria y hace lio
			xor dx,dx 						
			dec bx
			cmp bx,si 			; BX vale menos que SI cuando ya se recorrio toda la cadena
			jge dividirh
esletra:
			add dx, 37h	
			mov byte ptr[bx],dl	;como es una letra le sumo 37 para poder llevarlo a letra ascci
			xor dx,dx 						
			dec bx
			cmp bx,si 			; BX vale menos que SI cuando ya se recorrio toda la cadena
			jge dividirh

finh:		call popTodo
			ret
regToAsciiH endp

;------------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 				Recibe una cadena de texto y a todas las letras minuscula las convierte en Mayusculas
;	
;	Recibe: 				BX: Offset de la cadena de texto a modificar
;	
;	Devuelve:				En BX la cadena modificada
;-----------------------------------------------------------------------------------------------------------------------------------
ToUpper proc 							;;;;;;;;;;, Corregir esta y toLower
		call pushTodo
inicioMinus:
		cmp byte ptr[bx],24h
		je finMinus
		cmp byte ptr[bx],60h      ; comparo si es mayor que el ascii que esta antes de la "a"
		jg casiMinus
		jmp seguirMinus				   ; si no es una letra minicula no hago nada sigo incrementado bx
casiminus:
		cmp byte ptr[bx],7bh      ;comparo si es menor que el ascii que esta despues de "z"
		jl esMinus
		jmp seguirMinus
esMinus:	
		sub byte ptr[bx],20h
seguirMinus:	
		inc bx
		jmp inicioMinus
finMinus:

		call popTodo
ret		
ToUpper endp
;------------------------------------------------------------------------------------------------------------------------------------
;	Funcion: Recibe una cadena de texto y a todas las letras Mayusculas las convierte en minuscula
;
;	Recibe: -BX el offset de la cadena de texto a modificar
;	
;	Devuelve:Nada solo te pisa la cadena de texto que enviaste por la misma cadena pero con las letras mayuscula 
;				en minuscula
;
;		ejemplo: "HOLA"  /   "hola"
;-----------------------------------------------------------------------------------------------------------------------------------
ToLower proc
	
		call pushTodo
inicioMayus:
		cmp byte ptr[bx],24h
		je finMayus
		cmp byte ptr[bx],40h      ; comparo si es mayor que el ascii que esta antes de la "a"
		jg casiMayus
		jmp seguirMayus				   ; si no es una letra minicula no hago nada sigo incrementado bx
casiMayus:
		cmp byte ptr[bx],5bh      ;comparo si es menor que el ascii que esta despues de "z"
		jl esMayus
		jmp seguirMayus
esMayus:	
		add byte ptr[bx],20h
seguirMayus:	
		inc bx
		jmp inicioMayus
finMayus:

	call popTodo
ret
ToLower endp

;-------------------------------------------------------------------------------------------------------------------------------------
;	Funcion: invierte una cadena de texto y la guarda en otra cadena de texto distinta
;
;	Recibe : -BX offset de cadena de texto que se quiere invertir
;			 -SI offset de la cadena de texto donde se guardara la cadena invertida (var db 255 dup ("$"),24h	
;
;	Devuelve: Nada solo carga la variable de SI con la cadena de texto invertida	
;--------------------------------------------------------------------------------------------------------------------------------------
invertir proc 
	
	call pushtodo
	call len 
                              
	sub dx,1
	add si,dx
               
lup: 
	mov al,byte ptr[bx]
	mov byte ptr[si],al	
	inc bx 
	dec si
	cmp bx,si
	jl lup

	call popTodo
	ret
invertir endp

;---------------------------------------------------------------------------------------------------------------------
;	Funcion: 			Ascii to reg hasta 16 bits
; 						Convierte un numero binario ASCII guardado en una variable a numero y lo guarda en un registro
;	
;	Recibe: 			BX: Offset de una variable de -hasta- 16 bytes con el numero a convertir finalizada si o si en 24h  Ej: VAR db "xx...x",24h
;	
;	Devuelve:	 		DX: El numero (posta) 
;-----------------------------------------------------------------------------------------------------------------------
bAsciiToReg proc 		
		pushf	
		push ax
		push bx
		push cx
		push di
		push si

		xor ax,ax
		mov cx,2 		; Para que multiplique por 2 en 16 bits (Guardo en CX y no en CL)

		call len 		; Devuelve en DX el largo de la cadena. Le mando el offset de la variable que ya lo tengo en BX
		mov si,dx		; Lo muevo a DI porque DX lo voy a usar para otras cosas
		sub si,1 		; Posicion = largo - 1
		mov di,si
		xor dx,dx 		; En DX voy a acumular las multipliciones para transformar el ascii a registro

convB:	xor ah,ah 		; Limpio AH porque al estar trabajando con 16 bits cuando multiplico pueden quedar cosas ahi
		mov al,[bx+si]	; Muevo el digito de la variable al registro. Siempre va a ser de 8 bits porque es un caracter solo
		sub al,30h
		push di 		; Guardo la ultima posicion de la variable en el stack
		sub di,si		; di= di-si Va a indicar las veces que hay que multiplicar
		cmp di,0
		je uniB 		; Si esta en la unidad no multiplica
		push dx 		; Guardo en el stack para poder ponerlo en 0 en la multiplicacion  
loopMulB:xor dx,dx 		; Limpio DX porque voy a multiplicar por 16 bits
		mul cx
		dec di
		cmp di,0
		jg loopMulB 		
		pop dx 			; Recupero el valor de DX
uniB:	pop di 			; DI vuelve a valer lo que valia antes

		add dx,ax
		dec si
		cmp si,0
		jge convB


		pop si
		pop di
		pop cx
		pop bx
		pop ax

		ret
bAsciiToReg endp

;------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 			Convierte un numero guardado en un registro de 16 bits a numero ASCII binario
;	
;	Recibe: 			BX: Offset de una variable finalizada en 24h si o si. El tamaño depende del tamaño del numero a convertir, 
;						ante la duda se le puede poner 5 bytes (mas de eso no va a usar) y no pasa nada.	Ej: VAR db "00000",24h
;						DX: Numero a convertir
;	
;	Devuelve:	 		El numero ASCII en la variable que se pasa por BX
;-----------------------------------------------------------------------------------------------------------------------------
regToAsciiB proc 		 
			call pushTodo

			mov ax,dx 			; Lo muevo para trabajar en AX
			mov si,bx 			; Guardo la primera posicion de la variable en si
			mov cx,2			; Operador de 16 bits para usar la division de 16 bits
			call len 			; Devuelve en DX el largo de la cadena. Le mando el offset de la variable que ya lo tengo en BX
			mov di,dx 			; Muevo el largo a DI porque DX lo voy a usar en la division
			sub di,1 			; ultima posicion = largo cadena - 1
			xor dx,dx
		 	add bx,di 			; Me posiciono en el ultimo caracter de la variable con el numero ASCII
dividirB:	div cx 				; Divido DX:AX por CX, el resultado queda en AX y el resto en DX
			add dx,30h 			; Convierto numero a ascii
			mov byte ptr[bx],dl ; El resto queda siempre en dl. Si pongo DX me pasa 2 bytes a la memoria y hace lio
			xor dx,dx 						
			dec bx
			cmp bx,si 			; BX vale menos que SI cuando ya se recorrio toda la cadena
			jge dividirB

			call popTodo
			ret
regToAsciiB endp

;---------------------------------------------------------------------------------------------------------------------------------
;	Funcion : Cuenta la cantidad de la palabras en una frase, no toma como palabra ningun caracter especial.
;	
;	Recibe : -BX el offset de la cadena a trabajar
;			 
;	Devuelve:  -Dx cantidad de palabras contadas.
;-----------------------------------------------------------------------------------------------------------------------------------
contpalita proc 
			push cx
			mov dx,0
			call ToUpper
			           
			mov cx,1                ;Esto es una bandera prendida

	arranca:

			cmp byte ptr [bx],24h
			je terminepalita
			cmp byte ptr[bx],20h
			je otracosa
			cmp byte ptr [bx],40h    ;" hola ¿como estas?"
			jg palitamayor
			jmp otracosita

	otracosa:
			mov cx,1    ;encontro un espacio 20h entonces prende la bandera
otracosita:	inc bx
			jmp arranca 


	palitamayor:
			cmp byte ptr [bx],5bh
			jl banderapala
			jmp otracosita

	banderapala:
			cmp cx,1
			je palapalabra
			inc bx
			jmp arranca

	palapalabra:
			inc dx
			inc bx
			mov cx,0
			jmp arranca

	terminepalita:
			pop cx
			ret


contpalita endp

;---------------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 			Ordena de menor a mayor una variable terminada en 24h
;	Recibe: 			BX: offset de la variable a ordenar
;	Devuelve:			Nada
;
;					si se quiere ordenar de mayor a menos llamar antes a invertir y luego a ordenar
;---------------------------------------------------------------------------------------------------------------------------------------
ordenar proc
		call pushTodo
		call len 

		mov si,bx
		add si,dx 			; final de la cadena
		dec si 				; 				

orden:	push bx
		mov dh,0 			; Inicializo bandera en 0

change:	mov al,[bx] 		; Uso AL como registro auxiliar
		cmp al,[bx+1]
		jl seguirO

		mov dl,[bx+1] 		; Uso DL como registro auxiliar
		mov [bx],dl			; Hago el intercambio
		mov [bx+1],al
		mov dh,1  			; Si la cambia de lugar una posicion pongo la bandera en 1

seguirO:inc bx
		cmp bx,si
		jl change 			; Repite hasta recorrer toda la variable. 

		pop bx 				; Recupero el offset de la variable

		cmp dh,0
		jne orden 			; Si recorrio toda la variable y no cambio nada de lugar es porque ya esta ordenado

		call popTodo
		ret
ordenar endp
;---------------------------------------------------------------------------------------------------------------------------
;	Fucion: Genera un numero aleatorio por los segundos pasados de medianoche
;	
;	Recibe: Nada
;
;	Devuelve: DX numero aleatorio generado del resto
;---------------------------------------------------------------------------------------------------------------------------
random proc

	   	push ax
		push bx
		push cx 
		push di 
		push si
		pushf

	   mov ah, 00h  ; llamamos a la interrupcion para extraer el tiempo del sistema
	   int 1Ah      ; CX:DX Guarda los segudnos despues de medianoche       

	   mov  ax, dx
	   xor  dx, dx
	   mov  cx, 3    ;ESTO CAMBIARLO SI QUERES CONSEGUIR UN RESTO MAYOR    
	   div  cx       ;el resto me queda en dx

	   popf
	   pop si
	   pop di
	   pop cx
	   pop bx
	   pop ax
	   
   
ret    
random endp
;--------------------------------------------------------------------------------------------------------------------------------
;	Funcion: limpia la pantalla   SOLO EN EL MODO VIDEO YA QUE USA UN COLOR GRIS OSCURO, hay que armar una para el modo grafico
;		
;	Recibe: Nada
;
;	Devuelve : Nada 
;--------------------------------------------------------------------------------------------------------------------------------
			;RECORDAR ARMAR OTRO CLEAR PARA EL JUEGO ASI LIMPIA PANTALLA COMO CORRESPONDE EN CADA PANTALLA DETERMINADA
clear proc
call pushTodo

MOV AX,0600H ; Peticion para limpiar pantalla
MOV BH,07H ; Color de letra ==7 "gris claro"
; Fondo ==8 "Gris oscuro"
MOV CX,0000H ; Se posiciona el cursor en Ren=0 Col=0
MOV DX,184FH ; Cursor al final de la pantalla Ren=24(18)
; Col=79(4F)
INT 10H ; INTERRUPCION AL BIOS
;------------------------------------------------------------------------------
MOV AH,02H ; Peticion para colocar el cursor
MOV BH,00 ; Nunmero de pagina a imprimir
MOV DH,0 ; Cursor en el renglon 0
MOV DL,0 ; Cursor en la columna 0
INT 10H ; Interrupcion al bios

call popTodo
ret

clear endp
;---------------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 				Crea un delay del tiempo que le pongas
;
;	Recibe: 				BX: "Segundos"
;
;	Devuelve:				Nada
;---------------------------------------------------------------------------------------------------------------------------------------
delay proc
		call pushTodo
		xor dx,dx 		; Para multiplicar en 16 bits
		mov ax,bx
		mov cx,17 		; Un aproximado para convertir a segundos. Prueba y error, cuando se pone 1 min tarda 57
		mul cx
		mov bx,ax 		; Lo vuelvo a pasar a BX porque AX lo voy a usar para otra cosa. En BX quedan los ticks que quiero que espere
		;mov bx,1


		mov ah, 00h  				; llamamos a la interrupcion para extraer el tiempo del sistema
	   	int 1Ah      		; CX:DX Guarda los segudnos despues de medianoche

	   	mov si,cx 			; Guardo la primera medicion en SI. En las proximas mediciones SI tiene que ser siempre mas chico a menos que pase de las 00 hs

	   

		add bx,dx 			; Sumo los segundos actuales con los que quiero que espere

	 dela: 	mov ah, 00h  		; llamamos a la interrupcion para extraer el tiempo del sistema
	   		int 1Ah      		; CX:DX Guarda los segudnos despues de medianoche 

	   		cmp cx,si 			; Si en algun momento cx pasa a ser menor que SI es porque pasaron las 00 hs y pego la vuelta
	   		jl finDelay 
	   		cmp dx,bx
	   		jl dela

finDelay:	call popTodo
			ret

delay endp
;---------------------------------------------------------------------------------------------------------------- 
;	Funcion: 				pantallaColor
;
;	Recibe: 				BX(BL): el color
;
;	Devuelve:				Nada
;--------------------------------------------------------------------------------------------------------------------
pantallaColor proc
		call pushTodo
              

			mov si,200
	y:		mov cx,320
			
	x:
			mov ah,0ch 	;AH = 0CH 		; Imprimir un pixel
			mov al,bl 	;AL = Valor del color a usar.           cyan
			mov bh,0;BH = Página de vídeo donde escribir el carácter.
			;mov cx,20;CL = Columna donde escribir el pixel (coordenada gráfica x)
			mov dx,si;CH = Fila donde escribir el pixel (coordenada gráfica y)
			int 10h

			loop x

			dec si
			cmp si,0
			jne y


			xor bx,bx

			call popTodo
			ret
pantallaColor endp
;---------------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 				Pinta un pixel del color que se le pasa por parametro
;	
;	Recibe: 				BX: Color a cambiar ----> AL: Color a cambiar
;							CX: Coordenada X 		  CX: Columna
;							SI: Coordenada Y 	----> DX: Fila
;							
;	Devuelve:			 	Nada
;---------------------------------------------------------------------------------------------------------------------------------------
pixelColor proc
		call pushTodo
           	
	
		mov ah,0ch 	;AH = 0CH 		; Imprimir un pixel
		mov al,bl 	;AL = Valor del color a usar.           cyan
		mov bh,0;BH = Página de vídeo donde escribir el carácter.
		mov dx,si;CH = Fila donde escribir el pixel (coordenada gráfica y)
		int 10h

		call popTodo
		ret
pixelColor endp

;---------------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 				Leer atributo de un pixel en el 0,0 de la pantalla
;	
;	Recibe: 				Nada. 	Hay que pushear ax antes de llamarla para no pisar ah
;	
;	Devuelve:			 	AL: Color del pixel
;---------------------------------------------------------------------------------------------------------------------------------------
leerPixel proc
		
		push bx
		push cx
		push dx

		mov ah,0dh 		; Servicio de la int 10h para leer un pixel
		mov bh,0 		; Pagina de video
		mov cx,0 		; Columana
		mov dx,0 		; Fila 
		int 10h

		pop dx
		pop cx
		pop bx
		ret
leerPixel endp
;----------------------------------------------------------------------------------
; PROBAR CON ESTOS PARAMETROS PARA ARMAR UNA FUNCION QUE CAMBIE DE PAGINA DE VIDEO|
;																				  |
;    	cambiar de pagina de video                                                |
;                                                                                 |
;	Set cursor position	AH=02h	BH = Page Number, DH = Row, DL = Column           |
; LA HACE ALEX QUE NADIE TOQUE ESTO PORQUE SE PUDRE!!! :) (vos si deni ) jajaja   |                                                                      |
;----------------------------------------------------------------------------------
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////                                      //////////////////////////////////////////
;////////////////////////////////////////////  FUNCIONES EXCULUSIVAS PARA EL JUEGO  //////////////////////////////////////////
;////////////////////////////////////////////                                      ///////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;---------------------------------------------------------------------------------------------------------------------------
;	Funcion: posiciona el cursor en la parte de nuestra ventana que querramos, recordar que el cursor queda posicionado,
;				por lo cual hay que volver a posicionarlo luego
;
;	Recibe: CL fila en la cual quermos trabajar (de 0 a 24 en decimal son las filas)
;			CH columnna en la cual queremos trabajar (de 0 a 39 decimal son las columnas)
;           cl = 0 y ch = 0 son punta superior izquierda de la pantalla 
;
;	Devuelve: Nada, simplemente posiciona el cursor para poder imprimir con la interrupcion 21h
;----------------------------------------------------------------------------------------------------------------------------
posCursor proc
		call pushTodo	

			mov ah,02H ; LLAMADO PARA POSICIONAR CURSOR
			mov bh,00h ; PAGINA DONDE SE TRABAJA (siempre es la 0 para nosotros)
			mov dh,cl ; fila final = 24 
			mov dl,ch ; COLUMNA MAXIMA = 39 	
			int 10H ; INTERRUPCION AL BIOS
			
		call popTodo

	
ret
posCursor endp

;----------------------------------------------------------------------------------------------------
;	Funcion: Pasa a modo Grafico 320x200 pixeles 39x24 columnas imprimibles
;	
;	Recibe:  NADA
;
;	Devuelve:  Nada
;-----------------------------------------------------------------------------------------------------
ModoGrafico proc
	call pushTodo

		   mov ah, 00h             ; set de modo video
		   mov al, 13h             ; 13h - modo GRAFICO
		                            ; 40x25(columnasxfilas). 256 colores.;320x200 (pixeles) 1 pagina.
		    int 10h                 
	call popTodo
ret		    
ModoGrafico endp


;---------------------------------------------------------------------------------------------------------------
;	Funcion:  cambia el modo a modo video normal, con el que trabajamos normalmente
;
;	Recibe: Nada
;	
;	Devuelve: Nada
;------------------------------------------------------------------------------------------------------------------
ModoVideo proc
	call pushTodo

		   mov ah, 00h             ; set de modo video
		   mov al, 03h             ; 13h - modo GRAFICO
		                            ; 40x25(columnasxfilas). 256 colores.;320x200 (pixeles) 1 pagina.
		    int 10h                 
	call popTodo
ret		    
ModoVideo endp

;---------------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 				Busca un color en la pantalla y lo cambia
;	
;	Recibe: 				BX: Color a cambiar
;							DH: Rojo 	0-60
;							CH: Verde	0-60
;							CL: Azul 	0-60
;	
;	Devuelve:			 	Nada
;---------------------------------------------------------------------------------------------------------------------------------------
cambiarColor proc
		call pushTodo
		mov bl,0

		mov ax,1010h   
		;mov bx,0h				; Número de color a cambiar.               
		;mov dh,60h          	; Rojo
        ;mov ch,10h 			; Verde              
        ;mov cl,60h 			; Azul            
        int 10h

        call popTodo
        ret
cambiarColor endp
;---------------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 				Imprime una imagen pixel por pixel pasandole las coordenadas como una serie variables que representan las filas
; 							las cuales estan compuestas por los numeros de columnas a pintar.
; 							Ej: fila0 db 1,2,3,4,24h
;								fila1 db 1,4,24h
;	
;	Recibe: 				BX: Offset de la primera variable de las coordenadas
; 							AL: Color
; 							DL: Desplazamiento en y
;							CL; Desplazamiento en x
; 							
;	Devuelve:			 	Nada
;---------------------------------------------------------------------------------------------------------------------------------------
impImagen proc
		call pushTodo

		mov si,bx 			; Lo recibo en BX para ser consistente con las demas funciones pero lo paso a SI porque BX lo voy a usar para otra cosa

		xor dh,dh 			; Limpio la parte alta porque voy a trabajar con la baja
		xor ch,ch 			
		
	fila:	

columna:push cx				; Guardo el desplazammiento
		add cl,[si] 		; Desplazo la coordenada en X
		mov ah,0ch 			; Imprimir un pixel
		mov bh,0 			; Página de vídeo donde escribir el carácter.
		int 10h
		pop cx

		inc si 				; Paso a la siguiente coordenada

		cmp byte ptr[si],24h
		jne columna  			; Si no hay un 24h sigo recorriendo la fila

		inc si 					; Salteo el 24h
		inc dx 					; Paso a la siguiente fila

		cmp byte ptr[si],24h 	; Si encuentra el doble 24h sale
		jne fila


		call popTodo
		ret
impImagen endp

;=======================================FUNCIONES PARA PRINTAR UNA IMAGEN=======================================

;.----------------------------------------------------------------------------------------------
;
;	Funcion: Funciones de BMP para imprimir la foto de bienvenida
;
;	Recibe: CX (1,2,3) dependiendo del archivo que se quiera abrir, esta para abrir 3 archivos.	
;		
;	Devuelve: Nada	
;
;------------------------------------------------------------------------------------------------
OpenFile proc 

    ; Abrir archivo

    mov ah, 3Dh
    xor al, al
    ;mov dx, offset filename
    int 21h

    jc openerror
    cmp cx,2
    jl img1
    je img2
    cmp cx,3 
    je img3 
    jg img4 

    jmp openerror
	img1:
    mov [filehandle], ax
    ret
    img2:
    mov [ganastehandle], ax
    ret
    img3:
    mov [perdistehandle], ax
    ret
    img4: ;;;;;;;;;;
    mov [negritohandle], ax
    ret

    openerror:
    mov dx, offset ErrorMsg
    mov ah, 9h
    int 21h
    ret
OpenFile endp
;-------------------------------------------------------------------------------
;
;
;	Funcion: leer encabezado del archivo .bmp 
;
;	Recibe: SI (1,2,3) para ver en que variable guardar el encabezado, esta para poder usar 3 imagenes
;
;	Devuelve: Nada
;---------------------------------------------------------------------------------
ReadHeader proc 
	
    ; Leer encabezado de archivo BMP, 54 bytes

    mov ah,3fh
    cmp si,2
    jl img1r
    je img2r
    cmp si,3
    je img3r
    jg img4r
    img1r:
    mov bx, [filehandle]
    jmp abajito
     img2r:
    mov bx, [ganastehandle]
    jmp abajito
     img3r:
    mov bx, [perdistehandle]
    jmp abajito
    img4r:
    mov bx, [negritohandle]
    jmp abajito
    abajito:
    mov cx,54
    mov dx,offset Header
    int 21h
    ret
ReadHeader endp
;------------------------------------------------------------------------------------
;
;	Funcion: Lee la paleta de colores, usando la variable palete del archivo var 
;	
;	Recibe: nada
;
;	Devuelve: nada
;------------------------------------------------------------------------------------
ReadPalette proc

    ;Leer la paleta de colores del archivo BMP, 256 colores * 4 bytes (400 h)

    mov ah,3fh
    mov cx,400h
    mov dx,offset Palette
    int 21h
    ret
ReadPalette endp 
;-----------------------------------------------------------------------------
;
;Funcion:; Copiar la paleta de colores a la memoria de video
;			 El número del primer color debe enviarse al puerto 3C8h
; 				La paleta se envía al puerto 3C9h
;Recibe: nada
;
;Devuelve: nada
;--------------------------------------------------------------------------
CopyPal proc 

    

    mov si,offset Palette
    mov cx,256
    mov dx,3C8h
    mov al,0

    ; Copie el color inicial al puerto 3C8h

    out dx,al

    ; Copiar la paleta propia al puerto 3C9h

    inc dx
    PalLoop:

    ; Nota: los colores en un archivo BMP se guardan como valores BGR en lugar de RGB.

    mov al,[si+2] ; Obtener valor rojo.
    shr al,2 ; Max. es 255, pero la paleta de video es máxima

    ; el valor es 63. Por lo tanto, dividir por 4.

    out dx,al ; Enviamos.
    mov al,[si+1] ; Obtenga valor verde.
    shr al,2
    out dx,al ; Enviamos.
    mov al,[si] ; Obtenga valor azul.
    shr al,2
    out dx,al ; Enviamos.
    add si,4 ; Apunta al siguiente color.

    ; (Hay un chr nulo. después de cada color.)

    loop PalLoop
    ret
CopyPal endp 
;------------------------------------------------------------
;
;	Funcion:	Los gráficos BMP se guardan al revés.
; 				Leer el gráfico línea por línea (200 líneas en formato VGA),
; 				Mostrando las líneas de abajo hacia arriba
;
;	Recibe: nada
;	Devuelve: nada
;-------------------------------------------------------------------
CopyBitmap proc 

   

    mov ax, 0A000h
    mov es, ax
    mov cx,200
    PrintBMPLoop:
    push cx

    ; di = cx*320, apuntar a la línea de pantalla correcta

    mov di,cx
    shl cx,6
    shl di,8
    add di,cx

    ; Leer una línea

    mov ah,3fh
    mov cx,320
    mov dx,offset ScrLine
    ;add dx,0
    int 21h

    ; Copie una línea en la memoria de video

    cld 

    ; Limpiar Bandera de dirección, para movsb

    mov cx,320
    mov si,offset ScrLine
    rep movsb 

    ; Copiar línea a la pantalla
    ;rep movsb es el mismo que el siguiente código:
    ;mov es:di, ds:si
    ;inc si
    ;inc di
    ;dec cx
    ;loop until cx=0

    pop cx
    loop PrintBMPLoop
    ret
CopyBitmap endp 


;---------------------------------------------------------------------------------------------
;	Funcion:		Limpia la pantalla en el color que este, si se quiere limpiar menos pantalla,
;					primero posicionar el cursor y luego llamarla.
;
;	Recibe: 		Nada
;	
;	Devuelve: 		Nada
;---------------------------------------------------------------------------------------------
clearrosa proc
call pushTodo

MOV AX,0600H ; Peticion para limpiar pantalla
MOV BH,00h ; Color de letra ==7 "gris claro"
; Fondo ==8 "Gris oscuro"
MOV CX,0000H ; Se posiciona el cursor en Ren=0 Col=0
MOV DX,184FH ; Cursor al final de la pantalla Ren=24(18)
; Col=79(4F)
INT 10H ; INTERRUPCION AL BIOS
;------------------------------------------------------------------------------
MOV AH,02H ; Peticion para colocar el cursor
MOV BH,00 ; Nunmero de pagina a imprimir
MOV DH,0 ; Cursor en el renglon 0
MOV DL,0 ; Cursor en la columna 0
INT 10H ; Interrupcion al bios

call popTodo
ret

clearrosa endp

;---------------------------------------------------------------------------------------------------------------------------------------
; 	Funcion: 				Imprime piedra, papel o tijera segun parametro
;	
;	Recibe: 				BL: 1 Piedra
;								2 Papel
;								3 Tijera
;							AL: Color
;							DL: Desplazamiento en y
;							DI; Desplazamiento en x
;	
;	Devuelve: 				Nada
;---------------------------------------------------------------------------------------------------------------------------------------
impPPT proc
			call pushTodo
			xor bh,bh
			xor dh,dh
			cmp bl,2
			jl piedra
			je papel
			jg tijera

	piedra:	lea bx,fila0 		; Despues cambio los nombres para que se entienda mejor
			add dl,6 			; Ajusto para que quede centrado porque el dibujo de la piedra es mas chico
			jmp imprimirPPT
	papel: 	lea bx,PfilaA
			jmp imprimirPPT
	tijera: lea bx,sfila0

	imprimirPPT:
			call impImagen

			call popTodo
			ret
impPPT endp

;------------------------------------------------------------------------------------------
;	Funcion: Lee el scand code ingresado por teclado
;	
;	Recibe: Nada
;
;	Devuelve: AH el valor del scan code leido
;-----------------------------------------------------------------------------------------
leerScancode proc
	call pushTodo
		
		mov ah,00h
		int 16h

	call popTodo
ret
leerScancode endp

;---------------------------------------------------------------------------------------------------------
;	Funcion:		Elije un numero al azar la cual es la jugada de la maquina.
;	
;	Recibe:			NADA
;	
;	Devuelve:		AH = num que "eligio" la maquina
;---------------------------------------------------------------------------------------------------------
selec_maquina proc
	push cx
	push dx
	;push ax

	xor ax, ax					;limpio ax
	MOV AH, 00h  				;servicio para obtener los tics      
	INT 1AH      				; CX:DX ahora tiene el número de tics del reloj desde la medianoche      
	mov  ax, dx 				;muevo DX a AX para hacer division
	xor  dx, dx 				;limpio dx
	mov  cx, 3    				;divido por 3 para que el resto vaya de 0 a 2
	div  cx       				;divido y me queda en DL el resto de la división
	inc dl

	;pop ax
	
	mov ah, dl 					;dejo en AH el num de maquina

	pop dx
	pop cx
	ret
selec_maquina endp

;---------------------------------------------------------------------------------------------------------------------------------------
;	Funcion:				Muesta el score en la pantalla
;	
;	Recibe: 				BX: El score del usuario
;							DX: El score de la maquina
;							En la libreria tiene que estar declarada la variable 
;							score db "000",24h
;							textoUsuario  db "Usuario",0dh,0ah,24h
;							textoMaquina db "Computadora",0dh,0ah,24h
;
;							Tiene que estar activado el modo grafico
;					
;	Devuelve: 				NADA
;---------------------------------------------------------------------------------------------------------------------------------------
impScore proc
			call pushTodo
			;---------------------     USUARIO    -------------------------------
			mov si,bx 				; Guardo es score del usuario en SI
			mov di,dx 				; Guardo el score de la maquina en DI
			xor dx,dx
			mov cl,1				; x
			mov ch,1 				; y
			push cx				    
			call posCursor
			pop cx
			lea dx,textoUsuario
			call imprimir
			push cx
			mov cl,3				; x
			mov ch,3 				; y
			call posCursor
			pop cx
			lea bx,score
			mov dx,si 				; Score usuario
			call regToAscii

			lea dx,score
			call imprimir 	; DX ya tiene el offset que quiero imprimir
    	;-------------------------     MAQUINA     ----------------------------
			push cx
			mov cl,1				; x
			mov ch,32 				; y
			call posCursor
			pop cx
			lea dx,textoMaquina
			call imprimir
			push cx
			mov cl,3				; x
			mov ch,34 				; y
			call posCursor
			pop cx
			lea bx,score
			mov dx,di 				; Score maquina
			call regToAscii


			lea dx,score
			call imprimir 			; DX ya tiene el offset que quiero imprimir
			
			call popTodo
			ret
impScore endp

;---------------------------------------------------------------------------------------------------------------------------------------
;	Funcion: 				Devuelve el resultado de la ronda
;	
;	Recibe: 				BH: Eleccion usuario
;							BL: Eleccion maquina
;	
;	Devuelve 				DH: Un 1 si gano el usuario
;							DL: Un 1 si gano la maquina
; 							DX: un 0 si fue empate
;---------------------------------------------------------------------------------------------------------------------------------------
usVSmaq proc
			push bx

			cmp bh,bl
			je empatevs
			cmp bh,2
			jl piedraVS
			je papelVS 
			jg tijeraVS

	piedraVS:
			cmp bl,3
			je ganaUs
			jmp ganaMaq
	papelVS:cmp bl,1
			je ganaUs
			jmp ganaMaq
	tijeraVS:cmp bl,2
			je ganaUs
			jmp ganaMaq

	ganaUs:	xor dl,dl
			mov dh,1
			jmp finUsVSMaq

	ganaMaq:xor dh,dh
			mov dl,1
			jmp finUsVSMaq

	empatevs:	
			xor dx,dx

	finUsVSMaq:
			pop bx
			ret
usVSmaq endp

;--------------------------------------------------------------------------------	
; 	Funcion 			Espera una cantidad muy corta de tiepo
; 
;	Recibe: 			BL: Cant de ticks que se quiere esperar
; 
;	Devuelve:			Nada
;--------------------------------------------------------------------------------	
delayTrans proc
		call pushTodo

		xor bh,bh

		mov ah, 00h  				; llamamos a la interrupcion para extraer el tiempo del sistema
	   	int 1Ah      		; CX:DX Guarda los segudnos despues de medianoche

	  	add bx,dx 			; Sumo los segundos actuales con los que quiero que espere

 delayT: mov ah, 00h  		; llamamos a la interrupcion para extraer el tiempo del sistema
	   	int 1Ah      		; CX:DX Guarda los segudnos despues de medianoche 

  		cmp dx,bx
   		jl delayT

		call popTodo
		ret
delayTrans endp

;---------------------------------------------------------------------------------------------------------------------------------------
;	Funcion:			Muesta una cuenta regresiva en pantalla de 9 a 0 y a medida que avanza la pantalla se oscurece
;	
;	Recibe: 			Las siguientes variables tienen que esar declaradas en la libreria
;								textoCuenta  db " Desea volver a jugar?",0dh,0ah,24h
;								textoCuenta2 db "Ingrese una tecla",0dh,0ah,24h
;
;								nueve 	db "ÛßÛ",0dh,0ah,"                  ßßÛ",0dh,0ah,"                  ßßß",24h 		; Posiciono el cursor en 20 x asi que agrego 20 espacios para que imprima bien
;								ocho 	db "ÛßÛ",0dh,0ah,"                  ÛßÛ",0dh,0ah,"                  ßßß",24h
;								siete 	db "ÛßÛ",0dh,0ah,"                    Û",0dh,0ah,"                    ß",24h
;								seis 	db "Ûßß",0dh,0ah,"                  ÛßÛ",0dh,0ah,"                  ßßß",24h	
;								cinco 	db "Ûßß",0dh,0ah,"                  ßßÛ",0dh,0ah,"                  ßßß",24h
;								cuatro 	db "Û Û",0dh,0ah,"                  ßßÛ",0dh,0ah,"                    ß",24h
;								tres 	db "ßßÛ",0dh,0ah,"                  ßßÛ",0dh,0ah,"                  ßßß",24h
;								dos 	db "ßßÛ",0dh,0ah,"                  Ûßß",0ah,0dh,"                  ßßß",24h
;								uno 	db  "ßÛ",0dh,0ah,"                   Û",0ah,0dh,"                   ß",24h
;								cero 	db "ÛßÛ",0dh,0ah,"                  Û Û",0dh,0ah,"                  ßßß",24h,24h
;	
;	Devuelve: 			DX: 1 si se desea jugar otra vez, 0 si no
;---------------------------------------------------------------------------------------------------------------------------------------	
cuentaRegresiva proc

			push ax
			push bx  
			push cx
			push di
			push si
			pushf
			
			call ModoGrafico
			call vaciarBuffer

			xor ax,ax
			xor bx,bx
			xor cx,cx
			xor dx,dx
			xor di,di
			xor si,si
			
			;call clearRosa
			mov bx,0 ;<---- esta linea se agrego
			mov cl,15 				; Azul
			mov ch,15				; Verde 		
			mov dh,0 				; Rojo 
			call cambiarColor  

			lea dx,nueve

			;---------------
			mov di,10 				; Veces que se va a ejecutar el loop si no se aprieta una tecla
			mov cl,15 				; Azul 		Color de la pantalla que va a ir cambiando dentro del loop
			mov ch,15				; Verde 
loopCuenta:	
			
			push dx
			call clearRosa
			push cx
			mov ch,8				; x
			mov cl,5 				; y
			call posCursor
			pop cx

			lea dx,textoCuenta
			call imprimir
			push cx
			mov ch,10				; x
			mov cl,6 				; y
			call posCursor
			pop cx
			lea dx,textoCuenta2
			call imprimir
			 		
			mov dh,0 				; Rojo. Los demas los inicializo afuera del loop 
			call cambiarColor   	; Sale del loop con dh=0,ch=5,cl=5
			;sub ch,1
			;sub cl,1 					; Decremento para que la pantalla se vaya volviendo mas oscura a medida que avanza el tiempo
			push cx
			mov ch,18				; x
			mov cl,10 				; y
			call posCursor
			pop cx
			sub ch,1
			sub cl,1 	
			pop dx
			call imprimir
			
			xor bh,bh
			mov bl,1
			call delay

			push bx 			
			push dx
			mov bx,dx
			call len
			mov si,dx
			pop dx
			pop bx
			add dx,si  		; Paso a la variable que sigue
			inc dx 			; Salteo el 24h y me paro en la siguiente variable

			call clearRosa
			
			mov ah,01h
			int 16h
			jnz jugarOtra 		; Si se ingresa una tecla queda guardada en el buffer, la int 16h la lee cuando se ejecuta y salta a final

			dec di
			cmp di,0
			jne loopCuenta
			jmp noJugar

jugarOtra:	
			mov ah,8    ;leo una tecla para vaciar el buffer asi cuando regresa a ejecutar no imprime
			int 21h		;el "SU OPCION ES INCORRECTA" en el menu de eleccion de modo de juego.
			mov dx,1
			jmp acasito	
noJugar:	mov dx,0
acasito:	popf
			pop si
			pop di
			pop cx
			pop bx
			pop ax
			ret
		cuentaRegresiva endp
;-------------------------------------------------------------------------------------------
;
;
;	Funcion: limpia pantalla y vuelve al modo texto
;	
;	Recibe: nada
;
;	Devuelve: nada, simplemente limpia la pantalla y vuelve al modo texto original.
;
;--------------------------------------------------------------------------------------------
proc Clearscreen
	push ax
	push es
	push cx
	push di
	mov ax,3
	int 10h
	mov ax,0b800h
	mov es,ax
	mov cx,1000
	mov ax,7
	mov di,ax
	cld
	rep stosw
	pop di
	pop cx
	pop es
	pop ax
	ret 
Clearscreen endp
;--------------------------------------------------------------------------------
;
;	Funcion: Vacia el Buffer sin importar la cantidad de teclas apretadas.
;	
;	Recibe: Nada
;	
;	Devuelve: Nada, el buffer vacio
;--------------------------------------------------------------------------------


vaciarBuffer proc
	call pushtodo
vaciar:
	mov ah,01
	int 16h
	jz finalbuffer     ;
	mov ah,8
	int 21h
	jmp vaciar

finalbuffer:
	call popTodo
ret
vaciarBuffer endp		
;-----------------------------------------------------------------------------------------------------
;
;	Funcion: AH NOSEEEE, TENES QUE JUGAR NO TE PUEDO REGALAR TODO :)
;	
;	Recibe: JUGA NO TE VOY A EXPLICAR TODO 
;	devuelve: nada(juga y fijate muajajajajajaja)
;
;------------------------------------------------------------------------------------------------------

easterEgg proc

			push ax
			push bx  
			push cx
			push di
			push si
			pushf

			mov di,10
impwin:		;----------------------- Imprimo la imagen You Win -----------------------
			call clearrosa     ;LIMPIO PANTALLA
			call modografico   ;vuelvo a llamar al modo grafico
			;ABRO EL ARCHIVO
			mov dx, offset ganastepic ;le paso la imagen como parametro
		    mov cx,2                  ; le doy cx como parametro 
		    call OpenFile      
		    mov si,2             ;le doy si como parametro para que guarde el encabezado en la variable correcta
		    call ReadHeader
		    call ReadPalette
		    call CopyPal
		    call CopyBitmap
		    ;----------------------------------------------------------------------------------
		    mov bl,35
		    call delayTrans
		   
aca:
			mov ah,01h
			int 16h
			jnz preegg
					 		; Si se ingresa una tecla queda guardada en el buffer, la int 16h la lee cuando se ejecuta y salta a final
		

			dec di
			cmp di,0
			je noEgg
			jmp aca
preegg:
			cmp ah,0Eh;borrar 		; Comparo con la tecla elegida para el easter egg
			je egg
			jmp noEgg




 	Egg:	;mov ah,8
 			;int 21h 			; Leo la tecla ingresada para vaciar el buffer
 			call vaciarBuffer
 			;----------------Imprimo la imagen easter egg --------------------
			call clearrosa     ;LIMPIO PANTALLA
			call modografico   ;vuelvo a llamar al modo grafico
			;ABRO EL ARCHIVO
			mov dx, offset eggpic ;le paso la imagen como parametro
		    mov cx,4                  ; le doy cx como parametro 
		    call OpenFile      
		    mov si,4             ;le doy si como parametro para que guarde el encabezado en la variable correcta
		    call ReadHeader
		    call ReadPalette
		    call CopyPal
		    call CopyBitmap
		    ;----------------------------------------------------------------------------------

			jmp finEgg	
	noEgg:	
			call vaciarBuffer
finEgg:		popf
			pop si
			pop di
			pop cx
			pop bx
			pop ax
			ret
		easterEgg endp


end