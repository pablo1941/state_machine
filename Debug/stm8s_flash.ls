   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  80                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  80                     ; 88 {
  82                     .text:	section	.text,new
  83  0000               _FLASH_Unlock:
  87                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  89                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  91  0000 a1fd          	cp	a,#253
  92  0002 2609          	jrne	L73
  93                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  95  0004 35565062      	mov	20578,#86
  96                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  98  0008 35ae5062      	mov	20578,#174
 101  000c 81            	ret	
 102  000d               L73:
 103                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 105  000d 35ae5064      	mov	20580,#174
 106                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 108  0011 35565064      	mov	20580,#86
 109                     ; 104 }
 112  0015 81            	ret	
 147                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 147                     ; 113 {
 148                     .text:	section	.text,new
 149  0000               _FLASH_Lock:
 153                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 155                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 157  0000 c4505f        	and	a,20575
 158  0003 c7505f        	ld	20575,a
 159                     ; 119 }
 162  0006 81            	ret	
 185                     ; 126 void FLASH_DeInit(void)
 185                     ; 127 {
 186                     .text:	section	.text,new
 187  0000               _FLASH_DeInit:
 191                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 193  0000 725f505a      	clr	20570
 194                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 196  0004 725f505b      	clr	20571
 197                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 199  0008 35ff505c      	mov	20572,#255
 200                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 202  000c 7217505f      	bres	20575,#3
 203                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 205  0010 7213505f      	bres	20575,#1
 206                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 208  0014 c6505f        	ld	a,20575
 209                     ; 134 }
 212  0017 81            	ret	
 267                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 267                     ; 143 {
 268                     .text:	section	.text,new
 269  0000               _FLASH_ITConfig:
 273                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 275                     ; 147   if(NewState != DISABLE)
 277  0000 4d            	tnz	a
 278  0001 2705          	jreq	L711
 279                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 281  0003 7212505a      	bset	20570,#1
 284  0007 81            	ret	
 285  0008               L711:
 286                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 288  0008 7213505a      	bres	20570,#1
 289                     ; 155 }
 292  000c 81            	ret	
 326                     ; 164 void FLASH_EraseByte(uint32_t Address)
 326                     ; 165 {
 327                     .text:	section	.text,new
 328  0000               _FLASH_EraseByte:
 330       00000000      OFST:	set	0
 333                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 335                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 337  0000 1e05          	ldw	x,(OFST+5,sp)
 338  0002 7f            	clr	(x)
 339                     ; 171 }
 342  0003 81            	ret	
 385                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 385                     ; 182 {
 386                     .text:	section	.text,new
 387  0000               _FLASH_ProgramByte:
 389       00000000      OFST:	set	0
 392                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 394                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 396  0000 1e05          	ldw	x,(OFST+5,sp)
 397  0002 7b07          	ld	a,(OFST+7,sp)
 398  0004 f7            	ld	(x),a
 399                     ; 186 }
 402  0005 81            	ret	
 436                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 436                     ; 196 {
 437                     .text:	section	.text,new
 438  0000               _FLASH_ReadByte:
 440       00000000      OFST:	set	0
 443                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 445                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 447  0000 1e05          	ldw	x,(OFST+5,sp)
 448  0002 f6            	ld	a,(x)
 451  0003 81            	ret	
 494                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 494                     ; 213 {
 495                     .text:	section	.text,new
 496  0000               _FLASH_ProgramWord:
 498       00000000      OFST:	set	0
 501                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 503                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 505  0000 721c505b      	bset	20571,#6
 506                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 508  0004 721d505c      	bres	20572,#6
 509                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 511  0008 1e05          	ldw	x,(OFST+5,sp)
 512  000a 7b07          	ld	a,(OFST+7,sp)
 513  000c f7            	ld	(x),a
 514                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 516  000d 7b08          	ld	a,(OFST+8,sp)
 517  000f e701          	ld	(1,x),a
 518                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 520  0011 7b09          	ld	a,(OFST+9,sp)
 521  0013 e702          	ld	(2,x),a
 522                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 524  0015 7b0a          	ld	a,(OFST+10,sp)
 525  0017 e703          	ld	(3,x),a
 526                     ; 229 }
 529  0019 81            	ret	
 574                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 574                     ; 238 {
 575                     .text:	section	.text,new
 576  0000               _FLASH_ProgramOptionByte:
 578  0000 89            	pushw	x
 579       00000000      OFST:	set	0
 582                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 584                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 586  0001 721e505b      	bset	20571,#7
 587                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 589  0005 721f505c      	bres	20572,#7
 590                     ; 247   if(Address == 0x4800)
 592  0009 a34800        	cpw	x,#18432
 593  000c 2605          	jrne	L542
 594                     ; 250     *((NEAR uint8_t*)Address) = Data;
 596  000e 7b05          	ld	a,(OFST+5,sp)
 597  0010 f7            	ld	(x),a
 599  0011 2006          	jra	L742
 600  0013               L542:
 601                     ; 255     *((NEAR uint8_t*)Address) = Data;
 603  0013 7b05          	ld	a,(OFST+5,sp)
 604  0015 f7            	ld	(x),a
 605                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 607  0016 43            	cpl	a
 608  0017 e701          	ld	(1,x),a
 609  0019               L742:
 610                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 612  0019 a6fd          	ld	a,#253
 613  001b cd0000        	call	_FLASH_WaitForLastOperation
 615                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 617  001e 721f505b      	bres	20571,#7
 618                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 620  0022 721e505c      	bset	20572,#7
 621                     ; 263 }
 624  0026 85            	popw	x
 625  0027 81            	ret	
 661                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 661                     ; 271 {
 662                     .text:	section	.text,new
 663  0000               _FLASH_EraseOptionByte:
 665  0000 89            	pushw	x
 666       00000000      OFST:	set	0
 669                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 671                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 673  0001 721e505b      	bset	20571,#7
 674                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 676  0005 721f505c      	bres	20572,#7
 677                     ; 280   if(Address == 0x4800)
 679  0009 a34800        	cpw	x,#18432
 680  000c 2603          	jrne	L762
 681                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 683  000e 7f            	clr	(x)
 685  000f 2005          	jra	L172
 686  0011               L762:
 687                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 689  0011 7f            	clr	(x)
 690                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 692  0012 a6ff          	ld	a,#255
 693  0014 e701          	ld	(1,x),a
 694  0016               L172:
 695                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 697  0016 a6fd          	ld	a,#253
 698  0018 cd0000        	call	_FLASH_WaitForLastOperation
 700                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 702  001b 721f505b      	bres	20571,#7
 703                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 705  001f 721e505c      	bset	20572,#7
 706                     ; 296 }
 709  0023 85            	popw	x
 710  0024 81            	ret	
 773                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 773                     ; 304 {
 774                     .text:	section	.text,new
 775  0000               _FLASH_ReadOptionByte:
 777  0000 5204          	subw	sp,#4
 778       00000004      OFST:	set	4
 781                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 783                     ; 306   uint16_t res_value = 0;
 785                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 787                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 789  0002 f6            	ld	a,(x)
 790  0003 6b01          	ld	(OFST-3,sp),a
 792                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 794  0005 e601          	ld	a,(1,x)
 795  0007 6b02          	ld	(OFST-2,sp),a
 797                     ; 315   if(Address == 0x4800)	 
 799  0009 a34800        	cpw	x,#18432
 800  000c 2606          	jrne	L523
 801                     ; 317     res_value =	 value_optbyte;
 803  000e 7b01          	ld	a,(OFST-3,sp)
 804  0010 5f            	clrw	x
 805  0011 97            	ld	xl,a
 808  0012 201c          	jra	L723
 809  0014               L523:
 810                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 812  0014 43            	cpl	a
 813  0015 1101          	cp	a,(OFST-3,sp)
 814  0017 2614          	jrne	L133
 815                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 817  0019 7b01          	ld	a,(OFST-3,sp)
 818  001b 97            	ld	xl,a
 819  001c 4f            	clr	a
 820  001d 02            	rlwa	x,a
 821  001e 1f03          	ldw	(OFST-1,sp),x
 823                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 825  0020 5f            	clrw	x
 826  0021 7b02          	ld	a,(OFST-2,sp)
 827  0023 97            	ld	xl,a
 828  0024 01            	rrwa	x,a
 829  0025 1a04          	or	a,(OFST+0,sp)
 830  0027 01            	rrwa	x,a
 831  0028 1a03          	or	a,(OFST-1,sp)
 832  002a 01            	rrwa	x,a
 835  002b 2003          	jra	L723
 836  002d               L133:
 837                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 839  002d ae5555        	ldw	x,#21845
 841  0030               L723:
 842                     ; 331   return(res_value);
 846  0030 5b04          	addw	sp,#4
 847  0032 81            	ret	
 921                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 921                     ; 341 {
 922                     .text:	section	.text,new
 923  0000               _FLASH_SetLowPowerMode:
 925  0000 88            	push	a
 926       00000000      OFST:	set	0
 929                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 931                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 933  0001 c6505a        	ld	a,20570
 934  0004 a4f3          	and	a,#243
 935  0006 c7505a        	ld	20570,a
 936                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 938  0009 c6505a        	ld	a,20570
 939  000c 1a01          	or	a,(OFST+1,sp)
 940  000e c7505a        	ld	20570,a
 941                     ; 350 }
 944  0011 84            	pop	a
 945  0012 81            	ret	
1003                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1003                     ; 359 {
1004                     .text:	section	.text,new
1005  0000               _FLASH_SetProgrammingTime:
1009                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1011                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1013  0000 7211505a      	bres	20570,#0
1014                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1016  0004 ca505a        	or	a,20570
1017  0007 c7505a        	ld	20570,a
1018                     ; 365 }
1021  000a 81            	ret	
1046                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1046                     ; 373 {
1047                     .text:	section	.text,new
1048  0000               _FLASH_GetLowPowerMode:
1052                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1054  0000 c6505a        	ld	a,20570
1055  0003 a40c          	and	a,#12
1058  0005 81            	ret	
1083                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1083                     ; 383 {
1084                     .text:	section	.text,new
1085  0000               _FLASH_GetProgrammingTime:
1089                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1091  0000 c6505a        	ld	a,20570
1092  0003 a401          	and	a,#1
1095  0005 81            	ret	
1129                     ; 392 uint32_t FLASH_GetBootSize(void)
1129                     ; 393 {
1130                     .text:	section	.text,new
1131  0000               _FLASH_GetBootSize:
1133  0000 5204          	subw	sp,#4
1134       00000004      OFST:	set	4
1137                     ; 394   uint32_t temp = 0;
1139                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1141  0002 c6505d        	ld	a,20573
1142  0005 5f            	clrw	x
1143  0006 97            	ld	xl,a
1144  0007 90ae0200      	ldw	y,#512
1145  000b cd0000        	call	c_umul
1147  000e 96            	ldw	x,sp
1148  000f 5c            	incw	x
1149  0010 cd0000        	call	c_rtol
1152                     ; 400   if(FLASH->FPR == 0xFF)
1154  0013 c6505d        	ld	a,20573
1155  0016 4c            	inc	a
1156  0017 260d          	jrne	L354
1157                     ; 402     temp += 512;
1159  0019 ae0200        	ldw	x,#512
1160  001c bf02          	ldw	c_lreg+2,x
1161  001e 5f            	clrw	x
1162  001f bf00          	ldw	c_lreg,x
1163  0021 96            	ldw	x,sp
1164  0022 5c            	incw	x
1165  0023 cd0000        	call	c_lgadd
1168  0026               L354:
1169                     ; 406   return(temp);
1171  0026 96            	ldw	x,sp
1172  0027 5c            	incw	x
1173  0028 cd0000        	call	c_ltor
1177  002b 5b04          	addw	sp,#4
1178  002d 81            	ret	
1280                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1280                     ; 418 {
1281                     .text:	section	.text,new
1282  0000               _FLASH_GetFlagStatus:
1284       00000001      OFST:	set	1
1287                     ; 419   FlagStatus status = RESET;
1289                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1291                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1293  0000 c4505f        	and	a,20575
1294  0003 2702          	jreq	L325
1295                     ; 426     status = SET; /* FLASH_FLAG is set */
1297  0005 a601          	ld	a,#1
1300  0007               L325:
1301                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1304                     ; 434   return status;
1308  0007 81            	ret	
1393                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1393                     ; 550 {
1394                     .text:	section	.text,new
1395  0000               _FLASH_WaitForLastOperation:
1397  0000 5203          	subw	sp,#3
1398       00000003      OFST:	set	3
1401                     ; 551   uint8_t flagstatus = 0x00;
1403  0002 0f03          	clr	(OFST+0,sp)
1405                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1407  0004 aeffff        	ldw	x,#65535
1408                     ; 576   UNUSED(FLASH_MemType);
1411  0007 2008          	jra	L175
1412  0009               L765:
1413                     ; 579     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1415  0009 c6505f        	ld	a,20575
1416  000c a405          	and	a,#5
1417  000e 6b03          	ld	(OFST+0,sp),a
1419                     ; 580     timeout--;
1421  0010 5a            	decw	x
1422  0011               L175:
1423  0011 1f01          	ldw	(OFST-2,sp),x
1425                     ; 577   while((flagstatus == 0x00) && (timeout != 0x00))
1427  0013 7b03          	ld	a,(OFST+0,sp)
1428  0015 2604          	jrne	L575
1430  0017 1e01          	ldw	x,(OFST-2,sp)
1431  0019 26ee          	jrne	L765
1432  001b               L575:
1433                     ; 584   if(timeout == 0x00 )
1435  001b 1e01          	ldw	x,(OFST-2,sp)
1436  001d 2602          	jrne	L775
1437                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
1439  001f a602          	ld	a,#2
1441  0021               L775:
1442                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
1446  0021 5b03          	addw	sp,#3
1447  0023 81            	ret	
1510                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1510                     ; 600 {
1511                     .text:	section	.text,new
1512  0000               _FLASH_EraseBlock:
1514  0000 89            	pushw	x
1515  0001 5206          	subw	sp,#6
1516       00000006      OFST:	set	6
1519                     ; 601   uint32_t startaddress = 0;
1521                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1523                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1525  0003 7b0b          	ld	a,(OFST+5,sp)
1526  0005 a1fd          	cp	a,#253
1527  0007 2605          	jrne	L336
1528                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1530                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1532  0009 ae8000        	ldw	x,#32768
1534  000c 2003          	jra	L536
1535  000e               L336:
1536                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1538                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1540  000e ae4000        	ldw	x,#16384
1541  0011               L536:
1542  0011 1f05          	ldw	(OFST-1,sp),x
1543  0013 5f            	clrw	x
1544  0014 1f03          	ldw	(OFST-3,sp),x
1546                     ; 628     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1548  0016 a640          	ld	a,#64
1549  0018 1e07          	ldw	x,(OFST+1,sp)
1550  001a cd0000        	call	c_cmulx
1552  001d 96            	ldw	x,sp
1553  001e 1c0003        	addw	x,#OFST-3
1554  0021 cd0000        	call	c_ladd
1556  0024 be02          	ldw	x,c_lreg+2
1557  0026 1f01          	ldw	(OFST-5,sp),x
1559                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
1561  0028 721a505b      	bset	20571,#5
1562                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1564  002c 721b505c      	bres	20572,#5
1565                     ; 637     *pwFlash = (uint32_t)0;
1567  0030 4f            	clr	a
1568  0031 e703          	ld	(3,x),a
1569  0033 e702          	ld	(2,x),a
1570  0035 e701          	ld	(1,x),a
1571  0037 f7            	ld	(x),a
1572                     ; 645 }
1575  0038 5b08          	addw	sp,#8
1576  003a 81            	ret	
1680                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1680                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1680                     ; 658 {
1681                     .text:	section	.text,new
1682  0000               _FLASH_ProgramBlock:
1684  0000 89            	pushw	x
1685  0001 5206          	subw	sp,#6
1686       00000006      OFST:	set	6
1689                     ; 659   uint16_t Count = 0;
1691                     ; 660   uint32_t startaddress = 0;
1693                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1695                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1697                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1699  0003 7b0b          	ld	a,(OFST+5,sp)
1700  0005 a1fd          	cp	a,#253
1701  0007 2605          	jrne	L117
1702                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1704                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1706  0009 ae8000        	ldw	x,#32768
1708  000c 2003          	jra	L317
1709  000e               L117:
1710                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1712                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1714  000e ae4000        	ldw	x,#16384
1715  0011               L317:
1716  0011 1f03          	ldw	(OFST-3,sp),x
1717  0013 5f            	clrw	x
1718  0014 1f01          	ldw	(OFST-5,sp),x
1720                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1722  0016 a640          	ld	a,#64
1723  0018 1e07          	ldw	x,(OFST+1,sp)
1724  001a cd0000        	call	c_cmulx
1726  001d 96            	ldw	x,sp
1727  001e 5c            	incw	x
1728  001f cd0000        	call	c_lgadd
1731                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1733  0022 7b0c          	ld	a,(OFST+6,sp)
1734  0024 260a          	jrne	L517
1735                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
1737  0026 7210505b      	bset	20571,#0
1738                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1740  002a 7211505c      	bres	20572,#0
1742  002e 2008          	jra	L717
1743  0030               L517:
1744                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
1746  0030 7218505b      	bset	20571,#4
1747                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1749  0034 7219505c      	bres	20572,#4
1750  0038               L717:
1751                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1753  0038 5f            	clrw	x
1754  0039 1f05          	ldw	(OFST-1,sp),x
1756  003b               L127:
1757                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1759  003b 1e0d          	ldw	x,(OFST+7,sp)
1760  003d 72fb05        	addw	x,(OFST-1,sp)
1761  0040 f6            	ld	a,(x)
1762  0041 1e03          	ldw	x,(OFST-3,sp)
1763  0043 72fb05        	addw	x,(OFST-1,sp)
1764  0046 f7            	ld	(x),a
1765                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1767  0047 1e05          	ldw	x,(OFST-1,sp)
1768  0049 5c            	incw	x
1769  004a 1f05          	ldw	(OFST-1,sp),x
1773  004c a30040        	cpw	x,#64
1774  004f 25ea          	jrult	L127
1775                     ; 698 }
1778  0051 5b08          	addw	sp,#8
1779  0053 81            	ret	
1803                     ; 709 void Flash_setup(void)
1803                     ; 710 {
1804                     .text:	section	.text,new
1805  0000               _Flash_setup:
1809                     ; 711 	 FLASH_DeInit();
1812                     ; 712 }	
1815  0000 cc0000        	jp	_FLASH_DeInit
1863                     ; 716 void escribirEEPROM(uint16_t direccion, uint8_t value)
1863                     ; 717 {
1864                     .text:	section	.text,new
1865  0000               _escribirEEPROM:
1867  0000 89            	pushw	x
1868       00000000      OFST:	set	0
1871                     ; 718 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
1873  0001 a6f7          	ld	a,#247
1874  0003 cd0000        	call	_FLASH_Unlock
1876                     ; 720 	 FLASH_EraseByte(direccion);	
1878  0006 1e01          	ldw	x,(OFST+1,sp)
1879  0008 cd0000        	call	c_uitolx
1881  000b be02          	ldw	x,c_lreg+2
1882  000d 89            	pushw	x
1883  000e be00          	ldw	x,c_lreg
1884  0010 89            	pushw	x
1885  0011 cd0000        	call	_FLASH_EraseByte
1887  0014 5b04          	addw	sp,#4
1888                     ; 721    delayEE();
1890  0016 cd0000        	call	_delayEE
1892                     ; 723 	 FLASH_ProgramByte(direccion, value);	
1894  0019 7b05          	ld	a,(OFST+5,sp)
1895  001b 88            	push	a
1896  001c 1e02          	ldw	x,(OFST+2,sp)
1897  001e cd0000        	call	c_uitolx
1899  0021 be02          	ldw	x,c_lreg+2
1900  0023 89            	pushw	x
1901  0024 be00          	ldw	x,c_lreg
1902  0026 89            	pushw	x
1903  0027 cd0000        	call	_FLASH_ProgramByte
1905  002a 5b05          	addw	sp,#5
1906                     ; 724    delayEE();
1908  002c cd0000        	call	_delayEE
1910                     ; 726 	 FLASH_Lock(FLASH_MEMTYPE_DATA);
1912  002f a6f7          	ld	a,#247
1913  0031 cd0000        	call	_FLASH_Lock
1915                     ; 727 }
1918  0034 85            	popw	x
1919  0035 81            	ret	
1954                     ; 732 uint8_t leerEEPROM(uint16_t direccion)
1954                     ; 733 {
1955                     .text:	section	.text,new
1956  0000               _leerEEPROM:
1960                     ; 734 	return FLASH_ReadByte(direccion);
1962  0000 cd0000        	call	c_uitolx
1964  0003 be02          	ldw	x,c_lreg+2
1965  0005 89            	pushw	x
1966  0006 be00          	ldw	x,c_lreg
1967  0008 89            	pushw	x
1968  0009 cd0000        	call	_FLASH_ReadByte
1970  000c 5b04          	addw	sp,#4
1973  000e 81            	ret	
2027                     ; 737 void actualizarEEPROM(uint16_t direccion, uint8_t value)
2027                     ; 738 {
2028                     .text:	section	.text,new
2029  0000               _actualizarEEPROM:
2031  0000 89            	pushw	x
2032  0001 88            	push	a
2033       00000001      OFST:	set	1
2036                     ; 739   uint8_t valorActual = leerEEPROM(direccion);
2038  0002 cd0000        	call	_leerEEPROM
2040  0005 6b01          	ld	(OFST+0,sp),a
2042                     ; 741   if(valorActual != value)
2044  0007 1106          	cp	a,(OFST+5,sp)
2045  0009 2709          	jreq	L5201
2046                     ; 743     escribirEEPROM( direccion, value);
2048  000b 7b06          	ld	a,(OFST+5,sp)
2049  000d 88            	push	a
2050  000e 1e03          	ldw	x,(OFST+2,sp)
2051  0010 cd0000        	call	_escribirEEPROM
2053  0013 84            	pop	a
2054  0014               L5201:
2055                     ; 745 }
2058  0014 5b03          	addw	sp,#3
2059  0016 81            	ret	
2093                     .const:	section	.text
2094  0000               L611:
2095  0000 00007530      	dc.l	30000
2096                     ; 747 void delayEE(){
2097                     .text:	section	.text,new
2098  0000               _delayEE:
2100  0000 5204          	subw	sp,#4
2101       00000004      OFST:	set	4
2104                     ; 748   long ja = 0;
2106                     ; 749   for(ja = 0; ja<30000; ja++);
2108  0002 5f            	clrw	x
2109  0003 1f03          	ldw	(OFST-1,sp),x
2110  0005 1f01          	ldw	(OFST-3,sp),x
2112  0007               L5401:
2116  0007 96            	ldw	x,sp
2117  0008 5c            	incw	x
2118  0009 a601          	ld	a,#1
2119  000b cd0000        	call	c_lgadc
2124  000e 96            	ldw	x,sp
2125  000f ad16          	call	LC001
2127  0011 2ff4          	jrslt	L5401
2128                     ; 750 	for(ja = 0; ja<30000; ja++);
2130  0013 5f            	clrw	x
2131  0014 1f03          	ldw	(OFST-1,sp),x
2132  0016 1f01          	ldw	(OFST-3,sp),x
2134  0018               L3501:
2138  0018 96            	ldw	x,sp
2139  0019 5c            	incw	x
2140  001a a601          	ld	a,#1
2141  001c cd0000        	call	c_lgadc
2146  001f 96            	ldw	x,sp
2147  0020 ad05          	call	LC001
2149  0022 2ff4          	jrslt	L3501
2150                     ; 751 }
2153  0024 5b04          	addw	sp,#4
2154  0026 81            	ret	
2155  0027               LC001:
2156  0027 5c            	incw	x
2157  0028 cd0000        	call	c_ltor
2159  002b ae0000        	ldw	x,#L611
2160  002e cc0000        	jp	c_lcmp
2173                     	xdef	_FLASH_WaitForLastOperation
2174                     	xdef	_FLASH_ProgramBlock
2175                     	xdef	_FLASH_EraseBlock
2176                     	xdef	_FLASH_GetFlagStatus
2177                     	xdef	_FLASH_GetBootSize
2178                     	xdef	_FLASH_GetProgrammingTime
2179                     	xdef	_FLASH_GetLowPowerMode
2180                     	xdef	_FLASH_SetProgrammingTime
2181                     	xdef	_FLASH_SetLowPowerMode
2182                     	xdef	_FLASH_EraseOptionByte
2183                     	xdef	_FLASH_ProgramOptionByte
2184                     	xdef	_FLASH_ReadOptionByte
2185                     	xdef	_FLASH_ProgramWord
2186                     	xdef	_FLASH_ReadByte
2187                     	xdef	_FLASH_ProgramByte
2188                     	xdef	_FLASH_EraseByte
2189                     	xdef	_FLASH_ITConfig
2190                     	xdef	_FLASH_DeInit
2191                     	xdef	_FLASH_Lock
2192                     	xdef	_FLASH_Unlock
2193                     	xdef	_delayEE
2194                     	xdef	_actualizarEEPROM
2195                     	xdef	_escribirEEPROM
2196                     	xdef	_leerEEPROM
2197                     	xdef	_Flash_setup
2198                     	xref.b	c_lreg
2199                     	xref.b	c_x
2200                     	xref.b	c_y
2219                     	xref	c_lcmp
2220                     	xref	c_lgadc
2221                     	xref	c_uitolx
2222                     	xref	c_ladd
2223                     	xref	c_cmulx
2224                     	xref	c_ltor
2225                     	xref	c_lgadd
2226                     	xref	c_rtol
2227                     	xref	c_umul
2228                     	end
