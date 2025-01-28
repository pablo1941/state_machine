   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  48                     ; 50 void SPI_DeInit(void)
  48                     ; 51 {
  50                     .text:	section	.text,new
  51  0000               _SPI_DeInit:
  55                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  57  0000 725f5200      	clr	20992
  58                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  60  0004 725f5201      	clr	20993
  61                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  63  0008 725f5202      	clr	20994
  64                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  66  000c 35025203      	mov	20995,#2
  67                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  69  0010 35075205      	mov	20997,#7
  70                     ; 57 }
  73  0014 81            	ret	
 389                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 389                     ; 79 {
 390                     .text:	section	.text,new
 391  0000               _SPI_Init:
 393  0000 89            	pushw	x
 394  0001 88            	push	a
 395       00000001      OFST:	set	1
 398                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 400                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 402                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 404                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 406                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 408                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 410                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 412                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 414                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 414                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 416  0002 7b07          	ld	a,(OFST+6,sp)
 417  0004 1a08          	or	a,(OFST+7,sp)
 418  0006 6b01          	ld	(OFST+0,sp),a
 420  0008 9f            	ld	a,xl
 421  0009 1a02          	or	a,(OFST+1,sp)
 422  000b 1a01          	or	a,(OFST+0,sp)
 423  000d c75200        	ld	20992,a
 424                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 426  0010 7b09          	ld	a,(OFST+8,sp)
 427  0012 1a0a          	or	a,(OFST+9,sp)
 428  0014 c75201        	ld	20993,a
 429                     ; 97   if (Mode == SPI_MODE_MASTER)
 431  0017 7b06          	ld	a,(OFST+5,sp)
 432  0019 a104          	cp	a,#4
 433  001b 2606          	jrne	L302
 434                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 436  001d 72105201      	bset	20993,#0
 438  0021 2004          	jra	L502
 439  0023               L302:
 440                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 442  0023 72115201      	bres	20993,#0
 443  0027               L502:
 444                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 446  0027 c65200        	ld	a,20992
 447  002a 1a06          	or	a,(OFST+5,sp)
 448  002c c75200        	ld	20992,a
 449                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 451  002f 7b0b          	ld	a,(OFST+10,sp)
 452  0031 c75205        	ld	20997,a
 453                     ; 111 }
 456  0034 5b03          	addw	sp,#3
 457  0036 81            	ret	
 512                     ; 119 void SPI_Cmd(FunctionalState NewState)
 512                     ; 120 {
 513                     .text:	section	.text,new
 514  0000               _SPI_Cmd:
 518                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 520                     ; 124   if (NewState != DISABLE)
 522  0000 4d            	tnz	a
 523  0001 2705          	jreq	L532
 524                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 526  0003 721c5200      	bset	20992,#6
 529  0007 81            	ret	
 530  0008               L532:
 531                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 533  0008 721d5200      	bres	20992,#6
 534                     ; 132 }
 537  000c 81            	ret	
 646                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 646                     ; 142 {
 647                     .text:	section	.text,new
 648  0000               _SPI_ITConfig:
 650  0000 89            	pushw	x
 651  0001 88            	push	a
 652       00000001      OFST:	set	1
 655                     ; 143   uint8_t itpos = 0;
 657                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 659                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 661                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 663  0002 9e            	ld	a,xh
 664  0003 a40f          	and	a,#15
 665  0005 5f            	clrw	x
 666  0006 97            	ld	xl,a
 667  0007 a601          	ld	a,#1
 668  0009 5d            	tnzw	x
 669  000a 2704          	jreq	L41
 670  000c               L61:
 671  000c 48            	sll	a
 672  000d 5a            	decw	x
 673  000e 26fc          	jrne	L61
 674  0010               L41:
 675  0010 6b01          	ld	(OFST+0,sp),a
 677                     ; 151   if (NewState != DISABLE)
 679  0012 0d03          	tnz	(OFST+2,sp)
 680  0014 2707          	jreq	L113
 681                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 683  0016 c65202        	ld	a,20994
 684  0019 1a01          	or	a,(OFST+0,sp)
 686  001b 2004          	jra	L313
 687  001d               L113:
 688                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 690  001d 43            	cpl	a
 691  001e c45202        	and	a,20994
 692  0021               L313:
 693  0021 c75202        	ld	20994,a
 694                     ; 159 }
 697  0024 5b03          	addw	sp,#3
 698  0026 81            	ret	
 732                     ; 166 void SPI_SendData(uint8_t Data)
 732                     ; 167 {
 733                     .text:	section	.text,new
 734  0000               _SPI_SendData:
 738                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 740  0000 c75204        	ld	20996,a
 741                     ; 169 }
 744  0003 81            	ret	
 767                     ; 176 uint8_t SPI_ReceiveData(void)
 767                     ; 177 {
 768                     .text:	section	.text,new
 769  0000               _SPI_ReceiveData:
 773                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 775  0000 c65204        	ld	a,20996
 778  0003 81            	ret	
 814                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 814                     ; 188 {
 815                     .text:	section	.text,new
 816  0000               _SPI_NSSInternalSoftwareCmd:
 820                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 822                     ; 192   if (NewState != DISABLE)
 824  0000 4d            	tnz	a
 825  0001 2705          	jreq	L163
 826                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 828  0003 72105201      	bset	20993,#0
 831  0007 81            	ret	
 832  0008               L163:
 833                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 835  0008 72115201      	bres	20993,#0
 836                     ; 200 }
 839  000c 81            	ret	
 862                     ; 207 void SPI_TransmitCRC(void)
 862                     ; 208 {
 863                     .text:	section	.text,new
 864  0000               _SPI_TransmitCRC:
 868                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 870  0000 72185201      	bset	20993,#4
 871                     ; 210 }
 874  0004 81            	ret	
 910                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 910                     ; 219 {
 911                     .text:	section	.text,new
 912  0000               _SPI_CalculateCRCCmd:
 916                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 918                     ; 223   if (NewState != DISABLE)
 920  0000 4d            	tnz	a
 921  0001 2705          	jreq	L314
 922                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 924  0003 721a5201      	bset	20993,#5
 927  0007 81            	ret	
 928  0008               L314:
 929                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 931  0008 721b5201      	bres	20993,#5
 932                     ; 231 }
 935  000c 81            	ret	
 999                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 999                     ; 239 {
1000                     .text:	section	.text,new
1001  0000               _SPI_GetCRC:
1003       00000001      OFST:	set	1
1006                     ; 240   uint8_t crcreg = 0;
1008                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1010                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1012  0000 4d            	tnz	a
1013  0001 2704          	jreq	L154
1014                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1016  0003 c65207        	ld	a,20999
1020  0006 81            	ret	
1021  0007               L154:
1022                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1024  0007 c65206        	ld	a,20998
1026                     ; 255   return crcreg;
1030  000a 81            	ret	
1055                     ; 263 void SPI_ResetCRC(void)
1055                     ; 264 {
1056                     .text:	section	.text,new
1057  0000               _SPI_ResetCRC:
1061                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1063  0000 a601          	ld	a,#1
1064  0002 cd0000        	call	_SPI_CalculateCRCCmd
1066                     ; 270   SPI_Cmd(ENABLE);
1068  0005 a601          	ld	a,#1
1070                     ; 271 }
1073  0007 cc0000        	jp	_SPI_Cmd
1097                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1097                     ; 279 {
1098                     .text:	section	.text,new
1099  0000               _SPI_GetCRCPolynomial:
1103                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1105  0000 c65205        	ld	a,20997
1108  0003 81            	ret	
1164                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1164                     ; 289 {
1165                     .text:	section	.text,new
1166  0000               _SPI_BiDirectionalLineConfig:
1170                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1172                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1174  0000 4d            	tnz	a
1175  0001 2705          	jreq	L325
1176                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1178  0003 721c5201      	bset	20993,#6
1181  0007 81            	ret	
1182  0008               L325:
1183                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1185  0008 721d5201      	bres	20993,#6
1186                     ; 301 }
1189  000c 81            	ret	
1310                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1310                     ; 312 {
1311                     .text:	section	.text,new
1312  0000               _SPI_GetFlagStatus:
1314       00000001      OFST:	set	1
1317                     ; 313   FlagStatus status = RESET;
1319                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1321                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1323  0000 c45203        	and	a,20995
1324  0003 2702          	jreq	L306
1325                     ; 320     status = SET; /* SPI_FLAG is set */
1327  0005 a601          	ld	a,#1
1330  0007               L306:
1331                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1334                     ; 328   return status;
1338  0007 81            	ret	
1373                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1373                     ; 347 {
1374                     .text:	section	.text,new
1375  0000               _SPI_ClearFlag:
1379                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1381                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1383  0000 43            	cpl	a
1384  0001 c75203        	ld	20995,a
1385                     ; 351 }
1388  0004 81            	ret	
1470                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1470                     ; 367 {
1471                     .text:	section	.text,new
1472  0000               _SPI_GetITStatus:
1474  0000 88            	push	a
1475  0001 89            	pushw	x
1476       00000002      OFST:	set	2
1479                     ; 368   ITStatus pendingbitstatus = RESET;
1481                     ; 369   uint8_t itpos = 0;
1483                     ; 370   uint8_t itmask1 = 0;
1485                     ; 371   uint8_t itmask2 = 0;
1487                     ; 372   uint8_t enablestatus = 0;
1489                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1491                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1493  0002 a40f          	and	a,#15
1494  0004 5f            	clrw	x
1495  0005 97            	ld	xl,a
1496  0006 a601          	ld	a,#1
1497  0008 5d            	tnzw	x
1498  0009 2704          	jreq	L45
1499  000b               L65:
1500  000b 48            	sll	a
1501  000c 5a            	decw	x
1502  000d 26fc          	jrne	L65
1503  000f               L45:
1504  000f 6b01          	ld	(OFST-1,sp),a
1506                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1508  0011 7b03          	ld	a,(OFST+1,sp)
1509  0013 4e            	swap	a
1510  0014 a40f          	and	a,#15
1511  0016 6b02          	ld	(OFST+0,sp),a
1513                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1515  0018 5f            	clrw	x
1516  0019 97            	ld	xl,a
1517  001a a601          	ld	a,#1
1518  001c 5d            	tnzw	x
1519  001d 2704          	jreq	L06
1520  001f               L26:
1521  001f 48            	sll	a
1522  0020 5a            	decw	x
1523  0021 26fc          	jrne	L26
1524  0023               L06:
1526                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1528  0023 c45203        	and	a,20995
1529  0026 6b02          	ld	(OFST+0,sp),a
1531                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1533  0028 c65202        	ld	a,20994
1534  002b 1501          	bcp	a,(OFST-1,sp)
1535  002d 2708          	jreq	L766
1537  002f 7b02          	ld	a,(OFST+0,sp)
1538  0031 2704          	jreq	L766
1539                     ; 387     pendingbitstatus = SET;
1541  0033 a601          	ld	a,#1
1544  0035 2001          	jra	L176
1545  0037               L766:
1546                     ; 392     pendingbitstatus = RESET;
1548  0037 4f            	clr	a
1550  0038               L176:
1551                     ; 395   return  pendingbitstatus;
1555  0038 5b03          	addw	sp,#3
1556  003a 81            	ret	
1601                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1601                     ; 413 {
1602                     .text:	section	.text,new
1603  0000               _SPI_ClearITPendingBit:
1605       00000001      OFST:	set	1
1608                     ; 414   uint8_t itpos = 0;
1610                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1612                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1614  0000 4e            	swap	a
1615  0001 a40f          	and	a,#15
1616  0003 5f            	clrw	x
1617  0004 97            	ld	xl,a
1618  0005 a601          	ld	a,#1
1619  0007 5d            	tnzw	x
1620  0008 2704          	jreq	L66
1621  000a               L07:
1622  000a 48            	sll	a
1623  000b 5a            	decw	x
1624  000c 26fc          	jrne	L07
1625  000e               L66:
1627                     ; 422   SPI->SR = (uint8_t)(~itpos);
1629  000e 43            	cpl	a
1630  000f c75203        	ld	20995,a
1631                     ; 424 }
1634  0012 81            	ret	
1647                     	xdef	_SPI_ClearITPendingBit
1648                     	xdef	_SPI_GetITStatus
1649                     	xdef	_SPI_ClearFlag
1650                     	xdef	_SPI_GetFlagStatus
1651                     	xdef	_SPI_BiDirectionalLineConfig
1652                     	xdef	_SPI_GetCRCPolynomial
1653                     	xdef	_SPI_ResetCRC
1654                     	xdef	_SPI_GetCRC
1655                     	xdef	_SPI_CalculateCRCCmd
1656                     	xdef	_SPI_TransmitCRC
1657                     	xdef	_SPI_NSSInternalSoftwareCmd
1658                     	xdef	_SPI_ReceiveData
1659                     	xdef	_SPI_SendData
1660                     	xdef	_SPI_ITConfig
1661                     	xdef	_SPI_Cmd
1662                     	xdef	_SPI_Init
1663                     	xdef	_SPI_DeInit
1682                     	end
