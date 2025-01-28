   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  20                     	bsct
  21  0000               _Tx_Idx:
  22  0000 00            	dc.b	0
  23  0001               _Rx_Idx:
  24  0001 00            	dc.b	0
  25  0002               _Event:
  26  0002 0000          	dc.w	0
  27  0004               _cont_bytes:
  28  0004 00            	dc.b	0
  29                     .const:	section	.text
  30  0000               _N_BYTES:
  31  0000 02            	dc.b	2
  32                     	bsct
  33  0005               _aux:
  34  0005 00            	dc.b	0
  64                     ; 78 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  64                     ; 79 {
  65                     .text:	section	.text,new
  66  0000               f_NonHandledInterrupt:
  70                     ; 83 }
  73  0000 80            	iret	
  95                     ; 91 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
  95                     ; 92 {
  96                     .text:	section	.text,new
  97  0000               f_AWU_IRQHandler:
 101                     ; 96 }
 104  0000 80            	iret	
 133                     ; 102 void EXTI3_IRQHandler(void)
 133                     ; 103 { 
 134                     .text:	section	.text,new
 135  0000               f_EXTI3_IRQHandler:
 139                     ; 106   disableInterrupts();
 142  0000 9b            	sim	
 144                     ; 108   if(flag_boton == TRUE )
 147  0001 b600          	ld	a,_flag_boton
 148  0003 4a            	dec	a
 149  0004 2604          	jrne	L14
 150                     ; 110     flag_boton = FALSE;
 152  0006 b700          	ld	_flag_boton,a
 154  0008 2004          	jra	L34
 155  000a               L14:
 156                     ; 114     flag_boton = TRUE;  
 158  000a 35010000      	mov	_flag_boton,#1
 159  000e               L34:
 160                     ; 124   if(contPulsos == 3)
 162  000e b600          	ld	a,_contPulsos
 163  0010 a103          	cp	a,#3
 164  0012 2608          	jrne	L54
 165                     ; 126     flag_historicos = TRUE;
 167  0014 35010000      	mov	_flag_historicos,#1
 168                     ; 127     contPulsos = 0;
 170  0018 3f00          	clr	_contPulsos
 172  001a 2008          	jra	L74
 173  001c               L54:
 174                     ; 130   else if( contPulsos < 3)
 176  001c b600          	ld	a,_contPulsos
 177  001e a103          	cp	a,#3
 178  0020 2402          	jruge	L74
 179                     ; 132     contPulsos++;
 181  0022 3c00          	inc	_contPulsos
 182  0024               L74:
 183                     ; 135   if (contReinicio < 5)
 185  0024 b600          	ld	a,_contReinicio
 186  0026 a105          	cp	a,#5
 187  0028 2404          	jruge	L35
 188                     ; 137     contReinicio++;    
 190  002a 3c00          	inc	_contReinicio
 192  002c 200c          	jra	L55
 193  002e               L35:
 194                     ; 139   else if(contReinicio == 5)
 196  002e b600          	ld	a,_contReinicio
 197  0030 a105          	cp	a,#5
 198  0032 2606          	jrne	L55
 199                     ; 141     contReinicio = 0; 
 201  0034 3f00          	clr	_contReinicio
 202                     ; 142     flag_reinicio = TRUE;   
 204  0036 35010000      	mov	_flag_reinicio,#1
 205  003a               L55:
 206                     ; 147   enableInterrupts();
 209  003a 9a            	rim	
 211                     ; 148 }
 215  003b 80            	iret	
 240                     ; 154 void TIM1_UPD_IRQHandler(void)
 240                     ; 155 {
 241                     .text:	section	.text,new
 242  0000               f_TIM1_UPD_IRQHandler:
 244  0000 8a            	push	cc
 245  0001 84            	pop	a
 246  0002 a4bf          	and	a,#191
 247  0004 88            	push	a
 248  0005 86            	pop	cc
 249  0006 3b0002        	push	c_x+2
 250  0009 be00          	ldw	x,c_x
 251  000b 89            	pushw	x
 252  000c 3b0002        	push	c_y+2
 253  000f be00          	ldw	x,c_y
 254  0011 89            	pushw	x
 257                     ; 156   TIM1_ClearITPendingBit(TIM1_IT_UPDATE); 
 259  0012 a601          	ld	a,#1
 260  0014 cd0000        	call	_TIM1_ClearITPendingBit
 262                     ; 158   flag_buzzer ^= 1; 
 264  0017 90100000      	bcpl	_flag_buzzer,#0
 265                     ; 159 }
 268  001b 85            	popw	x
 269  001c bf00          	ldw	c_y,x
 270  001e 320002        	pop	c_y+2
 271  0021 85            	popw	x
 272  0022 bf00          	ldw	c_x,x
 273  0024 320002        	pop	c_x+2
 274  0027 80            	iret	
 304                     ; 168 void TIM2_UPD_IRQHandler(void)
 304                     ; 169 {
 305                     .text:	section	.text,new
 306  0000               f_TIM2_UPD_IRQHandler:
 308  0000 8a            	push	cc
 309  0001 84            	pop	a
 310  0002 a4bf          	and	a,#191
 311  0004 88            	push	a
 312  0005 86            	pop	cc
 313  0006 3b0002        	push	c_x+2
 314  0009 be00          	ldw	x,c_x
 315  000b 89            	pushw	x
 316  000c 3b0002        	push	c_y+2
 317  000f be00          	ldw	x,c_y
 318  0011 89            	pushw	x
 321                     ; 170 	flag_tim2^=1;
 323  0012 90100000      	bcpl	_flag_tim2,#0
 324                     ; 171 	TIM2_ClearFlag(TIM2_FLAG_UPDATE);	
 326  0016 ae0001        	ldw	x,#1
 327  0019 cd0000        	call	_TIM2_ClearFlag
 329                     ; 172 	cont_tim2++;
 331  001c be00          	ldw	x,_cont_tim2
 332  001e 5c            	incw	x
 333  001f bf00          	ldw	_cont_tim2,x
 334                     ; 173   cont_restart++;
 336  0021 be00          	ldw	x,_cont_restart
 337  0023 5c            	incw	x
 338  0024 bf00          	ldw	_cont_restart,x
 339                     ; 174   if(cont_ruleta <= 5 )
 341  0026 b600          	ld	a,_cont_ruleta
 342  0028 a106          	cp	a,#6
 343  002a 2404          	jruge	L101
 344                     ; 176     cont_ruleta++;
 346  002c 3c00          	inc	_cont_ruleta
 348  002e 2008          	jra	L301
 349  0030               L101:
 350                     ; 178   else if(cont_ruleta > 5)
 352  0030 b600          	ld	a,_cont_ruleta
 353  0032 a106          	cp	a,#6
 354  0034 2502          	jrult	L301
 355                     ; 180     cont_ruleta = 0;
 357  0036 3f00          	clr	_cont_ruleta
 358  0038               L301:
 359                     ; 184   if (cont_tim2%4 == 0)
 361  0038 be00          	ldw	x,_cont_tim2
 362  003a a604          	ld	a,#4
 363  003c cd0000        	call	c_smodx
 365  003f 5d            	tnzw	x
 366  0040 2604          	jrne	L701
 367                     ; 186     contHist++;
 369  0042 3c00          	inc	_contHist
 371  0044 200d          	jra	L111
 372  0046               L701:
 373                     ; 188   else if (cont_tim2 == 21)
 375  0046 be00          	ldw	x,_cont_tim2
 376  0048 a30015        	cpw	x,#21
 377  004b 2606          	jrne	L111
 378                     ; 190     flag_historicos = FALSE;
 380  004d 3f00          	clr	_flag_historicos
 381                     ; 191     contHist=1;
 383  004f 35010000      	mov	_contHist,#1
 384  0053               L111:
 385                     ; 193 }
 388  0053 85            	popw	x
 389  0054 bf00          	ldw	c_y,x
 390  0056 320002        	pop	c_y+2
 391  0059 85            	popw	x
 392  005a bf00          	ldw	c_x,x
 393  005c 320002        	pop	c_x+2
 394  005f 80            	iret	
 417                     ; 201 void I2C_ReceiverIRQHandler(void)
 417                     ; 202 {	
 418                     .text:	section	.text,new
 419  0000               f_I2C_ReceiverIRQHandler:
 423                     ; 266 }
 426  0000 80            	iret	
 449                     ; 272 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 449                     ; 273 {
 450                     .text:	section	.text,new
 451  0000               f_EEPROM_EEC_IRQHandler:
 455                     ; 277 }
 458  0000 80            	iret	
 498                     ; 283 void UART_RX_IRQHandler(void )
 498                     ; 284 {
 499                     .text:	section	.text,new
 500  0000               f_UART_RX_IRQHandler:
 502  0000 8a            	push	cc
 503  0001 84            	pop	a
 504  0002 a4bf          	and	a,#191
 505  0004 88            	push	a
 506  0005 86            	pop	cc
 507       00000001      OFST:	set	1
 508  0006 3b0002        	push	c_x+2
 509  0009 be00          	ldw	x,c_x
 510  000b 89            	pushw	x
 511  000c 3b0002        	push	c_y+2
 512  000f be00          	ldw	x,c_y
 513  0011 89            	pushw	x
 514  0012 88            	push	a
 517                     ; 285   uint8_t aux = 0;
 519                     ; 287   aux = UART1_ReceiveData8();
 521  0013 cd0000        	call	_UART1_ReceiveData8
 523  0016 6b01          	ld	(OFST+0,sp),a
 525                     ; 289   UART1_ClearITPendingBit(UART1_IT_RXNE);
 527  0018 ae0255        	ldw	x,#597
 528  001b cd0000        	call	_UART1_ClearITPendingBit
 530                     ; 290   UART1_ClearFlag(UART1_FLAG_RXNE);
 532  001e ae0020        	ldw	x,#32
 533  0021 cd0000        	call	_UART1_ClearFlag
 535                     ; 292   Slave_Buffer_Rx[cont_bytes] 	= aux;
 537  0024 b604          	ld	a,_cont_bytes
 538  0026 5f            	clrw	x
 539  0027 97            	ld	xl,a
 540  0028 7b01          	ld	a,(OFST+0,sp)
 541  002a e700          	ld	(_Slave_Buffer_Rx,x),a
 542                     ; 294   if(cont_bytes != (N_BYTES-1))
 544  002c b604          	ld	a,_cont_bytes
 545  002e a101          	cp	a,#1
 546  0030 2704          	jreq	L351
 547                     ; 296     cont_bytes++;		
 549  0032 3c04          	inc	_cont_bytes
 551  0034 2009          	jra	L551
 552  0036               L351:
 553                     ; 298   else if(cont_bytes == (N_BYTES-1))
 555  0036 4a            	dec	a
 556  0037 2606          	jrne	L551
 557                     ; 300     flag_recibir = TRUE;
 559  0039 35010000      	mov	_flag_recibir,#1
 560                     ; 301     cont_bytes=0;		
 562  003d b704          	ld	_cont_bytes,a
 563  003f               L551:
 564                     ; 303 }
 567  003f 84            	pop	a
 568  0040 85            	popw	x
 569  0041 bf00          	ldw	c_y,x
 570  0043 320002        	pop	c_y+2
 571  0046 85            	popw	x
 572  0047 bf00          	ldw	c_x,x
 573  0049 320002        	pop	c_x+2
 574  004c 80            	iret	
 642                     	xdef	_aux
 643                     	xdef	_N_BYTES
 644                     	xdef	_cont_bytes
 645                     	xdef	_Event
 646                     	xdef	_Rx_Idx
 647                     	xdef	_Tx_Idx
 648                     	xref.b	_Slave_Buffer_Rx
 649                     	xref.b	_contHist
 650                     	xref.b	_flag_reinicio
 651                     	xref.b	_contReinicio
 652                     	xref.b	_contPulsos
 653                     	xref.b	_cont_ruleta
 654                     	xref.b	_cont_restart
 655                     	xref.b	_cont_tim2
 656                     	xref.b	_flag_tim2
 657                     	xref.b	_flag_historicos
 658                     	xref.b	_flag_recibir
 659                     	xref.b	_flag_buzzer
 660                     	xref.b	_flag_boton
 661                     	xdef	f_EEPROM_EEC_IRQHandler
 662                     	xdef	f_AWU_IRQHandler
 663                     	xdef	f_NonHandledInterrupt
 664                     	xref	_UART1_ClearITPendingBit
 665                     	xref	_UART1_ClearFlag
 666                     	xref	_UART1_ReceiveData8
 667                     	xref	_TIM2_ClearFlag
 668                     	xref	_TIM1_ClearITPendingBit
 669                     	xdef	f_UART_RX_IRQHandler
 670                     	xdef	f_I2C_ReceiverIRQHandler
 671                     	xdef	f_TIM1_UPD_IRQHandler
 672                     	xdef	f_TIM2_UPD_IRQHandler
 673                     	xdef	f_EXTI3_IRQHandler
 674                     	xref.b	c_x
 675                     	xref.b	c_y
 694                     	xref	c_smodx
 695                     	end
