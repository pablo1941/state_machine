   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  20                     .const:	section	.text
  21  0000               _APR_Array:
  22  0000 00            	dc.b	0
  23  0001 1e            	dc.b	30
  24  0002 1e            	dc.b	30
  25  0003 1e            	dc.b	30
  26  0004 1e            	dc.b	30
  27  0005 1e            	dc.b	30
  28  0006 1e            	dc.b	30
  29  0007 1e            	dc.b	30
  30  0008 1e            	dc.b	30
  31  0009 1e            	dc.b	30
  32  000a 1e            	dc.b	30
  33  000b 1e            	dc.b	30
  34  000c 1e            	dc.b	30
  35  000d 3d            	dc.b	61
  36  000e 17            	dc.b	23
  37  000f 17            	dc.b	23
  38  0010 3e            	dc.b	62
  39  0011               _TBR_Array:
  40  0011 00            	dc.b	0
  41  0012 01            	dc.b	1
  42  0013 02            	dc.b	2
  43  0014 03            	dc.b	3
  44  0015 04            	dc.b	4
  45  0016 05            	dc.b	5
  46  0017 06            	dc.b	6
  47  0018 07            	dc.b	7
  48  0019 08            	dc.b	8
  49  001a 09            	dc.b	9
  50  001b 0a            	dc.b	10
  51  001c 0b            	dc.b	11
  52  001d 0c            	dc.b	12
  53  001e 0c            	dc.b	12
  54  001f 0e            	dc.b	14
  55  0020 0f            	dc.b	15
  56  0021 0f            	dc.b	15
  85                     ; 73 void AWU_DeInit(void)
  85                     ; 74 {
  87                     .text:	section	.text,new
  88  0000               _AWU_DeInit:
  92                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  94  0000 725f50f0      	clr	20720
  95                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  97  0004 353f50f1      	mov	20721,#63
  98                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
 100  0008 725f50f2      	clr	20722
 101                     ; 78 }
 104  000c 81            	ret	
 266                     ; 88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 266                     ; 89 {
 267                     .text:	section	.text,new
 268  0000               _AWU_Init:
 270  0000 88            	push	a
 271       00000000      OFST:	set	0
 274                     ; 91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 276                     ; 94   AWU->CSR |= AWU_CSR_AWUEN;
 278  0001 721850f0      	bset	20720,#4
 279                     ; 97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 281  0005 c650f2        	ld	a,20722
 282  0008 a4f0          	and	a,#240
 283  000a c750f2        	ld	20722,a
 284                     ; 98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 286  000d 7b01          	ld	a,(OFST+1,sp)
 287  000f 5f            	clrw	x
 288  0010 97            	ld	xl,a
 289  0011 c650f2        	ld	a,20722
 290  0014 da0011        	or	a,(_TBR_Array,x)
 291  0017 c750f2        	ld	20722,a
 292                     ; 101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 294  001a c650f1        	ld	a,20721
 295  001d a4c0          	and	a,#192
 296  001f c750f1        	ld	20721,a
 297                     ; 102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 299  0022 7b01          	ld	a,(OFST+1,sp)
 300  0024 5f            	clrw	x
 301  0025 97            	ld	xl,a
 302  0026 c650f1        	ld	a,20721
 303  0029 da0000        	or	a,(_APR_Array,x)
 304  002c c750f1        	ld	20721,a
 305                     ; 103 }
 308  002f 84            	pop	a
 309  0030 81            	ret	
 364                     ; 112 void AWU_Cmd(FunctionalState NewState)
 364                     ; 113 {
 365                     .text:	section	.text,new
 366  0000               _AWU_Cmd:
 370                     ; 114   if (NewState != DISABLE)
 372  0000 4d            	tnz	a
 373  0001 2705          	jreq	L331
 374                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 376  0003 721850f0      	bset	20720,#4
 379  0007 81            	ret	
 380  0008               L331:
 381                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 383  0008 721950f0      	bres	20720,#4
 384                     ; 124 }
 387  000c 81            	ret	
 440                     	switch	.const
 441  0022               L41:
 442  0022 000003e8      	dc.l	1000
 443                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 443                     ; 140 {
 444                     .text:	section	.text,new
 445  0000               _AWU_LSICalibrationConfig:
 447  0000 5206          	subw	sp,#6
 448       00000006      OFST:	set	6
 451                     ; 141   uint16_t lsifreqkhz = 0x0;
 453                     ; 142   uint16_t A = 0x0;
 455                     ; 145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 457                     ; 147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 459  0002 96            	ldw	x,sp
 460  0003 1c0009        	addw	x,#OFST+3
 461  0006 cd0000        	call	c_ltor
 463  0009 ae0022        	ldw	x,#L41
 464  000c cd0000        	call	c_ludv
 466  000f be02          	ldw	x,c_lreg+2
 467  0011 1f03          	ldw	(OFST-3,sp),x
 469                     ; 151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 471  0013 54            	srlw	x
 472  0014 54            	srlw	x
 473  0015 1f05          	ldw	(OFST-1,sp),x
 475                     ; 153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 477  0017 58            	sllw	x
 478  0018 58            	sllw	x
 479  0019 1f01          	ldw	(OFST-5,sp),x
 481  001b 1e03          	ldw	x,(OFST-3,sp)
 482  001d 72f001        	subw	x,(OFST-5,sp)
 483  0020 1605          	ldw	y,(OFST-1,sp)
 484  0022 9058          	sllw	y
 485  0024 905c          	incw	y
 486  0026 cd0000        	call	c_imul
 488  0029 1605          	ldw	y,(OFST-1,sp)
 489  002b 9058          	sllw	y
 490  002d bf00          	ldw	c_x,x
 491  002f 9058          	sllw	y
 492  0031 90b300        	cpw	y,c_x
 493  0034 7b06          	ld	a,(OFST+0,sp)
 494  0036 2504          	jrult	L561
 495                     ; 155     AWU->APR = (uint8_t)(A - 2U);
 497  0038 a002          	sub	a,#2
 499  003a 2001          	jra	L761
 500  003c               L561:
 501                     ; 159     AWU->APR = (uint8_t)(A - 1U);
 503  003c 4a            	dec	a
 504  003d               L761:
 505  003d c750f1        	ld	20721,a
 506                     ; 161 }
 509  0040 5b06          	addw	sp,#6
 510  0042 81            	ret	
 533                     ; 168 void AWU_IdleModeEnable(void)
 533                     ; 169 {
 534                     .text:	section	.text,new
 535  0000               _AWU_IdleModeEnable:
 539                     ; 171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 541  0000 721950f0      	bres	20720,#4
 542                     ; 174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 544  0004 35f050f2      	mov	20722,#240
 545                     ; 175 }
 548  0008 81            	ret	
 592                     ; 183 FlagStatus AWU_GetFlagStatus(void)
 592                     ; 184 {
 593                     .text:	section	.text,new
 594  0000               _AWU_GetFlagStatus:
 598                     ; 185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 600  0000 720a50f002    	btjt	20720,#5,L22
 601  0005 4f            	clr	a
 603  0006 81            	ret	
 604  0007               L22:
 605  0007 a601          	ld	a,#1
 608  0009 81            	ret	
 643                     	xdef	_TBR_Array
 644                     	xdef	_APR_Array
 645                     	xdef	_AWU_GetFlagStatus
 646                     	xdef	_AWU_IdleModeEnable
 647                     	xdef	_AWU_LSICalibrationConfig
 648                     	xdef	_AWU_Cmd
 649                     	xdef	_AWU_Init
 650                     	xdef	_AWU_DeInit
 651                     	xref.b	c_lreg
 652                     	xref.b	c_x
 671                     	xref	c_imul
 672                     	xref	c_ludv
 673                     	xref	c_ltor
 674                     	end
