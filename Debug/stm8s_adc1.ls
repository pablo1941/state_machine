   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  48                     ; 52 void ADC1_DeInit(void)
  48                     ; 53 {
  50                     .text:	section	.text,new
  51  0000               _ADC1_DeInit:
  55                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  57  0000 725f5400      	clr	21504
  58                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  60  0004 725f5401      	clr	21505
  61                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  63  0008 725f5402      	clr	21506
  64                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  66  000c 725f5403      	clr	21507
  67                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  69  0010 725f5406      	clr	21510
  70                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  72  0014 725f5407      	clr	21511
  73                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  75  0018 35ff5408      	mov	21512,#255
  76                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  78  001c 35035409      	mov	21513,#3
  79                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  81  0020 725f540a      	clr	21514
  82                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  84  0024 725f540b      	clr	21515
  85                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  87  0028 725f540e      	clr	21518
  88                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  90  002c 725f540f      	clr	21519
  91                     ; 66 }
  94  0030 81            	ret	
 545                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 545                     ; 89 {
 546                     .text:	section	.text,new
 547  0000               _ADC1_Init:
 549  0000 89            	pushw	x
 550       00000000      OFST:	set	0
 553                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 555                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 557                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 559                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 561                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 563                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 565                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 567                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 569                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 571  0001 7b08          	ld	a,(OFST+8,sp)
 572  0003 88            	push	a
 573  0004 7b02          	ld	a,(OFST+2,sp)
 574  0006 95            	ld	xh,a
 575  0007 cd0000        	call	_ADC1_ConversionConfig
 577  000a 84            	pop	a
 578                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 580  000b 7b05          	ld	a,(OFST+5,sp)
 581  000d cd0000        	call	_ADC1_PrescalerConfig
 583                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 585  0010 7b07          	ld	a,(OFST+7,sp)
 586  0012 97            	ld	xl,a
 587  0013 7b06          	ld	a,(OFST+6,sp)
 588  0015 95            	ld	xh,a
 589  0016 cd0000        	call	_ADC1_ExternalTriggerConfig
 591                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 593  0019 7b0a          	ld	a,(OFST+10,sp)
 594  001b 97            	ld	xl,a
 595  001c 7b09          	ld	a,(OFST+9,sp)
 596  001e 95            	ld	xh,a
 597  001f cd0000        	call	_ADC1_SchmittTriggerConfig
 599                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 601  0022 72105401      	bset	21505,#0
 602                     ; 119 }
 605  0026 85            	popw	x
 606  0027 81            	ret	
 641                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 641                     ; 127 {
 642                     .text:	section	.text,new
 643  0000               _ADC1_Cmd:
 647                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 649                     ; 131   if (NewState != DISABLE)
 651  0000 4d            	tnz	a
 652  0001 2705          	jreq	L362
 653                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 655  0003 72105401      	bset	21505,#0
 658  0007 81            	ret	
 659  0008               L362:
 660                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 662  0008 72115401      	bres	21505,#0
 663                     ; 139 }
 666  000c 81            	ret	
 701                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 701                     ; 147 {
 702                     .text:	section	.text,new
 703  0000               _ADC1_ScanModeCmd:
 707                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 709                     ; 151   if (NewState != DISABLE)
 711  0000 4d            	tnz	a
 712  0001 2705          	jreq	L503
 713                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 715  0003 72125402      	bset	21506,#1
 718  0007 81            	ret	
 719  0008               L503:
 720                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 722  0008 72135402      	bres	21506,#1
 723                     ; 159 }
 726  000c 81            	ret	
 761                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 761                     ; 167 {
 762                     .text:	section	.text,new
 763  0000               _ADC1_DataBufferCmd:
 767                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 769                     ; 171   if (NewState != DISABLE)
 771  0000 4d            	tnz	a
 772  0001 2705          	jreq	L723
 773                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 775  0003 721e5403      	bset	21507,#7
 778  0007 81            	ret	
 779  0008               L723:
 780                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 782  0008 721f5403      	bres	21507,#7
 783                     ; 179 }
 786  000c 81            	ret	
 942                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 942                     ; 191 {
 943                     .text:	section	.text,new
 944  0000               _ADC1_ITConfig:
 946  0000 89            	pushw	x
 947       00000000      OFST:	set	0
 950                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 952                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 954                     ; 196   if (NewState != DISABLE)
 956  0001 7b05          	ld	a,(OFST+5,sp)
 957  0003 2706          	jreq	L714
 958                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 960  0005 9f            	ld	a,xl
 961  0006 ca5400        	or	a,21504
 963  0009 2006          	jra	L124
 964  000b               L714:
 965                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 967  000b 7b02          	ld	a,(OFST+2,sp)
 968  000d 43            	cpl	a
 969  000e c45400        	and	a,21504
 970  0011               L124:
 971  0011 c75400        	ld	21504,a
 972                     ; 206 }
 975  0014 85            	popw	x
 976  0015 81            	ret	
1012                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1012                     ; 215 {
1013                     .text:	section	.text,new
1014  0000               _ADC1_PrescalerConfig:
1016  0000 88            	push	a
1017       00000000      OFST:	set	0
1020                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1022                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1024  0001 c65401        	ld	a,21505
1025  0004 a48f          	and	a,#143
1026  0006 c75401        	ld	21505,a
1027                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1029  0009 c65401        	ld	a,21505
1030  000c 1a01          	or	a,(OFST+1,sp)
1031  000e c75401        	ld	21505,a
1032                     ; 223 }
1035  0011 84            	pop	a
1036  0012 81            	ret	
1083                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1083                     ; 234 {
1084                     .text:	section	.text,new
1085  0000               _ADC1_SchmittTriggerConfig:
1087  0000 89            	pushw	x
1088       00000000      OFST:	set	0
1091                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1093                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1095                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1097  0001 9e            	ld	a,xh
1098  0002 4c            	inc	a
1099  0003 261d          	jrne	L364
1100                     ; 241     if (NewState != DISABLE)
1102  0005 9f            	ld	a,xl
1103  0006 4d            	tnz	a
1104  0007 270a          	jreq	L564
1105                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1107  0009 725f5407      	clr	21511
1108                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1110  000d 725f5406      	clr	21510
1112  0011 2059          	jra	L174
1113  0013               L564:
1114                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1116  0013 c65407        	ld	a,21511
1117  0016 aaff          	or	a,#255
1118  0018 c75407        	ld	21511,a
1119                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1121  001b c65406        	ld	a,21510
1122  001e aaff          	or	a,#255
1123  0020 2047          	jp	LC001
1124  0022               L364:
1125                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1127  0022 7b01          	ld	a,(OFST+1,sp)
1128  0024 a108          	cp	a,#8
1129  0026 0d02          	tnz	(OFST+2,sp)
1130  0028 2420          	jruge	L374
1131                     ; 254     if (NewState != DISABLE)
1133  002a 2711          	jreq	L574
1134                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1136  002c ad40          	call	LC003
1137  002e 2704          	jreq	L43
1138  0030               L63:
1139  0030 48            	sll	a
1140  0031 5a            	decw	x
1141  0032 26fc          	jrne	L63
1142  0034               L43:
1143  0034 43            	cpl	a
1144  0035 c45407        	and	a,21511
1145  0038               LC002:
1146  0038 c75407        	ld	21511,a
1148  003b 202f          	jra	L174
1149  003d               L574:
1150                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1152  003d ad2f          	call	LC003
1153  003f 2704          	jreq	L04
1154  0041               L24:
1155  0041 48            	sll	a
1156  0042 5a            	decw	x
1157  0043 26fc          	jrne	L24
1158  0045               L04:
1159  0045 ca5407        	or	a,21511
1160  0048 20ee          	jp	LC002
1161  004a               L374:
1162                     ; 265     if (NewState != DISABLE)
1164  004a 2710          	jreq	L305
1165                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1167  004c a008          	sub	a,#8
1168  004e ad1e          	call	LC003
1169  0050 2704          	jreq	L44
1170  0052               L64:
1171  0052 48            	sll	a
1172  0053 5a            	decw	x
1173  0054 26fc          	jrne	L64
1174  0056               L44:
1175  0056 43            	cpl	a
1176  0057 c45406        	and	a,21510
1178  005a 200d          	jp	LC001
1179  005c               L305:
1180                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1182  005c a008          	sub	a,#8
1183  005e ad0e          	call	LC003
1184  0060 2704          	jreq	L05
1185  0062               L25:
1186  0062 48            	sll	a
1187  0063 5a            	decw	x
1188  0064 26fc          	jrne	L25
1189  0066               L05:
1190  0066 ca5406        	or	a,21510
1191  0069               LC001:
1192  0069 c75406        	ld	21510,a
1193  006c               L174:
1194                     ; 274 }
1197  006c 85            	popw	x
1198  006d 81            	ret	
1199  006e               LC003:
1200  006e 5f            	clrw	x
1201  006f 97            	ld	xl,a
1202  0070 a601          	ld	a,#1
1203  0072 5d            	tnzw	x
1204  0073 81            	ret	
1261                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1261                     ; 287 {
1262                     .text:	section	.text,new
1263  0000               _ADC1_ConversionConfig:
1265  0000 89            	pushw	x
1266       00000000      OFST:	set	0
1269                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1271                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1273                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1275                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1277  0001 72175402      	bres	21506,#3
1278                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1280  0005 c65402        	ld	a,21506
1281  0008 1a05          	or	a,(OFST+5,sp)
1282  000a c75402        	ld	21506,a
1283                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1285  000d 9e            	ld	a,xh
1286  000e 4a            	dec	a
1287  000f 2606          	jrne	L535
1288                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1290  0011 72125401      	bset	21505,#1
1292  0015 2004          	jra	L735
1293  0017               L535:
1294                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1296  0017 72135401      	bres	21505,#1
1297  001b               L735:
1298                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1300  001b c65400        	ld	a,21504
1301  001e a4f0          	and	a,#240
1302  0020 c75400        	ld	21504,a
1303                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1305  0023 c65400        	ld	a,21504
1306  0026 1a02          	or	a,(OFST+2,sp)
1307  0028 c75400        	ld	21504,a
1308                     ; 313 }
1311  002b 85            	popw	x
1312  002c 81            	ret	
1358                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1358                     ; 326 {
1359                     .text:	section	.text,new
1360  0000               _ADC1_ExternalTriggerConfig:
1362  0000 89            	pushw	x
1363       00000000      OFST:	set	0
1366                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1368                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1370                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1372  0001 c65402        	ld	a,21506
1373  0004 a4cf          	and	a,#207
1374  0006 c75402        	ld	21506,a
1375                     ; 334   if (NewState != DISABLE)
1377  0009 9f            	ld	a,xl
1378  000a 4d            	tnz	a
1379  000b 2706          	jreq	L365
1380                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1382  000d 721c5402      	bset	21506,#6
1384  0011 2004          	jra	L565
1385  0013               L365:
1386                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1388  0013 721d5402      	bres	21506,#6
1389  0017               L565:
1390                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1392  0017 c65402        	ld	a,21506
1393  001a 1a01          	or	a,(OFST+1,sp)
1394  001c c75402        	ld	21506,a
1395                     ; 347 }
1398  001f 85            	popw	x
1399  0020 81            	ret	
1423                     ; 358 void ADC1_StartConversion(void)
1423                     ; 359 {
1424                     .text:	section	.text,new
1425  0000               _ADC1_StartConversion:
1429                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1431  0000 72105401      	bset	21505,#0
1432                     ; 361 }
1435  0004 81            	ret	
1479                     ; 370 uint16_t ADC1_GetConversionValue(void)
1479                     ; 371 {
1480                     .text:	section	.text,new
1481  0000               _ADC1_GetConversionValue:
1483  0000 5205          	subw	sp,#5
1484       00000005      OFST:	set	5
1487                     ; 372   uint16_t temph = 0;
1489                     ; 373   uint8_t templ = 0;
1491                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1493  0002 720754020e    	btjf	21506,#3,L126
1494                     ; 378     templ = ADC1->DRL;
1496  0007 c65405        	ld	a,21509
1497  000a 6b03          	ld	(OFST-2,sp),a
1499                     ; 380     temph = ADC1->DRH;
1501  000c c65404        	ld	a,21508
1502  000f 97            	ld	xl,a
1504                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1506  0010 7b03          	ld	a,(OFST-2,sp)
1507  0012 02            	rlwa	x,a
1510  0013 201a          	jra	L326
1511  0015               L126:
1512                     ; 387     temph = ADC1->DRH;
1514  0015 c65404        	ld	a,21508
1515  0018 97            	ld	xl,a
1517                     ; 389     templ = ADC1->DRL;
1519  0019 c65405        	ld	a,21509
1520  001c 6b03          	ld	(OFST-2,sp),a
1522                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1524  001e 4f            	clr	a
1525  001f 02            	rlwa	x,a
1526  0020 1f01          	ldw	(OFST-4,sp),x
1528  0022 7b03          	ld	a,(OFST-2,sp)
1529  0024 97            	ld	xl,a
1530  0025 a640          	ld	a,#64
1531  0027 42            	mul	x,a
1532  0028 01            	rrwa	x,a
1533  0029 1a02          	or	a,(OFST-3,sp)
1534  002b 01            	rrwa	x,a
1535  002c 1a01          	or	a,(OFST-4,sp)
1536  002e 01            	rrwa	x,a
1538  002f               L326:
1539                     ; 394   return ((uint16_t)temph);
1543  002f 5b05          	addw	sp,#5
1544  0031 81            	ret	
1590                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1590                     ; 406 {
1591                     .text:	section	.text,new
1592  0000               _ADC1_AWDChannelConfig:
1594  0000 89            	pushw	x
1595       00000000      OFST:	set	0
1598                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1600                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1602                     ; 411   if (Channel < (uint8_t)8)
1604  0001 9e            	ld	a,xh
1605  0002 a108          	cp	a,#8
1606  0004 2425          	jruge	L746
1607                     ; 413     if (NewState != DISABLE)
1609  0006 9f            	ld	a,xl
1610  0007 4d            	tnz	a
1611  0008 270e          	jreq	L156
1612                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1614  000a 9e            	ld	a,xh
1615  000b ad48          	call	LC006
1616  000d 2704          	jreq	L66
1617  000f               L07:
1618  000f 48            	sll	a
1619  0010 5a            	decw	x
1620  0011 26fc          	jrne	L07
1621  0013               L66:
1622  0013 ca540f        	or	a,21519
1624  0016 200e          	jp	LC005
1625  0018               L156:
1626                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1628  0018 7b01          	ld	a,(OFST+1,sp)
1629  001a ad39          	call	LC006
1630  001c 2704          	jreq	L27
1631  001e               L47:
1632  001e 48            	sll	a
1633  001f 5a            	decw	x
1634  0020 26fc          	jrne	L47
1635  0022               L27:
1636  0022 43            	cpl	a
1637  0023 c4540f        	and	a,21519
1638  0026               LC005:
1639  0026 c7540f        	ld	21519,a
1640  0029 2028          	jra	L556
1641  002b               L746:
1642                     ; 424     if (NewState != DISABLE)
1644  002b 7b02          	ld	a,(OFST+2,sp)
1645  002d 2711          	jreq	L756
1646                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1648  002f 7b01          	ld	a,(OFST+1,sp)
1649  0031 a008          	sub	a,#8
1650  0033 ad20          	call	LC006
1651  0035 2704          	jreq	L67
1652  0037               L001:
1653  0037 48            	sll	a
1654  0038 5a            	decw	x
1655  0039 26fc          	jrne	L001
1656  003b               L67:
1657  003b ca540e        	or	a,21518
1659  003e 2010          	jp	LC004
1660  0040               L756:
1661                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1663  0040 7b01          	ld	a,(OFST+1,sp)
1664  0042 a008          	sub	a,#8
1665  0044 ad0f          	call	LC006
1666  0046 2704          	jreq	L201
1667  0048               L401:
1668  0048 48            	sll	a
1669  0049 5a            	decw	x
1670  004a 26fc          	jrne	L401
1671  004c               L201:
1672  004c 43            	cpl	a
1673  004d c4540e        	and	a,21518
1674  0050               LC004:
1675  0050 c7540e        	ld	21518,a
1676  0053               L556:
1677                     ; 433 }
1680  0053 85            	popw	x
1681  0054 81            	ret	
1682  0055               LC006:
1683  0055 5f            	clrw	x
1684  0056 97            	ld	xl,a
1685  0057 a601          	ld	a,#1
1686  0059 5d            	tnzw	x
1687  005a 81            	ret	
1722                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1722                     ; 442 {
1723                     .text:	section	.text,new
1724  0000               _ADC1_SetHighThreshold:
1726  0000 89            	pushw	x
1727       00000000      OFST:	set	0
1730                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1732  0001 54            	srlw	x
1733  0002 54            	srlw	x
1734  0003 9f            	ld	a,xl
1735  0004 c75408        	ld	21512,a
1736                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1738  0007 7b02          	ld	a,(OFST+2,sp)
1739  0009 c75409        	ld	21513,a
1740                     ; 445 }
1743  000c 85            	popw	x
1744  000d 81            	ret	
1779                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1779                     ; 454 {
1780                     .text:	section	.text,new
1781  0000               _ADC1_SetLowThreshold:
1785                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1787  0000 9f            	ld	a,xl
1788  0001 c7540b        	ld	21515,a
1789                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1791  0004 54            	srlw	x
1792  0005 54            	srlw	x
1793  0006 9f            	ld	a,xl
1794  0007 c7540a        	ld	21514,a
1795                     ; 457 }
1798  000a 81            	ret	
1851                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1851                     ; 467 {
1852                     .text:	section	.text,new
1853  0000               _ADC1_GetBufferValue:
1855  0000 88            	push	a
1856  0001 5205          	subw	sp,#5
1857       00000005      OFST:	set	5
1860                     ; 468   uint16_t temph = 0;
1862                     ; 469   uint8_t templ = 0;
1864                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1866                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1868  0003 48            	sll	a
1869  0004 5f            	clrw	x
1870  0005 97            	ld	xl,a
1871  0006 7207540213    	btjf	21506,#3,L547
1872                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1874  000b d653e1        	ld	a,(21473,x)
1875  000e 6b03          	ld	(OFST-2,sp),a
1877                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1879  0010 7b06          	ld	a,(OFST+1,sp)
1880  0012 48            	sll	a
1881  0013 5f            	clrw	x
1882  0014 97            	ld	xl,a
1883  0015 d653e0        	ld	a,(21472,x)
1884  0018 97            	ld	xl,a
1886                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1888  0019 7b03          	ld	a,(OFST-2,sp)
1889  001b 02            	rlwa	x,a
1892  001c 2024          	jra	L747
1893  001e               L547:
1894                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1896  001e d653e0        	ld	a,(21472,x)
1897  0021 5f            	clrw	x
1898  0022 97            	ld	xl,a
1899  0023 1f04          	ldw	(OFST-1,sp),x
1901                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1903  0025 7b06          	ld	a,(OFST+1,sp)
1904  0027 48            	sll	a
1905  0028 5f            	clrw	x
1906  0029 97            	ld	xl,a
1907  002a d653e1        	ld	a,(21473,x)
1908  002d 6b03          	ld	(OFST-2,sp),a
1910                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1912  002f 4f            	clr	a
1913  0030 1e04          	ldw	x,(OFST-1,sp)
1914  0032 02            	rlwa	x,a
1915  0033 1f01          	ldw	(OFST-4,sp),x
1917  0035 7b03          	ld	a,(OFST-2,sp)
1918  0037 97            	ld	xl,a
1919  0038 a640          	ld	a,#64
1920  003a 42            	mul	x,a
1921  003b 01            	rrwa	x,a
1922  003c 1a02          	or	a,(OFST-3,sp)
1923  003e 01            	rrwa	x,a
1924  003f 1a01          	or	a,(OFST-4,sp)
1925  0041 01            	rrwa	x,a
1927  0042               L747:
1928                     ; 493   return ((uint16_t)temph);
1932  0042 5b06          	addw	sp,#6
1933  0044 81            	ret	
1999                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
1999                     ; 503 {
2000                     .text:	section	.text,new
2001  0000               _ADC1_GetAWDChannelStatus:
2003       00000001      OFST:	set	1
2006                     ; 504   uint8_t status = 0;
2008                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2010                     ; 509   if (Channel < (uint8_t)8)
2012  0000 a108          	cp	a,#8
2013  0002 240f          	jruge	L3001
2014                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2016  0004 5f            	clrw	x
2017  0005 97            	ld	xl,a
2018  0006 a601          	ld	a,#1
2019  0008 5d            	tnzw	x
2020  0009 2704          	jreq	L611
2021  000b               L021:
2022  000b 48            	sll	a
2023  000c 5a            	decw	x
2024  000d 26fc          	jrne	L021
2025  000f               L611:
2026  000f c4540d        	and	a,21517
2030  0012 81            	ret	
2031  0013               L3001:
2032                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2034  0013 a008          	sub	a,#8
2035  0015 5f            	clrw	x
2036  0016 97            	ld	xl,a
2037  0017 a601          	ld	a,#1
2038  0019 5d            	tnzw	x
2039  001a 2704          	jreq	L221
2040  001c               L421:
2041  001c 48            	sll	a
2042  001d 5a            	decw	x
2043  001e 26fc          	jrne	L421
2044  0020               L221:
2045  0020 c4540c        	and	a,21516
2047                     ; 518   return ((FlagStatus)status);
2051  0023 81            	ret	
2209                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2209                     ; 528 {
2210                     .text:	section	.text,new
2211  0000               _ADC1_GetFlagStatus:
2213  0000 88            	push	a
2214  0001 88            	push	a
2215       00000001      OFST:	set	1
2218                     ; 529   uint8_t flagstatus = 0;
2220                     ; 530   uint8_t temp = 0;
2222                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2224                     ; 535   if ((Flag & 0x0F) == 0x01)
2226  0002 a40f          	and	a,#15
2227  0004 4a            	dec	a
2228  0005 2607          	jrne	L5701
2229                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2231  0007 c65403        	ld	a,21507
2232  000a a440          	and	a,#64
2235  000c 2039          	jra	L7701
2236  000e               L5701:
2237                     ; 540   else if ((Flag & 0xF0) == 0x10)
2239  000e 7b02          	ld	a,(OFST+1,sp)
2240  0010 a4f0          	and	a,#240
2241  0012 a110          	cp	a,#16
2242  0014 262c          	jrne	L1011
2243                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2245  0016 7b02          	ld	a,(OFST+1,sp)
2246  0018 a40f          	and	a,#15
2247  001a 6b01          	ld	(OFST+0,sp),a
2249                     ; 544     if (temp < 8)
2251  001c a108          	cp	a,#8
2252  001e 2410          	jruge	L3011
2253                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2255  0020 5f            	clrw	x
2256  0021 97            	ld	xl,a
2257  0022 a601          	ld	a,#1
2258  0024 5d            	tnzw	x
2259  0025 2704          	jreq	L031
2260  0027               L231:
2261  0027 48            	sll	a
2262  0028 5a            	decw	x
2263  0029 26fc          	jrne	L231
2264  002b               L031:
2265  002b c4540d        	and	a,21517
2268  002e 2017          	jra	L7701
2269  0030               L3011:
2270                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2272  0030 a008          	sub	a,#8
2273  0032 5f            	clrw	x
2274  0033 97            	ld	xl,a
2275  0034 a601          	ld	a,#1
2276  0036 5d            	tnzw	x
2277  0037 2704          	jreq	L431
2278  0039               L631:
2279  0039 48            	sll	a
2280  003a 5a            	decw	x
2281  003b 26fc          	jrne	L631
2282  003d               L431:
2283  003d c4540c        	and	a,21516
2285  0040 2005          	jra	L7701
2286  0042               L1011:
2287                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2289  0042 c65400        	ld	a,21504
2290  0045 1402          	and	a,(OFST+1,sp)
2292  0047               L7701:
2293                     ; 557   return ((FlagStatus)flagstatus);
2297  0047 85            	popw	x
2298  0048 81            	ret	
2342                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2342                     ; 568 {
2343                     .text:	section	.text,new
2344  0000               _ADC1_ClearFlag:
2346  0000 88            	push	a
2347  0001 88            	push	a
2348       00000001      OFST:	set	1
2351                     ; 569   uint8_t temp = 0;
2353                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2355                     ; 574   if ((Flag & 0x0F) == 0x01)
2357  0002 a40f          	and	a,#15
2358  0004 4a            	dec	a
2359  0005 2606          	jrne	L3311
2360                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2362  0007 721d5403      	bres	21507,#6
2364  000b 2045          	jra	L5311
2365  000d               L3311:
2366                     ; 579   else if ((Flag & 0xF0) == 0x10)
2368  000d 7b02          	ld	a,(OFST+1,sp)
2369  000f a4f0          	and	a,#240
2370  0011 a110          	cp	a,#16
2371  0013 2634          	jrne	L7311
2372                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2374  0015 7b02          	ld	a,(OFST+1,sp)
2375  0017 a40f          	and	a,#15
2376  0019 6b01          	ld	(OFST+0,sp),a
2378                     ; 583     if (temp < 8)
2380  001b a108          	cp	a,#8
2381  001d 2414          	jruge	L1411
2382                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2384  001f 5f            	clrw	x
2385  0020 97            	ld	xl,a
2386  0021 a601          	ld	a,#1
2387  0023 5d            	tnzw	x
2388  0024 2704          	jreq	L241
2389  0026               L441:
2390  0026 48            	sll	a
2391  0027 5a            	decw	x
2392  0028 26fc          	jrne	L441
2393  002a               L241:
2394  002a 43            	cpl	a
2395  002b c4540d        	and	a,21517
2396  002e c7540d        	ld	21517,a
2398  0031 201f          	jra	L5311
2399  0033               L1411:
2400                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2402  0033 a008          	sub	a,#8
2403  0035 5f            	clrw	x
2404  0036 97            	ld	xl,a
2405  0037 a601          	ld	a,#1
2406  0039 5d            	tnzw	x
2407  003a 2704          	jreq	L641
2408  003c               L051:
2409  003c 48            	sll	a
2410  003d 5a            	decw	x
2411  003e 26fc          	jrne	L051
2412  0040               L641:
2413  0040 43            	cpl	a
2414  0041 c4540c        	and	a,21516
2415  0044 c7540c        	ld	21516,a
2416  0047 2009          	jra	L5311
2417  0049               L7311:
2418                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2420  0049 7b02          	ld	a,(OFST+1,sp)
2421  004b 43            	cpl	a
2422  004c c45400        	and	a,21504
2423  004f c75400        	ld	21504,a
2424  0052               L5311:
2425                     ; 596 }
2428  0052 85            	popw	x
2429  0053 81            	ret	
2484                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2484                     ; 617 {
2485                     .text:	section	.text,new
2486  0000               _ADC1_GetITStatus:
2488  0000 89            	pushw	x
2489  0001 88            	push	a
2490       00000001      OFST:	set	1
2493                     ; 618   ITStatus itstatus = RESET;
2495                     ; 619   uint8_t temp = 0;
2497                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2499                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2501  0002 01            	rrwa	x,a
2502  0003 a4f0          	and	a,#240
2503  0005 5f            	clrw	x
2504  0006 02            	rlwa	x,a
2505  0007 a30010        	cpw	x,#16
2506  000a 262c          	jrne	L5711
2507                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2509  000c 7b03          	ld	a,(OFST+2,sp)
2510  000e a40f          	and	a,#15
2511  0010 6b01          	ld	(OFST+0,sp),a
2513                     ; 628     if (temp < 8)
2515  0012 a108          	cp	a,#8
2516  0014 2410          	jruge	L7711
2517                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2519  0016 5f            	clrw	x
2520  0017 97            	ld	xl,a
2521  0018 a601          	ld	a,#1
2522  001a 5d            	tnzw	x
2523  001b 2704          	jreq	L451
2524  001d               L651:
2525  001d 48            	sll	a
2526  001e 5a            	decw	x
2527  001f 26fc          	jrne	L651
2528  0021               L451:
2529  0021 c4540d        	and	a,21517
2532  0024 2017          	jra	L3021
2533  0026               L7711:
2534                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2536  0026 a008          	sub	a,#8
2537  0028 5f            	clrw	x
2538  0029 97            	ld	xl,a
2539  002a a601          	ld	a,#1
2540  002c 5d            	tnzw	x
2541  002d 2704          	jreq	L061
2542  002f               L261:
2543  002f 48            	sll	a
2544  0030 5a            	decw	x
2545  0031 26fc          	jrne	L261
2546  0033               L061:
2547  0033 c4540c        	and	a,21516
2549  0036 2005          	jra	L3021
2550  0038               L5711:
2551                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2553  0038 c65400        	ld	a,21504
2554  003b 1403          	and	a,(OFST+2,sp)
2556  003d               L3021:
2557                     ; 641   return ((ITStatus)itstatus);
2561  003d 5b03          	addw	sp,#3
2562  003f 81            	ret	
2607                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2607                     ; 663 {
2608                     .text:	section	.text,new
2609  0000               _ADC1_ClearITPendingBit:
2611  0000 89            	pushw	x
2612  0001 88            	push	a
2613       00000001      OFST:	set	1
2616                     ; 664   uint8_t temp = 0;
2618                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2620                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2622  0002 01            	rrwa	x,a
2623  0003 a4f0          	and	a,#240
2624  0005 5f            	clrw	x
2625  0006 02            	rlwa	x,a
2626  0007 a30010        	cpw	x,#16
2627  000a 2634          	jrne	L7221
2628                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2630  000c 7b03          	ld	a,(OFST+2,sp)
2631  000e a40f          	and	a,#15
2632  0010 6b01          	ld	(OFST+0,sp),a
2634                     ; 673     if (temp < 8)
2636  0012 a108          	cp	a,#8
2637  0014 2414          	jruge	L1321
2638                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2640  0016 5f            	clrw	x
2641  0017 97            	ld	xl,a
2642  0018 a601          	ld	a,#1
2643  001a 5d            	tnzw	x
2644  001b 2704          	jreq	L661
2645  001d               L071:
2646  001d 48            	sll	a
2647  001e 5a            	decw	x
2648  001f 26fc          	jrne	L071
2649  0021               L661:
2650  0021 43            	cpl	a
2651  0022 c4540d        	and	a,21517
2652  0025 c7540d        	ld	21517,a
2654  0028 201f          	jra	L5321
2655  002a               L1321:
2656                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2658  002a a008          	sub	a,#8
2659  002c 5f            	clrw	x
2660  002d 97            	ld	xl,a
2661  002e a601          	ld	a,#1
2662  0030 5d            	tnzw	x
2663  0031 2704          	jreq	L271
2664  0033               L471:
2665  0033 48            	sll	a
2666  0034 5a            	decw	x
2667  0035 26fc          	jrne	L471
2668  0037               L271:
2669  0037 43            	cpl	a
2670  0038 c4540c        	and	a,21516
2671  003b c7540c        	ld	21516,a
2672  003e 2009          	jra	L5321
2673  0040               L7221:
2674                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2676  0040 7b03          	ld	a,(OFST+2,sp)
2677  0042 43            	cpl	a
2678  0043 c45400        	and	a,21504
2679  0046 c75400        	ld	21504,a
2680  0049               L5321:
2681                     ; 686 }
2684  0049 5b03          	addw	sp,#3
2685  004b 81            	ret	
2698                     	xdef	_ADC1_ClearITPendingBit
2699                     	xdef	_ADC1_GetITStatus
2700                     	xdef	_ADC1_ClearFlag
2701                     	xdef	_ADC1_GetFlagStatus
2702                     	xdef	_ADC1_GetAWDChannelStatus
2703                     	xdef	_ADC1_GetBufferValue
2704                     	xdef	_ADC1_SetLowThreshold
2705                     	xdef	_ADC1_SetHighThreshold
2706                     	xdef	_ADC1_GetConversionValue
2707                     	xdef	_ADC1_StartConversion
2708                     	xdef	_ADC1_AWDChannelConfig
2709                     	xdef	_ADC1_ExternalTriggerConfig
2710                     	xdef	_ADC1_ConversionConfig
2711                     	xdef	_ADC1_SchmittTriggerConfig
2712                     	xdef	_ADC1_PrescalerConfig
2713                     	xdef	_ADC1_ITConfig
2714                     	xdef	_ADC1_DataBufferCmd
2715                     	xdef	_ADC1_ScanModeCmd
2716                     	xdef	_ADC1_Cmd
2717                     	xdef	_ADC1_Init
2718                     	xdef	_ADC1_DeInit
2737                     	end
