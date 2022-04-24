;--------------------VARIABLES PARA EL JUEGO-------------------------------------------------
;variable para pushTodo y popTodo
algo dw 1
;cartel para pruebas
;variables de elecciones	
erreleccion db "SU OPCION ES INCORRECTA", 24h

vareleccion db 0c9h,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0bbh
			db 0bah," BIENVENIDO AL PIEDRA PAPEL O TIJERA  ",0bah,0dh 
			db 0c8h,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0bch,0dh,24h
  Opciones 	db 0c9h,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0bbh
			db 0bah,"    SELECCIONE EL MODO DE JUEGO       ",0bah
		    db 0cch,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0b9h
			db 0bah,"1. Unica Partida.                     ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"3. Jugar al Mejor de Tres.            ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"5. Jugar al Mejor de Cinco.           ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"0. Salir del juego.                   ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah 
			db 0bah,"Nota: En caso de empate se repetira   ",0bah 
			db 0bah,"      la jugada.                      ",0bah 
			db 0c8h,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0bch,0dh,0ah,24h

;------------------------------------MENU PARA ELEGIR CON QUE QUIERE JUGAR EL USUARIO---------------------------------------------------------------------------
menumanos   db 0cch,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0b9h
			db 0bah,"           ELIJA SU OPCION            ",0bah
		    db 0cch,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0b9h
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\",0bah
			db 0bah,"   PIEDRA      PAPEL       TIJERA     ",0bah
			db 0bah,"\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah
			db 0bah,"                                      ",0bah 
			db 0bah,"                                      ",0bah 
			db 0bah,"                                      ",0bah 
			db 0bah,"                                      ",0bah 
			db 0bah,"                                      ",0bah 
			db 0bah,"                                      ",0bah 
			db 0bah,"                                      ",0bah 
			db 0c8h,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0bch,0dh,0ah,24h
;VARIBALES PARA DIBUJAR LAS MANOS EN LA PANTALLA
;--------------------------------------------------------	PIEDRA	---------------------------------------------------------------

	fila0 	db 9,10,11,12,13,14,17,18,19,20,21,22,25,25,26,27,28,29,30,24h
	fila1 	db 9,10,11,12,13,14,17,18,19,20,21,22,25,25,26,27,28,29,30,24h
	fila2 	db 7,8,15,16,23,24,31,32,24h
	fila3 	db 7,8,15,16,23,24,31,32,24h
	fila4 	db 2,3,4,5,6,7,8,15,16,23,24,31,32,24h
	fila5 	db 2,3,4,5,6,7,8,15,16,23,24,31,32,24h
	fila6 	db 0,1,7,8,15,16,23,24,31,32,24h
	fila7 	db 0,1,7,8,15,16,23,24,31,32,24h
	fila8 	db 0,1,7,8,15,16,23,24,31,32,24h
	fila9 	db 0,1,7,8,15,16,23,24,31,32,24h
	fila10 	db 0,1,7,8,15,16,23,24,31,32,24h
	fila11 	db 0,1,7,8,15,16,23,24,31,32,24h
	fila12 	db 0,1,7,8,15,16,23,24,31,32,24h
	fila13 	db 0,1,7,8,15,16,23,24,31,32,24h
	fila14 	db 0,1,7,8,15,16,23,24,31,32,24h
	fila15 	db 0,1,7,8,15,16,23,24,31,32,24h
	fila16 	db 0,1,7,8,15,16,23,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,24h
	fila17 	db 0,1,7,8,15,16,23,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,24h
	fila18 	db 0,1,2,3,4,5,6,9,10,11,12,13,14,17,18,34,35,24h
	fila19 	db 0,1,2,3,4,5,6,9,10,11,12,13,14,17,18,34,35,24h
	fila20 	db 0,1,17,18,34,35,24h
	fila21 	db 0,1,17,18,34,35,24h
	fila22 	db 0,1,17,18,34,35,24h
	fila23 	db 0,1,17,18,34,35,24h
	fila24 	db 0,1,19,20,21,22,23,24,25,26,27,28,29,34,35,24h
	fila25 	db 0,1,19,20,21,22,23,24,25,26,27,28,29,34,35,24h
	fila26 	db 0,1,34,35,24h
	fila27 	db 0,1,34,35,24h
	fila28 	db 0,1,34,35,24h
	fila29 	db 0,1,34,35,24h
	fila30 	db 2,3,32,33,24h
	fila31 	db 2,3,32,33,24h
	fila32 	db 2,3,32,33,24h
	fila33 	db 2,3,32,33,24h
	fila34 	db 4,5,30,31,24h
	fila35 	db 4,5,30,31,24h
	fila36 	db 6,7,8,9,26,27,28,29,24h
	fila37 	db 6,7,8,9,26,27,28,29,24h
	fila38 	db 10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,24h
	fila39 	db 10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,24h,24h


	;--------------------------------------------------------	PAPEL	---------------------------------------------------------------
	PfilaA	db 17,18,19,20,21,22,24h
	PfilaB	db 17,18,19,20,21,22,24h
	PfilaC 	db 15,16,23,24,24h
	PfilaD 	db 15,16,23,24,24h
	Pfila0	db 9,10,11,12,13,14,15,16,23,24,25,25,26,27,28,29,30,24h
	Pfila1 	db 9,10,11,12,13,14,15,16,23,24,25,26,27,28,29,30,24h
	Pfila2asd 	db 7,8,15,16,23,24,31,32,24h
	Pfila3bad 	db 7,8,15,16,23,24,31,32,24h
	Pfila2cad 	db 2,3,4,5,6,7,8,15,16,23,24,31,32,24h
	Pfila3dad 	db 2,3,4,5,6,7,8,15,16,23,24,31,32,24h
	Pfila2ead 	db 0,1,7,8,15,16,23,24,31,32,24h
	Pfila3fad 	db 0,1,7,8,15,16,23,24,31,32,24h
	;Pfila2 	db 0,1,7,8,15,16,23,24,31,32,24h
	;Pfila3 	db 0,1,7,8,15,16,23,24,31,32,24h
	;Pfila4 	db 0,1,7,8,15,16,23,24,31,32,24h
	;Pfila5 	db 0,1,7,8,15,16,23,24,31,32,24h
	Pfila6 	db 0,1,7,8,15,16,23,24,31,32,24h
	Pfila7 	db 0,1,7,8,15,16,23,24,31,32,24h
	Pfila8 	db 0,1,7,8,15,16,23,24,31,32,24h
	Pfila9 	db 0,1,7,8,15,16,23,24,31,32,24h
	Pfila10 db 0,1,7,8,15,16,23,24,31,32,24h
	Pfila11 db 0,1,7,8,15,16,23,24,31,32,24h
	Pfila12 db 0,1,7,8,15,16,23,24,31,32,24h
	Pfila13 db 0,1,7,8,15,16,23,24,31,32,24h
	Pfila14 db 0,1,31,32,24h
	Pfila15 db 0,1,31,32,24h
	Pfila16 db 0,1,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,24h
	Pfila17 db 0,1,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,24h
	Pfila18 db 0,1,17,18,34,35,24h
	Pfila19 db 0,1,17,18,34,35,24h
	Pfila20 db 0,1,17,18,34,35,24h
	Pfila21 db 0,1,17,18,34,35,24h
	Pfila22 db 0,1,17,18,34,35,24h
	Pfila23 db 0,1,17,18,34,35,24h
	Pfila24 db 0,1,19,20,21,22,23,24,25,26,27,28,29,34,35,24h
	Pfila25 db 0,1,19,20,21,22,23,24,25,26,27,28,29,34,35,24h
	Pfila26 db 0,1,34,35,24h
	Pfila27 db 0,1,34,35,24h
	Pfila28 db 0,1,34,35,24h
	Pfila29 db 0,1,34,35,24h
	Pfila30 db 2,3,32,33,24h
	Pfila31 db 2,3,32,33,24h
	Pfila32 db 2,3,32,33,24h
	Pfila33 db 2,3,32,33,24h
	Pfila34 db 4,5,30,31,24h
	Pfila35 db 4,5,30,31,24h
	Pfila36 db 6,7,8,9,26,27,28,29,24h
	Pfila37 db 6,7,8,9,26,27,28,29,24h
	Pfila38 db 10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,24h
	Pfila39 db 10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,24h,24h
;-------------------------------------------------------	TIJERA	---------------------------------------------------------------
	Sfila0  db 11,12,13,14,15,16,29,30,31,32,33,34,24h
	Sfila1  db 11,12,13,14,15,16,29,30,31,32,33,34,24h
	Sfila2  db 9,10,17,18,27,28,35,36;,24h ;;;;; 36=24h
	Sfila3  db 9,10,17,18,27,28,35,36;,24h
	Sfila4  db 9,10,17,18,27,28,35,36;,24h
	Sfila5  db 9,10,17,18,27,28,35,36;,24h
	Sfila6  db 10,11,18,19,27,28,35,36;,24h
	Sfila7  db 10,11,18,19,27,28,35,36;,24h
	Sfila8  db 9,10,11,12,13,14,19,20,27,28,35,36;36 DECIMAL ES IGUAL 24 HEXADECIMAL
	Sfila9  db 9,10,11,12,13,14,19,20,27,28,35,36;,24h
	Sfila10 db 7,8,15,16,19,20,25,26,33,34,24h
	Sfila11 db 7,8,15,16,19,20,25,26,33,34,24h
	Sfila12 db 2,3,4,5,6,7,8,15,16,21,22,25,26,33,34,24h
	Sfila13 db 2,3,4,5,6,7,8,15,16,21,22,25,26,33,34,24h
	Sfila14 db 0,1,7,8,15,16,21,22,25,26,33,34,24h
	Sfila15 db 0,1,7,8,15,16,21,22,25,26,33,34,24h
	SfilaA  db 0,1,7,8,15,16,21,22,25,26,33,34,24h
	SfilaB  db 0,1,7,8,15,16,21,22,25,26,33,34,24h
	SfilaC  db 0,1,7,8,15,16,23,24,31,32,24h
	SfilaD  db 0,1,7,8,15,16,23,24,31,32,24h
	SfilaE  db 0,1,7,8,15,16,23,24,31,32,24h
	SfilaF  db 0,1,7,8,15,16,23,24,31,32,24h
	Sfila16 db 0,1,7,8,15,16,23,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,24h
	Sfila17 db 0,1,7,8,15,16,23,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,24h
	Sfila18 db 0,1,2,3,4,5,6,9,10,11,12,13,14,17,18,34,35,24h
	Sfila19 db 0,1,2,3,4,5,6,9,10,11,12,13,14,17,18,34,35,24h
	Sfila20 db 0,1,17,18,34,35,24h
	Sfila21 db 0,1,17,18,34,35,24h
	Sfila22 db 0,1,17,18,34,35,24h
	Sfila23 db 0,1,17,18,34,35,24h
	Sfila24 db 0,1,19,20,21,22,23,24,25,26,27,28,29,34,35,24h
	Sfila25 db 0,1,19,20,21,22,23,24,25,26,27,28,29,34,35,24h
	Sfila26 db 0,1,34,35,24h
	Sfila27 db 0,1,34,35,24h
	Sfila28 db 0,1,34,35,24h
	Sfila29 db 0,1,34,35,24h
	Sfila30 db 2,3,32,33,24h
	Sfila31	db 2,3,32,33,24h
	Sfila32	db 2,3,32,33,24h
	Sfila33	db 2,3,32,33,24h
	Sfila34	db 4,5,30,31,24h
	Sfila35	db 4,5,30,31,24h
	Sfila36	db 6,7,8,9,26,27,28,29,24h
	Sfila37	db 6,7,8,9,26,27,28,29,24h
	Sfila38	db 10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,24h
	Sfila39	db 10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,24h,24h

;------------------------------FLECHA-------------------------------------------------------------
	Flecha0  db 12,13,24h
	Flecha1  db 11,12,13,14,24h
	Flecha2  db 10,11,12,13,14,15,24h
	Flecha3  db 9,10,11,12,13,14,15,16,24h
	Flecha4  db 8,9,10,11,12,13,14,15,16,17,24h
	Flecha5  db 7,8,9,10,11,12,13,14,15,16,17,18,24h
	Flecha6  db 6,7,8,9,10,11,12,13,14,15,16,17,18,19,24h
	Flecha7  db 5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,24h
	Flecha8  db 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,24h
	Flecha9  db 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,24h
	Flecha10 db 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24h
	Flecha11 db 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,24h
	Flecha12 db 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,24h
	Flecha13 db 10,11,12,13,14,15,24h
	Flecha14 db 10,11,12,13,14,15,24h
	Flecha15 db 10,11,12,13,14,15,24h
	FlechaA  db 10,11,12,13,14,15,24h
	FlechaB  db 10,11,12,13,14,15,24h
	FlechaC  db 10,11,12,13,14,15,24h
	FlechaD  db 10,11,12,13,14,15,24h
	FlechaE  db 10,11,12,13,14,15,24h
	FlechaF  db 10,11,12,13,14,15,24h
	Flecha16 db 10,11,12,13,14,15,24h
	Flecha17 db 10,11,12,13,14,15,24h
	Flecha18 db 10,11,12,13,14,15,24h
	Flecha19 db 10,11,12,13,14,15,24h
	Flecha20 db 10,11,12,13,14,15,24h
	Flecha21 db 10,11,12,13,14,15,24h
	Flecha22 db 10,11,12,13,14,15,24h
	Flecha23 db 10,11,12,13,14,15,24h
	Flecha24 db 10,11,12,13,14,15,24h
	Flecha25 db 10,11,12,13,14,15,24h
	Flecha26 db 10,11,12,13,14,15,24h
	Flecha27 db 10,11,12,13,14,15,24h
	Flecha28 db 10,11,12,13,14,15,24h
	Flecha29 db 10,11,12,13,14,15,24h,24h
;------------------	variables para la partida -----------------------------------
	usuario db 0    ;eleccion del usuario de piedra papel o tijera
	posicion db 0	;posicion en x donde imprimir la flecha
	gano db 0		;variable para ver las victorias del usuario
	perdio db 0		;variable para ver las derrotas del usuario
	maquina db 0	;eleccion random de la maquina piedra papel o tijera
	cantpartidas db 0;eleccion del usuario en que modo de juego desea jugar
;--------------------------	VARIABLES PARA EL SCORE-------------------------------

score db "000",24h	;score para imprimir en usuario y maquina en pantalla vs
scoreUsuario dW 0 	;SCORE DEL USUARIO 
scoreMaquina dW 0	;SCORE DE LA MAQUINA|
vs db "VS",24h		;vs para imprimir en el medio de las manos
espera db 1 	; Se usa en la pantalla de el usuario vs la maquina
textoUsuario  db "Usuario",0dh,0ah,24h 
textoMaquina db "Maquina",0dh,0ah,24h
;----------------------------VARIABLES PRINTAR UNA IMAGEN--------------------------------
filename db 'ppt.bmp',0  ;Foto inicio juego

ganastepic db 'youwin.bmp',0  ;foto de ganador 

eggpic db 'nwp.bmp',0

ganastehandle dw ?   ;variable donde se guarda el encabezado de youwin

negritohandle dw ?

perdistepic db 'gameover.bmp',0 ;imagen de game over

perdistehandle dw ?     ;encabezado de game over

filehandle dw ?         ;encabezado de archivo pptfinal

Header db 54 dup (0)	;encabezado de 54 bytes

Palette db 256*4 dup (0)  ;paleta de colores en modo Grafico

ScrLine db 320 dup (0)   

ErrorMsg db 'Error: No pudo abrirse el archivo', 13, 10,'$' ;mensaje de error si no se pudo abrir el archivo

;-------------------------------VARIABLES DE LA CUENTA REGRESIVA------------------------------------------
textoCuenta  db " Desea volver a jugar?",0dh,0ah,24h   
textoCuenta2 db "Ingrese una tecla",0dh,0ah,24h

nueve 	db 219,223,219,0dh,0ah,"                  ",223,223,219,0dh,0ah,"                  ",223,223,223,24h 		; Posiciono el cursor en 20 x asi que agrego 20 espacios para que imprima bien
ocho 	db 219,223,219,0dh,0ah,"                  ",219,223,219,0dh,0ah,"                  ",223,223,223,24h
siete 	db 219,223,219,0dh,0ah,"                    ",219,0dh,0ah,"                    ",223,24h
seis 	db 219,223,223,0dh,0ah,"                  ",219,223,219,0dh,0ah,"                  ",223,223,223,24h	
cinco 	db 219,223,223,0dh,0ah,"                  ",223,223,219,0dh,0ah,"                  ",223,223,223,24h
cuatro 	db 219," ",219,0dh,0ah,"                  ",223,223,219,0dh,0ah,"                    ",223,24h
tres 	db 223,223,219,0dh,0ah,"                  ",223,223,219,0dh,0ah,"                  ",223,223,223,24h
dos 	db 223,223,219,0dh,0ah,"                  ",219,223,223,0ah,0dh,"                  ",223,223,223,24h
uno 	db 223,219,0dh,0ah,"                   ",219,0ah,0dh,"                   ",223,24h
cero 	db 219,223,219,0dh,0ah,"                  ",219," ",219,0dh,0ah,"                  ",223,223,223,24h,24h

;----------------------------------------VARIABLES PARA LOS CREDITOS-----------------------------------------
 archivo db "creditos.txt", "$"
 credito db 00h,00h
 readchar db 20h
 filerror db "Archivo no existe o error de apertura", 0dh, 0ah, '$'
 charactererror db "Error de lectura de caracter", 0dh, 0ah, '$'
 nextpage db "Presione <Enter> para finalizar...", "$"
 currentline db 01h

;------------------------------------------VARIABLES DE PRUEBA SI YA ESTAS SEGURO AGREGALAS ARRIBA DONDE JUNTO A LAS VARIABLES QUE SE USAN CERCA-------------