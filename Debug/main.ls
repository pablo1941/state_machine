   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  20                     	bsct
  21  0000               _cont_ruleta:
  22  0000 00            	dc.b	0
  23  0001               _contPulsos:
  24  0001 01            	dc.b	1
  25  0002               _contReinicio:
  26  0002 01            	dc.b	1
  27  0003               _contHist:
  28  0003 01            	dc.b	1
  29  0004               L5_porcentajeBat:
  30  0004 00            	dc.b	0
  31  0005               L7_porcentajeRec:
  32  0005 00            	dc.b	0
  33  0006               L11_alarma:
  34  0006 00            	dc.b	0
  35  0007               L31_alarma_init:
  36  0007 00            	dc.b	0
  37  0008               L51_arrayBinario:
  38  0008 00            	dc.b	0
  39  0009 00            	dc.b	0
  40  000a 00            	dc.b	0
  41  000b 00            	dc.b	0
  42  000c 00            	dc.b	0
  43  000d               L71_a1:
  44  000d 00            	dc.b	0
  45  000e               L12_a2:
  46  000e 00            	dc.b	0
  47  000f               L32_a3:
  48  000f 00            	dc.b	0
  49  0010               L52_a4:
  50  0010 00            	dc.b	0
  51  0011               L72_a5:
  52  0011 00            	dc.b	0
  53  0012               L13_a_EE:
  54  0012 00            	dc.b	0
  55  0013               L33_recarga_provisional:
  56  0013 00            	dc.b	0
  57  0014               L53_porcBat:
  58  0014 00            	dc.b	0
  59  0015               L73_visualBat:
  60  0015 00            	dc.b	0
  61  0016               L14_visualRec:
  62  0016 00            	dc.b	0
 157                     ; 120 void main(void)
 157                     ; 121 {
 159                     .text:	section	.text,new
 160  0000               _main:
 162  0000 88            	push	a
 163       00000001      OFST:	set	1
 166                     ; 123  	conf_GPIO();
 168  0001 cd0000        	call	_conf_GPIO
 170                     ; 124 	EXTI_setup();
 172  0004 cd0000        	call	_EXTI_setup
 174                     ; 125 	clock_setup();
 176  0007 cd0000        	call	_clock_setup
 178                     ; 126 	Flash_setup();
 180  000a cd0000        	call	_Flash_setup
 182                     ; 127 	TIM1_setup();	
 184  000d cd0000        	call	_TIM1_setup
 186                     ; 128 	TIM2_setup();
 188  0010 cd0000        	call	_TIM2_setup
 190                     ; 130 	UART1_setup();
 192  0013 cd0000        	call	_UART1_setup
 194                     ; 131 	encenderBuzzer();
 196  0016 cd0000        	call	_encenderBuzzer
 198                     ; 133 	config_IWDT();
 200  0019 cd0000        	call	_config_IWDT
 202                     ; 134 	enableInterrupts();
 205  001c 9a            	rim	
 207                     ; 135 	encenderBuzzer();
 210  001d cd0000        	call	_encenderBuzzer
 212                     ; 136 	apagarLeds();
 214  0020 cd0000        	call	_apagarLeds
 216                     ; 137 	actualizarLeds(31-4, CMD_RECARGA);	
 218  0023 ae1b52        	ldw	x,#6994
 219  0026 cd0000        	call	_actualizarLeds
 221                     ; 138 	actualizarLeds(4, CMD_BATERIA);		
 223  0029 ae0442        	ldw	x,#1090
 224  002c cd0000        	call	_actualizarLeds
 226                     ; 139 	for(ja = 0; ja<30000; ja++);
 228  002f 5f            	clrw	x
 229  0030               L531:
 233  0030 5c            	incw	x
 236  0031 a37530        	cpw	x,#30000
 237  0034 2ffa          	jrslt	L531
 238  0036 bf00          	ldw	_ja,x
 239                     ; 140 	for(ja = 0; ja<30000; ja++);
 241  0038 5f            	clrw	x
 242  0039               L341:
 246  0039 5c            	incw	x
 249  003a a37530        	cpw	x,#30000
 250  003d 2ffa          	jrslt	L341
 251  003f bf00          	ldw	_ja,x
 252                     ; 141 	for(ja = 0; ja<30000; ja++);		
 254  0041 5f            	clrw	x
 255  0042               L151:
 259  0042 5c            	incw	x
 262  0043 a37530        	cpw	x,#30000
 263  0046 2ffa          	jrslt	L151
 264  0048 bf00          	ldw	_ja,x
 265                     ; 142 	for(ja = 0; ja<30000; ja++);		
 267  004a 5f            	clrw	x
 268  004b               L751:
 272  004b 5c            	incw	x
 275  004c a37530        	cpw	x,#30000
 276  004f 2ffa          	jrslt	L751
 277  0051 bf00          	ldw	_ja,x
 278                     ; 143 	for(ja = 0; ja<30000; ja++);
 280  0053 5f            	clrw	x
 281  0054               L561:
 285  0054 5c            	incw	x
 288  0055 a37530        	cpw	x,#30000
 289  0058 2ffa          	jrslt	L561
 290  005a bf00          	ldw	_ja,x
 291                     ; 146 	inicializar();
 293  005c               LC001:
 295  005c cd0000        	call	_inicializar
 297  005f               L371:
 298                     ; 150   		refrescarIWDG();
 300  005f cd0000        	call	_refrescarIWDG
 302                     ; 151   		if(cont_restart == TIME_RESTART)
 304  0062 be05          	ldw	x,_cont_restart
 305  0064 a30104        	cpw	x,#260
 306  0067 2605          	jrne	L771
 307                     ; 153 			cont_restart = 0;
 309  0069 5f            	clrw	x
 310  006a bf05          	ldw	_cont_restart,x
 311                     ; 155   			main();
 313  006c ad92          	call	_main
 315  006e               L771:
 316                     ; 158 		if(flag_reinicio)
 318  006e 3d0a          	tnz	_flag_reinicio
 319  0070 2603cc011d    	jreq	L102
 320                     ; 160 			actualizarLeds(10, CMD_BATERIA);		
 322  0075 ae0a42        	ldw	x,#2626
 323  0078 cd0000        	call	_actualizarLeds
 325                     ; 161 			actualizarLeds(4, CMD_RECARGA);
 327  007b ae0452        	ldw	x,#1106
 328  007e cd0000        	call	_actualizarLeds
 330                     ; 162 			for(ja = 0; ja<30000; ja++);
 332  0081 5f            	clrw	x
 333  0082               L302:
 337  0082 5c            	incw	x
 340  0083 a37530        	cpw	x,#30000
 341  0086 2ffa          	jrslt	L302
 342  0088 bf00          	ldw	_ja,x
 343                     ; 163 			for(ja = 0; ja<30000; ja++);
 345  008a 5f            	clrw	x
 346  008b               L112:
 350  008b 5c            	incw	x
 353  008c a37530        	cpw	x,#30000
 354  008f 2ffa          	jrslt	L112
 355  0091 bf00          	ldw	_ja,x
 356                     ; 164 			for(ja = 0; ja<30000; ja++);		
 358  0093 5f            	clrw	x
 359  0094               L712:
 363  0094 5c            	incw	x
 366  0095 a37530        	cpw	x,#30000
 367  0098 2ffa          	jrslt	L712
 368  009a bf00          	ldw	_ja,x
 369                     ; 165 			for(ja = 0; ja<30000; ja++);		
 371  009c 5f            	clrw	x
 372  009d               L522:
 376  009d 5c            	incw	x
 379  009e a37530        	cpw	x,#30000
 380  00a1 2ffa          	jrslt	L522
 381  00a3 bf00          	ldw	_ja,x
 382                     ; 166 			for(ja = 0; ja<30000; ja++);
 384  00a5 5f            	clrw	x
 385  00a6               L332:
 389  00a6 5c            	incw	x
 392  00a7 a37530        	cpw	x,#30000
 393  00aa 2ffa          	jrslt	L332
 394  00ac bf00          	ldw	_ja,x
 395                     ; 168 			UART1_SendData8('S');
 397  00ae a653          	ld	a,#83
 398  00b0 cd0000        	call	_UART1_SendData8
 400                     ; 170 			for(ja = 0; ja<30000; ja++);
 402  00b3 5f            	clrw	x
 403  00b4               L142:
 407  00b4 5c            	incw	x
 410  00b5 a37530        	cpw	x,#30000
 411  00b8 2ffa          	jrslt	L142
 412  00ba bf00          	ldw	_ja,x
 413                     ; 171 			for(ja = 0; ja<30000; ja++);
 415  00bc 5f            	clrw	x
 416  00bd               L742:
 420  00bd 5c            	incw	x
 423  00be a37530        	cpw	x,#30000
 424  00c1 2ffa          	jrslt	L742
 425  00c3 bf00          	ldw	_ja,x
 426                     ; 172 			for(ja = 0; ja<30000; ja++);		
 428  00c5 5f            	clrw	x
 429  00c6               L552:
 433  00c6 5c            	incw	x
 436  00c7 a37530        	cpw	x,#30000
 437  00ca 2ffa          	jrslt	L552
 438  00cc bf00          	ldw	_ja,x
 439                     ; 173 			UART1_SendData8('T');
 441  00ce a654          	ld	a,#84
 442  00d0 cd0000        	call	_UART1_SendData8
 444                     ; 174 			for(ja = 0; ja<30000; ja++);
 446  00d3 5f            	clrw	x
 447  00d4               L362:
 451  00d4 5c            	incw	x
 454  00d5 a37530        	cpw	x,#30000
 455  00d8 2ffa          	jrslt	L362
 456  00da bf00          	ldw	_ja,x
 457                     ; 175 			for(ja = 0; ja<30000; ja++);
 459  00dc 5f            	clrw	x
 460  00dd               L172:
 464  00dd 5c            	incw	x
 467  00de a37530        	cpw	x,#30000
 468  00e1 2ffa          	jrslt	L172
 469  00e3 bf00          	ldw	_ja,x
 470                     ; 176 			for(ja = 0; ja<30000; ja++);	
 472  00e5 5f            	clrw	x
 473  00e6               L772:
 477  00e6 5c            	incw	x
 480  00e7 a37530        	cpw	x,#30000
 481  00ea 2ffa          	jrslt	L772
 482  00ec bf00          	ldw	_ja,x
 483                     ; 177 			UART1_SendData8('M');
 485  00ee a64d          	ld	a,#77
 486  00f0 cd0000        	call	_UART1_SendData8
 488                     ; 178 			for(ja = 0; ja<30000; ja++);
 490  00f3 5f            	clrw	x
 491  00f4               L503:
 495  00f4 5c            	incw	x
 498  00f5 a37530        	cpw	x,#30000
 499  00f8 2ffa          	jrslt	L503
 500  00fa bf00          	ldw	_ja,x
 501                     ; 179 			for(ja = 0; ja<30000; ja++);
 503  00fc 5f            	clrw	x
 504  00fd               L313:
 508  00fd 5c            	incw	x
 511  00fe a37530        	cpw	x,#30000
 512  0101 2ffa          	jrslt	L313
 513  0103 bf00          	ldw	_ja,x
 514                     ; 180 			for(ja = 0; ja<30000; ja++);				
 516  0105 5f            	clrw	x
 517  0106               L123:
 521  0106 5c            	incw	x
 524  0107 a37530        	cpw	x,#30000
 525  010a 2ffa          	jrslt	L123
 526  010c bf00          	ldw	_ja,x
 527                     ; 181 			UART1_SendData8(32);
 529  010e a620          	ld	a,#32
 530  0110 cd0000        	call	_UART1_SendData8
 532                     ; 182 			UART1_ClearFlag(UART1_FLAG_TXE);
 534  0113 ae0080        	ldw	x,#128
 535  0116 cd0000        	call	_UART1_ClearFlag
 537                     ; 186 			estado = ESTADO_FIN;
 539  0119 35090002      	mov	L3_estado,#9
 540  011d               L102:
 541                     ; 188 		switch(estado)
 543  011d b602          	ld	a,L3_estado
 545                     ; 621 			default:{break;}	
 546  011f 4a            	dec	a
 547  0120 2730          	jreq	L34
 548  0122 4a            	dec	a
 549  0123 2752          	jreq	L54
 550  0125 4a            	dec	a
 551  0126 2603cc01fa    	jreq	L56
 552  012b 4a            	dec	a
 553  012c 2603cc02a0    	jreq	L76
 554  0131 4a            	dec	a
 555  0132 2603cc0310    	jreq	L37
 556  0137 4a            	dec	a
 557  0138 2603cc02d2    	jreq	L17
 558  013d 4a            	dec	a
 559  013e 2603cc0484    	jreq	L77
 560  0143 4a            	dec	a
 561  0144 2603cc0402    	jreq	L57
 562  0149 4a            	dec	a
 563  014a 2603cc04d8    	jreq	L101
 564  014f cc005f        	jra	L371
 565  0152               L34:
 566                     ; 192 				refrescarIWDG();
 568  0152 cd0000        	call	_refrescarIWDG
 570                     ; 193 				if(flag_boton)
 572  0155 3d10          	tnz	_flag_boton
 573  0157 2707          	jreq	L333
 574                     ; 195 					estado = ESTADO_VISUALIZAR;					
 576  0159 35030002      	mov	L3_estado,#3
 578  015d cc005f        	jra	L371
 579  0160               L333:
 580                     ; 197 				else if(flag_recibir)
 582  0160 3d0d          	tnz	_flag_recibir
 583                     ; 199 					estado = ESTADO_RECIBIR;					
 585  0162 2703cc04a6    	jrne	LC002
 586                     ; 201 				else if(flag_historicos)
 588  0167 3d0c          	tnz	_flag_historicos
 589  0169 27f2          	jreq	L371
 590                     ; 203 					TIM2_Cmd(ENABLE);
 592  016b a601          	ld	a,#1
 593  016d cd04de        	call	LC017
 595                     ; 205 					estado = ESTADO_HISTORICOS;
 597  0170 35040002      	mov	L3_estado,#4
 598  0174 cc005f        	jra	L371
 599  0177               L54:
 600                     ; 211 					refrescarIWDG();
 602  0177 cd0000        	call	_refrescarIWDG
 604                     ; 212 					cont_tim2 = 0;
 606  017a 5f            	clrw	x
 607  017b bf07          	ldw	_cont_tim2,x
 608                     ; 214 					switch(Slave_Buffer_Rx[0])
 610  017d b603          	ld	a,_Slave_Buffer_Rx
 612                     ; 265 						default:{main();break;}
 613  017f a041          	sub	a,#65
 614  0181 273e          	jreq	L35
 615  0183 4a            	dec	a
 616  0184 2715          	jreq	L74
 617  0186 a007          	sub	a,#7
 618  0188 2756          	jreq	L75
 619  018a a005          	sub	a,#5
 620  018c 2744          	jreq	L55
 621  018e a004          	sub	a,#4
 622  0190 271c          	jreq	L15
 623  0192 a005          	sub	a,#5
 624  0194 2754          	jreq	L16
 627  0196 cd0000        	call	_main
 631  0199 205a          	jra	L743
 632  019b               L74:
 633                     ; 218 							porcentajeBat = Slave_Buffer_Rx[1];
 635  019b 450404        	mov	L5_porcentajeBat,_Slave_Buffer_Rx+1
 636                     ; 219 							actualizarEEPROM(ADDR_BATERIA,porcentajeBat);
 638  019e 3b0004        	push	L5_porcentajeBat
 639  01a1 ae4006        	ldw	x,#16390
 640  01a4 cd0000        	call	_actualizarEEPROM
 642  01a7 35090002      	mov	L3_estado,#9
 643  01ab 84            	pop	a
 644                     ; 220 							estado = ESTADO_FIN;							
 646                     ; 221 							break;
 648  01ac 2047          	jra	L743
 649  01ae               L15:
 650                     ; 225 							porcentajeRec = Slave_Buffer_Rx[1];
 652  01ae 450405        	mov	L7_porcentajeRec,_Slave_Buffer_Rx+1
 653                     ; 226 							actualizarEEPROM(ADDR_RECARGA,porcentajeRec);						
 655  01b1 3b0005        	push	L7_porcentajeRec
 656  01b4 ae4007        	ldw	x,#16391
 657  01b7 cd0000        	call	_actualizarEEPROM
 659  01ba 35090002      	mov	L3_estado,#9
 660  01be 84            	pop	a
 661                     ; 227 							estado = ESTADO_FIN;
 663                     ; 228 							break;
 665  01bf 2034          	jra	L743
 666  01c1               L35:
 667                     ; 232 							alarma = Slave_Buffer_Rx[1];
 669  01c1 450406        	mov	L11_alarma,_Slave_Buffer_Rx+1
 670                     ; 233 							guardarAlarma();
 672  01c4 cd0000        	call	_guardarAlarma
 674                     ; 234 							TIM2_Cmd(ENABLE);
 676  01c7 a601          	ld	a,#1
 677  01c9 cd04de        	call	LC017
 679                     ; 236 							estado = ESTADO_ALARMA;
 681  01cc 35060002      	mov	L3_estado,#6
 682                     ; 238 							break;
 684  01d0 2023          	jra	L743
 685  01d2               L55:
 686                     ; 242 							TIM1_setup2();
 688  01d2 cd0000        	call	_TIM1_setup2
 690                     ; 243 							TIM2_Cmd(ENABLE);
 692  01d5 a601          	ld	a,#1
 693  01d7 cd04de        	call	LC017
 695                     ; 245 							estado = ESTADO_NOTIFICACION;
 697  01da 35050002      	mov	L3_estado,#5
 698                     ; 247 							break;
 700  01de 2015          	jra	L743
 701  01e0               L75:
 702                     ; 251 							TIM2_Cmd(ENABLE);
 704  01e0 4c            	inc	a
 705  01e1 cd04de        	call	LC017
 707                     ; 253 							estado = ESTADO_INICIO;
 709  01e4 35080002      	mov	L3_estado,#8
 710                     ; 255 							break;
 712  01e8 200b          	jra	L743
 713  01ea               L16:
 714                     ; 259 							alarma_init = Slave_Buffer_Rx[1];
 716  01ea 450407        	mov	L31_alarma_init,_Slave_Buffer_Rx+1
 717                     ; 260 							TIM2_Cmd(ENABLE);
 719  01ed 4c            	inc	a
 720  01ee cd04de        	call	LC017
 722                     ; 262 							estado = ESTADO_WARNING;
 724  01f1 35070002      	mov	L3_estado,#7
 725                     ; 263 							break;
 727  01f5               L743:
 728                     ; 267 					flag_recibir = FALSE;
 730  01f5 3f0d          	clr	_flag_recibir
 731                     ; 268 				break;
 733  01f7 cc005f        	jra	L371
 734  01fa               L56:
 735                     ; 273 					recarga_provisional = leerEEPROM(ADDR_RECARGA);
 737  01fa ae4007        	ldw	x,#16391
 738  01fd cd0000        	call	_leerEEPROM
 740  0200 b713          	ld	L33_recarga_provisional,a
 741                     ; 274 					porcBat = leerEEPROM(ADDR_BATERIA) ;
 743  0202 ae4006        	ldw	x,#16390
 744  0205 cd0000        	call	_leerEEPROM
 746  0208 b714          	ld	L53_porcBat,a
 747                     ; 275 					visualBat = 0; 
 749  020a 3f15          	clr	L73_visualBat
 750                     ; 276 					visualRec = (1<<recarga_provisional) - 1;
 752  020c 5f            	clrw	x
 753  020d b613          	ld	a,L33_recarga_provisional
 754  020f cd04e6        	call	LC018
 755  0212 2704          	jreq	L231
 756  0214               L431:
 757  0214 48            	sll	a
 758  0215 5a            	decw	x
 759  0216 26fc          	jrne	L431
 760  0218               L231:
 761  0218 4a            	dec	a
 762  0219 b716          	ld	L14_visualRec,a
 763                     ; 278 					TIM2_Cmd(ENABLE);
 765  021b a601          	ld	a,#1
 766  021d cd04de        	call	LC017
 768                     ; 282 					refrescarIWDG();
 770  0220 cd0000        	call	_refrescarIWDG
 772                     ; 285 					if(porcBat == 0)
 774  0223 b614          	ld	a,L53_porcBat
 775  0225 2606          	jrne	LC016
 776                     ; 287 						visualBat = 16 ;//Encender Led5 Rojo para indicar porcentaje de bateria nulo.
 778  0227 35100015      	mov	L73_visualBat,#16
 780  022b 200d          	jra	L353
 781                     ; 289 					else if (porcBat != 0)
 783  022d               LC016:
 784                     ; 291 						visualBat = (1<<porcBat) - 1;
 786  022d 5f            	clrw	x
 787  022e cd04e6        	call	LC018
 788  0231 2704          	jreq	L441
 789  0233               L641:
 790  0233 48            	sll	a
 791  0234 5a            	decw	x
 792  0235 26fc          	jrne	L641
 793  0237               L441:
 794  0237 4a            	dec	a
 795  0238 b715          	ld	L73_visualBat,a
 796  023a               L353:
 797                     ; 294 					if( (recarga_provisional == 0)  && ( cont_tim2 <= UMBRAL_CONTEO ) )
 799  023a b613          	ld	a,L33_recarga_provisional
 800  023c 2621          	jrne	L753
 802  023e be07          	ldw	x,_cont_tim2
 803  0240 a3000b        	cpw	x,#11
 804  0243 2e1a          	jrsge	L753
 805                     ; 296 						if(flag_tim2)
 807  0245 3d09          	tnz	_flag_tim2
 808  0247 270a          	jreq	L163
 809                     ; 298 							apagarLeds();
 812                     ; 299 							actualizarLeds(visualBat, CMD_BATERIA);							
 814  0249               LC013:
 816  0249 cd0000        	call	_apagarLeds
 818  024c b615          	ld	a,L73_visualBat
 819  024e ae0042        	ldw	x,#66
 822  0251 2027          	jp	LC004
 823  0253               L163:
 824                     ; 301 						else if(!flag_tim2)
 826  0253 3d09          	tnz	_flag_tim2
 827  0255 2627          	jrne	L573
 828                     ; 303 							apagarLeds();
 830  0257 cd0000        	call	_apagarLeds
 832                     ; 305 							sinSaldo();																		
 834  025a cd0000        	call	_sinSaldo
 836                     ; 307 						estado = ESTADO_VISUALIZAR;											
 838  025d 201f          	jp	L573
 839  025f               L753:
 840                     ; 310 					else if( (cont_tim2 <= UMBRAL_CONTEO)  && (recarga_provisional != 0 ))
 842  025f be07          	ldw	x,_cont_tim2
 843  0261 a3000b        	cpw	x,#11
 844  0264 2e1e          	jrsge	L173
 846  0266 b613          	ld	a,L33_recarga_provisional
 847  0268 271a          	jreq	L173
 848                     ; 312 							if(flag_tim2)
 850  026a 3d09          	tnz	_flag_tim2
 851                     ; 314 								apagarLeds();
 853                     ; 315 								actualizarLeds(visualBat, CMD_BATERIA);							
 856  026c 26db          	jrne	LC013
 857                     ; 317 							else if(!flag_tim2)
 859  026e 3d09          	tnz	_flag_tim2
 860  0270 260c          	jrne	L573
 861                     ; 319 								apagarLeds();
 863  0272 cd0000        	call	_apagarLeds
 865                     ; 320 								actualizarLeds(visualRec,CMD_RECARGA);																	
 867  0275 b616          	ld	a,L14_visualRec
 868  0277 ae0052        	ldw	x,#82
 869  027a               LC004:
 870  027a 95            	ld	xh,a
 871  027b cd0000        	call	_actualizarLeds
 873  027e               L573:
 874                     ; 322 							estado = ESTADO_VISUALIZAR;
 877  027e 35030002      	mov	L3_estado,#3
 879  0282 200b          	jra	L763
 880  0284               L173:
 881                     ; 325 					else if ((cont_tim2 > UMBRAL_CONTEO))
 883  0284 be07          	ldw	x,_cont_tim2
 884  0286 a3000b        	cpw	x,#11
 885  0289 2f04          	jrslt	L763
 886                     ; 327 						estado = ESTADO_FIN;	
 888  028b 35090002      	mov	L3_estado,#9
 889  028f               L763:
 890                     ; 329 					if(flag_historicos)
 892  028f 3d0c          	tnz	_flag_historicos
 893  0291 2603cc005f    	jreq	L371
 894                     ; 331 						apagarLeds();
 896  0296 cd0000        	call	_apagarLeds
 898                     ; 332 						estado = ESTADO_HISTORICOS;
 900  0299 35040002      	mov	L3_estado,#4
 901  029d cc005f        	jra	L371
 902  02a0               L76:
 903                     ; 346 					refrescarIWDG();
 905  02a0 cd0000        	call	_refrescarIWDG
 907                     ; 347 					TIM1_Cmd(ENABLE);
 909  02a3 a601          	ld	a,#1
 910  02a5 cd0000        	call	_TIM1_Cmd
 912                     ; 348 					if(flag_historicos)
 914  02a8 3d0c          	tnz	_flag_historicos
 915  02aa 271f          	jreq	L704
 916                     ; 350 						apagarLeds();						
 918  02ac cd0000        	call	_apagarLeds
 920                     ; 351 						if(cont_tim2%4 != 0 )
 922  02af be07          	ldw	x,_cont_tim2
 923  02b1 a604          	ld	a,#4
 924  02b3 cd0000        	call	c_smodx
 926  02b6 5d            	tnzw	x
 927  02b7 2708          	jreq	L114
 928                     ; 353 							leerAlarma();
 930  02b9 cd0000        	call	_leerAlarma
 932                     ; 354 							apagarBuzzer(); 																					
 934  02bc cd0000        	call	_apagarBuzzer
 937  02bf 2003          	jra	L314
 938  02c1               L114:
 939                     ; 358 							encenderBuzzer();													
 941  02c1 cd0000        	call	_encenderBuzzer
 943  02c4               L314:
 944                     ; 360 						estado = ESTADO_HISTORICOS;						
 946  02c4 35040002      	mov	L3_estado,#4
 948  02c8 cc049a        	jra	L316
 949  02cb               L704:
 950                     ; 362 					else if (!flag_historicos)
 952  02cb 3d0c          	tnz	_flag_historicos
 953  02cd 26f9          	jrne	L316
 954                     ; 364 						estado = ESTADO_FIN;							
 955                     ; 366 					if(flag_recibir)
 956                     ; 368 						apagarLeds();
 958                     ; 369 						flag_boton = FALSE;
 959                     ; 370 						cont_tim2 = 0;
 960                     ; 371 						estado = ESTADO_RECIBIR;
 961  02cf cc0496        	jp	LC014
 962  02d2               L17:
 963                     ; 377 				refrescarIWDG();			
 965  02d2 cd0000        	call	_refrescarIWDG
 967                     ; 378 				if((flag_boton == TRUE) || (cont_tim2 > TOUT_ALARMA))
 969  02d5 b610          	ld	a,_flag_boton
 970  02d7 4a            	dec	a
 971  02d8 2603cc0493    	jreq	L116
 973  02dd be07          	ldw	x,_cont_tim2
 974  02df a3003d        	cpw	x,#61
 975                     ; 380 					apagarBuzzer();
 977                     ; 381 					estado = ESTADO_FIN;
 979                     ; 398 				if(flag_recibir)
 980                     ; 400 					apagarLeds();
 982                     ; 401 					flag_boton = FALSE;
 983                     ; 402 					cont_tim2 = 0;
 984                     ; 403 					estado = ESTADO_RECIBIR;
 985  02e2 2ef6          	jrsge	L116
 986                     ; 383 				else if((cont_tim2 <= TOUT_ALARMA))
 988  02e4 be07          	ldw	x,_cont_tim2
 989  02e6 a3003d        	cpw	x,#61
 990  02e9 2edd          	jrsge	L316
 991                     ; 385 					apagarLeds();
 993  02eb cd0000        	call	_apagarLeds
 995                     ; 386 					actualizarLeds(alarma,CMD_BATERIA); //Alarmas en rojo
 997  02ee b606          	ld	a,L11_alarma
 998  02f0 ae0042        	ldw	x,#66
 999  02f3 95            	ld	xh,a
1000  02f4 cd0000        	call	_actualizarLeds
1002                     ; 388 					if(cont_tim2%3 != 0 )
1004  02f7 be07          	ldw	x,_cont_tim2
1005  02f9 a603          	ld	a,#3
1006  02fb cd0000        	call	c_smodx
1008  02fe 5d            	tnzw	x
1009  02ff 2705          	jreq	L334
1010                     ; 390 						encenderBuzzer();
1012  0301 cd0000        	call	_encenderBuzzer
1015  0304 2003          	jra	L534
1016  0306               L334:
1017                     ; 394 						apagarBuzzer();	
1019  0306 cd0000        	call	_apagarBuzzer
1021  0309               L534:
1022                     ; 396 					estado = ESTADO_ALARMA;
1024  0309 35060002      	mov	L3_estado,#6
1025  030d cc049a        	jra	L316
1026  0310               L37:
1027                     ; 409 				uint8_t notif = Slave_Buffer_Rx[1];
1029  0310 b604          	ld	a,_Slave_Buffer_Rx+1
1030  0312 6b01          	ld	(OFST+0,sp),a
1032                     ; 410 				apagarLeds();
1034  0314 cd0000        	call	_apagarLeds
1036                     ; 412 				refrescarIWDG();
1038  0317 cd0000        	call	_refrescarIWDG
1040                     ; 414 				if(flag_notificacion == FALSE )
1042  031a 3d0b          	tnz	_flag_notificacion
1043  031c 2609          	jrne	L144
1044                     ; 416 					flag_notificacion = TRUE;
1046  031e 3501000b      	mov	_flag_notificacion,#1
1047                     ; 417 					cont_tim2 = 1;
1049  0322 ae0001        	ldw	x,#1
1050  0325 bf07          	ldw	_cont_tim2,x
1051  0327               L144:
1052                     ; 419 				if(notif == COND_END_RFID )
1054  0327 7b01          	ld	a,(OFST+0,sp)
1055  0329 4a            	dec	a
1056                     ; 421 					estado = ESTADO_FIN;
1058  032a 27a3          	jreq	LC014
1059                     ; 423 				else if(notif == COND_INIT_RFID)
1061  032c 7b01          	ld	a,(OFST+0,sp)
1062  032e 262f          	jrne	L744
1063                     ; 425 					if(cont_tim2 < TOUT_RECARGA )
1065  0330 be07          	ldw	x,_cont_tim2
1066  0332 a30003        	cpw	x,#3
1067  0335 2e1e          	jrsge	L154
1068                     ; 427 						actualizarLeds((1<<cont_ruleta) - 1, CMD_BATERIA);	
1070  0337 b600          	ld	a,_cont_ruleta
1071  0339 5f            	clrw	x
1072  033a cd04e6        	call	LC018
1073  033d 2704          	jreq	L432
1074  033f               L632:
1075  033f 48            	sll	a
1076  0340 5a            	decw	x
1077  0341 26fc          	jrne	L632
1078  0343               L432:
1079  0343 4a            	dec	a
1080  0344 ae0042        	ldw	x,#66
1081  0347 95            	ld	xh,a
1082  0348 cd0000        	call	_actualizarLeds
1084                     ; 428 						estado = ESTADO_NOTIFICACION;
1086  034b 35050002      	mov	L3_estado,#5
1087                     ; 429 						encenderBuzzer();
1089  034f cd0000        	call	_encenderBuzzer
1092  0352 cc049a        	jra	L316
1093  0355               L154:
1094                     ; 431 					else if(cont_tim2 >= TOUT_RECARGA)
1096  0355 be07          	ldw	x,_cont_tim2
1097  0357 a30003        	cpw	x,#3
1098  035a 2ff6          	jrslt	L316
1099                     ; 433 						estado = ESTADO_FIN;						
1100  035c cc0496        	jp	LC014
1101  035f               L744:
1102                     ; 436 				else if(notif == COND_ULTIMO_DIA)
1104  035f a103          	cp	a,#3
1105  0361 2616          	jrne	L164
1106                     ; 438 					if(cont_tim2 <= UMBRAL_CONTEO )
1108  0363 be07          	ldw	x,_cont_tim2
1109  0365 a3000b        	cpw	x,#11
1110  0368 2e05          	jrsge	L364
1111                     ; 440 						sinSaldo();					
1113  036a cd0000        	call	_sinSaldo
1115                     ; 441 						estado = ESTADO_NOTIFICACION;
1117  036d 2041          	jp	LC007
1118  036f               L364:
1119                     ; 443 					else if ((cont_tim2 > UMBRAL_CONTEO ))
1121  036f be07          	ldw	x,_cont_tim2
1122  0371 a3000b        	cpw	x,#11
1123  0374 2fdc          	jrslt	L316
1124                     ; 445 						estado = ESTADO_FIN;
1125  0376 cc0496        	jp	LC014
1126  0379               L164:
1127                     ; 448 				else if(notif == COND_PIN_VALIDO)
1129  0379 a104          	cp	a,#4
1130  037b 260f          	jrne	L374
1131                     ; 450 					if(cont_tim2>1)
1133  037d be07          	ldw	x,_cont_tim2
1134  037f a30002        	cpw	x,#2
1135                     ; 452 						estado = ESTADO_FIN;
1137  0382 2ef2          	jrsge	LC014
1138                     ; 456 						encenderBuzzer();
1140  0384 cd0000        	call	_encenderBuzzer
1142                     ; 457 						actualizarLeds(24,CMD_RECARGA);
1144  0387 ae1852        	ldw	x,#6226
1146                     ; 458 						estado = ESTADO_NOTIFICACION;
1147  038a 2021          	jp	LC008
1148  038c               L374:
1149                     ; 461 				else if(notif == COND_PIN_INVALIDO)
1151  038c a105          	cp	a,#5
1152  038e 260f          	jrne	L305
1153                     ; 463 					if(cont_tim2>1)
1155  0390 be07          	ldw	x,_cont_tim2
1156  0392 a30002        	cpw	x,#2
1157                     ; 465 						estado = ESTADO_FIN;
1159  0395 2edf          	jrsge	LC014
1160                     ; 469 						encenderBuzzer();
1162  0397 cd0000        	call	_encenderBuzzer
1164                     ; 470 						actualizarLeds(24,CMD_BATERIA);	
1166  039a ae1842        	ldw	x,#6210
1168                     ; 471 						estado = ESTADO_NOTIFICACION;
1169  039d 200e          	jp	LC008
1170  039f               L305:
1171                     ; 474 				else if(notif == COND_ALIVE)
1173  039f a109          	cp	a,#9
1174  03a1 2614          	jrne	L315
1175                     ; 476 					if(cont_tim2 > TIME_ALIVE)// Espera 2 segundos para apagar condici�n alive.
1177  03a3 be07          	ldw	x,_cont_tim2
1178  03a5 a30004        	cpw	x,#4
1179                     ; 478 						estado = ESTADO_FIN;
1181  03a8 2ecc          	jrsge	LC014
1182                     ; 483 						actualizarLeds(4,CMD_RECARGA);	//Enciende el led Azul central.
1184  03aa ae0452        	ldw	x,#1106
1185  03ad               LC008:
1186  03ad cd0000        	call	_actualizarLeds
1188                     ; 484 						estado = ESTADO_NOTIFICACION;
1190  03b0               LC007:
1195  03b0 35050002      	mov	L3_estado,#5
1196  03b4 cc049a        	jra	L316
1197  03b7               L315:
1198                     ; 488 				else if(notif >= COND_ALIVE_FALLO && notif <= COND_ALIVE_FALLO_FIN)
1200  03b7 a10a          	cp	a,#10
1201  03b9 2511          	jrult	L325
1203  03bb a111          	cp	a,#17
1204  03bd 240d          	jruge	L325
1205                     ; 490 					if(cont_tim2 > TIME_ALIVE)// Espera 2 segundos para apagar condici�n alive.
1207  03bf be07          	ldw	x,_cont_tim2
1208  03c1 a30004        	cpw	x,#4
1209                     ; 492 						estado = ESTADO_FIN;
1211  03c4 2eb0          	jrsge	LC014
1212                     ; 497 						actualizarLeds(notif,CMD_BATERIA);	//Enciende el led Azul central.
1214  03c6 ae0042        	ldw	x,#66
1215  03c9 95            	ld	xh,a
1217                     ; 498 						estado = ESTADO_NOTIFICACION;
1218  03ca 20e1          	jp	LC008
1219  03cc               L325:
1220                     ; 501 				else if (notif == COND_INIT_ADMIN)
1222  03cc a106          	cp	a,#6
1223  03ce 262b          	jrne	L335
1224                     ; 503 					estado = ESTADO_NOTIFICACION;
1226  03d0 35050002      	mov	L3_estado,#5
1227                     ; 505 					if(cont_tim2 < 5)
1229  03d4 be07          	ldw	x,_cont_tim2
1230  03d6 a30005        	cpw	x,#5
1231  03d9 2e16          	jrsge	L535
1232                     ; 507 						if(flag_tim2)
1234  03db 3d09          	tnz	_flag_tim2
1235  03dd 2709          	jreq	L735
1236                     ; 509 							actualizarLeds(7,CMD_RECARGA);	//Tres primeros leds azules.
1238  03df ae0752        	ldw	x,#1874
1239  03e2               LC009:
1240  03e2 cd0000        	call	_actualizarLeds
1243  03e5 cc049a        	jra	L316
1244  03e8               L735:
1245                     ; 511 						else if (!flag_tim2)
1247  03e8 3d09          	tnz	_flag_tim2
1248  03ea 26f9          	jrne	L316
1249                     ; 513 							actualizarLeds(24,CMD_BATERIA);	//Dos �ltimos leds rojos
1251  03ec ae1842        	ldw	x,#6210
1253  03ef 20f1          	jp	LC009
1254  03f1               L535:
1255                     ; 516 					else if (cont_tim2  >= 5)
1257  03f1 be07          	ldw	x,_cont_tim2
1258  03f3 a30005        	cpw	x,#5
1259  03f6 2fed          	jrslt	L316
1260                     ; 518 						estado = ESTADO_FIN;
1261  03f8 cc0496        	jp	LC014
1262  03fb               L335:
1263                     ; 522 				else if (notif == COND_END_ADMIN)
1265  03fb a107          	cp	a,#7
1266  03fd 26e6          	jrne	L316
1267                     ; 524 					estado = ESTADO_FIN;
1276                     ; 526 				if(flag_recibir)
1277                     ; 528 					apagarLeds();
1279                     ; 529 					flag_boton = FALSE;
1280                     ; 530 					cont_tim2 = 0;
1281                     ; 531 					estado = ESTADO_RECIBIR;
1282  03ff cc0496        	jp	LC014
1283  0402               L57:
1284                     ; 537 				uint8_t valor_inicio = Slave_Buffer_Rx[1];
1286  0402 b604          	ld	a,_Slave_Buffer_Rx+1
1287  0404 6b01          	ld	(OFST+0,sp),a
1289                     ; 539 				refrescarIWDG();
1291  0406 cd0000        	call	_refrescarIWDG
1293                     ; 541 				actualizarLeds(27,CMD_RECARGA);
1295  0409 ae1b52        	ldw	x,#6994
1296  040c cd0000        	call	_actualizarLeds
1298                     ; 542 				actualizarLeds(27,CMD_BATERIA);				
1300  040f ae1b42        	ldw	x,#6978
1301  0412 cd0000        	call	_actualizarLeds
1303                     ; 544 				if(valor_inicio == COND_BOOT_INIT)
1305  0415 7b01          	ld	a,(OFST+0,sp)
1306  0417 4a            	dec	a
1307  0418 2635          	jrne	L755
1308                     ; 546 					if( (cont_tim2 > 3) && (cont_tim2 <= 4) )
1310  041a be07          	ldw	x,_cont_tim2
1311  041c a30004        	cpw	x,#4
1312  041f 2f0c          	jrslt	L165
1314  0421 be07          	ldw	x,_cont_tim2
1315  0423 a30005        	cpw	x,#5
1316  0426 2e05          	jrsge	L165
1317                     ; 548 						apagarBuzzer();
1319  0428 cd0000        	call	_apagarBuzzer
1321                     ; 550 						estado = ESTADO_INICIO;
1323  042b 200a          	jp	LC011
1324  042d               L165:
1325                     ; 552 					else if(cont_tim2 < 2)
1327  042d be07          	ldw	x,_cont_tim2
1328  042f a30002        	cpw	x,#2
1329  0432 2e0a          	jrsge	L565
1330                     ; 554 						encenderBuzzer();
1332  0434 cd0000        	call	_encenderBuzzer
1334                     ; 555 						estado = ESTADO_INICIO;
1336  0437               LC011:
1339  0437 35080002      	mov	L3_estado,#8
1341  043b cc005f        	jra	L371
1342  043e               L565:
1343                     ; 557 					else if(cont_tim2 > 4)
1345  043e be07          	ldw	x,_cont_tim2
1346  0440 a30005        	cpw	x,#5
1347  0443 2ff6          	jrslt	L371
1348                     ; 559 						estado = ESTADO_FIN;
1350  0445 35090002      	mov	L3_estado,#9
1351                     ; 560 						main();
1353  0449 cd0000        	call	_main
1355  044c cc005f        	jra	L371
1356  044f               L755:
1357                     ; 563 				else if(valor_inicio == COND_BOOT_STOP)
1359  044f 7b01          	ld	a,(OFST+0,sp)
1360  0451 2607          	jrne	L575
1361                     ; 565 					estado = ESTADO_FIN;					
1363  0453               LC003:
1365  0453 35090002      	mov	L3_estado,#9
1367  0457 cc005f        	jra	L371
1368  045a               L575:
1369                     ; 567 				else if(valor_inicio == COND_MOSTRAR_RECARGA)
1371  045a a102          	cp	a,#2
1372  045c 26f9          	jrne	L371
1373                     ; 569 					if(cont_tim2 >1)
1375  045e be07          	ldw	x,_cont_tim2
1376  0460 a30002        	cpw	x,#2
1377                     ; 571 						estado = ESTADO_FIN;
1379  0463 2eee          	jrsge	LC003
1380                     ; 575 						apagarLeds();
1382  0465 cd0000        	call	_apagarLeds
1384                     ; 576 						encenderBuzzer();
1386  0468 cd0000        	call	_encenderBuzzer
1388                     ; 577 						actualizarLeds((1<<leerEEPROM(ADDR_RECARGA)) - 1,CMD_RECARGA);
1390  046b ae4007        	ldw	x,#16391
1391  046e cd0000        	call	_leerEEPROM
1393  0471 5f            	clrw	x
1394  0472 ad72          	call	LC018
1395  0474 2704          	jreq	L213
1396  0476               L413:
1397  0476 48            	sll	a
1398  0477 5a            	decw	x
1399  0478 26fc          	jrne	L413
1400  047a               L213:
1401  047a 4a            	dec	a
1402  047b ae0052        	ldw	x,#82
1403  047e 95            	ld	xh,a
1404  047f cd0000        	call	_actualizarLeds
1406                     ; 578 						estado = ESTADO_INICIO;
1407  0482 20b3          	jp	LC011
1408  0484               L77:
1409                     ; 585 				refrescarIWDG();			
1411  0484 cd0000        	call	_refrescarIWDG
1413                     ; 586 				if((flag_boton == TRUE) || (cont_tim2 > TOUT_ALARMA))
1415  0487 b610          	ld	a,_flag_boton
1416  0489 4a            	dec	a
1417  048a 2707          	jreq	L116
1419  048c be07          	ldw	x,_cont_tim2
1420  048e a3003d        	cpw	x,#61
1421  0491 2f1a          	jrslt	L706
1422  0493               L116:
1423                     ; 588 					apagarBuzzer();
1426  0493 cd0000        	call	_apagarBuzzer
1428                     ; 589 					estado = ESTADO_FIN;
1430  0496               LC014:
1434  0496 35090002      	mov	L3_estado,#9
1436  049a               L316:
1437                     ; 606 				if(flag_recibir)
1439                     ; 608 					apagarLeds();
1442                     ; 609 					flag_boton = FALSE;
1444                     ; 610 					cont_tim2 = 0;
1449  049a 3d0d          	tnz	_flag_recibir
1450  049c 27b9          	jreq	L371
1454  049e cd0000        	call	_apagarLeds
1458  04a1 3f10          	clr	_flag_boton
1462  04a3 5f            	clrw	x
1463  04a4 bf07          	ldw	_cont_tim2,x
1464                     ; 611 					estado = ESTADO_RECIBIR;
1466  04a6               LC002:
1471  04a6 35020002      	mov	L3_estado,#2
1472  04aa cc005f        	jra	L371
1473  04ad               L706:
1474                     ; 591 				else if((cont_tim2 <= TOUT_ALARMA))
1476  04ad be07          	ldw	x,_cont_tim2
1477  04af a3003d        	cpw	x,#61
1478  04b2 2ee6          	jrsge	L316
1479                     ; 593 					apagarLeds();
1481  04b4 cd0000        	call	_apagarLeds
1483                     ; 594 					actualizarLeds(alarma_init,CMD_RECARGA); //Visualizar warnings.
1485  04b7 b607          	ld	a,L31_alarma_init
1486  04b9 ae0052        	ldw	x,#82
1487  04bc 95            	ld	xh,a
1488  04bd cd0000        	call	_actualizarLeds
1490                     ; 596 					if(cont_tim2%2 != 0 )
1492  04c0 be07          	ldw	x,_cont_tim2
1493  04c2 a602          	ld	a,#2
1494  04c4 cd0000        	call	c_smodx
1496  04c7 5d            	tnzw	x
1497  04c8 2705          	jreq	L716
1498                     ; 598 						encenderBuzzer();
1500  04ca cd0000        	call	_encenderBuzzer
1503  04cd 2003          	jra	L126
1504  04cf               L716:
1505                     ; 602 						apagarBuzzer();	
1507  04cf cd0000        	call	_apagarBuzzer
1509  04d2               L126:
1510                     ; 604 					estado = ESTADO_WARNING;
1512  04d2 35070002      	mov	L3_estado,#7
1513  04d6 20c2          	jra	L316
1514  04d8               L101:
1515                     ; 617 				refrescarIWDG();
1517  04d8 cd0000        	call	_refrescarIWDG
1519                     ; 618 				inicializar();						
1521                     ; 619 				break;
1523  04db cc005c        	jp	LC001
1524                     ; 621 			default:{break;}	
1525  04de               LC017:
1526  04de cd0000        	call	_TIM2_Cmd
1528                     ; 279 					TIM1_Cmd(ENABLE);
1530  04e1 a601          	ld	a,#1
1531  04e3 cc0000        	jp	_TIM1_Cmd
1532  04e6               LC018:
1533  04e6 97            	ld	xl,a
1534  04e7 a601          	ld	a,#1
1535  04e9 5d            	tnzw	x
1536  04ea 81            	ret	
1560                     ; 626 void apagarLeds(void)
1560                     ; 627 {
1561                     .text:	section	.text,new
1562  0000               _apagarLeds:
1566                     ; 628 	actualizarLeds(0,CMD_BATERIA);
1568  0000 ae0042        	ldw	x,#66
1569  0003 cd0000        	call	_actualizarLeds
1571                     ; 629 	actualizarLeds(0,CMD_RECARGA);	
1573  0006 ae0052        	ldw	x,#82
1575                     ; 630 }
1578  0009 cc0000        	jp	_actualizarLeds
1618                     ; 632 void inicializar(void)
1618                     ; 633 {	
1619                     .text:	section	.text,new
1620  0000               _inicializar:
1624                     ; 635 	TIM1_Cmd(DISABLE);
1626  0000 4f            	clr	a
1627  0001 cd0000        	call	_TIM1_Cmd
1629                     ; 636 	TIM1_setup();
1631  0004 cd0000        	call	_TIM1_setup
1633                     ; 637 	apagarLeds();
1635  0007 cd0000        	call	_apagarLeds
1637                     ; 638 	apagarBuzzer();
1639  000a cd0000        	call	_apagarBuzzer
1641                     ; 639 	cont_tim2         = 0;
1643  000d 5f            	clrw	x
1644  000e bf07          	ldw	_cont_tim2,x
1645                     ; 640 	cont_restart	  = 0;
1647  0010 bf05          	ldw	_cont_restart,x
1648                     ; 641 	cont_ruleta       = 0;
1650  0012 3f00          	clr	_cont_ruleta
1651                     ; 642 	contPulsos        = 1;
1653  0014 35010001      	mov	_contPulsos,#1
1654                     ; 643 	contReinicio      = 1;
1656  0018 35010002      	mov	_contReinicio,#1
1657                     ; 644 	contHist	      = 1;
1659  001c 35010003      	mov	_contHist,#1
1660                     ; 645 	flag_boton        = FALSE;
1662  0020 3f10          	clr	_flag_boton
1663                     ; 646 	flag_buzzer       = FALSE; 
1665  0022 3f0e          	clr	_flag_buzzer
1666                     ; 647 	flag_recibir      = FALSE;
1668  0024 3f0d          	clr	_flag_recibir
1669                     ; 648 	flag_historicos   = FALSE;
1671  0026 3f0c          	clr	_flag_historicos
1672                     ; 649 	flag_notificacion = FALSE;
1674  0028 3f0b          	clr	_flag_notificacion
1675                     ; 650 	flag_reinicio	  = FALSE;
1677  002a 3f0a          	clr	_flag_reinicio
1678                     ; 651 	estado            = ESTADO_ESPERAR;
1680  002c 35010002      	mov	L3_estado,#1
1681                     ; 652 }
1684  0030 81            	ret	
1710                     ; 654 void encenderBuzzer(void)
1710                     ; 655 {
1711                     .text:	section	.text,new
1712  0000               _encenderBuzzer:
1716                     ; 656 	if(flag_buzzer == TRUE ){GPIO_WriteHigh(GPIOA, BUZZER);}
1718  0000 b60e          	ld	a,_flag_buzzer
1719  0002 4a            	dec	a
1720  0003 260a          	jrne	L556
1723  0005 4b08          	push	#8
1724  0007 ae5000        	ldw	x,#20480
1725  000a cd0000        	call	_GPIO_WriteHigh
1727  000d 84            	pop	a
1730  000e 81            	ret	
1731  000f               L556:
1732                     ; 657 	else{apagarBuzzer();} 
1735                     ; 658 }
1738  000f cc0000        	jp	_apagarBuzzer
1762                     ; 660 void apagarBuzzer(void)
1762                     ; 661 {
1763                     .text:	section	.text,new
1764  0000               _apagarBuzzer:
1768                     ; 662 	GPIO_WriteLow(GPIOA, BUZZER);	
1770  0000 4b08          	push	#8
1771  0002 ae5000        	ldw	x,#20480
1772  0005 cd0000        	call	_GPIO_WriteLow
1774  0008 84            	pop	a
1775                     ; 663 }
1778  0009 81            	ret	
1841                     ; 665 void actualizarLeds( uint8_t valor, uint8_t cmd)
1841                     ; 666 {
1842                     .text:	section	.text,new
1843  0000               _actualizarLeds:
1845  0000 89            	pushw	x
1846  0001 5203          	subw	sp,#3
1847       00000003      OFST:	set	3
1850                     ; 667 	uint8_t posicion = 0;
1852                     ; 668 	int i = 0;
1854                     ; 669 	for( i = 0; i< 5; i++)
1856  0003 5f            	clrw	x
1857  0004 1f02          	ldw	(OFST-1,sp),x
1859  0006               L327:
1860                     ; 671 		arrayBinario[i]=valor%2;
1862  0006 7b04          	ld	a,(OFST+1,sp)
1863  0008 a401          	and	a,#1
1864  000a e708          	ld	(L51_arrayBinario,x),a
1865                     ; 672 		valor=valor/2;
1867  000c 5f            	clrw	x
1868  000d 7b04          	ld	a,(OFST+1,sp)
1869  000f 97            	ld	xl,a
1870  0010 57            	sraw	x
1871  0011 01            	rrwa	x,a
1872  0012 6b04          	ld	(OFST+1,sp),a
1873                     ; 673 		posicion = i + 1;
1875  0014 7b03          	ld	a,(OFST+0,sp)
1876  0016 4c            	inc	a
1877  0017 6b01          	ld	(OFST-2,sp),a
1879                     ; 674 		refrescarLed(posicion, arrayBinario[i], cmd);	
1881  0019 7b05          	ld	a,(OFST+2,sp)
1882  001b 88            	push	a
1883  001c 1e03          	ldw	x,(OFST+0,sp)
1884  001e e608          	ld	a,(L51_arrayBinario,x)
1885  0020 97            	ld	xl,a
1886  0021 7b02          	ld	a,(OFST-1,sp)
1887  0023 95            	ld	xh,a
1888  0024 cd0000        	call	_refrescarLed
1890  0027 84            	pop	a
1891                     ; 675 		arrayBinario[i] = 0;
1893  0028 1e02          	ldw	x,(OFST-1,sp)
1894  002a 6f08          	clr	(L51_arrayBinario,x)
1895                     ; 669 	for( i = 0; i< 5; i++)
1897  002c 5c            	incw	x
1898  002d 1f02          	ldw	(OFST-1,sp),x
1902  002f a30005        	cpw	x,#5
1903  0032 2fd2          	jrslt	L327
1904                     ; 677 }
1907  0034 5b05          	addw	sp,#5
1908  0036 81            	ret	
1980                     ; 679 void refrescarLed(uint8_t posicion,uint8_t estadoLed, uint8_t cmd)
1980                     ; 680 {
1981                     .text:	section	.text,new
1982  0000               _refrescarLed:
1984  0000 89            	pushw	x
1985       00000000      OFST:	set	0
1988                     ; 681 		switch(posicion)
1990  0001 9e            	ld	a,xh
1992                     ; 813 			default:{break;}			
1993  0002 4a            	dec	a
1994  0003 2715          	jreq	L137
1995  0005 4a            	dec	a
1996  0006 2747          	jreq	L337
1997  0008 4a            	dec	a
1998  0009 2779          	jreq	L537
1999  000b 4a            	dec	a
2000  000c 2603cc00b6    	jreq	L737
2001  0011 4a            	dec	a
2002  0012 2603cc00e7    	jreq	L147
2003  0017 cc0116        	jra	L577
2004  001a               L137:
2005                     ; 685 				if(estadoLed == 1)
2007  001a 7b02          	ld	a,(OFST+2,sp)
2008  001c 4a            	dec	a
2009  001d 2616          	jrne	L777
2010                     ; 687 					if(cmd == CMD_BATERIA)
2012  001f 7b05          	ld	a,(OFST+5,sp)
2013  0021 a142          	cp	a,#66
2014  0023 2606          	jrne	L1001
2015                     ; 689 						onBD1 ();
2017  0025 cd0000        	call	_onBD1
2020  0028 cc0116        	jra	L577
2021  002b               L1001:
2022                     ; 691 					else if(cmd == CMD_RECARGA)
2024  002b a152          	cp	a,#82
2025  002d 26f9          	jrne	L577
2026                     ; 693 						onGD1 ();
2028  002f cd0000        	call	_onGD1
2030  0032 cc0116        	jra	L577
2031  0035               L777:
2032                     ; 696 				else if( estadoLed == 0)
2034  0035 7b02          	ld	a,(OFST+2,sp)
2035  0037 26f9          	jrne	L577
2036                     ; 698 					if(cmd == CMD_BATERIA)
2038  0039 7b05          	ld	a,(OFST+5,sp)
2039  003b a142          	cp	a,#66
2040  003d 2606          	jrne	L3101
2041                     ; 700 						offBD1 ();
2043  003f cd0000        	call	_offBD1
2046  0042 cc0116        	jra	L577
2047  0045               L3101:
2048                     ; 702 					else if(cmd == CMD_RECARGA)
2050  0045 a152          	cp	a,#82
2051  0047 26f9          	jrne	L577
2052                     ; 704 						offGD1 ();
2054  0049 cd0000        	call	_offGD1
2056  004c cc0116        	jra	L577
2057  004f               L337:
2058                     ; 711 				if(estadoLed == 1)
2060  004f 7b02          	ld	a,(OFST+2,sp)
2061  0051 4a            	dec	a
2062  0052 2616          	jrne	L1201
2063                     ; 713 					if(cmd == CMD_BATERIA)
2065  0054 7b05          	ld	a,(OFST+5,sp)
2066  0056 a142          	cp	a,#66
2067  0058 2606          	jrne	L3201
2068                     ; 715 						onBD2 ();
2070  005a cd0000        	call	_onBD2
2073  005d cc0116        	jra	L577
2074  0060               L3201:
2075                     ; 717 					else if(cmd == CMD_RECARGA)
2077  0060 a152          	cp	a,#82
2078  0062 26f9          	jrne	L577
2079                     ; 719 						onGD2 ();
2081  0064 cd0000        	call	_onGD2
2083  0067 cc0116        	jra	L577
2084  006a               L1201:
2085                     ; 722 				else if( estadoLed == 0)
2087  006a 7b02          	ld	a,(OFST+2,sp)
2088  006c 26f9          	jrne	L577
2089                     ; 724 					if(cmd == CMD_BATERIA)
2091  006e 7b05          	ld	a,(OFST+5,sp)
2092  0070 a142          	cp	a,#66
2093  0072 2606          	jrne	L5301
2094                     ; 726 						offBD2 ();
2096  0074 cd0000        	call	_offBD2
2099  0077 cc0116        	jra	L577
2100  007a               L5301:
2101                     ; 728 					else if(cmd == CMD_RECARGA)
2103  007a a152          	cp	a,#82
2104  007c 26f9          	jrne	L577
2105                     ; 730 						offGD2 ();
2107  007e cd0000        	call	_offGD2
2109  0081 cc0116        	jra	L577
2110  0084               L537:
2111                     ; 737 				if(estadoLed == 1)
2113  0084 7b02          	ld	a,(OFST+2,sp)
2114  0086 4a            	dec	a
2115  0087 2615          	jrne	L3401
2116                     ; 739 					if(cmd == CMD_BATERIA)
2118  0089 7b05          	ld	a,(OFST+5,sp)
2119  008b a142          	cp	a,#66
2120  008d 2606          	jrne	L5401
2121                     ; 741 						onBD3 ();
2123  008f cd0000        	call	_onBD3
2126  0092 cc0116        	jra	L577
2127  0095               L5401:
2128                     ; 743 					else if(cmd == CMD_RECARGA)
2130  0095 a152          	cp	a,#82
2131  0097 267d          	jrne	L577
2132                     ; 745 						onGD3 ();
2134  0099 cd0000        	call	_onGD3
2136  009c 2078          	jra	L577
2137  009e               L3401:
2138                     ; 748 				else if( estadoLed == 0)
2140  009e 7b02          	ld	a,(OFST+2,sp)
2141  00a0 2674          	jrne	L577
2142                     ; 750 					if(cmd == CMD_BATERIA)
2144  00a2 7b05          	ld	a,(OFST+5,sp)
2145  00a4 a142          	cp	a,#66
2146  00a6 2605          	jrne	L7501
2147                     ; 752 						offBD3 ();
2149  00a8 cd0000        	call	_offBD3
2152  00ab 2069          	jra	L577
2153  00ad               L7501:
2154                     ; 754 					else if(cmd == CMD_RECARGA)
2156  00ad a152          	cp	a,#82
2157  00af 2665          	jrne	L577
2158                     ; 756 						offGD3 ();
2160  00b1 cd0000        	call	_offGD3
2162  00b4 2060          	jra	L577
2163  00b6               L737:
2164                     ; 763 				if(estadoLed == 1)
2166  00b6 7b02          	ld	a,(OFST+2,sp)
2167  00b8 4a            	dec	a
2168  00b9 2614          	jrne	L5601
2169                     ; 765 					if(cmd == CMD_BATERIA)
2171  00bb 7b05          	ld	a,(OFST+5,sp)
2172  00bd a142          	cp	a,#66
2173  00bf 2605          	jrne	L7601
2174                     ; 767 						onBD4 ();
2176  00c1 cd0000        	call	_onBD4
2179  00c4 2050          	jra	L577
2180  00c6               L7601:
2181                     ; 769 					else if(cmd == CMD_RECARGA)
2183  00c6 a152          	cp	a,#82
2184  00c8 264c          	jrne	L577
2185                     ; 771 						onGD4 ();
2187  00ca cd0000        	call	_onGD4
2189  00cd 2047          	jra	L577
2190  00cf               L5601:
2191                     ; 774 				else if( estadoLed == 0)
2193  00cf 7b02          	ld	a,(OFST+2,sp)
2194  00d1 2643          	jrne	L577
2195                     ; 776 					if(cmd == CMD_BATERIA)
2197  00d3 7b05          	ld	a,(OFST+5,sp)
2198  00d5 a142          	cp	a,#66
2199  00d7 2605          	jrne	L1011
2200                     ; 778 						offBD4 ();
2202  00d9 cd0000        	call	_offBD4
2205  00dc 2038          	jra	L577
2206  00de               L1011:
2207                     ; 780 					else if(cmd == CMD_RECARGA)
2209  00de a152          	cp	a,#82
2210  00e0 2634          	jrne	L577
2211                     ; 782 						offGD4 ();
2213  00e2 cd0000        	call	_offGD4
2215  00e5 202f          	jra	L577
2216  00e7               L147:
2217                     ; 789 				if(estadoLed == 1)
2219  00e7 7b02          	ld	a,(OFST+2,sp)
2220  00e9 4a            	dec	a
2221  00ea 2614          	jrne	L7011
2222                     ; 791 					if(cmd == CMD_BATERIA)
2224  00ec 7b05          	ld	a,(OFST+5,sp)
2225  00ee a142          	cp	a,#66
2226  00f0 2605          	jrne	L1111
2227                     ; 793 						onBD5 ();
2229  00f2 cd0000        	call	_onBD5
2232  00f5 201f          	jra	L577
2233  00f7               L1111:
2234                     ; 795 					else if(cmd == CMD_RECARGA)
2236  00f7 a152          	cp	a,#82
2237  00f9 261b          	jrne	L577
2238                     ; 797 						onGD5 ();
2240  00fb cd0000        	call	_onGD5
2242  00fe 2016          	jra	L577
2243  0100               L7011:
2244                     ; 800 				else if( estadoLed == 0)
2246  0100 7b02          	ld	a,(OFST+2,sp)
2247  0102 2612          	jrne	L577
2248                     ; 802 					if(cmd == CMD_BATERIA)
2250  0104 7b05          	ld	a,(OFST+5,sp)
2251  0106 a142          	cp	a,#66
2252  0108 2605          	jrne	L3211
2253                     ; 804 						offBD5 ();
2255  010a cd0000        	call	_offBD5
2258  010d 2007          	jra	L577
2259  010f               L3211:
2260                     ; 806 					else if(cmd == CMD_RECARGA)
2262  010f a152          	cp	a,#82
2263  0111 2603          	jrne	L577
2264                     ; 808 						offGD5 ();
2266  0113 cd0000        	call	_offGD5
2268  0116               L577:
2269                     ; 815 }
2272  0116 85            	popw	x
2273  0117 81            	ret	
2304                     ; 818 void guardarAlarma()	 
2304                     ; 819 {
2305                     .text:	section	.text,new
2306  0000               _guardarAlarma:
2310                     ; 820 	a5 = leerEEPROM(ADDR_BASE+4);//Leer A4 y actualizarla en A5	
2312  0000 ae4004        	ldw	x,#16388
2313  0003 cd0000        	call	_leerEEPROM
2315  0006 b711          	ld	L72_a5,a
2316                     ; 821 	actualizarEEPROM(ADDR_BASE+5,a5);	
2318  0008 88            	push	a
2319  0009 ae4005        	ldw	x,#16389
2320  000c cd0000        	call	_actualizarEEPROM
2322  000f ae4003        	ldw	x,#16387
2323  0012 84            	pop	a
2324                     ; 822 	a4 = leerEEPROM(ADDR_BASE+3);//Leer A3 y actualizarla en A4	
2326  0013 cd0000        	call	_leerEEPROM
2328  0016 b710          	ld	L52_a4,a
2329                     ; 823 	actualizarEEPROM(ADDR_BASE+4,a4);	
2331  0018 88            	push	a
2332  0019 ae4004        	ldw	x,#16388
2333  001c cd0000        	call	_actualizarEEPROM
2335  001f ae4002        	ldw	x,#16386
2336  0022 84            	pop	a
2337                     ; 824 	a3 = leerEEPROM(ADDR_BASE+2);//Leer A2 y actualizarla en A3	
2339  0023 cd0000        	call	_leerEEPROM
2341  0026 b70f          	ld	L32_a3,a
2342                     ; 825 	actualizarEEPROM(ADDR_BASE+3,a3);	
2344  0028 88            	push	a
2345  0029 ae4003        	ldw	x,#16387
2346  002c cd0000        	call	_actualizarEEPROM
2348  002f ae4001        	ldw	x,#16385
2349  0032 84            	pop	a
2350                     ; 826 	a2 = leerEEPROM(ADDR_BASE+1);//Leer A1 y actualizarla en A2	
2352  0033 cd0000        	call	_leerEEPROM
2354  0036 b70e          	ld	L12_a2,a
2355                     ; 827 	actualizarEEPROM(ADDR_BASE+2,a2);	
2357  0038 88            	push	a
2358  0039 ae4002        	ldw	x,#16386
2359  003c cd0000        	call	_actualizarEEPROM
2361  003f 45060d        	mov	L71_a1,L11_alarma
2362  0042 84            	pop	a
2363                     ; 828 	a1 = alarma;	             //Actualizar A1
2365                     ; 829 	actualizarEEPROM(ADDR_BASE+1,a1);	
2367  0043 3b000d        	push	L71_a1
2368  0046 ae4001        	ldw	x,#16385
2369  0049 cd0000        	call	_actualizarEEPROM
2371  004c 84            	pop	a
2372                     ; 830 }
2375  004d 81            	ret	
2402                     ; 832 void leerAlarma()
2402                     ; 833 {
2403                     .text:	section	.text,new
2404  0000               _leerAlarma:
2408                     ; 834 	a_EE =leerEEPROM(ADDR_BASE+contHist);
2410  0000 b603          	ld	a,_contHist
2411  0002 5f            	clrw	x
2412  0003 97            	ld	xl,a
2413  0004 1c4000        	addw	x,#16384
2414  0007 cd0000        	call	_leerEEPROM
2416  000a b712          	ld	L13_a_EE,a
2417                     ; 835 	actualizarLeds(a_EE,CMD_RECARGA);	
2419  000c ae0052        	ldw	x,#82
2420  000f 95            	ld	xh,a
2422                     ; 836 }
2425  0010 cc0000        	jp	_actualizarLeds
2450                     ; 838 void refrescarIWDG()
2450                     ; 839 {
2451                     .text:	section	.text,new
2452  0000               _refrescarIWDG:
2456                     ; 840 	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
2458  0000 a655          	ld	a,#85
2459  0002 cd0000        	call	_IWDG_WriteAccessCmd
2461                     ; 841 	IWDG_ReloadCounter();
2463  0005 cd0000        	call	_IWDG_ReloadCounter
2465                     ; 842 	IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
2467  0008 4f            	clr	a
2469                     ; 843 }
2472  0009 cc0000        	jp	_IWDG_WriteAccessCmd
2500                     ; 845 void sinSaldo(void)
2500                     ; 846 {
2501                     .text:	section	.text,new
2502  0000               _sinSaldo:
2506                     ; 847 	apagarLeds();
2508  0000 cd0000        	call	_apagarLeds
2510                     ; 848 	actualizarLeds(21,CMD_BATERIA);
2512  0003 ae1542        	ldw	x,#5442
2513  0006 cd0000        	call	_actualizarLeds
2515                     ; 849 	actualizarLeds(10,CMD_RECARGA);
2517  0009 ae0a52        	ldw	x,#2642
2518  000c cd0000        	call	_actualizarLeds
2520                     ; 859 	if((cont_tim2 >= 1 && cont_tim2 < 2) || (cont_tim2 > (UMBRAL_CONTEO-1) && cont_tim2 <= UMBRAL_CONTEO))
2522  000f 9c            	rvf	
2523  0010 be07          	ldw	x,_cont_tim2
2524  0012 2d07          	jrsle	L5711
2526  0014 be07          	ldw	x,_cont_tim2
2527  0016 a30002        	cpw	x,#2
2528  0019 2f0e          	jrslt	L3711
2529  001b               L5711:
2531  001b be07          	ldw	x,_cont_tim2
2532  001d a3000a        	cpw	x,#10
2533  0020 2f0a          	jrslt	L1711
2535  0022 be07          	ldw	x,_cont_tim2
2536  0024 a3000b        	cpw	x,#11
2537  0027 2e03          	jrsge	L1711
2538  0029               L3711:
2539                     ; 861 		encenderBuzzer();
2544  0029 cc0000        	jp	_encenderBuzzer
2545  002c               L1711:
2546                     ; 865 		apagarBuzzer();
2549                     ; 867 }
2552  002c cc0000        	jp	_apagarBuzzer
2611                     ; 869 void signalStatus(bool estado)
2611                     ; 870 {
2612                     .text:	section	.text,new
2613  0000               _signalStatus:
2615  0000 88            	push	a
2616       00000000      OFST:	set	0
2619                     ; 871 	if(estado)
2621  0001 4d            	tnz	a
2622  0002 2705          	jreq	L7221
2623                     ; 873 		actualizarLeds(14,CMD_RECARGA);
2625  0004 ae0e52        	ldw	x,#3666
2628  0007 2003          	jra	L1321
2629  0009               L7221:
2630                     ; 877 		actualizarLeds(14,CMD_BATERIA);
2632  0009 ae0e42        	ldw	x,#3650
2634  000c               L1321:
2635  000c cd0000        	call	_actualizarLeds
2636                     ; 881 	if( (cont_tim2 > 1 && cont_tim2 <= 2) || (cont_tim2 > (TIME_STATUS-1) )  && (cont_tim2 <= TIME_STATUS) )
2638  000f be07          	ldw	x,_cont_tim2
2639  0011 a30002        	cpw	x,#2
2640  0014 2f07          	jrslt	L7321
2642  0016 be07          	ldw	x,_cont_tim2
2643  0018 a30003        	cpw	x,#3
2644  001b 2f0e          	jrslt	L5321
2645  001d               L7321:
2647  001d be07          	ldw	x,_cont_tim2
2648  001f a30005        	cpw	x,#5
2649  0022 2f0c          	jrslt	L3321
2651  0024 be07          	ldw	x,_cont_tim2
2652  0026 a30006        	cpw	x,#6
2653  0029 2e05          	jrsge	L3321
2654  002b               L5321:
2655                     ; 883 		encenderBuzzer();
2657  002b cd0000        	call	_encenderBuzzer
2660  002e 2003          	jra	L1421
2661  0030               L3321:
2662                     ; 887 		apagarBuzzer();
2664  0030 cd0000        	call	_apagarBuzzer
2666  0033               L1421:
2667                     ; 890 	if(cont_tim2 >= TIME_STATUS)
2669  0033 be07          	ldw	x,_cont_tim2
2670  0035 a30005        	cpw	x,#5
2671                     ; 892 		estado = ESTADO_FIN;
2674  0038 2e02          	jrsge	L5421
2675                     ; 894 	else if(cont_tim2 < TIME_STATUS)
2677  003a be07          	ldw	x,_cont_tim2
2678                     ; 896 		estado = ESTADO_NOTIFICACION;
2680  003c               L5421:
2681                     ; 898 }
2684  003c 84            	pop	a
2685  003d 81            	ret	
2999                     	xdef	_main
3000                     	xdef	_signalStatus
3001                     	xdef	_sinSaldo
3002                     	xdef	_refrescarIWDG
3003                     	xdef	_leerAlarma
3004                     	xdef	_guardarAlarma
3005                     	xdef	_apagarBuzzer
3006                     	xdef	_encenderBuzzer
3007                     	xdef	_inicializar
3008                     	xdef	_apagarLeds
3009                     	xdef	_refrescarLed
3010                     	xdef	_actualizarLeds
3011                     	switch	.ubsct
3012  0000               _ja:
3013  0000 0000          	ds.b	2
3014                     	xdef	_ja
3015  0002               L3_estado:
3016  0002 00            	ds.b	1
3017  0003               _Slave_Buffer_Rx:
3018  0003 0000          	ds.b	2
3019                     	xdef	_Slave_Buffer_Rx
3020                     	xdef	_contHist
3021                     	xdef	_contReinicio
3022                     	xdef	_contPulsos
3023                     	xdef	_cont_ruleta
3024  0005               _cont_restart:
3025  0005 0000          	ds.b	2
3026                     	xdef	_cont_restart
3027  0007               _cont_tim2:
3028  0007 0000          	ds.b	2
3029                     	xdef	_cont_tim2
3030  0009               _flag_tim2:
3031  0009 00            	ds.b	1
3032                     	xdef	_flag_tim2
3033  000a               _flag_reinicio:
3034  000a 00            	ds.b	1
3035                     	xdef	_flag_reinicio
3036  000b               _flag_notificacion:
3037  000b 00            	ds.b	1
3038                     	xdef	_flag_notificacion
3039  000c               _flag_historicos:
3040  000c 00            	ds.b	1
3041                     	xdef	_flag_historicos
3042  000d               _flag_recibir:
3043  000d 00            	ds.b	1
3044                     	xdef	_flag_recibir
3045  000e               _flag_buzzer:
3046  000e 00            	ds.b	1
3047                     	xdef	_flag_buzzer
3048  000f               _flag_alarma:
3049  000f 00            	ds.b	1
3050                     	xdef	_flag_alarma
3051  0010               _flag_boton:
3052  0010 00            	ds.b	1
3053                     	xdef	_flag_boton
3054                     	xref	_UART1_setup
3055                     	xref	_UART1_ClearFlag
3056                     	xref	_UART1_SendData8
3057                     	xref	_TIM2_Cmd
3058                     	xref	_TIM2_setup
3059                     	xref	_TIM1_setup
3060                     	xref	_TIM1_setup2
3061                     	xref	_TIM1_Cmd
3062                     	xref	_config_IWDT
3063                     	xref	_IWDG_ReloadCounter
3064                     	xref	_IWDG_WriteAccessCmd
3065                     	xref	_offGD5
3066                     	xref	_offGD4
3067                     	xref	_offGD3
3068                     	xref	_offGD2
3069                     	xref	_offGD1
3070                     	xref	_onGD5
3071                     	xref	_onGD4
3072                     	xref	_onGD3
3073                     	xref	_onGD2
3074                     	xref	_onGD1
3075                     	xref	_offBD5
3076                     	xref	_offBD4
3077                     	xref	_offBD3
3078                     	xref	_offBD2
3079                     	xref	_offBD1
3080                     	xref	_onBD5
3081                     	xref	_onBD4
3082                     	xref	_onBD3
3083                     	xref	_onBD2
3084                     	xref	_onBD1
3085                     	xref	_conf_GPIO
3086                     	xref	_GPIO_WriteLow
3087                     	xref	_GPIO_WriteHigh
3088                     	xref	_actualizarEEPROM
3089                     	xref	_leerEEPROM
3090                     	xref	_Flash_setup
3091                     	xref	_EXTI_setup
3092                     	xref	_clock_setup
3093                     	xref.b	c_x
3113                     	xref	c_smodx
3114                     	end
