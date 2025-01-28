   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  48                     ; 67 void I2C_DeInit(void)
  48                     ; 68 {
  50                     .text:	section	.text,new
  51  0000               _I2C_DeInit:
  55                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  57  0000 725f5210      	clr	21008
  58                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  60  0004 725f5211      	clr	21009
  61                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  63  0008 725f5212      	clr	21010
  64                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  66  000c 725f5213      	clr	21011
  67                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  69  0010 725f5214      	clr	21012
  70                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  72  0014 725f521a      	clr	21018
  73                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  75  0018 725f521b      	clr	21019
  76                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  78  001c 725f521c      	clr	21020
  79                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  81  0020 3502521d      	mov	21021,#2
  82                     ; 78 }
  85  0024 81            	ret	
 264                     .const:	section	.text
 265  0000               L01:
 266  0000 000186a1      	dc.l	100001
 267  0004               L21:
 268  0004 000f4240      	dc.l	1000000
 269                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 269                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 269                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 269                     ; 99 {
 270                     .text:	section	.text,new
 271  0000               _I2C_Init:
 273  0000 5209          	subw	sp,#9
 274       00000009      OFST:	set	9
 277                     ; 100   uint16_t result = 0x0004;
 279                     ; 101   uint16_t tmpval = 0;
 281                     ; 102   uint8_t tmpccrh = 0;
 283  0002 0f07          	clr	(OFST-2,sp)
 285                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 287                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 289                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 291                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 293                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 295                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 297                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 299  0004 c65212        	ld	a,21010
 300  0007 a4c0          	and	a,#192
 301  0009 c75212        	ld	21010,a
 302                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 304  000c c65212        	ld	a,21010
 305  000f 1a15          	or	a,(OFST+12,sp)
 306  0011 c75212        	ld	21010,a
 307                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 309  0014 72115210      	bres	21008,#0
 310                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 312  0018 c6521c        	ld	a,21020
 313  001b a430          	and	a,#48
 314  001d c7521c        	ld	21020,a
 315                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 317  0020 725f521b      	clr	21019
 318                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 320  0024 96            	ldw	x,sp
 321  0025 1c000c        	addw	x,#OFST+3
 322  0028 cd0000        	call	c_ltor
 324  002b ae0000        	ldw	x,#L01
 325  002e cd0000        	call	c_lcmp
 327  0031 2560          	jrult	L131
 328                     ; 131     tmpccrh = I2C_CCRH_FS;
 330  0033 a680          	ld	a,#128
 331  0035 6b07          	ld	(OFST-2,sp),a
 333                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 335  0037 96            	ldw	x,sp
 336  0038 0d12          	tnz	(OFST+9,sp)
 337  003a 261d          	jrne	L331
 338                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 340  003c 1c000c        	addw	x,#OFST+3
 341  003f cd0000        	call	c_ltor
 343  0042 a603          	ld	a,#3
 344  0044 cd0000        	call	c_smul
 346  0047 96            	ldw	x,sp
 347  0048 5c            	incw	x
 348  0049 cd0000        	call	c_rtol
 351  004c 7b15          	ld	a,(OFST+12,sp)
 352  004e cd00f1        	call	LC001
 354  0051 96            	ldw	x,sp
 355  0052 cd00ff        	call	LC002
 356  0055 1f08          	ldw	(OFST-1,sp),x
 359  0057 2021          	jra	L531
 360  0059               L331:
 361                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 363  0059 1c000c        	addw	x,#OFST+3
 364  005c cd0000        	call	c_ltor
 366  005f a619          	ld	a,#25
 367  0061 cd0000        	call	c_smul
 369  0064 96            	ldw	x,sp
 370  0065 5c            	incw	x
 371  0066 cd0000        	call	c_rtol
 374  0069 7b15          	ld	a,(OFST+12,sp)
 375  006b cd00f1        	call	LC001
 377  006e 96            	ldw	x,sp
 378  006f cd00ff        	call	LC002
 379  0072 1f08          	ldw	(OFST-1,sp),x
 381                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 383  0074 7b07          	ld	a,(OFST-2,sp)
 384  0076 aa40          	or	a,#64
 385  0078 6b07          	ld	(OFST-2,sp),a
 387  007a               L531:
 388                     ; 147     if (result < (uint16_t)0x01)
 390  007a 1e08          	ldw	x,(OFST-1,sp)
 391  007c 2603          	jrne	L731
 392                     ; 150       result = (uint16_t)0x0001;
 394  007e 5c            	incw	x
 395  007f 1f08          	ldw	(OFST-1,sp),x
 397  0081               L731:
 398                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 400  0081 7b15          	ld	a,(OFST+12,sp)
 401  0083 97            	ld	xl,a
 402  0084 a603          	ld	a,#3
 403  0086 42            	mul	x,a
 404  0087 a60a          	ld	a,#10
 405  0089 cd0000        	call	c_sdivx
 407  008c 5c            	incw	x
 408  008d 1f05          	ldw	(OFST-4,sp),x
 410                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 412  008f 7b06          	ld	a,(OFST-3,sp)
 414  0091 2028          	jra	L141
 415  0093               L131:
 416                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 418  0093 96            	ldw	x,sp
 419  0094 1c000c        	addw	x,#OFST+3
 420  0097 cd0000        	call	c_ltor
 422  009a 3803          	sll	c_lreg+3
 423  009c 3902          	rlc	c_lreg+2
 424  009e 3901          	rlc	c_lreg+1
 425  00a0 96            	ldw	x,sp
 426  00a1 3900          	rlc	c_lreg
 427  00a3 5c            	incw	x
 428  00a4 cd0000        	call	c_rtol
 431  00a7 7b15          	ld	a,(OFST+12,sp)
 432  00a9 ad46          	call	LC001
 434  00ab 96            	ldw	x,sp
 435  00ac ad51          	call	LC002
 437                     ; 167     if (result < (uint16_t)0x0004)
 439  00ae a30004        	cpw	x,#4
 440  00b1 2403          	jruge	L341
 441                     ; 170       result = (uint16_t)0x0004;
 443  00b3 ae0004        	ldw	x,#4
 445  00b6               L341:
 446  00b6 1f08          	ldw	(OFST-1,sp),x
 447                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 449  00b8 7b15          	ld	a,(OFST+12,sp)
 450  00ba 4c            	inc	a
 451  00bb               L141:
 452  00bb c7521d        	ld	21021,a
 453                     ; 181   I2C->CCRL = (uint8_t)result;
 455  00be 7b09          	ld	a,(OFST+0,sp)
 456  00c0 c7521b        	ld	21019,a
 457                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 459  00c3 7b08          	ld	a,(OFST-1,sp)
 460  00c5 a40f          	and	a,#15
 461  00c7 1a07          	or	a,(OFST-2,sp)
 462  00c9 c7521c        	ld	21020,a
 463                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 465  00cc 72105210      	bset	21008,#0
 466                     ; 188   I2C_AcknowledgeConfig(Ack);
 468  00d0 7b13          	ld	a,(OFST+10,sp)
 469  00d2 cd0000        	call	_I2C_AcknowledgeConfig
 471                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 473  00d5 7b11          	ld	a,(OFST+8,sp)
 474  00d7 c75213        	ld	21011,a
 475                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 475                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 477  00da 1e10          	ldw	x,(OFST+7,sp)
 478  00dc 4f            	clr	a
 479  00dd 01            	rrwa	x,a
 480  00de 48            	sll	a
 481  00df 01            	rrwa	x,a
 482  00e0 49            	rlc	a
 483  00e1 a406          	and	a,#6
 484  00e3 6b04          	ld	(OFST-5,sp),a
 486  00e5 7b14          	ld	a,(OFST+11,sp)
 487  00e7 aa40          	or	a,#64
 488  00e9 1a04          	or	a,(OFST-5,sp)
 489  00eb c75214        	ld	21012,a
 490                     ; 194 }
 493  00ee 5b09          	addw	sp,#9
 494  00f0 81            	ret	
 495  00f1               LC001:
 496  00f1 b703          	ld	c_lreg+3,a
 497  00f3 3f02          	clr	c_lreg+2
 498  00f5 3f01          	clr	c_lreg+1
 499  00f7 3f00          	clr	c_lreg
 500  00f9 ae0004        	ldw	x,#L21
 501  00fc cc0000        	jp	c_lmul
 502  00ff               LC002:
 503  00ff 5c            	incw	x
 504  0100 cd0000        	call	c_ludv
 506  0103 be02          	ldw	x,c_lreg+2
 507  0105 81            	ret	
 562                     ; 202 void I2C_Cmd(FunctionalState NewState)
 562                     ; 203 {
 563                     .text:	section	.text,new
 564  0000               _I2C_Cmd:
 568                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 570                     ; 207   if (NewState != DISABLE)
 572  0000 4d            	tnz	a
 573  0001 2705          	jreq	L371
 574                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 576  0003 72105210      	bset	21008,#0
 579  0007 81            	ret	
 580  0008               L371:
 581                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 583  0008 72115210      	bres	21008,#0
 584                     ; 217 }
 587  000c 81            	ret	
 622                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 622                     ; 226 {
 623                     .text:	section	.text,new
 624  0000               _I2C_GeneralCallCmd:
 628                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 630                     ; 230   if (NewState != DISABLE)
 632  0000 4d            	tnz	a
 633  0001 2705          	jreq	L512
 634                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 636  0003 721c5210      	bset	21008,#6
 639  0007 81            	ret	
 640  0008               L512:
 641                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 643  0008 721d5210      	bres	21008,#6
 644                     ; 240 }
 647  000c 81            	ret	
 682                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 682                     ; 251 {
 683                     .text:	section	.text,new
 684  0000               _I2C_GenerateSTART:
 688                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 690                     ; 255   if (NewState != DISABLE)
 692  0000 4d            	tnz	a
 693  0001 2705          	jreq	L732
 694                     ; 258     I2C->CR2 |= I2C_CR2_START;
 696  0003 72105211      	bset	21009,#0
 699  0007 81            	ret	
 700  0008               L732:
 701                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 703  0008 72115211      	bres	21009,#0
 704                     ; 265 }
 707  000c 81            	ret	
 742                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 742                     ; 274 {
 743                     .text:	section	.text,new
 744  0000               _I2C_GenerateSTOP:
 748                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 750                     ; 278   if (NewState != DISABLE)
 752  0000 4d            	tnz	a
 753  0001 2705          	jreq	L162
 754                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 756  0003 72125211      	bset	21009,#1
 759  0007 81            	ret	
 760  0008               L162:
 761                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 763  0008 72135211      	bres	21009,#1
 764                     ; 288 }
 767  000c 81            	ret	
 803                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 803                     ; 297 {
 804                     .text:	section	.text,new
 805  0000               _I2C_SoftwareResetCmd:
 809                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 811                     ; 301   if (NewState != DISABLE)
 813  0000 4d            	tnz	a
 814  0001 2705          	jreq	L303
 815                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 817  0003 721e5211      	bset	21009,#7
 820  0007 81            	ret	
 821  0008               L303:
 822                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 824  0008 721f5211      	bres	21009,#7
 825                     ; 311 }
 828  000c 81            	ret	
 864                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 864                     ; 321 {
 865                     .text:	section	.text,new
 866  0000               _I2C_StretchClockCmd:
 870                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 872                     ; 325   if (NewState != DISABLE)
 874  0000 4d            	tnz	a
 875  0001 2705          	jreq	L523
 876                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 878  0003 721f5210      	bres	21008,#7
 881  0007 81            	ret	
 882  0008               L523:
 883                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 885  0008 721e5210      	bset	21008,#7
 886                     ; 336 }
 889  000c 81            	ret	
 925                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 925                     ; 346 {
 926                     .text:	section	.text,new
 927  0000               _I2C_AcknowledgeConfig:
 929       00000000      OFST:	set	0
 932                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 934                     ; 350   if (Ack == I2C_ACK_NONE)
 936  0000 4d            	tnz	a
 937  0001 2605          	jrne	L743
 938                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 940  0003 72155211      	bres	21009,#2
 943  0007 81            	ret	
 944  0008               L743:
 945                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 947  0008 72145211      	bset	21009,#2
 948                     ; 360     if (Ack == I2C_ACK_CURR)
 950  000c 4a            	dec	a
 951  000d 2605          	jrne	L353
 952                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 954  000f 72175211      	bres	21009,#3
 957  0013 81            	ret	
 958  0014               L353:
 959                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 961  0014 72165211      	bset	21009,#3
 962                     ; 371 }
 965  0018 81            	ret	
1037                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1037                     ; 382 {
1038                     .text:	section	.text,new
1039  0000               _I2C_ITConfig:
1041  0000 89            	pushw	x
1042       00000000      OFST:	set	0
1045                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1047                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1049                     ; 387   if (NewState != DISABLE)
1051  0001 9f            	ld	a,xl
1052  0002 4d            	tnz	a
1053  0003 2706          	jreq	L314
1054                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1056  0005 9e            	ld	a,xh
1057  0006 ca521a        	or	a,21018
1059  0009 2006          	jra	L514
1060  000b               L314:
1061                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1063  000b 7b01          	ld	a,(OFST+1,sp)
1064  000d 43            	cpl	a
1065  000e c4521a        	and	a,21018
1066  0011               L514:
1067  0011 c7521a        	ld	21018,a
1068                     ; 397 }
1071  0014 85            	popw	x
1072  0015 81            	ret	
1108                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1108                     ; 406 {
1109                     .text:	section	.text,new
1110  0000               _I2C_FastModeDutyCycleConfig:
1114                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1116                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1118  0000 a140          	cp	a,#64
1119  0002 2605          	jrne	L534
1120                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1122  0004 721c521c      	bset	21020,#6
1125  0008 81            	ret	
1126  0009               L534:
1127                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1129  0009 721d521c      	bres	21020,#6
1130                     ; 420 }
1133  000d 81            	ret	
1156                     ; 427 uint8_t I2C_ReceiveData(void)
1156                     ; 428 {
1157                     .text:	section	.text,new
1158  0000               _I2C_ReceiveData:
1162                     ; 430   return ((uint8_t)I2C->DR);
1164  0000 c65216        	ld	a,21014
1167  0003 81            	ret	
1232                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1232                     ; 441 {
1233                     .text:	section	.text,new
1234  0000               _I2C_Send7bitAddress:
1236  0000 89            	pushw	x
1237       00000000      OFST:	set	0
1240                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1242                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1244                     ; 447   Address &= (uint8_t)0xFE;
1246  0001 7b01          	ld	a,(OFST+1,sp)
1247  0003 a4fe          	and	a,#254
1248  0005 6b01          	ld	(OFST+1,sp),a
1249                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1251  0007 1a02          	or	a,(OFST+2,sp)
1252  0009 c75216        	ld	21014,a
1253                     ; 451 }
1256  000c 85            	popw	x
1257  000d 81            	ret	
1291                     ; 458 void I2C_SendData(uint8_t Data)
1291                     ; 459 {
1292                     .text:	section	.text,new
1293  0000               _I2C_SendData:
1297                     ; 461   I2C->DR = Data;
1299  0000 c75216        	ld	21014,a
1300                     ; 462 }
1303  0003 81            	ret	
1527                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1527                     ; 579 {
1528                     .text:	section	.text,new
1529  0000               _I2C_CheckEvent:
1531  0000 89            	pushw	x
1532  0001 5206          	subw	sp,#6
1533       00000006      OFST:	set	6
1536                     ; 580   __IO uint16_t lastevent = 0x00;
1538  0003 5f            	clrw	x
1539  0004 1f04          	ldw	(OFST-2,sp),x
1541                     ; 581   uint8_t flag1 = 0x00 ;
1543                     ; 582   uint8_t flag2 = 0x00;
1545                     ; 583   ErrorStatus status = ERROR;
1547                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1549                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1551  0006 1e07          	ldw	x,(OFST+1,sp)
1552  0008 a30004        	cpw	x,#4
1553  000b 2609          	jrne	L136
1554                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1556  000d c65218        	ld	a,21016
1557  0010 a404          	and	a,#4
1558  0012 5f            	clrw	x
1559  0013 97            	ld	xl,a
1561  0014 201a          	jra	L336
1562  0016               L136:
1563                     ; 594     flag1 = I2C->SR1;
1565  0016 c65217        	ld	a,21015
1566  0019 6b03          	ld	(OFST-3,sp),a
1568                     ; 595     flag2 = I2C->SR3;
1570  001b c65219        	ld	a,21017
1571  001e 6b06          	ld	(OFST+0,sp),a
1573                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1575  0020 5f            	clrw	x
1576  0021 7b03          	ld	a,(OFST-3,sp)
1577  0023 97            	ld	xl,a
1578  0024 1f01          	ldw	(OFST-5,sp),x
1580  0026 5f            	clrw	x
1581  0027 7b06          	ld	a,(OFST+0,sp)
1582  0029 97            	ld	xl,a
1583  002a 7b02          	ld	a,(OFST-4,sp)
1584  002c 01            	rrwa	x,a
1585  002d 1a01          	or	a,(OFST-5,sp)
1586  002f 01            	rrwa	x,a
1587  0030               L336:
1588  0030 1f04          	ldw	(OFST-2,sp),x
1590                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1592  0032 1e04          	ldw	x,(OFST-2,sp)
1593  0034 01            	rrwa	x,a
1594  0035 1408          	and	a,(OFST+2,sp)
1595  0037 01            	rrwa	x,a
1596  0038 1407          	and	a,(OFST+1,sp)
1597  003a 01            	rrwa	x,a
1598  003b 1307          	cpw	x,(OFST+1,sp)
1599  003d 2604          	jrne	L536
1600                     ; 602     status = SUCCESS;
1602  003f a601          	ld	a,#1
1605  0041 2001          	jra	L736
1606  0043               L536:
1607                     ; 607     status = ERROR;
1609  0043 4f            	clr	a
1611  0044               L736:
1612                     ; 611   return status;
1616  0044 5b08          	addw	sp,#8
1617  0046 81            	ret	
1670                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1670                     ; 629 {
1671                     .text:	section	.text,new
1672  0000               _I2C_GetLastEvent:
1674  0000 5206          	subw	sp,#6
1675       00000006      OFST:	set	6
1678                     ; 630   __IO uint16_t lastevent = 0;
1680  0002 5f            	clrw	x
1681  0003 1f05          	ldw	(OFST-1,sp),x
1683                     ; 631   uint16_t flag1 = 0;
1685                     ; 632   uint16_t flag2 = 0;
1687                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1689  0005 7205521805    	btjf	21016,#2,L766
1690                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1692  000a ae0004        	ldw	x,#4
1694  000d 2013          	jra	L176
1695  000f               L766:
1696                     ; 641     flag1 = I2C->SR1;
1698  000f c65217        	ld	a,21015
1699  0012 97            	ld	xl,a
1700  0013 1f01          	ldw	(OFST-5,sp),x
1702                     ; 642     flag2 = I2C->SR3;
1704  0015 c65219        	ld	a,21017
1705  0018 5f            	clrw	x
1706  0019 97            	ld	xl,a
1707  001a 1f03          	ldw	(OFST-3,sp),x
1709                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1711  001c 7b02          	ld	a,(OFST-4,sp)
1712  001e 01            	rrwa	x,a
1713  001f 1a01          	or	a,(OFST-5,sp)
1714  0021 01            	rrwa	x,a
1715  0022               L176:
1716  0022 1f05          	ldw	(OFST-1,sp),x
1718                     ; 648   return (I2C_Event_TypeDef)lastevent;
1720  0024 1e05          	ldw	x,(OFST-1,sp)
1723  0026 5b06          	addw	sp,#6
1724  0028 81            	ret	
1939                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1939                     ; 680 {
1940                     .text:	section	.text,new
1941  0000               _I2C_GetFlagStatus:
1943  0000 89            	pushw	x
1944  0001 89            	pushw	x
1945       00000002      OFST:	set	2
1948                     ; 681   uint8_t tempreg = 0;
1950  0002 0f02          	clr	(OFST+0,sp)
1952                     ; 682   uint8_t regindex = 0;
1954                     ; 683   FlagStatus bitstatus = RESET;
1956                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1958                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1960  0004 9e            	ld	a,xh
1961  0005 6b01          	ld	(OFST-1,sp),a
1963                     ; 691   switch (regindex)
1966                     ; 708     default:
1966                     ; 709       break;
1967  0007 4a            	dec	a
1968  0008 2708          	jreq	L376
1969  000a 4a            	dec	a
1970  000b 270a          	jreq	L576
1971  000d 4a            	dec	a
1972  000e 270c          	jreq	L776
1973  0010 200f          	jra	L3101
1974  0012               L376:
1975                     ; 694     case 0x01:
1975                     ; 695       tempreg = (uint8_t)I2C->SR1;
1977  0012 c65217        	ld	a,21015
1978                     ; 696       break;
1980  0015 2008          	jp	LC003
1981  0017               L576:
1982                     ; 699     case 0x02:
1982                     ; 700       tempreg = (uint8_t)I2C->SR2;
1984  0017 c65218        	ld	a,21016
1985                     ; 701       break;
1987  001a 2003          	jp	LC003
1988  001c               L776:
1989                     ; 704     case 0x03:
1989                     ; 705       tempreg = (uint8_t)I2C->SR3;
1991  001c c65219        	ld	a,21017
1992  001f               LC003:
1993  001f 6b02          	ld	(OFST+0,sp),a
1995                     ; 706       break;
1997                     ; 708     default:
1997                     ; 709       break;
1999  0021               L3101:
2000                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2002  0021 7b04          	ld	a,(OFST+2,sp)
2003  0023 1502          	bcp	a,(OFST+0,sp)
2004  0025 2704          	jreq	L5101
2005                     ; 716     bitstatus = SET;
2007  0027 a601          	ld	a,#1
2010  0029 2001          	jra	L7101
2011  002b               L5101:
2012                     ; 721     bitstatus = RESET;
2014  002b 4f            	clr	a
2016  002c               L7101:
2017                     ; 724   return bitstatus;
2021  002c 5b04          	addw	sp,#4
2022  002e 81            	ret	
2066                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2066                     ; 760 {
2067                     .text:	section	.text,new
2068  0000               _I2C_ClearFlag:
2070  0000 89            	pushw	x
2071       00000002      OFST:	set	2
2074                     ; 761   uint16_t flagpos = 0;
2076                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2078                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2080  0001 01            	rrwa	x,a
2081  0002 5f            	clrw	x
2082  0003 02            	rlwa	x,a
2083  0004 1f01          	ldw	(OFST-1,sp),x
2085                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2087  0006 7b02          	ld	a,(OFST+0,sp)
2088  0008 43            	cpl	a
2089  0009 c75218        	ld	21016,a
2090                     ; 769 }
2093  000c 85            	popw	x
2094  000d 81            	ret	
2260                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2260                     ; 792 {
2261                     .text:	section	.text,new
2262  0000               _I2C_GetITStatus:
2264  0000 89            	pushw	x
2265  0001 5204          	subw	sp,#4
2266       00000004      OFST:	set	4
2269                     ; 793   ITStatus bitstatus = RESET;
2271                     ; 794   __IO uint8_t enablestatus = 0;
2273  0003 0f03          	clr	(OFST-1,sp)
2275                     ; 795   uint16_t tempregister = 0;
2277                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2279                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2281  0005 9e            	ld	a,xh
2282  0006 a407          	and	a,#7
2283  0008 5f            	clrw	x
2284  0009 97            	ld	xl,a
2285  000a 1f01          	ldw	(OFST-3,sp),x
2287                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2289  000c c6521a        	ld	a,21018
2290  000f 1402          	and	a,(OFST-2,sp)
2291  0011 6b03          	ld	(OFST-1,sp),a
2293                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2295  0013 7b05          	ld	a,(OFST+1,sp)
2296  0015 a430          	and	a,#48
2297  0017 97            	ld	xl,a
2298  0018 4f            	clr	a
2299  0019 02            	rlwa	x,a
2300  001a a30100        	cpw	x,#256
2301  001d 260d          	jrne	L1311
2302                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2304  001f c65217        	ld	a,21015
2305  0022 1506          	bcp	a,(OFST+2,sp)
2306  0024 2715          	jreq	L1411
2308  0026 0d03          	tnz	(OFST-1,sp)
2309  0028 2711          	jreq	L1411
2310                     ; 811       bitstatus = SET;
2312  002a 200b          	jp	LC005
2313                     ; 816       bitstatus = RESET;
2314  002c               L1311:
2315                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2317  002c c65218        	ld	a,21016
2318  002f 1506          	bcp	a,(OFST+2,sp)
2319  0031 2708          	jreq	L1411
2321  0033 0d03          	tnz	(OFST-1,sp)
2322  0035 2704          	jreq	L1411
2323                     ; 825       bitstatus = SET;
2325  0037               LC005:
2327  0037 a601          	ld	a,#1
2330  0039 2001          	jra	L7311
2331  003b               L1411:
2332                     ; 830       bitstatus = RESET;
2335  003b 4f            	clr	a
2337  003c               L7311:
2338                     ; 834   return  bitstatus;
2342  003c 5b06          	addw	sp,#6
2343  003e 81            	ret	
2388                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2388                     ; 872 {
2389                     .text:	section	.text,new
2390  0000               _I2C_ClearITPendingBit:
2392  0000 89            	pushw	x
2393       00000002      OFST:	set	2
2396                     ; 873   uint16_t flagpos = 0;
2398                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2400                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2402  0001 01            	rrwa	x,a
2403  0002 5f            	clrw	x
2404  0003 02            	rlwa	x,a
2405  0004 1f01          	ldw	(OFST-1,sp),x
2407                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2409  0006 7b02          	ld	a,(OFST+0,sp)
2410  0008 43            	cpl	a
2411  0009 c75218        	ld	21016,a
2412                     ; 883 }
2415  000c 85            	popw	x
2416  000d 81            	ret	
2444                     ; 892 void I2C_setup(void)
2444                     ; 893 {
2445                     .text:	section	.text,new
2446  0000               _I2C_setup:
2450                     ; 895 I2C_DeInit();
2452  0000 cd0000        	call	_I2C_DeInit
2454                     ; 896 I2C_Init(100000,
2454                     ; 897 ADDR_VISUAL,
2454                     ; 898 I2C_DUTYCYCLE_2,
2454                     ; 899 I2C_ACK_CURR,
2454                     ; 900 I2C_ADDMODE_7BIT,
2454                     ; 901 (CLK_GetClockFreq() / 1000000));
2456  0003 cd0000        	call	_CLK_GetClockFreq
2458  0006 ae0004        	ldw	x,#L21
2459  0009 cd0000        	call	c_ludv
2461  000c b603          	ld	a,c_lreg+3
2462  000e 88            	push	a
2463  000f 4b00          	push	#0
2464  0011 4b01          	push	#1
2465  0013 4b00          	push	#0
2466  0015 ae0040        	ldw	x,#64
2467  0018 89            	pushw	x
2468  0019 ae86a0        	ldw	x,#34464
2469  001c 89            	pushw	x
2470  001d ae0001        	ldw	x,#1
2471  0020 89            	pushw	x
2472  0021 cd0000        	call	_I2C_Init
2474  0024 5b0a          	addw	sp,#10
2475                     ; 903 I2C_ITConfig((I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
2477  0026 ae0701        	ldw	x,#1793
2478  0029 cd0000        	call	_I2C_ITConfig
2480                     ; 905 I2C_Cmd(ENABLE);
2482  002c a601          	ld	a,#1
2484                     ; 906 }
2487  002e cc0000        	jp	_I2C_Cmd
2500                     	xdef	_I2C_ClearITPendingBit
2501                     	xdef	_I2C_GetITStatus
2502                     	xdef	_I2C_ClearFlag
2503                     	xdef	_I2C_GetFlagStatus
2504                     	xdef	_I2C_GetLastEvent
2505                     	xdef	_I2C_CheckEvent
2506                     	xdef	_I2C_SendData
2507                     	xdef	_I2C_Send7bitAddress
2508                     	xdef	_I2C_ReceiveData
2509                     	xdef	_I2C_ITConfig
2510                     	xdef	_I2C_FastModeDutyCycleConfig
2511                     	xdef	_I2C_AcknowledgeConfig
2512                     	xdef	_I2C_StretchClockCmd
2513                     	xdef	_I2C_SoftwareResetCmd
2514                     	xdef	_I2C_GenerateSTOP
2515                     	xdef	_I2C_GenerateSTART
2516                     	xdef	_I2C_GeneralCallCmd
2517                     	xdef	_I2C_Cmd
2518                     	xdef	_I2C_Init
2519                     	xdef	_I2C_setup
2520                     	xdef	_I2C_DeInit
2521                     	xref	_CLK_GetClockFreq
2522                     	xref.b	c_lreg
2523                     	xref.b	c_x
2542                     	xref	c_sdivx
2543                     	xref	c_ludv
2544                     	xref	c_rtol
2545                     	xref	c_smul
2546                     	xref	c_lmul
2547                     	xref	c_lcmp
2548                     	xref	c_ltor
2549                     	end
