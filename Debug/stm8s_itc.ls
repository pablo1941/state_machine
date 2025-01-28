   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  48                     ; 50 uint8_t ITC_GetCPUCC(void)
  48                     ; 51 {
  50                     .text:	section	.text,new
  51  0000               _ITC_GetCPUCC:
  55                     ; 53   _asm("push cc");
  58  0000 8a            	push	cc
  60                     ; 54   _asm("pop a");
  63  0001 84            	pop	a
  65                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  68  0002 81            	ret	
  91                     ; 80 void ITC_DeInit(void)
  91                     ; 81 {
  92                     .text:	section	.text,new
  93  0000               _ITC_DeInit:
  97                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  99  0000 35ff7f70      	mov	32624,#255
 100                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 102  0004 35ff7f71      	mov	32625,#255
 103                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 105  0008 35ff7f72      	mov	32626,#255
 106                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 108  000c 35ff7f73      	mov	32627,#255
 109                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 111  0010 35ff7f74      	mov	32628,#255
 112                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 114  0014 35ff7f75      	mov	32629,#255
 115                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 117  0018 35ff7f76      	mov	32630,#255
 118                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 120  001c 35ff7f77      	mov	32631,#255
 121                     ; 90 }
 124  0020 81            	ret	
 149                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 149                     ; 98 {
 150                     .text:	section	.text,new
 151  0000               _ITC_GetSoftIntStatus:
 155                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 157  0000 cd0000        	call	_ITC_GetCPUCC
 159  0003 a428          	and	a,#40
 162  0005 81            	ret	
 411                     .const:	section	.text
 412  0000               L42:
 413  0000 0021          	dc.w	L14
 414  0002 0021          	dc.w	L14
 415  0004 0021          	dc.w	L14
 416  0006 0021          	dc.w	L14
 417  0008 0026          	dc.w	L34
 418  000a 0026          	dc.w	L34
 419  000c 0026          	dc.w	L34
 420  000e 0026          	dc.w	L34
 421  0010 0046          	dc.w	L302
 422  0012 0046          	dc.w	L302
 423  0014 002b          	dc.w	L54
 424  0016 002b          	dc.w	L54
 425  0018 0030          	dc.w	L74
 426  001a 0030          	dc.w	L74
 427  001c 0030          	dc.w	L74
 428  001e 0030          	dc.w	L74
 429  0020 0035          	dc.w	L15
 430  0022 0035          	dc.w	L15
 431  0024 0035          	dc.w	L15
 432  0026 0035          	dc.w	L15
 433  0028 0046          	dc.w	L302
 434  002a 0046          	dc.w	L302
 435  002c 003a          	dc.w	L35
 436  002e 003a          	dc.w	L35
 437  0030 003f          	dc.w	L55
 438                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 438                     ; 108 {
 439                     .text:	section	.text,new
 440  0000               _ITC_GetSoftwarePriority:
 442  0000 88            	push	a
 443  0001 89            	pushw	x
 444       00000002      OFST:	set	2
 447                     ; 109   uint8_t Value = 0;
 449  0002 0f02          	clr	(OFST+0,sp)
 451                     ; 110   uint8_t Mask = 0;
 453                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 455                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 457  0004 a403          	and	a,#3
 458  0006 48            	sll	a
 459  0007 5f            	clrw	x
 460  0008 97            	ld	xl,a
 461  0009 a603          	ld	a,#3
 462  000b 5d            	tnzw	x
 463  000c 2704          	jreq	L61
 464  000e               L02:
 465  000e 48            	sll	a
 466  000f 5a            	decw	x
 467  0010 26fc          	jrne	L02
 468  0012               L61:
 469  0012 6b01          	ld	(OFST-1,sp),a
 471                     ; 118   switch (IrqNum)
 473  0014 7b03          	ld	a,(OFST+1,sp)
 475                     ; 198   default:
 475                     ; 199     break;
 476  0016 a119          	cp	a,#25
 477  0018 242c          	jruge	L302
 478  001a 5f            	clrw	x
 479  001b 97            	ld	xl,a
 480  001c 58            	sllw	x
 481  001d de0000        	ldw	x,(L42,x)
 482  0020 fc            	jp	(x)
 483  0021               L14:
 484                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 484                     ; 121   case ITC_IRQ_AWU:
 484                     ; 122   case ITC_IRQ_CLK:
 484                     ; 123   case ITC_IRQ_PORTA:
 484                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 486  0021 c67f70        	ld	a,32624
 487                     ; 125     break;
 489  0024 201c          	jp	LC001
 490  0026               L34:
 491                     ; 127   case ITC_IRQ_PORTB:
 491                     ; 128   case ITC_IRQ_PORTC:
 491                     ; 129   case ITC_IRQ_PORTD:
 491                     ; 130   case ITC_IRQ_PORTE:
 491                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 493  0026 c67f71        	ld	a,32625
 494                     ; 132     break;
 496  0029 2017          	jp	LC001
 497  002b               L54:
 498                     ; 141   case ITC_IRQ_SPI:
 498                     ; 142   case ITC_IRQ_TIM1_OVF:
 498                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 500  002b c67f72        	ld	a,32626
 501                     ; 144     break;
 503  002e 2012          	jp	LC001
 504  0030               L74:
 505                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 505                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 505                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 505                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 505                     ; 150 #else
 505                     ; 151   case ITC_IRQ_TIM2_OVF:
 505                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 505                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 505                     ; 154   case ITC_IRQ_TIM3_OVF:
 505                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 507  0030 c67f73        	ld	a,32627
 508                     ; 156     break;
 510  0033 200d          	jp	LC001
 511  0035               L15:
 512                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 512                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 512                     ; 160     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 512                     ; 161   case ITC_IRQ_UART1_TX:
 512                     ; 162   case ITC_IRQ_UART1_RX:
 512                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 512                     ; 164 #if defined(STM8AF622x)
 512                     ; 165   case ITC_IRQ_UART4_TX:
 512                     ; 166   case ITC_IRQ_UART4_RX:
 512                     ; 167 #endif /*STM8AF622x */
 512                     ; 168   case ITC_IRQ_I2C:
 512                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 514  0035 c67f74        	ld	a,32628
 515                     ; 170     break;
 517  0038 2008          	jp	LC001
 518  003a               L35:
 519                     ; 184   case ITC_IRQ_ADC1:
 519                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 519                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 519                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 519                     ; 188 #else
 519                     ; 189   case ITC_IRQ_TIM4_OVF:
 519                     ; 190 #endif /*STM8S903 or STM8AF622x */
 519                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 521  003a c67f75        	ld	a,32629
 522                     ; 192     break;
 524  003d 2003          	jp	LC001
 525  003f               L55:
 526                     ; 194   case ITC_IRQ_EEPROM_EEC:
 526                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 528  003f c67f76        	ld	a,32630
 529  0042               LC001:
 530  0042 1401          	and	a,(OFST-1,sp)
 531  0044 6b02          	ld	(OFST+0,sp),a
 533                     ; 196     break;
 535                     ; 198   default:
 535                     ; 199     break;
 537  0046               L302:
 538                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 540  0046 7b03          	ld	a,(OFST+1,sp)
 541  0048 a403          	and	a,#3
 542  004a 48            	sll	a
 543  004b 5f            	clrw	x
 544  004c 97            	ld	xl,a
 545  004d 7b02          	ld	a,(OFST+0,sp)
 546  004f 5d            	tnzw	x
 547  0050 2704          	jreq	L62
 548  0052               L03:
 549  0052 44            	srl	a
 550  0053 5a            	decw	x
 551  0054 26fc          	jrne	L03
 552  0056               L62:
 554                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 558  0056 5b03          	addw	sp,#3
 559  0058 81            	ret	
 623                     	switch	.const
 624  0032               L64:
 625  0032 0036          	dc.w	L502
 626  0034 0036          	dc.w	L502
 627  0036 0036          	dc.w	L502
 628  0038 0036          	dc.w	L502
 629  003a 0048          	dc.w	L702
 630  003c 0048          	dc.w	L702
 631  003e 0048          	dc.w	L702
 632  0040 0048          	dc.w	L702
 633  0042 00b2          	dc.w	L162
 634  0044 00b2          	dc.w	L162
 635  0046 005a          	dc.w	L112
 636  0048 005a          	dc.w	L112
 637  004a 006c          	dc.w	L312
 638  004c 006c          	dc.w	L312
 639  004e 006c          	dc.w	L312
 640  0050 006c          	dc.w	L312
 641  0052 007e          	dc.w	L512
 642  0054 007e          	dc.w	L512
 643  0056 007e          	dc.w	L512
 644  0058 007e          	dc.w	L512
 645  005a 00b2          	dc.w	L162
 646  005c 00b2          	dc.w	L162
 647  005e 0090          	dc.w	L712
 648  0060 0090          	dc.w	L712
 649  0062 00a2          	dc.w	L122
 650                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 650                     ; 221 {
 651                     .text:	section	.text,new
 652  0000               _ITC_SetSoftwarePriority:
 654  0000 89            	pushw	x
 655  0001 89            	pushw	x
 656       00000002      OFST:	set	2
 659                     ; 222   uint8_t Mask = 0;
 661                     ; 223   uint8_t NewPriority = 0;
 663                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 665                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 667                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 669                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 671  0002 9e            	ld	a,xh
 672  0003 a403          	and	a,#3
 673  0005 48            	sll	a
 674  0006 5f            	clrw	x
 675  0007 97            	ld	xl,a
 676  0008 a603          	ld	a,#3
 677  000a 5d            	tnzw	x
 678  000b 2704          	jreq	L43
 679  000d               L63:
 680  000d 48            	sll	a
 681  000e 5a            	decw	x
 682  000f 26fc          	jrne	L63
 683  0011               L43:
 684  0011 43            	cpl	a
 685  0012 6b01          	ld	(OFST-1,sp),a
 687                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 689  0014 7b03          	ld	a,(OFST+1,sp)
 690  0016 a403          	and	a,#3
 691  0018 48            	sll	a
 692  0019 5f            	clrw	x
 693  001a 97            	ld	xl,a
 694  001b 7b04          	ld	a,(OFST+2,sp)
 695  001d 5d            	tnzw	x
 696  001e 2704          	jreq	L04
 697  0020               L24:
 698  0020 48            	sll	a
 699  0021 5a            	decw	x
 700  0022 26fc          	jrne	L24
 701  0024               L04:
 702  0024 6b02          	ld	(OFST+0,sp),a
 704                     ; 239   switch (IrqNum)
 706  0026 7b03          	ld	a,(OFST+1,sp)
 708                     ; 329   default:
 708                     ; 330     break;
 709  0028 a119          	cp	a,#25
 710  002a 2503cc00b2    	jruge	L162
 711  002f 5f            	clrw	x
 712  0030 97            	ld	xl,a
 713  0031 58            	sllw	x
 714  0032 de0032        	ldw	x,(L64,x)
 715  0035 fc            	jp	(x)
 716  0036               L502:
 717                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 717                     ; 242   case ITC_IRQ_AWU:
 717                     ; 243   case ITC_IRQ_CLK:
 717                     ; 244   case ITC_IRQ_PORTA:
 717                     ; 245     ITC->ISPR1 &= Mask;
 719  0036 c67f70        	ld	a,32624
 720  0039 1401          	and	a,(OFST-1,sp)
 721  003b c77f70        	ld	32624,a
 722                     ; 246     ITC->ISPR1 |= NewPriority;
 724  003e c67f70        	ld	a,32624
 725  0041 1a02          	or	a,(OFST+0,sp)
 726  0043 c77f70        	ld	32624,a
 727                     ; 247     break;
 729  0046 206a          	jra	L162
 730  0048               L702:
 731                     ; 249   case ITC_IRQ_PORTB:
 731                     ; 250   case ITC_IRQ_PORTC:
 731                     ; 251   case ITC_IRQ_PORTD:
 731                     ; 252   case ITC_IRQ_PORTE:
 731                     ; 253     ITC->ISPR2 &= Mask;
 733  0048 c67f71        	ld	a,32625
 734  004b 1401          	and	a,(OFST-1,sp)
 735  004d c77f71        	ld	32625,a
 736                     ; 254     ITC->ISPR2 |= NewPriority;
 738  0050 c67f71        	ld	a,32625
 739  0053 1a02          	or	a,(OFST+0,sp)
 740  0055 c77f71        	ld	32625,a
 741                     ; 255     break;
 743  0058 2058          	jra	L162
 744  005a               L112:
 745                     ; 264   case ITC_IRQ_SPI:
 745                     ; 265   case ITC_IRQ_TIM1_OVF:
 745                     ; 266     ITC->ISPR3 &= Mask;
 747  005a c67f72        	ld	a,32626
 748  005d 1401          	and	a,(OFST-1,sp)
 749  005f c77f72        	ld	32626,a
 750                     ; 267     ITC->ISPR3 |= NewPriority;
 752  0062 c67f72        	ld	a,32626
 753  0065 1a02          	or	a,(OFST+0,sp)
 754  0067 c77f72        	ld	32626,a
 755                     ; 268     break;
 757  006a 2046          	jra	L162
 758  006c               L312:
 759                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 759                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 759                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 759                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 759                     ; 274 #else
 759                     ; 275   case ITC_IRQ_TIM2_OVF:
 759                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 759                     ; 277 #endif /*STM8S903 or STM8AF622x */
 759                     ; 278   case ITC_IRQ_TIM3_OVF:
 759                     ; 279     ITC->ISPR4 &= Mask;
 761  006c c67f73        	ld	a,32627
 762  006f 1401          	and	a,(OFST-1,sp)
 763  0071 c77f73        	ld	32627,a
 764                     ; 280     ITC->ISPR4 |= NewPriority;
 766  0074 c67f73        	ld	a,32627
 767  0077 1a02          	or	a,(OFST+0,sp)
 768  0079 c77f73        	ld	32627,a
 769                     ; 281     break;
 771  007c 2034          	jra	L162
 772  007e               L512:
 773                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 773                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 773                     ; 285     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 773                     ; 286   case ITC_IRQ_UART1_TX:
 773                     ; 287   case ITC_IRQ_UART1_RX:
 773                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 773                     ; 289 #if defined(STM8AF622x)
 773                     ; 290   case ITC_IRQ_UART4_TX:
 773                     ; 291   case ITC_IRQ_UART4_RX:
 773                     ; 292 #endif /*STM8AF622x */
 773                     ; 293   case ITC_IRQ_I2C:
 773                     ; 294     ITC->ISPR5 &= Mask;
 775  007e c67f74        	ld	a,32628
 776  0081 1401          	and	a,(OFST-1,sp)
 777  0083 c77f74        	ld	32628,a
 778                     ; 295     ITC->ISPR5 |= NewPriority;
 780  0086 c67f74        	ld	a,32628
 781  0089 1a02          	or	a,(OFST+0,sp)
 782  008b c77f74        	ld	32628,a
 783                     ; 296     break;
 785  008e 2022          	jra	L162
 786  0090               L712:
 787                     ; 312   case ITC_IRQ_ADC1:
 787                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 787                     ; 314     
 787                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 787                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 787                     ; 317 #else
 787                     ; 318   case ITC_IRQ_TIM4_OVF:
 787                     ; 319 #endif /* STM8S903 or STM8AF622x */
 787                     ; 320     ITC->ISPR6 &= Mask;
 789  0090 c67f75        	ld	a,32629
 790  0093 1401          	and	a,(OFST-1,sp)
 791  0095 c77f75        	ld	32629,a
 792                     ; 321     ITC->ISPR6 |= NewPriority;
 794  0098 c67f75        	ld	a,32629
 795  009b 1a02          	or	a,(OFST+0,sp)
 796  009d c77f75        	ld	32629,a
 797                     ; 322     break;
 799  00a0 2010          	jra	L162
 800  00a2               L122:
 801                     ; 324   case ITC_IRQ_EEPROM_EEC:
 801                     ; 325     ITC->ISPR7 &= Mask;
 803  00a2 c67f76        	ld	a,32630
 804  00a5 1401          	and	a,(OFST-1,sp)
 805  00a7 c77f76        	ld	32630,a
 806                     ; 326     ITC->ISPR7 |= NewPriority;
 808  00aa c67f76        	ld	a,32630
 809  00ad 1a02          	or	a,(OFST+0,sp)
 810  00af c77f76        	ld	32630,a
 811                     ; 327     break;
 813                     ; 329   default:
 813                     ; 330     break;
 815  00b2               L162:
 816                     ; 332 }
 819  00b2 5b04          	addw	sp,#4
 820  00b4 81            	ret	
 833                     	xdef	_ITC_GetSoftwarePriority
 834                     	xdef	_ITC_SetSoftwarePriority
 835                     	xdef	_ITC_GetSoftIntStatus
 836                     	xdef	_ITC_DeInit
 837                     	xdef	_ITC_GetCPUCC
 856                     	end
