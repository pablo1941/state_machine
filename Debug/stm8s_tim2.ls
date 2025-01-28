   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  48                     ; 52 void TIM2_DeInit(void)
  48                     ; 53 {
  50                     .text:	section	.text,new
  51  0000               _TIM2_DeInit:
  55                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  57  0000 725f5300      	clr	21248
  58                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  60  0004 725f5303      	clr	21251
  61                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  63  0008 725f5305      	clr	21253
  64                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  66  000c 725f530a      	clr	21258
  67                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  69  0010 725f530b      	clr	21259
  70                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  72  0014 725f530a      	clr	21258
  73                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  75  0018 725f530b      	clr	21259
  76                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  78  001c 725f5307      	clr	21255
  79                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  81  0020 725f5308      	clr	21256
  82                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  84  0024 725f5309      	clr	21257
  85                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  87  0028 725f530c      	clr	21260
  88                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  90  002c 725f530d      	clr	21261
  91                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  93  0030 725f530e      	clr	21262
  94                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  96  0034 35ff530f      	mov	21263,#255
  97                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  99  0038 35ff5310      	mov	21264,#255
 100                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 102  003c 725f5311      	clr	21265
 103                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 105  0040 725f5312      	clr	21266
 106                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 108  0044 725f5313      	clr	21267
 109                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 111  0048 725f5314      	clr	21268
 112                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 114  004c 725f5315      	clr	21269
 115                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 117  0050 725f5316      	clr	21270
 118                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 120  0054 725f5304      	clr	21252
 121                     ; 81 }
 124  0058 81            	ret	
 292                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 292                     ; 90                         uint16_t TIM2_Period)
 292                     ; 91 {
 293                     .text:	section	.text,new
 294  0000               _TIM2_TimeBaseInit:
 296       ffffffff      OFST: set -1
 299                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 301  0000 c7530e        	ld	21262,a
 302                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 304  0003 7b03          	ld	a,(OFST+4,sp)
 305  0005 c7530f        	ld	21263,a
 306                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 308  0008 7b04          	ld	a,(OFST+5,sp)
 309  000a c75310        	ld	21264,a
 310                     ; 97 }
 313  000d 81            	ret	
 470                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 470                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 470                     ; 110                   uint16_t TIM2_Pulse,
 470                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 470                     ; 112 {
 471                     .text:	section	.text,new
 472  0000               _TIM2_OC1Init:
 474  0000 89            	pushw	x
 475  0001 88            	push	a
 476       00000001      OFST:	set	1
 479                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 481                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 483                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 485                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 487  0002 c6530a        	ld	a,21258
 488  0005 a4fc          	and	a,#252
 489  0007 c7530a        	ld	21258,a
 490                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 490                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 492  000a 7b08          	ld	a,(OFST+7,sp)
 493  000c a402          	and	a,#2
 494  000e 6b01          	ld	(OFST+0,sp),a
 496  0010 9f            	ld	a,xl
 497  0011 a401          	and	a,#1
 498  0013 1a01          	or	a,(OFST+0,sp)
 499  0015 ca530a        	or	a,21258
 500  0018 c7530a        	ld	21258,a
 501                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 501                     ; 126                           (uint8_t)TIM2_OCMode);
 503  001b c65307        	ld	a,21255
 504  001e a48f          	and	a,#143
 505  0020 1a02          	or	a,(OFST+1,sp)
 506  0022 c75307        	ld	21255,a
 507                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 509  0025 7b06          	ld	a,(OFST+5,sp)
 510  0027 c75311        	ld	21265,a
 511                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 513  002a 7b07          	ld	a,(OFST+6,sp)
 514  002c c75312        	ld	21266,a
 515                     ; 131 }
 518  002f 5b03          	addw	sp,#3
 519  0031 81            	ret	
 583                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 583                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 583                     ; 144                   uint16_t TIM2_Pulse,
 583                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 583                     ; 146 {
 584                     .text:	section	.text,new
 585  0000               _TIM2_OC2Init:
 587  0000 89            	pushw	x
 588  0001 88            	push	a
 589       00000001      OFST:	set	1
 592                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 594                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 596                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 598                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 600  0002 c6530a        	ld	a,21258
 601  0005 a4cf          	and	a,#207
 602  0007 c7530a        	ld	21258,a
 603                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 603                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 605  000a 7b08          	ld	a,(OFST+7,sp)
 606  000c a420          	and	a,#32
 607  000e 6b01          	ld	(OFST+0,sp),a
 609  0010 9f            	ld	a,xl
 610  0011 a410          	and	a,#16
 611  0013 1a01          	or	a,(OFST+0,sp)
 612  0015 ca530a        	or	a,21258
 613  0018 c7530a        	ld	21258,a
 614                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 614                     ; 162                           (uint8_t)TIM2_OCMode);
 616  001b c65308        	ld	a,21256
 617  001e a48f          	and	a,#143
 618  0020 1a02          	or	a,(OFST+1,sp)
 619  0022 c75308        	ld	21256,a
 620                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 622  0025 7b06          	ld	a,(OFST+5,sp)
 623  0027 c75313        	ld	21267,a
 624                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 626  002a 7b07          	ld	a,(OFST+6,sp)
 627  002c c75314        	ld	21268,a
 628                     ; 168 }
 631  002f 5b03          	addw	sp,#3
 632  0031 81            	ret	
 696                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 696                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 696                     ; 181                   uint16_t TIM2_Pulse,
 696                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 696                     ; 183 {
 697                     .text:	section	.text,new
 698  0000               _TIM2_OC3Init:
 700  0000 89            	pushw	x
 701  0001 88            	push	a
 702       00000001      OFST:	set	1
 705                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 707                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 709                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 711                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 713  0002 c6530b        	ld	a,21259
 714  0005 a4fc          	and	a,#252
 715  0007 c7530b        	ld	21259,a
 716                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 716                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 718  000a 7b08          	ld	a,(OFST+7,sp)
 719  000c a402          	and	a,#2
 720  000e 6b01          	ld	(OFST+0,sp),a
 722  0010 9f            	ld	a,xl
 723  0011 a401          	and	a,#1
 724  0013 1a01          	or	a,(OFST+0,sp)
 725  0015 ca530b        	or	a,21259
 726  0018 c7530b        	ld	21259,a
 727                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 727                     ; 196                           (uint8_t)TIM2_OCMode);
 729  001b c65309        	ld	a,21257
 730  001e a48f          	and	a,#143
 731  0020 1a02          	or	a,(OFST+1,sp)
 732  0022 c75309        	ld	21257,a
 733                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 735  0025 7b06          	ld	a,(OFST+5,sp)
 736  0027 c75315        	ld	21269,a
 737                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 739  002a 7b07          	ld	a,(OFST+6,sp)
 740  002c c75316        	ld	21270,a
 741                     ; 201 }
 744  002f 5b03          	addw	sp,#3
 745  0031 81            	ret	
 938                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 938                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 938                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 938                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 938                     ; 216                  uint8_t TIM2_ICFilter)
 938                     ; 217 {
 939                     .text:	section	.text,new
 940  0000               _TIM2_ICInit:
 942  0000 89            	pushw	x
 943       00000000      OFST:	set	0
 946                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 948                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 950                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 952                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 954                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 956                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 958  0001 9e            	ld	a,xh
 959  0002 4d            	tnz	a
 960  0003 2614          	jrne	L104
 961                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 961                     ; 229                (uint8_t)TIM2_ICSelection,
 961                     ; 230                (uint8_t)TIM2_ICFilter);
 963  0005 7b07          	ld	a,(OFST+7,sp)
 964  0007 88            	push	a
 965  0008 7b06          	ld	a,(OFST+6,sp)
 966  000a 97            	ld	xl,a
 967  000b 7b03          	ld	a,(OFST+3,sp)
 968  000d 95            	ld	xh,a
 969  000e cd0000        	call	L3_TI1_Config
 971  0011 84            	pop	a
 972                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 974  0012 7b06          	ld	a,(OFST+6,sp)
 975  0014 cd0000        	call	_TIM2_SetIC1Prescaler
 978  0017 202b          	jra	L304
 979  0019               L104:
 980                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 982  0019 7b01          	ld	a,(OFST+1,sp)
 983  001b 4a            	dec	a
 984  001c 2614          	jrne	L504
 985                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 985                     ; 239                (uint8_t)TIM2_ICSelection,
 985                     ; 240                (uint8_t)TIM2_ICFilter);
 987  001e 7b07          	ld	a,(OFST+7,sp)
 988  0020 88            	push	a
 989  0021 7b06          	ld	a,(OFST+6,sp)
 990  0023 97            	ld	xl,a
 991  0024 7b03          	ld	a,(OFST+3,sp)
 992  0026 95            	ld	xh,a
 993  0027 cd0000        	call	L5_TI2_Config
 995  002a 84            	pop	a
 996                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 998  002b 7b06          	ld	a,(OFST+6,sp)
 999  002d cd0000        	call	_TIM2_SetIC2Prescaler
1002  0030 2012          	jra	L304
1003  0032               L504:
1004                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1004                     ; 249                (uint8_t)TIM2_ICSelection,
1004                     ; 250                (uint8_t)TIM2_ICFilter);
1006  0032 7b07          	ld	a,(OFST+7,sp)
1007  0034 88            	push	a
1008  0035 7b06          	ld	a,(OFST+6,sp)
1009  0037 97            	ld	xl,a
1010  0038 7b03          	ld	a,(OFST+3,sp)
1011  003a 95            	ld	xh,a
1012  003b cd0000        	call	L7_TI3_Config
1014  003e 84            	pop	a
1015                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1017  003f 7b06          	ld	a,(OFST+6,sp)
1018  0041 cd0000        	call	_TIM2_SetIC3Prescaler
1020  0044               L304:
1021                     ; 255 }
1024  0044 85            	popw	x
1025  0045 81            	ret	
1121                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1121                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1121                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1121                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1121                     ; 270                      uint8_t TIM2_ICFilter)
1121                     ; 271 {
1122                     .text:	section	.text,new
1123  0000               _TIM2_PWMIConfig:
1125  0000 89            	pushw	x
1126  0001 89            	pushw	x
1127       00000002      OFST:	set	2
1130                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1132                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1134                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1136                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1138                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1140                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1142                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1144  0002 9f            	ld	a,xl
1145  0003 a144          	cp	a,#68
1146  0005 2706          	jreq	L754
1147                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1149  0007 a644          	ld	a,#68
1150  0009 6b01          	ld	(OFST-1,sp),a
1153  000b 2002          	jra	L164
1154  000d               L754:
1155                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1157  000d 0f01          	clr	(OFST-1,sp)
1159  000f               L164:
1160                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1162  000f 7b07          	ld	a,(OFST+5,sp)
1163  0011 4a            	dec	a
1164  0012 2604          	jrne	L364
1165                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1167  0014 a602          	ld	a,#2
1169  0016 2002          	jra	L564
1170  0018               L364:
1171                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1173  0018 a601          	ld	a,#1
1174  001a               L564:
1175  001a 6b02          	ld	(OFST+0,sp),a
1177                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1179  001c 7b03          	ld	a,(OFST+1,sp)
1180  001e 2626          	jrne	L764
1181                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1181                     ; 305                (uint8_t)TIM2_ICFilter);
1183  0020 7b09          	ld	a,(OFST+7,sp)
1184  0022 88            	push	a
1185  0023 7b08          	ld	a,(OFST+6,sp)
1186  0025 97            	ld	xl,a
1187  0026 7b05          	ld	a,(OFST+3,sp)
1188  0028 95            	ld	xh,a
1189  0029 cd0000        	call	L3_TI1_Config
1191  002c 84            	pop	a
1192                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1194  002d 7b08          	ld	a,(OFST+6,sp)
1195  002f cd0000        	call	_TIM2_SetIC1Prescaler
1197                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1199  0032 7b09          	ld	a,(OFST+7,sp)
1200  0034 88            	push	a
1201  0035 7b03          	ld	a,(OFST+1,sp)
1202  0037 97            	ld	xl,a
1203  0038 7b02          	ld	a,(OFST+0,sp)
1204  003a 95            	ld	xh,a
1205  003b cd0000        	call	L5_TI2_Config
1207  003e 84            	pop	a
1208                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1210  003f 7b08          	ld	a,(OFST+6,sp)
1211  0041 cd0000        	call	_TIM2_SetIC2Prescaler
1214  0044 2024          	jra	L174
1215  0046               L764:
1216                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1216                     ; 320                (uint8_t)TIM2_ICFilter);
1218  0046 7b09          	ld	a,(OFST+7,sp)
1219  0048 88            	push	a
1220  0049 7b08          	ld	a,(OFST+6,sp)
1221  004b 97            	ld	xl,a
1222  004c 7b05          	ld	a,(OFST+3,sp)
1223  004e 95            	ld	xh,a
1224  004f cd0000        	call	L5_TI2_Config
1226  0052 84            	pop	a
1227                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1229  0053 7b08          	ld	a,(OFST+6,sp)
1230  0055 cd0000        	call	_TIM2_SetIC2Prescaler
1232                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1234  0058 7b09          	ld	a,(OFST+7,sp)
1235  005a 88            	push	a
1236  005b 7b03          	ld	a,(OFST+1,sp)
1237  005d 97            	ld	xl,a
1238  005e 7b02          	ld	a,(OFST+0,sp)
1239  0060 95            	ld	xh,a
1240  0061 cd0000        	call	L3_TI1_Config
1242  0064 84            	pop	a
1243                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1245  0065 7b08          	ld	a,(OFST+6,sp)
1246  0067 cd0000        	call	_TIM2_SetIC1Prescaler
1248  006a               L174:
1249                     ; 331 }
1252  006a 5b04          	addw	sp,#4
1253  006c 81            	ret	
1308                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1308                     ; 340 {
1309                     .text:	section	.text,new
1310  0000               _TIM2_Cmd:
1314                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1316                     ; 345   if (NewState != DISABLE)
1318  0000 4d            	tnz	a
1319  0001 2705          	jreq	L125
1320                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1322  0003 72105300      	bset	21248,#0
1325  0007 81            	ret	
1326  0008               L125:
1327                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1329  0008 72115300      	bres	21248,#0
1330                     ; 353 }
1333  000c 81            	ret	
1412                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1412                     ; 369 {
1413                     .text:	section	.text,new
1414  0000               _TIM2_ITConfig:
1416  0000 89            	pushw	x
1417       00000000      OFST:	set	0
1420                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1422                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1424                     ; 374   if (NewState != DISABLE)
1426  0001 9f            	ld	a,xl
1427  0002 4d            	tnz	a
1428  0003 2706          	jreq	L365
1429                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1431  0005 9e            	ld	a,xh
1432  0006 ca5303        	or	a,21251
1434  0009 2006          	jra	L565
1435  000b               L365:
1436                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1438  000b 7b01          	ld	a,(OFST+1,sp)
1439  000d 43            	cpl	a
1440  000e c45303        	and	a,21251
1441  0011               L565:
1442  0011 c75303        	ld	21251,a
1443                     ; 384 }
1446  0014 85            	popw	x
1447  0015 81            	ret	
1483                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1483                     ; 393 {
1484                     .text:	section	.text,new
1485  0000               _TIM2_UpdateDisableConfig:
1489                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1491                     ; 398   if (NewState != DISABLE)
1493  0000 4d            	tnz	a
1494  0001 2705          	jreq	L506
1495                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1497  0003 72125300      	bset	21248,#1
1500  0007 81            	ret	
1501  0008               L506:
1502                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1504  0008 72135300      	bres	21248,#1
1505                     ; 406 }
1508  000c 81            	ret	
1566                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1566                     ; 417 {
1567                     .text:	section	.text,new
1568  0000               _TIM2_UpdateRequestConfig:
1572                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1574                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1576  0000 4d            	tnz	a
1577  0001 2705          	jreq	L736
1578                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1580  0003 72145300      	bset	21248,#2
1583  0007 81            	ret	
1584  0008               L736:
1585                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1587  0008 72155300      	bres	21248,#2
1588                     ; 430 }
1591  000c 81            	ret	
1648                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1648                     ; 441 {
1649                     .text:	section	.text,new
1650  0000               _TIM2_SelectOnePulseMode:
1654                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1656                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1658  0000 4d            	tnz	a
1659  0001 2705          	jreq	L176
1660                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1662  0003 72165300      	bset	21248,#3
1665  0007 81            	ret	
1666  0008               L176:
1667                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1669  0008 72175300      	bres	21248,#3
1670                     ; 454 }
1673  000c 81            	ret	
1741                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1741                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1741                     ; 486 {
1742                     .text:	section	.text,new
1743  0000               _TIM2_PrescalerConfig:
1747                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1749                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1751                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1753  0000 9e            	ld	a,xh
1754  0001 c7530e        	ld	21262,a
1755                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1757  0004 9f            	ld	a,xl
1758  0005 c75306        	ld	21254,a
1759                     ; 496 }
1762  0008 81            	ret	
1820                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1820                     ; 508 {
1821                     .text:	section	.text,new
1822  0000               _TIM2_ForcedOC1Config:
1824  0000 88            	push	a
1825       00000000      OFST:	set	0
1828                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1830                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1830                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1832  0001 c65307        	ld	a,21255
1833  0004 a48f          	and	a,#143
1834  0006 1a01          	or	a,(OFST+1,sp)
1835  0008 c75307        	ld	21255,a
1836                     ; 515 }
1839  000b 84            	pop	a
1840  000c 81            	ret	
1876                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1876                     ; 527 {
1877                     .text:	section	.text,new
1878  0000               _TIM2_ForcedOC2Config:
1880  0000 88            	push	a
1881       00000000      OFST:	set	0
1884                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1886                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1886                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1888  0001 c65308        	ld	a,21256
1889  0004 a48f          	and	a,#143
1890  0006 1a01          	or	a,(OFST+1,sp)
1891  0008 c75308        	ld	21256,a
1892                     ; 534 }
1895  000b 84            	pop	a
1896  000c 81            	ret	
1932                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1932                     ; 546 {
1933                     .text:	section	.text,new
1934  0000               _TIM2_ForcedOC3Config:
1936  0000 88            	push	a
1937       00000000      OFST:	set	0
1940                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1942                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1942                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1944  0001 c65309        	ld	a,21257
1945  0004 a48f          	and	a,#143
1946  0006 1a01          	or	a,(OFST+1,sp)
1947  0008 c75309        	ld	21257,a
1948                     ; 553 }
1951  000b 84            	pop	a
1952  000c 81            	ret	
1988                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1988                     ; 562 {
1989                     .text:	section	.text,new
1990  0000               _TIM2_ARRPreloadConfig:
1994                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1996                     ; 567   if (NewState != DISABLE)
1998  0000 4d            	tnz	a
1999  0001 2705          	jreq	L7201
2000                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2002  0003 721e5300      	bset	21248,#7
2005  0007 81            	ret	
2006  0008               L7201:
2007                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2009  0008 721f5300      	bres	21248,#7
2010                     ; 575 }
2013  000c 81            	ret	
2049                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2049                     ; 584 {
2050                     .text:	section	.text,new
2051  0000               _TIM2_OC1PreloadConfig:
2055                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2057                     ; 589   if (NewState != DISABLE)
2059  0000 4d            	tnz	a
2060  0001 2705          	jreq	L1501
2061                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2063  0003 72165307      	bset	21255,#3
2066  0007 81            	ret	
2067  0008               L1501:
2068                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2070  0008 72175307      	bres	21255,#3
2071                     ; 597 }
2074  000c 81            	ret	
2110                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2110                     ; 606 {
2111                     .text:	section	.text,new
2112  0000               _TIM2_OC2PreloadConfig:
2116                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2118                     ; 611   if (NewState != DISABLE)
2120  0000 4d            	tnz	a
2121  0001 2705          	jreq	L3701
2122                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2124  0003 72165308      	bset	21256,#3
2127  0007 81            	ret	
2128  0008               L3701:
2129                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2131  0008 72175308      	bres	21256,#3
2132                     ; 619 }
2135  000c 81            	ret	
2171                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2171                     ; 628 {
2172                     .text:	section	.text,new
2173  0000               _TIM2_OC3PreloadConfig:
2177                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2179                     ; 633   if (NewState != DISABLE)
2181  0000 4d            	tnz	a
2182  0001 2705          	jreq	L5111
2183                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2185  0003 72165309      	bset	21257,#3
2188  0007 81            	ret	
2189  0008               L5111:
2190                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2192  0008 72175309      	bres	21257,#3
2193                     ; 641 }
2196  000c 81            	ret	
2269                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2269                     ; 654 {
2270                     .text:	section	.text,new
2271  0000               _TIM2_GenerateEvent:
2275                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2277                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2279  0000 c75306        	ld	21254,a
2280                     ; 660 }
2283  0003 81            	ret	
2319                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2319                     ; 671 {
2320                     .text:	section	.text,new
2321  0000               _TIM2_OC1PolarityConfig:
2325                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2327                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2329  0000 4d            	tnz	a
2330  0001 2705          	jreq	L1711
2331                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2333  0003 7212530a      	bset	21258,#1
2336  0007 81            	ret	
2337  0008               L1711:
2338                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2340  0008 7213530a      	bres	21258,#1
2341                     ; 684 }
2344  000c 81            	ret	
2380                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2380                     ; 695 {
2381                     .text:	section	.text,new
2382  0000               _TIM2_OC2PolarityConfig:
2386                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2388                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2390  0000 4d            	tnz	a
2391  0001 2705          	jreq	L3121
2392                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2394  0003 721a530a      	bset	21258,#5
2397  0007 81            	ret	
2398  0008               L3121:
2399                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2401  0008 721b530a      	bres	21258,#5
2402                     ; 708 }
2405  000c 81            	ret	
2441                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2441                     ; 719 {
2442                     .text:	section	.text,new
2443  0000               _TIM2_OC3PolarityConfig:
2447                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2449                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2451  0000 4d            	tnz	a
2452  0001 2705          	jreq	L5321
2453                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2455  0003 7212530b      	bset	21259,#1
2458  0007 81            	ret	
2459  0008               L5321:
2460                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2462  0008 7213530b      	bres	21259,#1
2463                     ; 732 }
2466  000c 81            	ret	
2511                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2511                     ; 746 {
2512                     .text:	section	.text,new
2513  0000               _TIM2_CCxCmd:
2515  0000 89            	pushw	x
2516       00000000      OFST:	set	0
2519                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2521                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2523                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2525  0001 9e            	ld	a,xh
2526  0002 4d            	tnz	a
2527  0003 2610          	jrne	L3621
2528                     ; 754     if (NewState != DISABLE)
2530  0005 9f            	ld	a,xl
2531  0006 4d            	tnz	a
2532  0007 2706          	jreq	L5621
2533                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2535  0009 7210530a      	bset	21258,#0
2537  000d 2029          	jra	L1721
2538  000f               L5621:
2539                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2541  000f 7211530a      	bres	21258,#0
2542  0013 2023          	jra	L1721
2543  0015               L3621:
2544                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2546  0015 7b01          	ld	a,(OFST+1,sp)
2547  0017 4a            	dec	a
2548  0018 2610          	jrne	L3721
2549                     ; 767     if (NewState != DISABLE)
2551  001a 7b02          	ld	a,(OFST+2,sp)
2552  001c 2706          	jreq	L5721
2553                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2555  001e 7218530a      	bset	21258,#4
2557  0022 2014          	jra	L1721
2558  0024               L5721:
2559                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2561  0024 7219530a      	bres	21258,#4
2562  0028 200e          	jra	L1721
2563  002a               L3721:
2564                     ; 779     if (NewState != DISABLE)
2566  002a 7b02          	ld	a,(OFST+2,sp)
2567  002c 2706          	jreq	L3031
2568                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2570  002e 7210530b      	bset	21259,#0
2572  0032 2004          	jra	L1721
2573  0034               L3031:
2574                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2576  0034 7211530b      	bres	21259,#0
2577  0038               L1721:
2578                     ; 788 }
2581  0038 85            	popw	x
2582  0039 81            	ret	
2627                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2627                     ; 811 {
2628                     .text:	section	.text,new
2629  0000               _TIM2_SelectOCxM:
2631  0000 89            	pushw	x
2632       00000000      OFST:	set	0
2635                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2637                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2639                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2641  0001 9e            	ld	a,xh
2642  0002 4d            	tnz	a
2643  0003 2610          	jrne	L1331
2644                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2646  0005 7211530a      	bres	21258,#0
2647                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2647                     ; 823                             | (uint8_t)TIM2_OCMode);
2649  0009 c65307        	ld	a,21255
2650  000c a48f          	and	a,#143
2651  000e 1a02          	or	a,(OFST+2,sp)
2652  0010 c75307        	ld	21255,a
2654  0013 2023          	jra	L3331
2655  0015               L1331:
2656                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2658  0015 7b01          	ld	a,(OFST+1,sp)
2659  0017 4a            	dec	a
2660  0018 2610          	jrne	L5331
2661                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2663  001a 7219530a      	bres	21258,#4
2664                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2664                     ; 832                             | (uint8_t)TIM2_OCMode);
2666  001e c65308        	ld	a,21256
2667  0021 a48f          	and	a,#143
2668  0023 1a02          	or	a,(OFST+2,sp)
2669  0025 c75308        	ld	21256,a
2671  0028 200e          	jra	L3331
2672  002a               L5331:
2673                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2675  002a 7211530b      	bres	21259,#0
2676                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2676                     ; 841                             | (uint8_t)TIM2_OCMode);
2678  002e c65309        	ld	a,21257
2679  0031 a48f          	and	a,#143
2680  0033 1a02          	or	a,(OFST+2,sp)
2681  0035 c75309        	ld	21257,a
2682  0038               L3331:
2683                     ; 843 }
2686  0038 85            	popw	x
2687  0039 81            	ret	
2721                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2721                     ; 852 {
2722                     .text:	section	.text,new
2723  0000               _TIM2_SetCounter:
2727                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2729  0000 9e            	ld	a,xh
2730  0001 c7530c        	ld	21260,a
2731                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2733  0004 9f            	ld	a,xl
2734  0005 c7530d        	ld	21261,a
2735                     ; 856 }
2738  0008 81            	ret	
2772                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2772                     ; 865 {
2773                     .text:	section	.text,new
2774  0000               _TIM2_SetAutoreload:
2778                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2780  0000 9e            	ld	a,xh
2781  0001 c7530f        	ld	21263,a
2782                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2784  0004 9f            	ld	a,xl
2785  0005 c75310        	ld	21264,a
2786                     ; 869 }
2789  0008 81            	ret	
2823                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2823                     ; 878 {
2824                     .text:	section	.text,new
2825  0000               _TIM2_SetCompare1:
2829                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2831  0000 9e            	ld	a,xh
2832  0001 c75311        	ld	21265,a
2833                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2835  0004 9f            	ld	a,xl
2836  0005 c75312        	ld	21266,a
2837                     ; 882 }
2840  0008 81            	ret	
2874                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2874                     ; 891 {
2875                     .text:	section	.text,new
2876  0000               _TIM2_SetCompare2:
2880                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2882  0000 9e            	ld	a,xh
2883  0001 c75313        	ld	21267,a
2884                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2886  0004 9f            	ld	a,xl
2887  0005 c75314        	ld	21268,a
2888                     ; 895 }
2891  0008 81            	ret	
2925                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2925                     ; 904 {
2926                     .text:	section	.text,new
2927  0000               _TIM2_SetCompare3:
2931                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2933  0000 9e            	ld	a,xh
2934  0001 c75315        	ld	21269,a
2935                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2937  0004 9f            	ld	a,xl
2938  0005 c75316        	ld	21270,a
2939                     ; 908 }
2942  0008 81            	ret	
2978                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2978                     ; 921 {
2979                     .text:	section	.text,new
2980  0000               _TIM2_SetIC1Prescaler:
2982  0000 88            	push	a
2983       00000000      OFST:	set	0
2986                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2988                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2988                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2990  0001 c65307        	ld	a,21255
2991  0004 a4f3          	and	a,#243
2992  0006 1a01          	or	a,(OFST+1,sp)
2993  0008 c75307        	ld	21255,a
2994                     ; 928 }
2997  000b 84            	pop	a
2998  000c 81            	ret	
3034                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3034                     ; 941 {
3035                     .text:	section	.text,new
3036  0000               _TIM2_SetIC2Prescaler:
3038  0000 88            	push	a
3039       00000000      OFST:	set	0
3042                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3044                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3044                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3046  0001 c65308        	ld	a,21256
3047  0004 a4f3          	and	a,#243
3048  0006 1a01          	or	a,(OFST+1,sp)
3049  0008 c75308        	ld	21256,a
3050                     ; 948 }
3053  000b 84            	pop	a
3054  000c 81            	ret	
3090                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3090                     ; 961 {
3091                     .text:	section	.text,new
3092  0000               _TIM2_SetIC3Prescaler:
3094  0000 88            	push	a
3095       00000000      OFST:	set	0
3098                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3100                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3100                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3102  0001 c65309        	ld	a,21257
3103  0004 a4f3          	and	a,#243
3104  0006 1a01          	or	a,(OFST+1,sp)
3105  0008 c75309        	ld	21257,a
3106                     ; 968 }
3109  000b 84            	pop	a
3110  000c 81            	ret	
3162                     ; 975 uint16_t TIM2_GetCapture1(void)
3162                     ; 976 {
3163                     .text:	section	.text,new
3164  0000               _TIM2_GetCapture1:
3166  0000 5204          	subw	sp,#4
3167       00000004      OFST:	set	4
3170                     ; 978   uint16_t tmpccr1 = 0;
3172                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3176                     ; 981   tmpccr1h = TIM2->CCR1H;
3178  0002 c65311        	ld	a,21265
3179  0005 6b02          	ld	(OFST-2,sp),a
3181                     ; 982   tmpccr1l = TIM2->CCR1L;
3183  0007 c65312        	ld	a,21266
3184  000a 6b01          	ld	(OFST-3,sp),a
3186                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3188  000c 5f            	clrw	x
3189  000d 97            	ld	xl,a
3190  000e 1f03          	ldw	(OFST-1,sp),x
3192                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3194  0010 5f            	clrw	x
3195  0011 7b02          	ld	a,(OFST-2,sp)
3196  0013 97            	ld	xl,a
3197  0014 7b04          	ld	a,(OFST+0,sp)
3198  0016 01            	rrwa	x,a
3199  0017 1a03          	or	a,(OFST-1,sp)
3200  0019 01            	rrwa	x,a
3202                     ; 987   return (uint16_t)tmpccr1;
3206  001a 5b04          	addw	sp,#4
3207  001c 81            	ret	
3259                     ; 995 uint16_t TIM2_GetCapture2(void)
3259                     ; 996 {
3260                     .text:	section	.text,new
3261  0000               _TIM2_GetCapture2:
3263  0000 5204          	subw	sp,#4
3264       00000004      OFST:	set	4
3267                     ; 998   uint16_t tmpccr2 = 0;
3269                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3273                     ; 1001   tmpccr2h = TIM2->CCR2H;
3275  0002 c65313        	ld	a,21267
3276  0005 6b02          	ld	(OFST-2,sp),a
3278                     ; 1002   tmpccr2l = TIM2->CCR2L;
3280  0007 c65314        	ld	a,21268
3281  000a 6b01          	ld	(OFST-3,sp),a
3283                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3285  000c 5f            	clrw	x
3286  000d 97            	ld	xl,a
3287  000e 1f03          	ldw	(OFST-1,sp),x
3289                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3291  0010 5f            	clrw	x
3292  0011 7b02          	ld	a,(OFST-2,sp)
3293  0013 97            	ld	xl,a
3294  0014 7b04          	ld	a,(OFST+0,sp)
3295  0016 01            	rrwa	x,a
3296  0017 1a03          	or	a,(OFST-1,sp)
3297  0019 01            	rrwa	x,a
3299                     ; 1007   return (uint16_t)tmpccr2;
3303  001a 5b04          	addw	sp,#4
3304  001c 81            	ret	
3356                     ; 1015 uint16_t TIM2_GetCapture3(void)
3356                     ; 1016 {
3357                     .text:	section	.text,new
3358  0000               _TIM2_GetCapture3:
3360  0000 5204          	subw	sp,#4
3361       00000004      OFST:	set	4
3364                     ; 1018   uint16_t tmpccr3 = 0;
3366                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3370                     ; 1021   tmpccr3h = TIM2->CCR3H;
3372  0002 c65315        	ld	a,21269
3373  0005 6b02          	ld	(OFST-2,sp),a
3375                     ; 1022   tmpccr3l = TIM2->CCR3L;
3377  0007 c65316        	ld	a,21270
3378  000a 6b01          	ld	(OFST-3,sp),a
3380                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3382  000c 5f            	clrw	x
3383  000d 97            	ld	xl,a
3384  000e 1f03          	ldw	(OFST-1,sp),x
3386                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3388  0010 5f            	clrw	x
3389  0011 7b02          	ld	a,(OFST-2,sp)
3390  0013 97            	ld	xl,a
3391  0014 7b04          	ld	a,(OFST+0,sp)
3392  0016 01            	rrwa	x,a
3393  0017 1a03          	or	a,(OFST-1,sp)
3394  0019 01            	rrwa	x,a
3396                     ; 1027   return (uint16_t)tmpccr3;
3400  001a 5b04          	addw	sp,#4
3401  001c 81            	ret	
3435                     ; 1035 uint16_t TIM2_GetCounter(void)
3435                     ; 1036 {
3436                     .text:	section	.text,new
3437  0000               _TIM2_GetCounter:
3439  0000 89            	pushw	x
3440       00000002      OFST:	set	2
3443                     ; 1037   uint16_t tmpcntr = 0;
3445                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3447  0001 c6530c        	ld	a,21260
3448  0004 97            	ld	xl,a
3449  0005 4f            	clr	a
3450  0006 02            	rlwa	x,a
3451  0007 1f01          	ldw	(OFST-1,sp),x
3453                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3455  0009 c6530d        	ld	a,21261
3456  000c 5f            	clrw	x
3457  000d 97            	ld	xl,a
3458  000e 01            	rrwa	x,a
3459  000f 1a02          	or	a,(OFST+0,sp)
3460  0011 01            	rrwa	x,a
3461  0012 1a01          	or	a,(OFST-1,sp)
3462  0014 01            	rrwa	x,a
3465  0015 5b02          	addw	sp,#2
3466  0017 81            	ret	
3490                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3490                     ; 1050 {
3491                     .text:	section	.text,new
3492  0000               _TIM2_GetPrescaler:
3496                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3498  0000 c6530e        	ld	a,21262
3501  0003 81            	ret	
3640                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3640                     ; 1069 {
3641                     .text:	section	.text,new
3642  0000               _TIM2_GetFlagStatus:
3644  0000 89            	pushw	x
3645  0001 89            	pushw	x
3646       00000002      OFST:	set	2
3649                     ; 1070   FlagStatus bitstatus = RESET;
3651                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3655                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3657                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3659  0002 9f            	ld	a,xl
3660  0003 c45304        	and	a,21252
3661  0006 6b01          	ld	(OFST-1,sp),a
3663                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3665  0008 7b03          	ld	a,(OFST+1,sp)
3666  000a 6b02          	ld	(OFST+0,sp),a
3668                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3670  000c c45305        	and	a,21253
3671  000f 1a01          	or	a,(OFST-1,sp)
3672  0011 2702          	jreq	L5371
3673                     ; 1081     bitstatus = SET;
3675  0013 a601          	ld	a,#1
3678  0015               L5371:
3679                     ; 1085     bitstatus = RESET;
3682                     ; 1087   return (FlagStatus)bitstatus;
3686  0015 5b04          	addw	sp,#4
3687  0017 81            	ret	
3722                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3722                     ; 1104 {
3723                     .text:	section	.text,new
3724  0000               _TIM2_ClearFlag:
3728                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3730                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3732  0000 9f            	ld	a,xl
3733  0001 43            	cpl	a
3734  0002 c75304        	ld	21252,a
3735                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3737  0005 35ff5305      	mov	21253,#255
3738                     ; 1111 }
3741  0009 81            	ret	
3805                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3805                     ; 1124 {
3806                     .text:	section	.text,new
3807  0000               _TIM2_GetITStatus:
3809  0000 88            	push	a
3810  0001 89            	pushw	x
3811       00000002      OFST:	set	2
3814                     ; 1125   ITStatus bitstatus = RESET;
3816                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3820                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3822                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3824  0002 c45304        	and	a,21252
3825  0005 6b01          	ld	(OFST-1,sp),a
3827                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3829  0007 c65303        	ld	a,21251
3830  000a 1403          	and	a,(OFST+1,sp)
3831  000c 6b02          	ld	(OFST+0,sp),a
3833                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3835  000e 7b01          	ld	a,(OFST-1,sp)
3836  0010 2708          	jreq	L1102
3838  0012 7b02          	ld	a,(OFST+0,sp)
3839  0014 2704          	jreq	L1102
3840                     ; 1137     bitstatus = SET;
3842  0016 a601          	ld	a,#1
3845  0018 2001          	jra	L3102
3846  001a               L1102:
3847                     ; 1141     bitstatus = RESET;
3849  001a 4f            	clr	a
3851  001b               L3102:
3852                     ; 1143   return (ITStatus)(bitstatus);
3856  001b 5b03          	addw	sp,#3
3857  001d 81            	ret	
3893                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3893                     ; 1157 {
3894                     .text:	section	.text,new
3895  0000               _TIM2_ClearITPendingBit:
3899                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3901                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3903  0000 43            	cpl	a
3904  0001 c75304        	ld	21252,a
3905                     ; 1163 }
3908  0004 81            	ret	
3960                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3960                     ; 1182                        uint8_t TIM2_ICSelection,
3960                     ; 1183                        uint8_t TIM2_ICFilter)
3960                     ; 1184 {
3961                     .text:	section	.text,new
3962  0000               L3_TI1_Config:
3964  0000 89            	pushw	x
3965  0001 88            	push	a
3966       00000001      OFST:	set	1
3969                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3971  0002 7211530a      	bres	21258,#0
3972                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3972                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3974  0006 7b06          	ld	a,(OFST+5,sp)
3975  0008 97            	ld	xl,a
3976  0009 a610          	ld	a,#16
3977  000b 42            	mul	x,a
3978  000c 9f            	ld	a,xl
3979  000d 1a03          	or	a,(OFST+2,sp)
3980  000f 6b01          	ld	(OFST+0,sp),a
3982  0011 c65307        	ld	a,21255
3983  0014 a40c          	and	a,#12
3984  0016 1a01          	or	a,(OFST+0,sp)
3985  0018 c75307        	ld	21255,a
3986                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3988  001b 7b02          	ld	a,(OFST+1,sp)
3989  001d 2706          	jreq	L1602
3990                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3992  001f 7212530a      	bset	21258,#1
3994  0023 2004          	jra	L3602
3995  0025               L1602:
3996                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3998  0025 7213530a      	bres	21258,#1
3999  0029               L3602:
4000                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4002  0029 7210530a      	bset	21258,#0
4003                     ; 1203 }
4006  002d 5b03          	addw	sp,#3
4007  002f 81            	ret	
4059                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4059                     ; 1222                        uint8_t TIM2_ICSelection,
4059                     ; 1223                        uint8_t TIM2_ICFilter)
4059                     ; 1224 {
4060                     .text:	section	.text,new
4061  0000               L5_TI2_Config:
4063  0000 89            	pushw	x
4064  0001 88            	push	a
4065       00000001      OFST:	set	1
4068                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4070  0002 7219530a      	bres	21258,#4
4071                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4071                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4073  0006 7b06          	ld	a,(OFST+5,sp)
4074  0008 97            	ld	xl,a
4075  0009 a610          	ld	a,#16
4076  000b 42            	mul	x,a
4077  000c 9f            	ld	a,xl
4078  000d 1a03          	or	a,(OFST+2,sp)
4079  000f 6b01          	ld	(OFST+0,sp),a
4081  0011 c65308        	ld	a,21256
4082  0014 a40c          	and	a,#12
4083  0016 1a01          	or	a,(OFST+0,sp)
4084  0018 c75308        	ld	21256,a
4085                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4087  001b 7b02          	ld	a,(OFST+1,sp)
4088  001d 2706          	jreq	L3112
4089                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4091  001f 721a530a      	bset	21258,#5
4093  0023 2004          	jra	L5112
4094  0025               L3112:
4095                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4097  0025 721b530a      	bres	21258,#5
4098  0029               L5112:
4099                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4101  0029 7218530a      	bset	21258,#4
4102                     ; 1245 }
4105  002d 5b03          	addw	sp,#3
4106  002f 81            	ret	
4158                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4158                     ; 1262                        uint8_t TIM2_ICFilter)
4158                     ; 1263 {
4159                     .text:	section	.text,new
4160  0000               L7_TI3_Config:
4162  0000 89            	pushw	x
4163  0001 88            	push	a
4164       00000001      OFST:	set	1
4167                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4169  0002 7211530b      	bres	21259,#0
4170                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4170                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4172  0006 7b06          	ld	a,(OFST+5,sp)
4173  0008 97            	ld	xl,a
4174  0009 a610          	ld	a,#16
4175  000b 42            	mul	x,a
4176  000c 9f            	ld	a,xl
4177  000d 1a03          	or	a,(OFST+2,sp)
4178  000f 6b01          	ld	(OFST+0,sp),a
4180  0011 c65309        	ld	a,21257
4181  0014 a40c          	and	a,#12
4182  0016 1a01          	or	a,(OFST+0,sp)
4183  0018 c75309        	ld	21257,a
4184                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4186  001b 7b02          	ld	a,(OFST+1,sp)
4187  001d 2706          	jreq	L5412
4188                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4190  001f 7212530b      	bset	21259,#1
4192  0023 2004          	jra	L7412
4193  0025               L5412:
4194                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4196  0025 7213530b      	bres	21259,#1
4197  0029               L7412:
4198                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4200  0029 7210530b      	bset	21259,#0
4201                     ; 1283 }
4204  002d 5b03          	addw	sp,#3
4205  002f 81            	ret	
4231                     ; 1288 void TIM2_setup(void)
4231                     ; 1289 {
4232                     .text:	section	.text,new
4233  0000               _TIM2_setup:
4237                     ; 1291     TIM2_DeInit();
4239  0000 cd0000        	call	_TIM2_DeInit
4241                     ; 1292     TIM2_TimeBaseInit(TIM2_PRESCALER_2048, 7813);
4243  0003 ae1e85        	ldw	x,#7813
4244  0006 89            	pushw	x
4245  0007 a60b          	ld	a,#11
4246  0009 cd0000        	call	_TIM2_TimeBaseInit
4248  000c 85            	popw	x
4249                     ; 1293     TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
4251  000d ae0101        	ldw	x,#257
4253                     ; 1296 }	  
4256  0010 cc0000        	jp	_TIM2_ITConfig
4269                     	xdef	_TIM2_ClearITPendingBit
4270                     	xdef	_TIM2_GetITStatus
4271                     	xdef	_TIM2_ClearFlag
4272                     	xdef	_TIM2_GetFlagStatus
4273                     	xdef	_TIM2_GetPrescaler
4274                     	xdef	_TIM2_GetCounter
4275                     	xdef	_TIM2_GetCapture3
4276                     	xdef	_TIM2_GetCapture2
4277                     	xdef	_TIM2_GetCapture1
4278                     	xdef	_TIM2_SetIC3Prescaler
4279                     	xdef	_TIM2_SetIC2Prescaler
4280                     	xdef	_TIM2_SetIC1Prescaler
4281                     	xdef	_TIM2_SetCompare3
4282                     	xdef	_TIM2_SetCompare2
4283                     	xdef	_TIM2_SetCompare1
4284                     	xdef	_TIM2_SetAutoreload
4285                     	xdef	_TIM2_SetCounter
4286                     	xdef	_TIM2_SelectOCxM
4287                     	xdef	_TIM2_CCxCmd
4288                     	xdef	_TIM2_OC3PolarityConfig
4289                     	xdef	_TIM2_OC2PolarityConfig
4290                     	xdef	_TIM2_OC1PolarityConfig
4291                     	xdef	_TIM2_GenerateEvent
4292                     	xdef	_TIM2_OC3PreloadConfig
4293                     	xdef	_TIM2_OC2PreloadConfig
4294                     	xdef	_TIM2_OC1PreloadConfig
4295                     	xdef	_TIM2_ARRPreloadConfig
4296                     	xdef	_TIM2_ForcedOC3Config
4297                     	xdef	_TIM2_ForcedOC2Config
4298                     	xdef	_TIM2_ForcedOC1Config
4299                     	xdef	_TIM2_PrescalerConfig
4300                     	xdef	_TIM2_SelectOnePulseMode
4301                     	xdef	_TIM2_UpdateRequestConfig
4302                     	xdef	_TIM2_UpdateDisableConfig
4303                     	xdef	_TIM2_ITConfig
4304                     	xdef	_TIM2_Cmd
4305                     	xdef	_TIM2_PWMIConfig
4306                     	xdef	_TIM2_ICInit
4307                     	xdef	_TIM2_OC3Init
4308                     	xdef	_TIM2_OC2Init
4309                     	xdef	_TIM2_OC1Init
4310                     	xdef	_TIM2_TimeBaseInit
4311                     	xdef	_TIM2_setup
4312                     	xdef	_TIM2_DeInit
4331                     	end
