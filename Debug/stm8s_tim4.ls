   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  48                     ; 49 void TIM4_DeInit(void)
  48                     ; 50 {
  50                     .text:	section	.text,new
  51  0000               _TIM4_DeInit:
  55                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  57  0000 725f5340      	clr	21312
  58                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  60  0004 725f5343      	clr	21315
  61                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  63  0008 725f5346      	clr	21318
  64                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  66  000c 725f5347      	clr	21319
  67                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  69  0010 35ff5348      	mov	21320,#255
  70                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  72  0014 725f5344      	clr	21316
  73                     ; 57 }
  76  0018 81            	ret	
 182                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 182                     ; 66 {
 183                     .text:	section	.text,new
 184  0000               _TIM4_TimeBaseInit:
 188                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 190                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 192  0000 9e            	ld	a,xh
 193  0001 c75347        	ld	21319,a
 194                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 196  0004 9f            	ld	a,xl
 197  0005 c75348        	ld	21320,a
 198                     ; 73 }
 201  0008 81            	ret	
 256                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 256                     ; 82 {
 257                     .text:	section	.text,new
 258  0000               _TIM4_Cmd:
 262                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 264                     ; 87   if (NewState != DISABLE)
 266  0000 4d            	tnz	a
 267  0001 2705          	jreq	L511
 268                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 270  0003 72105340      	bset	21312,#0
 273  0007 81            	ret	
 274  0008               L511:
 275                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 277  0008 72115340      	bres	21312,#0
 278                     ; 95 }
 281  000c 81            	ret	
 339                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 339                     ; 108 {
 340                     .text:	section	.text,new
 341  0000               _TIM4_ITConfig:
 343  0000 89            	pushw	x
 344       00000000      OFST:	set	0
 347                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 349                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 351                     ; 113   if (NewState != DISABLE)
 353  0001 9f            	ld	a,xl
 354  0002 4d            	tnz	a
 355  0003 2706          	jreq	L151
 356                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 358  0005 9e            	ld	a,xh
 359  0006 ca5343        	or	a,21315
 361  0009 2006          	jra	L351
 362  000b               L151:
 363                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 365  000b 7b01          	ld	a,(OFST+1,sp)
 366  000d 43            	cpl	a
 367  000e c45343        	and	a,21315
 368  0011               L351:
 369  0011 c75343        	ld	21315,a
 370                     ; 123 }
 373  0014 85            	popw	x
 374  0015 81            	ret	
 410                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 410                     ; 132 {
 411                     .text:	section	.text,new
 412  0000               _TIM4_UpdateDisableConfig:
 416                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 418                     ; 137   if (NewState != DISABLE)
 420  0000 4d            	tnz	a
 421  0001 2705          	jreq	L371
 422                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 424  0003 72125340      	bset	21312,#1
 427  0007 81            	ret	
 428  0008               L371:
 429                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 431  0008 72135340      	bres	21312,#1
 432                     ; 145 }
 435  000c 81            	ret	
 493                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 493                     ; 156 {
 494                     .text:	section	.text,new
 495  0000               _TIM4_UpdateRequestConfig:
 499                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 501                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 503  0000 4d            	tnz	a
 504  0001 2705          	jreq	L522
 505                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 507  0003 72145340      	bset	21312,#2
 510  0007 81            	ret	
 511  0008               L522:
 512                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 514  0008 72155340      	bres	21312,#2
 515                     ; 169 }
 518  000c 81            	ret	
 575                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 575                     ; 180 {
 576                     .text:	section	.text,new
 577  0000               _TIM4_SelectOnePulseMode:
 581                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 583                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 585  0000 4d            	tnz	a
 586  0001 2705          	jreq	L752
 587                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 589  0003 72165340      	bset	21312,#3
 592  0007 81            	ret	
 593  0008               L752:
 594                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 596  0008 72175340      	bres	21312,#3
 597                     ; 193 }
 600  000c 81            	ret	
 668                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 668                     ; 216 {
 669                     .text:	section	.text,new
 670  0000               _TIM4_PrescalerConfig:
 674                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 676                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 678                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 680  0000 9e            	ld	a,xh
 681  0001 c75347        	ld	21319,a
 682                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 684  0004 9f            	ld	a,xl
 685  0005 c75345        	ld	21317,a
 686                     ; 226 }
 689  0008 81            	ret	
 725                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 725                     ; 235 {
 726                     .text:	section	.text,new
 727  0000               _TIM4_ARRPreloadConfig:
 731                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 733                     ; 240   if (NewState != DISABLE)
 735  0000 4d            	tnz	a
 736  0001 2705          	jreq	L333
 737                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 739  0003 721e5340      	bset	21312,#7
 742  0007 81            	ret	
 743  0008               L333:
 744                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 746  0008 721f5340      	bres	21312,#7
 747                     ; 248 }
 750  000c 81            	ret	
 799                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 799                     ; 258 {
 800                     .text:	section	.text,new
 801  0000               _TIM4_GenerateEvent:
 805                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 807                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 809  0000 c75345        	ld	21317,a
 810                     ; 264 }
 813  0003 81            	ret	
 847                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 847                     ; 273 {
 848                     .text:	section	.text,new
 849  0000               _TIM4_SetCounter:
 853                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 855  0000 c75346        	ld	21318,a
 856                     ; 276 }
 859  0003 81            	ret	
 893                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 893                     ; 285 {
 894                     .text:	section	.text,new
 895  0000               _TIM4_SetAutoreload:
 899                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 901  0000 c75348        	ld	21320,a
 902                     ; 288 }
 905  0003 81            	ret	
 928                     ; 295 uint8_t TIM4_GetCounter(void)
 928                     ; 296 {
 929                     .text:	section	.text,new
 930  0000               _TIM4_GetCounter:
 934                     ; 298   return (uint8_t)(TIM4->CNTR);
 936  0000 c65346        	ld	a,21318
 939  0003 81            	ret	
 963                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 963                     ; 307 {
 964                     .text:	section	.text,new
 965  0000               _TIM4_GetPrescaler:
 969                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 971  0000 c65347        	ld	a,21319
 974  0003 81            	ret	
1053                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1053                     ; 320 {
1054                     .text:	section	.text,new
1055  0000               _TIM4_GetFlagStatus:
1057       00000001      OFST:	set	1
1060                     ; 321   FlagStatus bitstatus = RESET;
1062                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1064                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1066  0000 c45344        	and	a,21316
1067  0003 2702          	jreq	L774
1068                     ; 328     bitstatus = SET;
1070  0005 a601          	ld	a,#1
1073  0007               L774:
1074                     ; 332     bitstatus = RESET;
1077                     ; 334   return ((FlagStatus)bitstatus);
1081  0007 81            	ret	
1116                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1116                     ; 345 {
1117                     .text:	section	.text,new
1118  0000               _TIM4_ClearFlag:
1122                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1124                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1126  0000 43            	cpl	a
1127  0001 c75344        	ld	21316,a
1128                     ; 351 }
1131  0004 81            	ret	
1195                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1195                     ; 361 {
1196                     .text:	section	.text,new
1197  0000               _TIM4_GetITStatus:
1199  0000 88            	push	a
1200  0001 89            	pushw	x
1201       00000002      OFST:	set	2
1204                     ; 362   ITStatus bitstatus = RESET;
1206                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1210                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1212                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1214  0002 c45344        	and	a,21316
1215  0005 6b01          	ld	(OFST-1,sp),a
1217                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1219  0007 c65343        	ld	a,21315
1220  000a 1403          	and	a,(OFST+1,sp)
1221  000c 6b02          	ld	(OFST+0,sp),a
1223                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1225  000e 7b01          	ld	a,(OFST-1,sp)
1226  0010 2708          	jreq	L355
1228  0012 7b02          	ld	a,(OFST+0,sp)
1229  0014 2704          	jreq	L355
1230                     ; 375     bitstatus = (ITStatus)SET;
1232  0016 a601          	ld	a,#1
1235  0018 2001          	jra	L555
1236  001a               L355:
1237                     ; 379     bitstatus = (ITStatus)RESET;
1239  001a 4f            	clr	a
1241  001b               L555:
1242                     ; 381   return ((ITStatus)bitstatus);
1246  001b 5b03          	addw	sp,#3
1247  001d 81            	ret	
1283                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1283                     ; 392 {
1284                     .text:	section	.text,new
1285  0000               _TIM4_ClearITPendingBit:
1289                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1291                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1293  0000 43            	cpl	a
1294  0001 c75344        	ld	21316,a
1295                     ; 398 }
1298  0004 81            	ret	
1337                     ; 403 void delay_us(signed int us)
1337                     ; 404 {   
1338                     .text:	section	.text,new
1339  0000               _delay_us:
1341  0000 89            	pushw	x
1342       00000000      OFST:	set	0
1345                     ; 405 	TIM4_DeInit();	
1347  0001 cd0000        	call	_TIM4_DeInit
1349                     ; 407 	if((us <= 200) && (us >= 0))
1351  0004 1e01          	ldw	x,(OFST+1,sp)
1352  0006 a300c9        	cpw	x,#201
1353  0009 2e09          	jrsge	L316
1355  000b 1e01          	ldw	x,(OFST+1,sp)
1356  000d 2b05          	jrmi	L316
1357                     ; 409 		TIM4_TimeBaseInit(TIM4_PRESCALER_16, 200);
1359  000f ae04c8        	ldw	x,#1224
1361                     ; 410 		TIM4_Cmd(ENABLE);   
1364  0012 203c          	jp	LC001
1365  0014               L316:
1366                     ; 412 	else if((us <= 400) && (us > 200))
1368  0014 a30191        	cpw	x,#401
1369  0017 2e0e          	jrsge	L716
1371  0019 a300c9        	cpw	x,#201
1372  001c 2f09          	jrslt	L716
1373                     ; 414 		us >>= 1;
1375  001e 0701          	sra	(OFST+1,sp)
1376                     ; 415 		TIM4_TimeBaseInit(TIM4_PRESCALER_32, 200);
1378  0020 ae05c8        	ldw	x,#1480
1379  0023 0602          	rrc	(OFST+2,sp)
1381                     ; 416 		TIM4_Cmd(ENABLE);   
1384  0025 2029          	jp	LC001
1385  0027               L716:
1386                     ; 418 	else if((us <= 800) && (us > 400))
1388  0027 a30321        	cpw	x,#801
1389  002a 2e13          	jrsge	L326
1391  002c a30191        	cpw	x,#401
1392  002f 2f0e          	jrslt	L326
1393                     ; 420 		us >>= 2;
1395  0031 a602          	ld	a,#2
1396  0033               L46:
1397  0033 0701          	sra	(OFST+1,sp)
1398  0035 0602          	rrc	(OFST+2,sp)
1399  0037 4a            	dec	a
1400  0038 26f9          	jrne	L46
1401                     ; 421 		TIM4_TimeBaseInit(TIM4_PRESCALER_64, 200);
1403  003a ae06c8        	ldw	x,#1736
1405                     ; 422 		TIM4_Cmd(ENABLE);   
1408  003d 2011          	jp	LC001
1409  003f               L326:
1410                     ; 424 	else if(us > 800)
1412  003f a30321        	cpw	x,#801
1413  0042 2f14          	jrslt	L336
1414                     ; 426 		us >>= 3;
1416  0044 a603          	ld	a,#3
1417  0046               L27:
1418  0046 0701          	sra	(OFST+1,sp)
1419  0048 0602          	rrc	(OFST+2,sp)
1420  004a 4a            	dec	a
1421  004b 26f9          	jrne	L27
1422                     ; 427 		TIM4_TimeBaseInit(TIM4_PRESCALER_128, 200);
1424  004d ae07c8        	ldw	x,#1992
1426                     ; 428 		TIM4_Cmd(ENABLE);   
1428  0050               LC001:
1429  0050 cd0000        	call	_TIM4_TimeBaseInit
1433  0053 a601          	ld	a,#1
1434  0055 cd0000        	call	_TIM4_Cmd
1436  0058               L336:
1437                     ; 431 	while(TIM4_GetCounter() < us);
1439  0058 cd0000        	call	_TIM4_GetCounter
1441  005b 5f            	clrw	x
1442  005c 97            	ld	xl,a
1443  005d 1301          	cpw	x,(OFST+1,sp)
1444  005f 2ff7          	jrslt	L336
1445                     ; 432 	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
1447  0061 a601          	ld	a,#1
1448  0063 cd0000        	call	_TIM4_ClearFlag
1450                     ; 433 	TIM4_Cmd(DISABLE);     
1452  0066 4f            	clr	a
1453  0067 cd0000        	call	_TIM4_Cmd
1455                     ; 434 }
1458  006a 85            	popw	x
1459  006b 81            	ret	
1494                     ; 437 void delay_ms(signed int ms)
1494                     ; 438 {
1495                     .text:	section	.text,new
1496  0000               _delay_ms:
1498  0000 89            	pushw	x
1499       00000000      OFST:	set	0
1502  0001 2006          	jra	L756
1503  0003               L556:
1504                     ; 441 		delay_us(1000);
1506  0003 ae03e8        	ldw	x,#1000
1507  0006 cd0000        	call	_delay_us
1509  0009               L756:
1510                     ; 439 	while(ms--)
1512  0009 1e01          	ldw	x,(OFST+1,sp)
1513  000b 5a            	decw	x
1514  000c 1f01          	ldw	(OFST+1,sp),x
1515  000e 5c            	incw	x
1516  000f 26f2          	jrne	L556
1517                     ; 443 }    
1521  0011 85            	popw	x
1522  0012 81            	ret	
1535                     	xdef	_TIM4_ClearITPendingBit
1536                     	xdef	_TIM4_GetITStatus
1537                     	xdef	_TIM4_ClearFlag
1538                     	xdef	_TIM4_GetFlagStatus
1539                     	xdef	_TIM4_GetPrescaler
1540                     	xdef	_TIM4_GetCounter
1541                     	xdef	_TIM4_SetAutoreload
1542                     	xdef	_TIM4_SetCounter
1543                     	xdef	_TIM4_GenerateEvent
1544                     	xdef	_TIM4_ARRPreloadConfig
1545                     	xdef	_TIM4_PrescalerConfig
1546                     	xdef	_TIM4_SelectOnePulseMode
1547                     	xdef	_TIM4_UpdateRequestConfig
1548                     	xdef	_TIM4_UpdateDisableConfig
1549                     	xdef	_TIM4_ITConfig
1550                     	xdef	_TIM4_Cmd
1551                     	xdef	_TIM4_TimeBaseInit
1552                     	xdef	_delay_ms
1553                     	xdef	_delay_us
1554                     	xdef	_TIM4_DeInit
1573                     	end
