.8086						
.model small
.stack 100h
;------------------------------CONSTANTES---------------------------------------
COLORADITO EQU 0Ch    
BLANCO EQU 0Fh

.data
;-----------------------VARIABLES EN EL ARCHIVO var.inc---------------------------
include var.inc

.code
;-----------------------FUNCIONES DE LA LIBRERIA  LIBP.ASM-------------------------
 ;Menu
    extrn menu:proc         
; Auxiliares
    extrn pushTodo:proc
    extrn PopTodo:proc
; Conversores
    extrn asciiToReg:proc
    extrn regToAscii:proc
    extrn hAsciiToReg:proc
    extrn regToAsciiH:proc
    extrn bAsciiToReg:proc          
    extrn regToAsciiB:proc
; Lectura
    extrn leer:proc
    extrn leerNum:proc 
    extrn leerNumH:proc 
    extrn leerNumB:proc
; Impresion 
    extrn imprimir:proc
    extrn imprimirSalto:proc
    extrn imprimirBinario:proc
    extrn ImprimirConColor:proc
; Cadenas y vectores
    extrn len:proc 
    extrn ceros:proc        
    extrn contador:proc
    extrn modificador:proc
    extrn invertir:proc
    extrn ToUpper:proc
    extrn ToLower:proc
    extrn ordenar: proc
    extrn contpalita:proc
    extrn ordenar: proc
; Otras
    extrn random:proc
    extrn clearrosa: proc
    extrn posCursor: proc
    extrn ModoVideo: proc
    extrn modoGrafico: proc
    extrn cambiarColor: proc
    extrn delay:proc
    extrn OpenFile:proc
    extrn ReadHeader:proc
    extrn ReadPalette:proc
    extrn CopyPal:proc
    extrn CopyBitmap:proc
    extrn impPPT: proc
    extrn impImagen: proc
    extrn leerScancode: proc
    extrn selec_maquina: proc
	extrn usVSmaq: proc
	extrn impScore: proc
	extrn delayTrans: proc
	extrn cuentaRegresiva:proc
	extrn Clearscreen: proc
	extrn easterEgg: proc
	extrn vaciarBuffer: proc
	;ABRO EL ARCHIVO 
    
  
;--------------------------------	INICIO DE EJECUCION --------------------------------------
	main proc
			mov ax,@data
			mov ds,ax

  	call pushTodo

;#########################################################################################################
;#########################################################################################################
;############################PANTALLA DE INICIO JUEGO ####################################################
;#########################################################################################################
;#########################################################################################################
	
	call modoGrafico
    ;ABRO EL ARCHIVO 
    mov dx, offset filename
    mov cx,1
    call OpenFile
    mov si,1
    call ReadHeader    ;FUNCIONES PARA ABRIR ARCHIVO BMP Y PRINTARLA EN PANTALLA
    call ReadPalette
    call CopyPal
    call CopyBitmap

    mov ah,1
    ;ESPERA UN ENTER PARA CAMBAIR A PANTALLA DE BIENVENIDA
    int 21h

    call modoGrafico   ;vuelvo a activar el modografico porque lo perdi el las anteriores lineas
    call popTodo
;#########################################################################################################
;#########################################################################################################
;############################TRANSICION DE PANTALLA COLOR ################################################
;#########################################################################################################
;#########################################################################################################
inicioTrans:	
			mov bl,0				; Color de partida
			mov cl,60 				; Azul
			mov ch,60				; Verde 		
			mov dh,60 				; Rojo 

trans0:		call cambiarColor

			push bx
			xor bx,bx
			mov bl,1
			
			call delayTrans       ;le damos un delay para que vaya cambiando color poco a poco
			pop bx

			dec cl                ;decrementamos la intensidad de los colores loop a loop
			dec ch
			dec dh
			cmp ch,15             ;cuando ch llego a 15 llegamos al color que queremos 
			jne trans0

trans:		call cambiarColor

			push bx
			xor bx,bx
			mov bl,1                
			call delayTrans    
			pop bx

			dec dh
			cmp dh,0
			jne trans


;########################################################################################################
;########################################################################################################
;########IMPRIMIR MENU PARA SELECCIONAR EL MODO DE JUEGO Y LEER EL MODO #################################
;########################################################################################################
;########################################################################################################

	preguntar:		

			call vaciarBuffer
			mov ch,0
			mov cl,0         ;POSICIONA EL CURSOR EN LA ESQUINA SUPERIOR IZQUIERDA
			call posCursor
			

			lea dx ,vareleccion    ;IMPRIME MENU DE BIENVENIDA PARA VER CUANTAS VECES QUIERE JUGAR
			call Imprimir

			mov ch,0
			mov cl, 5			  ;IMPRIME OPCIONES DE MODO DE JUEGO
			lea dx, opciones
			call Imprimir

;------------------------------CAJA DE LECTURA DE MODO DE JUEGO----------------------------------

	cajalecturamodo:

			mov cl,24
			mov ch,0         ;POSICIONO EL CURSOR EN LA ULTIMA FILA PRIMER COLUMNA
			call posCursor

			mov ah,08h
			int 21h
			cmp al,31h
			je guardar      ;HAGO LAS COMPARACIONES CON LO QUE ME INGRESO EL USUARIO 
			cmp al,35h
			je guardar
			cmp al,33h
			je guardar
			cmp al, 30h
			je interfinal
			jmp cartelito



cartelito:
	mov cl,24
	mov ch,0         ;POSICIONO EL CURSOR PARA EL CARTEL DE ERROR
	call posCursor



	mov ah,09h
	lea dx,erreleccion   ;IMPRIMO ERROR
	int 21h
	
	mov cl,24
	mov ch,0         ;POSICIONO EL CURSOR PARA BORRAR EL CARTEL Y DARLE EL EFECTO DE 
	call posCursor	 ;DESAPARECER CUANDO PRESIONA UNA TECLA


	mov bx,7
	call delayTrans     ;LE DOY UN DELAY PARA GENERAR EL EFECTO QUE TITILA CUANDO APRETA LA TECLA
						;INCORRECTA
	
	call clearrosa		;LIMPIO LA PANTALLA CON LAS COORDENADAS DEL CARTEL DE ERROR

	jmp preguntar		;VUELVO A IMPRIMIR TODO DE VUELTA


guardar:
	sub ax,30h	
	mov cx, ax         	   ;EN CX ESTAN LAS CANTIDAD DE PARTIDAS A JUGAR
	mov cantpartidas,cl    ;LO GUARDO EN UNA VARIABLE 
	xor cx,cx 
	xor ax,ax			
   	jmp lop_juego	        ;SALTA A LA PANTALLA DE VERSUS			 

interfinal:
	jmp final   
intecuenta2:
	xor ax,ax               ;LIMPIO REGISTROS Y VARIABLES PARA LA SEGUNDA EJECUCION
	xor bh,bh				;DEVUELVO EL COLOR ORIGINAL PARA GENERAR NUEVAMENTE EL CAMBIO TRANSITIVO DE COLOR
	mov bl,0				; Color de partida
	mov cl,60 				; Azul
	mov ch,60				; Verde 		
	mov dh,60 				; Rojo 
	xor si,si
	xor di,di
	mov gano,0
	mov perdio,0
	jmp trans0	       ;SALTA A LA TRANSICION DE PANTALLA PARA DARLE EL EFECTO DE APAGADO DE TELEVISOR
lop_juego:
	jmp PANTALLAELECCION      ;SALTA A LA PANTALLA DE VERSUS
  
lop_juego2:	

	call selec_maquina    ;SELEC_MAQUINA =  RANDOM, PARA QUE LA MAQUINA ELIJA ALEATOREAMENTE
	mov maquina,1     ;LA ELECCION DE LA MAQUINA SE GUARDA EN UNA VARIABLE
	            	
;########################################################################################################
;########################################################################################################
;#############################PANTALLA VERSUS############################################################
;########################################################################################################
;########################################################################################################

	call pushTodo
	   
		
;------------------------------------------------------------------------------------------------------

			mov espera,2 		;Inicializo espera para que empiece en 2 cada ronda
		
			call clearrosa
			mov cl,15 				; Azul
			mov ch,15				; Verde 		
			mov dh,0 				; Rojo 
			call cambiarColor  
			mov bl,maquina
			mov cx,20			; Cantidad de vueltas rapidas
			 				
primerloop:	push cx
		
			mov cl,0			;POSICIONO EL CURSOR AL PRINCIPIO DE LA PANTALLA
			mov ch,0
			call posCursor

			push bx
			mov bx,scoreUsuario		;Imprimo el score en las esqiunas
			mov dx,scoreMaquina
			call impScore
			pop bx		
			
			push bx 				;Guardo el valor de BX porque voy a usar BX para elegir la opcion a imprimir	
			mov cl,60
			mov dl,75
			mov al,COLORADITO
			mov bl,usuario 			;Lo que ingreso el usuario
			call impPPT
			pop bx
			
			mov cl,12 				; coordenada y
			mov ch,18				; coordenada x
			call posCursor
			
			mov ah,09h
			lea dx,vs
			int 21h

			mov cl,200 				; Desplazamiento en y 		
			mov dl,75				; Desplazamiento en x
			inc bl
			cmp bl,3
			jle nada1
			sub bl,3
	nada1:	 			
			mov al,BLANCO           ;imprimo las manos en blanco que van cambiando loop a loop 
			call impPPT				;para darle el efecto de que es random 

			push bx
			mov bl,espera
			call delayTrans          ;delay de TRANSICION para imprimir las manos maquina
			pop bx

			call clearrosa
			mov cl,15				; Azul
			mov ch,15				; Verde 		
			mov dh,00 				; Rojo 
			call cambiarColor 
			
			pop cx	
			loop primerloop

			mov cx,5 				;Con esto se maneja que tan tento va al final
segundoloop:mov si,3 										
			push cx
					
loopi:	
			push bx 				
			mov bx,scoreUsuario		;Imprimo el score en las esqiunas
			mov dx,scoreMaquina
			call impScore
			pop bx	

			push bx
			mov cl,60				;COORDENADAS y
			mov dl,75				;COORDENADAS x
			mov al,COLORADITO		;color de la mano del usuario siempre es roja
			mov bl,usuario 			;eleccion usuario
			call impPPT
			pop bx

			mov cl,12 				; COORDENADAS x
			mov ch,18				; COORDENADAS y
			call posCursor
			
			mov ah,09h				
			lea dx,vs               ;imprimo versus "VS"
			int 21h

			mov cl,200 				; Desplazamiento en y 		
			mov dl,75				; Desplazamiento en x
			inc bl
			cmp bl,3
			jle nada
			sub bl,3
	nada:	 			
			mov al,BLANCO
			call impPPT

			push bx
			mov bl,espera 			;Va a ir incrementando con cada vuelta por lo tanto va a ser mas lento
			call delayTrans         ;llamamos a delayTrans para darle el efecto de que va seleccionando en el momento    
			pop bx

			call clearrosa			;limpio pantalla con el color usado
			mov cl,15				; Azul
			mov ch,15				; Verde 		
			mov dh,00 				; Rojo 
			call cambiarColor 		;cambio el color de la pantalla

			push bx 				
			mov bx,scoreUsuario		; Imprimo el score en las esqiunas
			mov dx,scoreMaquina
			call impScore
			pop bx	

			dec si 
			cmp si,0
			jne loopi

			add espera,2
			pop cx
			loop segundoloop


resultado: 	call clearrosa
			mov cl,15				; Azul 
			mov ch,15				; Verde 		
			mov dh,00 				; Rojo
			call cambiarColor 

			push bx 				
			mov bx,scoreUsuario		; Imprimo el score en las esqiunas
			mov dx,scoreMaquina
			call impScore
			pop bx	

			mov cl,200
			mov dl,75
			mov al,BLANCO
			call impPPT 			; Maquina
			
			push bx				
			mov cl,12 				; coordenadas x
			mov ch,18				; coordenadas y
			call posCursor
			mov ah,09h
			lea dx,vs
			int 21h
			pop bx
			
			push bx
			mov cl,60
			mov dl,75
			mov al,COLORADITO
			mov bl,usuario 				; Lo que ingreso el usuario
			call impPPT
			pop bx

			push bx
			mov bl,espera 		;Va a ir incrementando con cada vuelta por lo tanto va a ser mas lento
			call delayTrans
			pop bx

			inc bl 				;bl inclementa y sale cuando el numero coincide con la selec_maquina
			cmp bl,3
			jle nada2
			sub bl,3

	nada2:	cmp bl,maquina
			jl resultado

			jmp cosavs
	interlop_juego:
		jmp lop_juego		
;------------------------------ IMPRIMO EL RESULTADO EN COLOR -----------------------
			
	cosavs:	call clearrosa
			mov cl,15				; Azul
			mov ch,15				; Verde 		
			mov dh,00 				; Rojo 
			call cambiarColor 
			
			mov cl,60
			mov dl,75
			mov al,COLORADITO
			mov bl,usuario
			call impPPT 			; Usuario

			mov cl,12 				;coordenadas x
			mov ch,18				;coordenadas y
			call posCursor
			mov ah,09h
			lea dx,vs
			int 21h
									;en la ultima EJECUCION la mano de la maquina se imprime en rojo
			mov cl,200				;para que el usuario se de cuenta de contra que eleccion tuvo la maquina
			mov dl,75
			mov al,COLORADITO
			mov bl,maquina 			; Maquina
			call impPPT


;---------------Comparo quien gano para aumentar el score mostrado------------------------
			mov bh,usuario
			mov bl,maquina
			call usVSmaq 	;Funcion que devuelve 1 en DH si gano el usuario o
			mov ax,dx       ;1 en DL si gano la maquina. Si empatan devuelve 0 en DX

			mov bx,scoreUsuario		; Imprimo el score en las esqiunas
			mov dx,scoreMaquina 	; Lo paso a AX para trabajar con DX en la funcion

			add bl,ah 				;SUMO EL RESULTADO AL Usuario
			add dl,al 				;SUMO EL RESULTADO A LA MAQUINA Maquina

			call impScore			;IMPRIMO LOS SCORE MODIFICADOS
;----------------------------------------------------------------------------------------------
	
			mov bl,75 			;LE DAMOS UN PEQUEÑO DELAY PARA QUE TENGA TIEMPO EL USUARIO DE VER RESULTADO
			call delayTrans
			
;-----------------------------RESULTADO DE LA BATALLA --------------------------------------		
	call popTodo

	mov bh,usuario
	mov bl,maquina
	call usVSmaq 	;Funcion que devuelve 1 en DH si gano el usuario o 1 en DL si gano la maquina. Si empatan devuelve 0 en DX
	mov bx,dx
	xor ax,ax
	mov al,bh		;bh tengo si gano maquina bh =1
	add scoreUsuario,ax   ;lo llevo a un registro de 16 porque es una variable dw
	xor ax,ax
	mov al,bl         ;bl tengo si gano el usuario bl  =1
	add scoreMaquina,ax     ;lo llevo a un registro de 16 porque es una variable dw
	xor ax,ax       
	
	cmp dx,0           ;si dx = 0 EMPATARON, asi que se vuelve a jugar 
	je interlop_juego
	add gano,dh            ;sumo si gano el usuario 1 a gano
	add perdio,dl          ;sumo si gano la maquina 1 a perdio
	xor dx,dx
	cmp cantpartidas,3     ;comparo la cantidad de partidas para ver si el se termino el juego
	jl hasta1              ;dependiendo del modo de juego que eligio el usuario
	je hasta2
	jg hasta3

	jmp lop_juego      
hasta2:
	cmp gano,2
	je interganaste
	cmp perdio,2           ;AL MEJOR DE 3 
	je interperdiste
	jmp lop_juego
hasta3:
	cmp gano,3 
	je interganaste
	cmp perdio,3           ;AL MEJOR DE 5
	je interperdiste
	jmp lop_juego
hasta1:
	cmp gano[0],1
	je interganaste
	cmp perdio,1          ;AL MEJOR DE 1
	je interperdiste
	jmp lop_juego


;##########################################################################################################
;##########################################################################################################
;########################PANTALLA ELECCION USUARIO P P O T#################################################
;##########################################################################################################
;##########################################################################################################
PANTALLAELECCION:
mov si,2   ;MUEVO A SI 2 PARA IMPRIMIR LA PRIMER FLECHA EN EL MEDIO
coorxpapel:
mov posicion,130 ;PAPEL COORDENADA X FLECHA
jmp ELECCION
coorxpiedra:
mov posicion,35  ;PIEDRA COORDENADA X FLECHA
jmp ELECCION
coorxtijera:
mov posicion,226 ;TIJERA COORDENADA X FLECHA
jmp ELECCION
interganaste:
	jmp ganaste   ;SALTO INTERMEDIO 
interperdiste:
	jmp perdiste  ;SALTO INTERMEDIO
ELECCION:
	
	mov bl,00h
	mov dh,0   ;PINTO LA PANTALLA
	mov cl,15
	mov ch,15   
	call cambiarColor
	mov cl,0
	mov ch,0     ;POSICIONO EL CURSOR EN LA ESQUINA SUPERIOR IZQUIERDA
	call posCursor


	mov dx,Offset menumanos     ;IMRPRIMO EL MENU DE ELECCION DE LAS MANOS
	call imprimir
	;IMPRMIR PIEDRA
	mov bl,1       ;IMPPT CON BL = 1 IMRPRIME PIEDRA
	mov al,BLANCO              
	mov dl,80
	mov cl,30	 
	call impPPT
	;IMRPIMIR PAPEL
	mov bl,2       ;IMPPT CON BL = 2 IMRPRIME PIEDRA
	mov al,BLANCO
	mov dl,80
	mov cl,125	
	call impPPT 
	;IMPRMIR TIJERA
	mov bl,3        ;IMPPT CON BL =1 IMRPRIME PIEDRA
	mov al,BLANCO
	mov dl,80
	mov cl,220	
	call impPPT 
	lea bx, Flecha0    ;IMPRIMO LA FLECHA CON LAS COORDENADAS DE PAPEL PARA QUE ARRANQUE EN EL MEDIO
	mov al,BLANCO
	mov dl,140	       ;La coordenada y para imprimir la flecha siempre es igual
	mov cl,posicion    ;EN X  = 130 para el papel, 35 para piedra, 226 para la tijera 
	call impImagen
	jmp leerScan
intercoorxpapel:
	jmp coorxpapel	
intercoorxpiedra:
	jmp coorxpiedra      ;SALTOS INTERMEDIOS
intercoorxtijera:
	jmp coorxtijera	
interCuentaR:

	jmp intecuenta2

;----------------------CAJA DE LECTURA SCANCODE---------------------------
leerScan:	

	mov ah,00h
	int 16h               ;LEO EL SCANCODE INGRESADO POR EL USUARIO
	cmp ah, 4bh       ;<-FLECHA IZQUIERDA TECLADO
	je izquierda

	cmp ah, 4dh       ;->FLECHA DERECHA TECLADO
	je derecha

	cmp ah, 1ch       ;<Enter> SCAND CODE TECLADO
	je eligio
	;espero el scancode si no lo ingresa no hago nada
	jmp leerScan
izquierda:
	dec si         ;decremento si para posicionar la flecha donde cooresponde
	jmp comp
derecha:
	inc si         ;incremento si para posicionar la flecha donde cooresponde
comp:cmp si,1
	jl sumar3      ;cuando SI sea menor 1 le sumo 3 para que pegue la vuelta
	je intercoorxpiedra
	cmp si,2                    ;SI EL REGISTRO(SI), vale menos que 1 o mas que 3, le resto o sumo, dependiendo
	je intercoorxpapel			;dando el efecto de que la flecha pega la vuelta
	cmp si,3
	jg restar3     ;cuando SI sea mayor a 3 le resto 3 para que pegue la vuelta
	je intercoorxtijera
	jmp leerScan
sumar3:
	add si,3       ;sumo 3
	jmp comp
restar3:
	sub si,3       ;resto 3
	jmp comp
eligio:
	;esta en SI el dato, 1 =  piedra, 2 = papel, 3 = tijera
	mov ax, si      ;guardo la eleccion en ax
	xor si,si       ;limpio si, ya lo termine de usar
mover:	
	mov usuario, al   ;muevo la eleccion del usuario a la variable 
	xor ax,ax

	jmp lop_juego2    ;salto a la eleccion de la maquina(random) para luego imprimir el vs


;###########################################################################################################
;###########################################################################################################
;################################PANTALLA YOU WIN ##########################################################
;###########################################################################################################
;###########################################################################################################

ganaste:
	
	call clearrosa     ;LIMPIO PANTALLA
	call modografico   ;vuelvo a llamar al modo grafico
	
	call easterEgg
	
    					;en este caso no espero una tecla que ingrese el usuario, simplemente imprimo la imagen
	mov bx,50
	call delayTrans      ;le doy un pequeño delay para que mantenga la imagen

	call cuentaRegresiva
	cmp dx,0
CR:	jne interCuentaR
	jmp creditos
	
volver:
	jmp interCuentaR


perdiste:

	
;########################################################################################################################
;########################################################################################################################
;################################PANTALLA GAME OVER######################################################################
;########################################################################################################################
;########################################################################################################################

	call clearrosa             ;LIMPIO PANTALLA
	call modografico           ;vuelvo a llamar al modo grafico
	mov dx, offset perdistepic   ;le paso la imagen como parametro
    mov cx,3	                 ; le doy cx como parametro 
    ;ABRO EL ARCHIVO				
    call OpenFile
    mov si,3 				;le doy si como parametro para que guarde el encabezado en la variable correcta
    call ReadHeader
    call ReadPalette
    call CopyPal
    call CopyBitmap

	


	mov bx,50               ;en este caso no espero una tecla que ingrese el usuario, simplemente imprimo la imagen
	call delayTrans         ;le doy un pequeño delay para que mantenga la imagen
	call vaciarBuffer
;#####################################################################################################################
;#####################################################################################################################
;################################PANTALLA CUENTA REGRESIVA ###########################################################
;#####################################################################################################################
;#####################################################################################################################
	call cuentaRegresiva ;esto es una pantalla por si sola pero esta en la libreria como funcion
	cmp dx,0          ;de cuenta regresiva sale con dx = 1 si el usuario ingreso alguna tecla o 
	jne volver        ;dx = 0 si el usuario no ingreso ninguna tecla 
	jmp creditos         ;si el usuario ingreso una tecla vuelve a la ejecutar juego pero sin restartear el score 
					  ;para que mantega su puntuacion si quiere revancha y ganarle :)


;#####################################################################################################################
;#####################################################################################################################
;################################PANTALLA CREDITOS   #################################################################
;#####################################################################################################################
;#####################################################################################################################

creditos:

call Clearscreen

  lea dx,archivo   
  mov ah,3dH
  mov al,0
  int 21H
  jc openerr
  mov word ptr[credito], ax 

char:
  mov ah,3FH
  mov bx, word ptr [credito]      
  mov cx,1
  lea dx,readchar
  int 21H
  jc charerr
  
  cmp ax,0
  je final
  
  mov dl,readchar
  mov ah,02H
  int 21H
  
  cmp dl,0ah
  jne char
  cmp currentline,18h
  je endofpage
  inc currentline
  jmp char
  
endofpage:
  lea dx, nextpage
  mov ah,9
  int 21h
  
  mov ah,1
  int 21h      ;espera un enter para finalizar programa
  cmp al,0dh
  jne final
  mov currentline,01h
  call Clearscreen
  jmp char
 
 openerr:
  lea dx, filerror
  mov ah,9            ;imprime un cartel de error si no encuentra el txt
  int 21h
  jmp final
  
 charerr:
  lea dx, charactererror
  mov ah,9
  int 21h					  

	final: 
			mov ax, 4c00h
			int 21h

;-----------------------------FIN DEL CODIGO ESPERAMOS QUE LES HAYA GUSTADO  :)--------------------------------
main endp

end main
	;Alumnos:
			;-Deutsch, Denise
			;-Sosa, Alex 
			;-Sezaro, Tomas
			;-Marquez, Federico 
			;-Ganino, Matias
;==========================================================================================================================			