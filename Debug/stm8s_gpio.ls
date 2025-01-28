   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
 114                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 114                     ; 54 {
 116                     .text:	section	.text,new
 117  0000               _GPIO_DeInit:
 121                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 123  0000 7f            	clr	(x)
 124                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 126  0001 6f02          	clr	(2,x)
 127                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 129  0003 6f03          	clr	(3,x)
 130                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 132  0005 6f04          	clr	(4,x)
 133                     ; 59 }
 136  0007 81            	ret	
 376                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 376                     ; 72 {
 377                     .text:	section	.text,new
 378  0000               _GPIO_Init:
 380  0000 89            	pushw	x
 381       00000000      OFST:	set	0
 384                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 386                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 388                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 390  0001 7b05          	ld	a,(OFST+5,sp)
 391  0003 43            	cpl	a
 392  0004 e404          	and	a,(4,x)
 393  0006 e704          	ld	(4,x),a
 394                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 396  0008 7b06          	ld	a,(OFST+6,sp)
 397  000a 2a16          	jrpl	L771
 398                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 400  000c a510          	bcp	a,#16
 401  000e 2705          	jreq	L102
 402                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 404  0010 f6            	ld	a,(x)
 405  0011 1a05          	or	a,(OFST+5,sp)
 407  0013 2004          	jra	L302
 408  0015               L102:
 409                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 411  0015 7b05          	ld	a,(OFST+5,sp)
 412  0017 43            	cpl	a
 413  0018 f4            	and	a,(x)
 414  0019               L302:
 415  0019 f7            	ld	(x),a
 416                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 418  001a 1e01          	ldw	x,(OFST+1,sp)
 419  001c e602          	ld	a,(2,x)
 420  001e 1a05          	or	a,(OFST+5,sp)
 422  0020 2005          	jra	L502
 423  0022               L771:
 424                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 426  0022 7b05          	ld	a,(OFST+5,sp)
 427  0024 43            	cpl	a
 428  0025 e402          	and	a,(2,x)
 429  0027               L502:
 430  0027 e702          	ld	(2,x),a
 431                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 433  0029 7b06          	ld	a,(OFST+6,sp)
 434  002b a540          	bcp	a,#64
 435  002d 2706          	jreq	L702
 436                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 438  002f e603          	ld	a,(3,x)
 439  0031 1a05          	or	a,(OFST+5,sp)
 441  0033 2005          	jra	L112
 442  0035               L702:
 443                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 445  0035 7b05          	ld	a,(OFST+5,sp)
 446  0037 43            	cpl	a
 447  0038 e403          	and	a,(3,x)
 448  003a               L112:
 449  003a e703          	ld	(3,x),a
 450                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 452  003c 7b06          	ld	a,(OFST+6,sp)
 453  003e a520          	bcp	a,#32
 454  0040 2706          	jreq	L312
 455                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 457  0042 e604          	ld	a,(4,x)
 458  0044 1a05          	or	a,(OFST+5,sp)
 460  0046 2005          	jra	L512
 461  0048               L312:
 462                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 464  0048 7b05          	ld	a,(OFST+5,sp)
 465  004a 43            	cpl	a
 466  004b e404          	and	a,(4,x)
 467  004d               L512:
 468  004d e704          	ld	(4,x),a
 469                     ; 131 }
 472  004f 85            	popw	x
 473  0050 81            	ret	
 519                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 519                     ; 142 {
 520                     .text:	section	.text,new
 521  0000               _GPIO_Write:
 523       fffffffe      OFST: set -2
 526                     ; 143   GPIOx->ODR = PortVal;
 528  0000 7b03          	ld	a,(OFST+5,sp)
 529  0002 f7            	ld	(x),a
 530                     ; 144 }
 533  0003 81            	ret	
 580                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 580                     ; 155 {
 581                     .text:	section	.text,new
 582  0000               _GPIO_WriteHigh:
 584       fffffffe      OFST: set -2
 587                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 589  0000 f6            	ld	a,(x)
 590  0001 1a03          	or	a,(OFST+5,sp)
 591  0003 f7            	ld	(x),a
 592                     ; 157 }
 595  0004 81            	ret	
 642                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 642                     ; 168 {
 643                     .text:	section	.text,new
 644  0000               _GPIO_WriteLow:
 646       fffffffe      OFST: set -2
 649                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 651  0000 7b03          	ld	a,(OFST+5,sp)
 652  0002 43            	cpl	a
 653  0003 f4            	and	a,(x)
 654  0004 f7            	ld	(x),a
 655                     ; 170 }
 658  0005 81            	ret	
 705                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 705                     ; 181 {
 706                     .text:	section	.text,new
 707  0000               _GPIO_WriteReverse:
 709       fffffffe      OFST: set -2
 712                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 714  0000 f6            	ld	a,(x)
 715  0001 1803          	xor	a,(OFST+5,sp)
 716  0003 f7            	ld	(x),a
 717                     ; 183 }
 720  0004 81            	ret	
 758                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 758                     ; 192 {
 759                     .text:	section	.text,new
 760  0000               _GPIO_ReadOutputData:
 764                     ; 193   return ((uint8_t)GPIOx->ODR);
 766  0000 f6            	ld	a,(x)
 769  0001 81            	ret	
 806                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 806                     ; 203 {
 807                     .text:	section	.text,new
 808  0000               _GPIO_ReadInputData:
 812                     ; 204   return ((uint8_t)GPIOx->IDR);
 814  0000 e601          	ld	a,(1,x)
 817  0002 81            	ret	
 885                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 885                     ; 214 {
 886                     .text:	section	.text,new
 887  0000               _GPIO_ReadInputPin:
 889       fffffffe      OFST: set -2
 892                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 894  0000 e601          	ld	a,(1,x)
 895  0002 1403          	and	a,(OFST+5,sp)
 898  0004 81            	ret	
 976                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 976                     ; 226 {
 977                     .text:	section	.text,new
 978  0000               _GPIO_ExternalPullUpConfig:
 980       fffffffe      OFST: set -2
 983                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 985                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 987                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
 989  0000 7b04          	ld	a,(OFST+6,sp)
 990  0002 2706          	jreq	L374
 991                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 993  0004 e603          	ld	a,(3,x)
 994  0006 1a03          	or	a,(OFST+5,sp)
 996  0008 2005          	jra	L574
 997  000a               L374:
 998                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1000  000a 7b03          	ld	a,(OFST+5,sp)
1001  000c 43            	cpl	a
1002  000d e403          	and	a,(3,x)
1003  000f               L574:
1004  000f e703          	ld	(3,x),a
1005                     ; 238 }
1008  0011 81            	ret	
1034                     ; 247 void conf_GPIO(void)
1034                     ; 248 {
1035                     .text:	section	.text,new
1036  0000               _conf_GPIO:
1040                     ; 249 	GPIO_DeInit(GPIOA);
1042  0000 ae5000        	ldw	x,#20480
1043  0003 cd0000        	call	_GPIO_DeInit
1045                     ; 250 	GPIO_DeInit(GPIOB);
1047  0006 ae5005        	ldw	x,#20485
1048  0009 cd0000        	call	_GPIO_DeInit
1050                     ; 251 	GPIO_DeInit(GPIOC);
1052  000c ae500a        	ldw	x,#20490
1053  000f cd0000        	call	_GPIO_DeInit
1055                     ; 252 	GPIO_DeInit(GPIOD);	
1057  0012 ae500f        	ldw	x,#20495
1058  0015 cd0000        	call	_GPIO_DeInit
1060                     ; 254 	GPIO_Init(GPIOA, BUZZER, GPIO_MODE_OUT_PP_LOW_FAST);	
1062  0018 4be0          	push	#224
1063  001a 4b08          	push	#8
1064  001c ae5000        	ldw	x,#20480
1065  001f cd0000        	call	_GPIO_Init
1067  0022 85            	popw	x
1068                     ; 255 	GPIO_Init(GPIOD, BOTON, GPIO_MODE_IN_PU_IT);	
1070  0023 4b60          	push	#96
1071  0025 4b10          	push	#16
1072  0027 ae500f        	ldw	x,#20495
1073  002a cd0000        	call	_GPIO_Init
1075  002d 85            	popw	x
1076                     ; 262   GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
1078  002e 4bf0          	push	#240
1079  0030 4b20          	push	#32
1080  0032 ae500f        	ldw	x,#20495
1081  0035 cd0000        	call	_GPIO_Init
1083  0038 85            	popw	x
1084                     ; 263   GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
1086  0039 4b00          	push	#0
1087  003b 4b40          	push	#64
1088  003d ae500f        	ldw	x,#20495
1089  0040 cd0000        	call	_GPIO_Init
1091  0043 85            	popw	x
1092                     ; 265   GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
1094  0044 4b90          	push	#144
1095  0046 4b20          	push	#32
1096  0048 ae5005        	ldw	x,#20485
1097  004b cd0000        	call	_GPIO_Init
1099  004e 85            	popw	x
1100                     ; 266   GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_SLOW);
1102  004f 4b90          	push	#144
1103  0051 4b10          	push	#16
1104  0053 ae5005        	ldw	x,#20485
1105  0056 cd0000        	call	_GPIO_Init
1107  0059 85            	popw	x
1108                     ; 271   GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)PINESO_PORTC, GPIO_MODE_OUT_PP_LOW_FAST);
1110  005a 4be0          	push	#224
1111  005c 4bf8          	push	#248
1112  005e ae500a        	ldw	x,#20490
1113  0061 cd0000        	call	_GPIO_Init
1115  0064 85            	popw	x
1116                     ; 272 	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)PINESO_PORTD, GPIO_MODE_OUT_PP_LOW_FAST);
1118  0065 4be0          	push	#224
1119  0067 4b0e          	push	#14
1120  0069 ae500f        	ldw	x,#20495
1121  006c cd0000        	call	_GPIO_Init
1123  006f 85            	popw	x
1124                     ; 276 	GPIO_WriteLow(GPIOD,(GPIO_Pin_TypeDef)PINESO_PORTD);
1126  0070 4b0e          	push	#14
1127  0072 ae500f        	ldw	x,#20495
1128  0075 cd0000        	call	_GPIO_WriteLow
1130  0078 84            	pop	a
1131                     ; 277 	GPIO_WriteLow(GPIOC,(GPIO_Pin_TypeDef)PINESO_PORTC);	
1133  0079 4bf8          	push	#248
1134  007b ae500a        	ldw	x,#20490
1135  007e cd0000        	call	_GPIO_WriteLow
1137  0081 84            	pop	a
1138                     ; 278   GPIO_WriteLow(GPIOB,(GPIO_Pin_TypeDef)PINESO_PORTB);  
1140  0082 4b30          	push	#48
1141  0084 ae5005        	ldw	x,#20485
1142  0087 cd0000        	call	_GPIO_WriteLow
1144  008a 84            	pop	a
1145                     ; 279 }  
1148  008b 81            	ret	
1172                     ; 281 void onBD1 (void){GPIO_WriteHigh(GPIOB, BD1);}
1173                     .text:	section	.text,new
1174  0000               _onBD1:
1180  0000 4b10          	push	#16
1181  0002 ae5005        	ldw	x,#20485
1182  0005 cd0000        	call	_GPIO_WriteHigh
1184  0008 84            	pop	a
1188  0009 81            	ret	
1212                     ; 282 void onBD2 (void){GPIO_WriteHigh(GPIOC, BD2);}
1213                     .text:	section	.text,new
1214  0000               _onBD2:
1220  0000 4b10          	push	#16
1221  0002 ae500a        	ldw	x,#20490
1222  0005 cd0000        	call	_GPIO_WriteHigh
1224  0008 84            	pop	a
1228  0009 81            	ret	
1252                     ; 283 void onBD3 (void){GPIO_WriteHigh(GPIOC, BD3);}
1253                     .text:	section	.text,new
1254  0000               _onBD3:
1260  0000 4b40          	push	#64
1261  0002 ae500a        	ldw	x,#20490
1262  0005 cd0000        	call	_GPIO_WriteHigh
1264  0008 84            	pop	a
1268  0009 81            	ret	
1292                     ; 284 void onBD4 (void){GPIO_WriteHigh(GPIOD, BD4);}
1293                     .text:	section	.text,new
1294  0000               _onBD4:
1300  0000 4b02          	push	#2
1301  0002 ae500f        	ldw	x,#20495
1302  0005 cd0000        	call	_GPIO_WriteHigh
1304  0008 84            	pop	a
1308  0009 81            	ret	
1332                     ; 285 void onBD5 (void){GPIO_WriteHigh(GPIOD, BD5);}
1333                     .text:	section	.text,new
1334  0000               _onBD5:
1340  0000 4b08          	push	#8
1341  0002 ae500f        	ldw	x,#20495
1342  0005 cd0000        	call	_GPIO_WriteHigh
1344  0008 84            	pop	a
1348  0009 81            	ret	
1372                     ; 287 void offBD1 (void){GPIO_WriteLow(GPIOB, BD1);}
1373                     .text:	section	.text,new
1374  0000               _offBD1:
1380  0000 4b10          	push	#16
1381  0002 ae5005        	ldw	x,#20485
1382  0005 cd0000        	call	_GPIO_WriteLow
1384  0008 84            	pop	a
1388  0009 81            	ret	
1412                     ; 288 void offBD2 (void){GPIO_WriteLow(GPIOC, BD2);}
1413                     .text:	section	.text,new
1414  0000               _offBD2:
1420  0000 4b10          	push	#16
1421  0002 ae500a        	ldw	x,#20490
1422  0005 cd0000        	call	_GPIO_WriteLow
1424  0008 84            	pop	a
1428  0009 81            	ret	
1452                     ; 289 void offBD3 (void){GPIO_WriteLow(GPIOC, BD3);}
1453                     .text:	section	.text,new
1454  0000               _offBD3:
1460  0000 4b40          	push	#64
1461  0002 ae500a        	ldw	x,#20490
1462  0005 cd0000        	call	_GPIO_WriteLow
1464  0008 84            	pop	a
1468  0009 81            	ret	
1492                     ; 290 void offBD4 (void){GPIO_WriteLow(GPIOD, BD4);}
1493                     .text:	section	.text,new
1494  0000               _offBD4:
1500  0000 4b02          	push	#2
1501  0002 ae500f        	ldw	x,#20495
1502  0005 cd0000        	call	_GPIO_WriteLow
1504  0008 84            	pop	a
1508  0009 81            	ret	
1532                     ; 291 void offBD5 (void){GPIO_WriteLow(GPIOD, BD5);}
1533                     .text:	section	.text,new
1534  0000               _offBD5:
1540  0000 4b08          	push	#8
1541  0002 ae500f        	ldw	x,#20495
1542  0005 cd0000        	call	_GPIO_WriteLow
1544  0008 84            	pop	a
1548  0009 81            	ret	
1572                     ; 293 void onGD1 (void){GPIO_WriteHigh(GPIOB, GD1);}
1573                     .text:	section	.text,new
1574  0000               _onGD1:
1580  0000 4b20          	push	#32
1581  0002 ae5005        	ldw	x,#20485
1582  0005 cd0000        	call	_GPIO_WriteHigh
1584  0008 84            	pop	a
1588  0009 81            	ret	
1612                     ; 294 void onGD2 (void){GPIO_WriteHigh(GPIOC, GD2);}
1613                     .text:	section	.text,new
1614  0000               _onGD2:
1620  0000 4b08          	push	#8
1621  0002 ae500a        	ldw	x,#20490
1622  0005 cd0000        	call	_GPIO_WriteHigh
1624  0008 84            	pop	a
1628  0009 81            	ret	
1652                     ; 295 void onGD3 (void){GPIO_WriteHigh(GPIOC, GD3);}
1653                     .text:	section	.text,new
1654  0000               _onGD3:
1660  0000 4b20          	push	#32
1661  0002 ae500a        	ldw	x,#20490
1662  0005 cd0000        	call	_GPIO_WriteHigh
1664  0008 84            	pop	a
1668  0009 81            	ret	
1692                     ; 296 void onGD4 (void){GPIO_WriteHigh(GPIOC, GD4);}
1693                     .text:	section	.text,new
1694  0000               _onGD4:
1700  0000 4b80          	push	#128
1701  0002 ae500a        	ldw	x,#20490
1702  0005 cd0000        	call	_GPIO_WriteHigh
1704  0008 84            	pop	a
1708  0009 81            	ret	
1732                     ; 297 void onGD5 (void){GPIO_WriteHigh(GPIOD, GD5);}
1733                     .text:	section	.text,new
1734  0000               _onGD5:
1740  0000 4b04          	push	#4
1741  0002 ae500f        	ldw	x,#20495
1742  0005 cd0000        	call	_GPIO_WriteHigh
1744  0008 84            	pop	a
1748  0009 81            	ret	
1772                     ; 299 void offGD1 (void){GPIO_WriteLow(GPIOB, GD1);}
1773                     .text:	section	.text,new
1774  0000               _offGD1:
1780  0000 4b20          	push	#32
1781  0002 ae5005        	ldw	x,#20485
1782  0005 cd0000        	call	_GPIO_WriteLow
1784  0008 84            	pop	a
1788  0009 81            	ret	
1812                     ; 300 void offGD2 (void){GPIO_WriteLow(GPIOC, GD2);}
1813                     .text:	section	.text,new
1814  0000               _offGD2:
1820  0000 4b08          	push	#8
1821  0002 ae500a        	ldw	x,#20490
1822  0005 cd0000        	call	_GPIO_WriteLow
1824  0008 84            	pop	a
1828  0009 81            	ret	
1852                     ; 301 void offGD3 (void){GPIO_WriteLow(GPIOC, GD3);}
1853                     .text:	section	.text,new
1854  0000               _offGD3:
1860  0000 4b20          	push	#32
1861  0002 ae500a        	ldw	x,#20490
1862  0005 cd0000        	call	_GPIO_WriteLow
1864  0008 84            	pop	a
1868  0009 81            	ret	
1892                     ; 302 void offGD4 (void){GPIO_WriteLow(GPIOC, GD4);}
1893                     .text:	section	.text,new
1894  0000               _offGD4:
1900  0000 4b80          	push	#128
1901  0002 ae500a        	ldw	x,#20490
1902  0005 cd0000        	call	_GPIO_WriteLow
1904  0008 84            	pop	a
1908  0009 81            	ret	
1932                     ; 303 void offGD5 (void){GPIO_WriteLow(GPIOD, GD5);}
1933                     .text:	section	.text,new
1934  0000               _offGD5:
1940  0000 4b04          	push	#4
1941  0002 ae500f        	ldw	x,#20495
1942  0005 cd0000        	call	_GPIO_WriteLow
1944  0008 84            	pop	a
1948  0009 81            	ret	
1961                     	xdef	_offGD5
1962                     	xdef	_offGD4
1963                     	xdef	_offGD3
1964                     	xdef	_offGD2
1965                     	xdef	_offGD1
1966                     	xdef	_onGD5
1967                     	xdef	_onGD4
1968                     	xdef	_onGD3
1969                     	xdef	_onGD2
1970                     	xdef	_onGD1
1971                     	xdef	_offBD5
1972                     	xdef	_offBD4
1973                     	xdef	_offBD3
1974                     	xdef	_offBD2
1975                     	xdef	_offBD1
1976                     	xdef	_onBD5
1977                     	xdef	_onBD4
1978                     	xdef	_onBD3
1979                     	xdef	_onBD2
1980                     	xdef	_onBD1
1981                     	xdef	_conf_GPIO
1982                     	xdef	_GPIO_ExternalPullUpConfig
1983                     	xdef	_GPIO_ReadInputPin
1984                     	xdef	_GPIO_ReadOutputData
1985                     	xdef	_GPIO_ReadInputData
1986                     	xdef	_GPIO_WriteReverse
1987                     	xdef	_GPIO_WriteLow
1988                     	xdef	_GPIO_WriteHigh
1989                     	xdef	_GPIO_Write
1990                     	xdef	_GPIO_Init
1991                     	xdef	_GPIO_DeInit
2010                     	end
