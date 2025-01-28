   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  48                     ; 53 void UART1_DeInit(void)
  48                     ; 54 {
  50                     .text:	section	.text,new
  51  0000               _UART1_DeInit:
  55                     ; 57   (void)UART1->SR;
  57  0000 c65230        	ld	a,21040
  58                     ; 58   (void)UART1->DR;
  60  0003 c65231        	ld	a,21041
  61                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  63  0006 725f5233      	clr	21043
  64                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  66  000a 725f5232      	clr	21042
  67                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  69  000e 725f5234      	clr	21044
  70                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  72  0012 725f5235      	clr	21045
  73                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  75  0016 725f5236      	clr	21046
  76                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  78  001a 725f5237      	clr	21047
  79                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  81  001e 725f5238      	clr	21048
  82                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  84  0022 725f5239      	clr	21049
  85                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  87  0026 725f523a      	clr	21050
  88                     ; 71 }
  91  002a 81            	ret	
 394                     .const:	section	.text
 395  0000               L41:
 396  0000 00000064      	dc.l	100
 397                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 397                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 397                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 397                     ; 93 {
 398                     .text:	section	.text,new
 399  0000               _UART1_Init:
 401  0000 520c          	subw	sp,#12
 402       0000000c      OFST:	set	12
 405                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 409                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 411                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 413                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 415                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 417                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 419                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 421                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 423  0002 72195234      	bres	21044,#4
 424                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 426  0006 c65234        	ld	a,21044
 427  0009 1a13          	or	a,(OFST+7,sp)
 428  000b c75234        	ld	21044,a
 429                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 431  000e c65236        	ld	a,21046
 432  0011 a4cf          	and	a,#207
 433  0013 c75236        	ld	21046,a
 434                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 436  0016 c65236        	ld	a,21046
 437  0019 1a14          	or	a,(OFST+8,sp)
 438  001b c75236        	ld	21046,a
 439                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 441  001e c65234        	ld	a,21044
 442  0021 a4f9          	and	a,#249
 443  0023 c75234        	ld	21044,a
 444                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 446  0026 c65234        	ld	a,21044
 447  0029 1a15          	or	a,(OFST+9,sp)
 448  002b c75234        	ld	21044,a
 449                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 451  002e 725f5232      	clr	21042
 452                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 454  0032 c65233        	ld	a,21043
 455  0035 a40f          	and	a,#15
 456  0037 c75233        	ld	21043,a
 457                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 459  003a c65233        	ld	a,21043
 460  003d a4f0          	and	a,#240
 461  003f c75233        	ld	21043,a
 462                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 464  0042 96            	ldw	x,sp
 465  0043 cd011c        	call	LC001
 467  0046 96            	ldw	x,sp
 468  0047 5c            	incw	x
 469  0048 cd0000        	call	c_rtol
 472  004b cd0000        	call	_CLK_GetClockFreq
 474  004e 96            	ldw	x,sp
 475  004f 5c            	incw	x
 476  0050 cd0000        	call	c_ludv
 478  0053 96            	ldw	x,sp
 479  0054 1c0009        	addw	x,#OFST-3
 480  0057 cd0000        	call	c_rtol
 483                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 485  005a 96            	ldw	x,sp
 486  005b cd011c        	call	LC001
 488  005e 96            	ldw	x,sp
 489  005f 5c            	incw	x
 490  0060 cd0000        	call	c_rtol
 493  0063 cd0000        	call	_CLK_GetClockFreq
 495  0066 a664          	ld	a,#100
 496  0068 cd0000        	call	c_smul
 498  006b 96            	ldw	x,sp
 499  006c 5c            	incw	x
 500  006d cd0000        	call	c_ludv
 502  0070 96            	ldw	x,sp
 503  0071 1c0005        	addw	x,#OFST-7
 504  0074 cd0000        	call	c_rtol
 507                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 509  0077 96            	ldw	x,sp
 510  0078 1c0009        	addw	x,#OFST-3
 511  007b cd0000        	call	c_ltor
 513  007e a664          	ld	a,#100
 514  0080 cd0000        	call	c_smul
 516  0083 96            	ldw	x,sp
 517  0084 5c            	incw	x
 518  0085 cd0000        	call	c_rtol
 521  0088 96            	ldw	x,sp
 522  0089 1c0005        	addw	x,#OFST-7
 523  008c cd0000        	call	c_ltor
 525  008f 96            	ldw	x,sp
 526  0090 5c            	incw	x
 527  0091 cd0000        	call	c_lsub
 529  0094 a604          	ld	a,#4
 530  0096 cd0000        	call	c_llsh
 532  0099 ae0000        	ldw	x,#L41
 533  009c cd0000        	call	c_ludv
 535  009f b603          	ld	a,c_lreg+3
 536  00a1 a40f          	and	a,#15
 537  00a3 ca5233        	or	a,21043
 538  00a6 c75233        	ld	21043,a
 539                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 541  00a9 96            	ldw	x,sp
 542  00aa 1c0009        	addw	x,#OFST-3
 543  00ad cd0000        	call	c_ltor
 545  00b0 a604          	ld	a,#4
 546  00b2 cd0000        	call	c_lursh
 548  00b5 b603          	ld	a,c_lreg+3
 549  00b7 a4f0          	and	a,#240
 550  00b9 b703          	ld	c_lreg+3,a
 551  00bb 3f02          	clr	c_lreg+2
 552  00bd 3f01          	clr	c_lreg+1
 553  00bf 3f00          	clr	c_lreg
 554  00c1 ca5233        	or	a,21043
 555  00c4 c75233        	ld	21043,a
 556                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 558  00c7 c65232        	ld	a,21042
 559  00ca 1a0c          	or	a,(OFST+0,sp)
 560  00cc c75232        	ld	21042,a
 561                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 563  00cf c65235        	ld	a,21045
 564  00d2 a4f3          	and	a,#243
 565  00d4 c75235        	ld	21045,a
 566                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 568  00d7 c65236        	ld	a,21046
 569  00da a4f8          	and	a,#248
 570  00dc c75236        	ld	21046,a
 571                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 571                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 573  00df 7b16          	ld	a,(OFST+10,sp)
 574  00e1 a407          	and	a,#7
 575  00e3 ca5236        	or	a,21046
 576  00e6 c75236        	ld	21046,a
 577                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 579  00e9 7b17          	ld	a,(OFST+11,sp)
 580  00eb a504          	bcp	a,#4
 581  00ed 2706          	jreq	L371
 582                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 584  00ef 72165235      	bset	21045,#3
 586  00f3 2004          	jra	L571
 587  00f5               L371:
 588                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 590  00f5 72175235      	bres	21045,#3
 591  00f9               L571:
 592                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 594  00f9 a508          	bcp	a,#8
 595  00fb 2706          	jreq	L771
 596                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 598  00fd 72145235      	bset	21045,#2
 600  0101 2004          	jra	L102
 601  0103               L771:
 602                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 604  0103 72155235      	bres	21045,#2
 605  0107               L102:
 606                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 608  0107 7b16          	ld	a,(OFST+10,sp)
 609  0109 2a06          	jrpl	L302
 610                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 612  010b 72175236      	bres	21046,#3
 614  010f 2008          	jra	L502
 615  0111               L302:
 616                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 618  0111 a408          	and	a,#8
 619  0113 ca5236        	or	a,21046
 620  0116 c75236        	ld	21046,a
 621  0119               L502:
 622                     ; 176 }
 625  0119 5b0c          	addw	sp,#12
 626  011b 81            	ret	
 627  011c               LC001:
 628  011c 1c000f        	addw	x,#OFST+3
 629  011f cd0000        	call	c_ltor
 631  0122 a604          	ld	a,#4
 632  0124 cc0000        	jp	c_llsh
 687                     ; 184 void UART1_Cmd(FunctionalState NewState)
 687                     ; 185 {
 688                     .text:	section	.text,new
 689  0000               _UART1_Cmd:
 693                     ; 186   if (NewState != DISABLE)
 695  0000 4d            	tnz	a
 696  0001 2705          	jreq	L532
 697                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 699  0003 721b5234      	bres	21044,#5
 702  0007 81            	ret	
 703  0008               L532:
 704                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 706  0008 721a5234      	bset	21044,#5
 707                     ; 196 }
 710  000c 81            	ret	
 835                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 835                     ; 212 {
 836                     .text:	section	.text,new
 837  0000               _UART1_ITConfig:
 839  0000 89            	pushw	x
 840  0001 89            	pushw	x
 841       00000002      OFST:	set	2
 844                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 848                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 850                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 852                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 854  0002 9e            	ld	a,xh
 855  0003 6b01          	ld	(OFST-1,sp),a
 857                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 859  0005 9f            	ld	a,xl
 860  0006 a40f          	and	a,#15
 861  0008 5f            	clrw	x
 862  0009 97            	ld	xl,a
 863  000a a601          	ld	a,#1
 864  000c 5d            	tnzw	x
 865  000d 2704          	jreq	L22
 866  000f               L42:
 867  000f 48            	sll	a
 868  0010 5a            	decw	x
 869  0011 26fc          	jrne	L42
 870  0013               L22:
 871  0013 6b02          	ld	(OFST+0,sp),a
 873                     ; 224   if (NewState != DISABLE)
 875  0015 7b07          	ld	a,(OFST+5,sp)
 876  0017 271f          	jreq	L713
 877                     ; 227     if (uartreg == 0x01)
 879  0019 7b01          	ld	a,(OFST-1,sp)
 880  001b a101          	cp	a,#1
 881  001d 2607          	jrne	L123
 882                     ; 229       UART1->CR1 |= itpos;
 884  001f c65234        	ld	a,21044
 885  0022 1a02          	or	a,(OFST+0,sp)
 887  0024 201e          	jp	LC003
 888  0026               L123:
 889                     ; 231     else if (uartreg == 0x02)
 891  0026 a102          	cp	a,#2
 892  0028 2607          	jrne	L523
 893                     ; 233       UART1->CR2 |= itpos;
 895  002a c65235        	ld	a,21045
 896  002d 1a02          	or	a,(OFST+0,sp)
 898  002f 2022          	jp	LC004
 899  0031               L523:
 900                     ; 237       UART1->CR4 |= itpos;
 902  0031 c65237        	ld	a,21047
 903  0034 1a02          	or	a,(OFST+0,sp)
 904  0036 2026          	jp	LC002
 905  0038               L713:
 906                     ; 243     if (uartreg == 0x01)
 908  0038 7b01          	ld	a,(OFST-1,sp)
 909  003a a101          	cp	a,#1
 910  003c 260b          	jrne	L333
 911                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 913  003e 7b02          	ld	a,(OFST+0,sp)
 914  0040 43            	cpl	a
 915  0041 c45234        	and	a,21044
 916  0044               LC003:
 917  0044 c75234        	ld	21044,a
 919  0047 2018          	jra	L133
 920  0049               L333:
 921                     ; 247     else if (uartreg == 0x02)
 923  0049 a102          	cp	a,#2
 924  004b 260b          	jrne	L733
 925                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 927  004d 7b02          	ld	a,(OFST+0,sp)
 928  004f 43            	cpl	a
 929  0050 c45235        	and	a,21045
 930  0053               LC004:
 931  0053 c75235        	ld	21045,a
 933  0056 2009          	jra	L133
 934  0058               L733:
 935                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 937  0058 7b02          	ld	a,(OFST+0,sp)
 938  005a 43            	cpl	a
 939  005b c45237        	and	a,21047
 940  005e               LC002:
 941  005e c75237        	ld	21047,a
 942  0061               L133:
 943                     ; 257 }
 946  0061 5b04          	addw	sp,#4
 947  0063 81            	ret	
 983                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 983                     ; 266 {
 984                     .text:	section	.text,new
 985  0000               _UART1_HalfDuplexCmd:
 989                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 991                     ; 269   if (NewState != DISABLE)
 993  0000 4d            	tnz	a
 994  0001 2705          	jreq	L163
 995                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 997  0003 72165238      	bset	21048,#3
1000  0007 81            	ret	
1001  0008               L163:
1002                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1004  0008 72175238      	bres	21048,#3
1005                     ; 277 }
1008  000c 81            	ret	
1065                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1065                     ; 286 {
1066                     .text:	section	.text,new
1067  0000               _UART1_IrDAConfig:
1071                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1073                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1075  0000 4d            	tnz	a
1076  0001 2705          	jreq	L314
1077                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1079  0003 72145238      	bset	21048,#2
1082  0007 81            	ret	
1083  0008               L314:
1084                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1086  0008 72155238      	bres	21048,#2
1087                     ; 297 }
1090  000c 81            	ret	
1125                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1125                     ; 306 {
1126                     .text:	section	.text,new
1127  0000               _UART1_IrDACmd:
1131                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1133                     ; 310   if (NewState != DISABLE)
1135  0000 4d            	tnz	a
1136  0001 2705          	jreq	L534
1137                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1139  0003 72125238      	bset	21048,#1
1142  0007 81            	ret	
1143  0008               L534:
1144                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1146  0008 72135238      	bres	21048,#1
1147                     ; 320 }
1150  000c 81            	ret	
1209                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1209                     ; 330 {
1210                     .text:	section	.text,new
1211  0000               _UART1_LINBreakDetectionConfig:
1215                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1217                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1219  0000 4d            	tnz	a
1220  0001 2705          	jreq	L764
1221                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1223  0003 721a5237      	bset	21047,#5
1226  0007 81            	ret	
1227  0008               L764:
1228                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1230  0008 721b5237      	bres	21047,#5
1231                     ; 341 }
1234  000c 81            	ret	
1269                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1269                     ; 350 {
1270                     .text:	section	.text,new
1271  0000               _UART1_LINCmd:
1275                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1277                     ; 353   if (NewState != DISABLE)
1279  0000 4d            	tnz	a
1280  0001 2705          	jreq	L115
1281                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1283  0003 721c5236      	bset	21046,#6
1286  0007 81            	ret	
1287  0008               L115:
1288                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1290  0008 721d5236      	bres	21046,#6
1291                     ; 363 }
1294  000c 81            	ret	
1329                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1329                     ; 372 {
1330                     .text:	section	.text,new
1331  0000               _UART1_SmartCardCmd:
1335                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1337                     ; 375   if (NewState != DISABLE)
1339  0000 4d            	tnz	a
1340  0001 2705          	jreq	L335
1341                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1343  0003 721a5238      	bset	21048,#5
1346  0007 81            	ret	
1347  0008               L335:
1348                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1350  0008 721b5238      	bres	21048,#5
1351                     ; 385 }
1354  000c 81            	ret	
1390                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1390                     ; 395 {
1391                     .text:	section	.text,new
1392  0000               _UART1_SmartCardNACKCmd:
1396                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1398                     ; 398   if (NewState != DISABLE)
1400  0000 4d            	tnz	a
1401  0001 2705          	jreq	L555
1402                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1404  0003 72185238      	bset	21048,#4
1407  0007 81            	ret	
1408  0008               L555:
1409                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1411  0008 72195238      	bres	21048,#4
1412                     ; 408 }
1415  000c 81            	ret	
1472                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1472                     ; 417 {
1473                     .text:	section	.text,new
1474  0000               _UART1_WakeUpConfig:
1478                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1480                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1482  0000 72175234      	bres	21044,#3
1483                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1485  0004 ca5234        	or	a,21044
1486  0007 c75234        	ld	21044,a
1487                     ; 422 }
1490  000a 81            	ret	
1526                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1526                     ; 431 {
1527                     .text:	section	.text,new
1528  0000               _UART1_ReceiverWakeUpCmd:
1532                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1534                     ; 434   if (NewState != DISABLE)
1536  0000 4d            	tnz	a
1537  0001 2705          	jreq	L526
1538                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1540  0003 72125235      	bset	21045,#1
1543  0007 81            	ret	
1544  0008               L526:
1545                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1547  0008 72135235      	bres	21045,#1
1548                     ; 444 }
1551  000c 81            	ret	
1574                     ; 451 uint8_t UART1_ReceiveData8(void)
1574                     ; 452 {
1575                     .text:	section	.text,new
1576  0000               _UART1_ReceiveData8:
1580                     ; 453   return ((uint8_t)UART1->DR);
1582  0000 c65231        	ld	a,21041
1585  0003 81            	ret	
1619                     ; 461 uint16_t UART1_ReceiveData9(void)
1619                     ; 462 {
1620                     .text:	section	.text,new
1621  0000               _UART1_ReceiveData9:
1623  0000 89            	pushw	x
1624       00000002      OFST:	set	2
1627                     ; 463   uint16_t temp = 0;
1629                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1631  0001 c65234        	ld	a,21044
1632  0004 a480          	and	a,#128
1633  0006 5f            	clrw	x
1634  0007 02            	rlwa	x,a
1635  0008 58            	sllw	x
1636  0009 1f01          	ldw	(OFST-1,sp),x
1638                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1640  000b c65231        	ld	a,21041
1641  000e 5f            	clrw	x
1642  000f 97            	ld	xl,a
1643  0010 01            	rrwa	x,a
1644  0011 1a02          	or	a,(OFST+0,sp)
1645  0013 01            	rrwa	x,a
1646  0014 1a01          	or	a,(OFST-1,sp)
1647  0016 a401          	and	a,#1
1648  0018 01            	rrwa	x,a
1651  0019 5b02          	addw	sp,#2
1652  001b 81            	ret	
1686                     ; 474 void UART1_SendData8(uint8_t Data)
1686                     ; 475 {
1687                     .text:	section	.text,new
1688  0000               _UART1_SendData8:
1692                     ; 477   UART1->DR = Data;
1694  0000 c75231        	ld	21041,a
1695                     ; 478 }
1698  0003 81            	ret	
1732                     ; 486 void UART1_SendData9(uint16_t Data)
1732                     ; 487 {
1733                     .text:	section	.text,new
1734  0000               _UART1_SendData9:
1736  0000 89            	pushw	x
1737       00000000      OFST:	set	0
1740                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1742  0001 721d5234      	bres	21044,#6
1743                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1745  0005 54            	srlw	x
1746  0006 54            	srlw	x
1747  0007 9f            	ld	a,xl
1748  0008 a440          	and	a,#64
1749  000a ca5234        	or	a,21044
1750  000d c75234        	ld	21044,a
1751                     ; 493   UART1->DR   = (uint8_t)(Data);
1753  0010 7b02          	ld	a,(OFST+2,sp)
1754  0012 c75231        	ld	21041,a
1755                     ; 494 }
1758  0015 85            	popw	x
1759  0016 81            	ret	
1782                     ; 501 void UART1_SendBreak(void)
1782                     ; 502 {
1783                     .text:	section	.text,new
1784  0000               _UART1_SendBreak:
1788                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1790  0000 72105235      	bset	21045,#0
1791                     ; 504 }
1794  0004 81            	ret	
1828                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1828                     ; 512 {
1829                     .text:	section	.text,new
1830  0000               _UART1_SetAddress:
1832  0000 88            	push	a
1833       00000000      OFST:	set	0
1836                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1838                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1840  0001 c65237        	ld	a,21047
1841  0004 a4f0          	and	a,#240
1842  0006 c75237        	ld	21047,a
1843                     ; 519   UART1->CR4 |= UART1_Address;
1845  0009 c65237        	ld	a,21047
1846  000c 1a01          	or	a,(OFST+1,sp)
1847  000e c75237        	ld	21047,a
1848                     ; 520 }
1851  0011 84            	pop	a
1852  0012 81            	ret	
1886                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1886                     ; 529 {
1887                     .text:	section	.text,new
1888  0000               _UART1_SetGuardTime:
1892                     ; 531   UART1->GTR = UART1_GuardTime;
1894  0000 c75239        	ld	21049,a
1895                     ; 532 }
1898  0003 81            	ret	
1932                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1932                     ; 557 {
1933                     .text:	section	.text,new
1934  0000               _UART1_SetPrescaler:
1938                     ; 559   UART1->PSCR = UART1_Prescaler;
1940  0000 c7523a        	ld	21050,a
1941                     ; 560 }
1944  0003 81            	ret	
2087                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2087                     ; 569 {
2088                     .text:	section	.text,new
2089  0000               _UART1_GetFlagStatus:
2091  0000 89            	pushw	x
2092  0001 88            	push	a
2093       00000001      OFST:	set	1
2096                     ; 570   FlagStatus status = RESET;
2098                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2100                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2102  0002 a30210        	cpw	x,#528
2103  0005 2608          	jrne	L7501
2104                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2106  0007 9f            	ld	a,xl
2107  0008 c45237        	and	a,21047
2108  000b 271c          	jreq	L5601
2109                     ; 582       status = SET;
2111  000d 2015          	jp	LC007
2112                     ; 587       status = RESET;
2113  000f               L7501:
2114                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2116  000f a30101        	cpw	x,#257
2117  0012 2609          	jrne	L7601
2118                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2120  0014 c65235        	ld	a,21045
2121  0017 1503          	bcp	a,(OFST+2,sp)
2122  0019 270d          	jreq	L7701
2123                     ; 595       status = SET;
2125  001b 2007          	jp	LC007
2126                     ; 600       status = RESET;
2127  001d               L7601:
2128                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2130  001d c65230        	ld	a,21040
2131  0020 1503          	bcp	a,(OFST+2,sp)
2132  0022 2704          	jreq	L7701
2133                     ; 608       status = SET;
2135  0024               LC007:
2138  0024 a601          	ld	a,#1
2142  0026 2001          	jra	L5601
2143  0028               L7701:
2144                     ; 613       status = RESET;
2147  0028 4f            	clr	a
2149  0029               L5601:
2150                     ; 617   return status;
2154  0029 5b03          	addw	sp,#3
2155  002b 81            	ret	
2190                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2190                     ; 647 {
2191                     .text:	section	.text,new
2192  0000               _UART1_ClearFlag:
2196                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2198                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2200  0000 a30020        	cpw	x,#32
2201  0003 2605          	jrne	L1211
2202                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2204  0005 35df5230      	mov	21040,#223
2207  0009 81            	ret	
2208  000a               L1211:
2209                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2211  000a 72195237      	bres	21047,#4
2212                     ; 660 }
2215  000e 81            	ret	
2297                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2297                     ; 676 {
2298                     .text:	section	.text,new
2299  0000               _UART1_GetITStatus:
2301  0000 89            	pushw	x
2302  0001 89            	pushw	x
2303       00000002      OFST:	set	2
2306                     ; 677   ITStatus pendingbitstatus = RESET;
2308                     ; 678   uint8_t itpos = 0;
2310                     ; 679   uint8_t itmask1 = 0;
2312                     ; 680   uint8_t itmask2 = 0;
2314                     ; 681   uint8_t enablestatus = 0;
2316                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2318                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2320  0002 9f            	ld	a,xl
2321  0003 a40f          	and	a,#15
2322  0005 5f            	clrw	x
2323  0006 97            	ld	xl,a
2324  0007 a601          	ld	a,#1
2325  0009 5d            	tnzw	x
2326  000a 2704          	jreq	L67
2327  000c               L001:
2328  000c 48            	sll	a
2329  000d 5a            	decw	x
2330  000e 26fc          	jrne	L001
2331  0010               L67:
2332  0010 6b01          	ld	(OFST-1,sp),a
2334                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2336  0012 7b04          	ld	a,(OFST+2,sp)
2337  0014 4e            	swap	a
2338  0015 a40f          	and	a,#15
2339  0017 6b02          	ld	(OFST+0,sp),a
2341                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2343  0019 5f            	clrw	x
2344  001a 97            	ld	xl,a
2345  001b a601          	ld	a,#1
2346  001d 5d            	tnzw	x
2347  001e 2704          	jreq	L201
2348  0020               L401:
2349  0020 48            	sll	a
2350  0021 5a            	decw	x
2351  0022 26fc          	jrne	L401
2352  0024               L201:
2353  0024 6b02          	ld	(OFST+0,sp),a
2355                     ; 695   if (UART1_IT == UART1_IT_PE)
2357  0026 1e03          	ldw	x,(OFST+1,sp)
2358  0028 a30100        	cpw	x,#256
2359  002b 260c          	jrne	L7611
2360                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2362  002d c65234        	ld	a,21044
2363  0030 1402          	and	a,(OFST+0,sp)
2364  0032 6b02          	ld	(OFST+0,sp),a
2366                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2368  0034 c65230        	ld	a,21040
2370                     ; 704       pendingbitstatus = SET;
2372  0037 200f          	jp	LC010
2373                     ; 709       pendingbitstatus = RESET;
2374  0039               L7611:
2375                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2377  0039 a30346        	cpw	x,#838
2378  003c 2616          	jrne	L7711
2379                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2381  003e c65237        	ld	a,21047
2382  0041 1402          	and	a,(OFST+0,sp)
2383  0043 6b02          	ld	(OFST+0,sp),a
2385                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2387  0045 c65237        	ld	a,21047
2389  0048               LC010:
2390  0048 1501          	bcp	a,(OFST-1,sp)
2391  004a 271a          	jreq	L7021
2392  004c 7b02          	ld	a,(OFST+0,sp)
2393  004e 2716          	jreq	L7021
2394                     ; 721       pendingbitstatus = SET;
2396  0050               LC009:
2399  0050 a601          	ld	a,#1
2402  0052 2013          	jra	L5711
2403                     ; 726       pendingbitstatus = RESET;
2404  0054               L7711:
2405                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2407  0054 c65235        	ld	a,21045
2408  0057 1402          	and	a,(OFST+0,sp)
2409  0059 6b02          	ld	(OFST+0,sp),a
2411                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2413  005b c65230        	ld	a,21040
2414  005e 1501          	bcp	a,(OFST-1,sp)
2415  0060 2704          	jreq	L7021
2417  0062 7b02          	ld	a,(OFST+0,sp)
2418                     ; 737       pendingbitstatus = SET;
2420  0064 26ea          	jrne	LC009
2421  0066               L7021:
2422                     ; 742       pendingbitstatus = RESET;
2426  0066 4f            	clr	a
2428  0067               L5711:
2429                     ; 747   return  pendingbitstatus;
2433  0067 5b04          	addw	sp,#4
2434  0069 81            	ret	
2470                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2470                     ; 776 {
2471                     .text:	section	.text,new
2472  0000               _UART1_ClearITPendingBit:
2476                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2478                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2480  0000 a30255        	cpw	x,#597
2481  0003 2605          	jrne	L1321
2482                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2484  0005 35df5230      	mov	21040,#223
2487  0009 81            	ret	
2488  000a               L1321:
2489                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2491  000a 72195237      	bres	21047,#4
2492                     ; 789 }
2495  000e 81            	ret	
2522                     ; 791 void UART1_setup(void)
2522                     ; 792 {
2523                     .text:	section	.text,new
2524  0000               _UART1_setup:
2528                     ; 793   UART1_DeInit();
2530  0000 cd0000        	call	_UART1_DeInit
2532                     ; 794   UART1_Init(BAUD_RATE,
2532                     ; 795   UART1_WORDLENGTH_8D,
2532                     ; 796   UART1_STOPBITS_1,
2532                     ; 797   UART1_PARITY_NO,
2532                     ; 798   UART1_SYNCMODE_CLOCK_DISABLE,
2532                     ; 799   UART1_MODE_TXRX_ENABLE);
2534  0003 4b0c          	push	#12
2535  0005 4b80          	push	#128
2536  0007 4b00          	push	#0
2537  0009 4b00          	push	#0
2538  000b 4b00          	push	#0
2539  000d ae4b00        	ldw	x,#19200
2540  0010 89            	pushw	x
2541  0011 5f            	clrw	x
2542  0012 89            	pushw	x
2543  0013 cd0000        	call	_UART1_Init
2545  0016 5b09          	addw	sp,#9
2546                     ; 800   UART1_ITConfig(UART1_IT_RXNE, ENABLE);
2548  0018 4b01          	push	#1
2549  001a ae0255        	ldw	x,#597
2550  001d cd0000        	call	_UART1_ITConfig
2552  0020 84            	pop	a
2553                     ; 802   UART1_Cmd(ENABLE);
2555  0021 a601          	ld	a,#1
2557                     ; 803 }
2560  0023 cc0000        	jp	_UART1_Cmd
2573                     	xdef	_UART1_setup
2574                     	xdef	_UART1_ClearITPendingBit
2575                     	xdef	_UART1_GetITStatus
2576                     	xdef	_UART1_ClearFlag
2577                     	xdef	_UART1_GetFlagStatus
2578                     	xdef	_UART1_SetPrescaler
2579                     	xdef	_UART1_SetGuardTime
2580                     	xdef	_UART1_SetAddress
2581                     	xdef	_UART1_SendBreak
2582                     	xdef	_UART1_SendData9
2583                     	xdef	_UART1_SendData8
2584                     	xdef	_UART1_ReceiveData9
2585                     	xdef	_UART1_ReceiveData8
2586                     	xdef	_UART1_ReceiverWakeUpCmd
2587                     	xdef	_UART1_WakeUpConfig
2588                     	xdef	_UART1_SmartCardNACKCmd
2589                     	xdef	_UART1_SmartCardCmd
2590                     	xdef	_UART1_LINCmd
2591                     	xdef	_UART1_LINBreakDetectionConfig
2592                     	xdef	_UART1_IrDACmd
2593                     	xdef	_UART1_IrDAConfig
2594                     	xdef	_UART1_HalfDuplexCmd
2595                     	xdef	_UART1_ITConfig
2596                     	xdef	_UART1_Cmd
2597                     	xdef	_UART1_Init
2598                     	xdef	_UART1_DeInit
2599                     	xref	_CLK_GetClockFreq
2600                     	xref.b	c_lreg
2601                     	xref.b	c_x
2620                     	xref	c_lursh
2621                     	xref	c_lsub
2622                     	xref	c_smul
2623                     	xref	c_ludv
2624                     	xref	c_rtol
2625                     	xref	c_llsh
2626                     	xref	c_ltor
2627                     	end
