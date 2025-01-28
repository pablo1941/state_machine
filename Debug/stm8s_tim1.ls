   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  48                     ; 58 void TIM1_DeInit(void)
  48                     ; 59 {
  50                     .text:	section	.text,new
  51  0000               _TIM1_DeInit:
  55                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  57  0000 725f5250      	clr	21072
  58                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  60  0004 725f5251      	clr	21073
  61                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  63  0008 725f5252      	clr	21074
  64                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  66  000c 725f5253      	clr	21075
  67                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  69  0010 725f5254      	clr	21076
  70                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  72  0014 725f5256      	clr	21078
  73                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  75  0018 725f525c      	clr	21084
  76                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  78  001c 725f525d      	clr	21085
  79                     ; 70   TIM1->CCMR1 = 0x01;
  81  0020 35015258      	mov	21080,#1
  82                     ; 71   TIM1->CCMR2 = 0x01;
  84  0024 35015259      	mov	21081,#1
  85                     ; 72   TIM1->CCMR3 = 0x01;
  87  0028 3501525a      	mov	21082,#1
  88                     ; 73   TIM1->CCMR4 = 0x01;
  90  002c 3501525b      	mov	21083,#1
  91                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  93  0030 725f525c      	clr	21084
  94                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  96  0034 725f525d      	clr	21085
  97                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  99  0038 725f5258      	clr	21080
 100                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 102  003c 725f5259      	clr	21081
 103                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 105  0040 725f525a      	clr	21082
 106                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 108  0044 725f525b      	clr	21083
 109                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 111  0048 725f525e      	clr	21086
 112                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 114  004c 725f525f      	clr	21087
 115                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 117  0050 725f5260      	clr	21088
 118                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 120  0054 725f5261      	clr	21089
 121                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 123  0058 35ff5262      	mov	21090,#255
 124                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 126  005c 35ff5263      	mov	21091,#255
 127                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 129  0060 725f5265      	clr	21093
 130                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 132  0064 725f5266      	clr	21094
 133                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 135  0068 725f5267      	clr	21095
 136                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 138  006c 725f5268      	clr	21096
 139                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 141  0070 725f5269      	clr	21097
 142                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 144  0074 725f526a      	clr	21098
 145                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 147  0078 725f526b      	clr	21099
 148                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 150  007c 725f526c      	clr	21100
 151                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 153  0080 725f526f      	clr	21103
 154                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 156  0084 35015257      	mov	21079,#1
 157                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 159  0088 725f526e      	clr	21102
 160                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 162  008c 725f526d      	clr	21101
 163                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 165  0090 725f5264      	clr	21092
 166                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 168  0094 725f5255      	clr	21077
 169                     ; 101 }
 172  0098 81            	ret	
 281                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 281                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 281                     ; 113                        uint16_t TIM1_Period,
 281                     ; 114                        uint8_t TIM1_RepetitionCounter)
 281                     ; 115 {
 282                     .text:	section	.text,new
 283  0000               _TIM1_TimeBaseInit:
 285       fffffffe      OFST: set -2
 288                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 290                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 292  0000 7b04          	ld	a,(OFST+6,sp)
 293  0002 c75262        	ld	21090,a
 294                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 296  0005 7b05          	ld	a,(OFST+7,sp)
 297  0007 c75263        	ld	21091,a
 298                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 300  000a 9e            	ld	a,xh
 301  000b c75260        	ld	21088,a
 302                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 304  000e 9f            	ld	a,xl
 305  000f c75261        	ld	21089,a
 306                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 306                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 308  0012 c65250        	ld	a,21072
 309  0015 a48f          	and	a,#143
 310  0017 1a03          	or	a,(OFST+5,sp)
 311  0019 c75250        	ld	21072,a
 312                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 314  001c 7b06          	ld	a,(OFST+8,sp)
 315  001e c75264        	ld	21092,a
 316                     ; 133 }
 319  0021 81            	ret	
 604                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 604                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 604                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 604                     ; 157                   uint16_t TIM1_Pulse,
 604                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 604                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 604                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 604                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 604                     ; 162 {
 605                     .text:	section	.text,new
 606  0000               _TIM1_OC1Init:
 608  0000 89            	pushw	x
 609  0001 5203          	subw	sp,#3
 610       00000003      OFST:	set	3
 613                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 615                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 617                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 619                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 621                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 623                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 625                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 627                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 627                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 629  0003 c6525c        	ld	a,21084
 630  0006 a4f0          	and	a,#240
 631  0008 c7525c        	ld	21084,a
 632                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 632                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 632                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 632                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 634  000b 7b0c          	ld	a,(OFST+9,sp)
 635  000d a408          	and	a,#8
 636  000f 6b03          	ld	(OFST+0,sp),a
 638  0011 7b0b          	ld	a,(OFST+8,sp)
 639  0013 a402          	and	a,#2
 640  0015 1a03          	or	a,(OFST+0,sp)
 641  0017 6b02          	ld	(OFST-1,sp),a
 643  0019 7b08          	ld	a,(OFST+5,sp)
 644  001b a404          	and	a,#4
 645  001d 6b01          	ld	(OFST-2,sp),a
 647  001f 9f            	ld	a,xl
 648  0020 a401          	and	a,#1
 649  0022 1a01          	or	a,(OFST-2,sp)
 650  0024 1a02          	or	a,(OFST-1,sp)
 651  0026 ca525c        	or	a,21084
 652  0029 c7525c        	ld	21084,a
 653                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 653                     ; 185                           (uint8_t)TIM1_OCMode);
 655  002c c65258        	ld	a,21080
 656  002f a48f          	and	a,#143
 657  0031 1a04          	or	a,(OFST+1,sp)
 658  0033 c75258        	ld	21080,a
 659                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 661  0036 c6526f        	ld	a,21103
 662  0039 a4fc          	and	a,#252
 663  003b c7526f        	ld	21103,a
 664                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 664                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 666  003e 7b0e          	ld	a,(OFST+11,sp)
 667  0040 a402          	and	a,#2
 668  0042 6b03          	ld	(OFST+0,sp),a
 670  0044 7b0d          	ld	a,(OFST+10,sp)
 671  0046 a401          	and	a,#1
 672  0048 1a03          	or	a,(OFST+0,sp)
 673  004a ca526f        	or	a,21103
 674  004d c7526f        	ld	21103,a
 675                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 677  0050 7b09          	ld	a,(OFST+6,sp)
 678  0052 c75265        	ld	21093,a
 679                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 681  0055 7b0a          	ld	a,(OFST+7,sp)
 682  0057 c75266        	ld	21094,a
 683                     ; 196 }
 686  005a 5b05          	addw	sp,#5
 687  005c 81            	ret	
 791                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 791                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 791                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 791                     ; 220                   uint16_t TIM1_Pulse,
 791                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 791                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 791                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 791                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 791                     ; 225 {
 792                     .text:	section	.text,new
 793  0000               _TIM1_OC2Init:
 795  0000 89            	pushw	x
 796  0001 5203          	subw	sp,#3
 797       00000003      OFST:	set	3
 800                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 802                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 804                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 806                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 808                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 810                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 812                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 814                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 814                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 816  0003 c6525c        	ld	a,21084
 817  0006 a40f          	and	a,#15
 818  0008 c7525c        	ld	21084,a
 819                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 819                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 819                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 819                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 821  000b 7b0c          	ld	a,(OFST+9,sp)
 822  000d a480          	and	a,#128
 823  000f 6b03          	ld	(OFST+0,sp),a
 825  0011 7b0b          	ld	a,(OFST+8,sp)
 826  0013 a420          	and	a,#32
 827  0015 1a03          	or	a,(OFST+0,sp)
 828  0017 6b02          	ld	(OFST-1,sp),a
 830  0019 7b08          	ld	a,(OFST+5,sp)
 831  001b a440          	and	a,#64
 832  001d 6b01          	ld	(OFST-2,sp),a
 834  001f 9f            	ld	a,xl
 835  0020 a410          	and	a,#16
 836  0022 1a01          	or	a,(OFST-2,sp)
 837  0024 1a02          	or	a,(OFST-1,sp)
 838  0026 ca525c        	or	a,21084
 839  0029 c7525c        	ld	21084,a
 840                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 840                     ; 249                           (uint8_t)TIM1_OCMode);
 842  002c c65259        	ld	a,21081
 843  002f a48f          	and	a,#143
 844  0031 1a04          	or	a,(OFST+1,sp)
 845  0033 c75259        	ld	21081,a
 846                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 848  0036 c6526f        	ld	a,21103
 849  0039 a4f3          	and	a,#243
 850  003b c7526f        	ld	21103,a
 851                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 851                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 853  003e 7b0e          	ld	a,(OFST+11,sp)
 854  0040 a408          	and	a,#8
 855  0042 6b03          	ld	(OFST+0,sp),a
 857  0044 7b0d          	ld	a,(OFST+10,sp)
 858  0046 a404          	and	a,#4
 859  0048 1a03          	or	a,(OFST+0,sp)
 860  004a ca526f        	or	a,21103
 861  004d c7526f        	ld	21103,a
 862                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 864  0050 7b09          	ld	a,(OFST+6,sp)
 865  0052 c75267        	ld	21095,a
 866                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 868  0055 7b0a          	ld	a,(OFST+7,sp)
 869  0057 c75268        	ld	21096,a
 870                     ; 260 }
 873  005a 5b05          	addw	sp,#5
 874  005c 81            	ret	
 978                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 978                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 978                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 978                     ; 284                   uint16_t TIM1_Pulse,
 978                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 978                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 978                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 978                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 978                     ; 289 {
 979                     .text:	section	.text,new
 980  0000               _TIM1_OC3Init:
 982  0000 89            	pushw	x
 983  0001 5203          	subw	sp,#3
 984       00000003      OFST:	set	3
 987                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 989                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 991                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 993                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 995                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 997                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 999                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1001                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1001                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1003  0003 c6525d        	ld	a,21085
1004  0006 a4f0          	and	a,#240
1005  0008 c7525d        	ld	21085,a
1006                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1006                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1006                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1006                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1008  000b 7b0c          	ld	a,(OFST+9,sp)
1009  000d a408          	and	a,#8
1010  000f 6b03          	ld	(OFST+0,sp),a
1012  0011 7b0b          	ld	a,(OFST+8,sp)
1013  0013 a402          	and	a,#2
1014  0015 1a03          	or	a,(OFST+0,sp)
1015  0017 6b02          	ld	(OFST-1,sp),a
1017  0019 7b08          	ld	a,(OFST+5,sp)
1018  001b a404          	and	a,#4
1019  001d 6b01          	ld	(OFST-2,sp),a
1021  001f 9f            	ld	a,xl
1022  0020 a401          	and	a,#1
1023  0022 1a01          	or	a,(OFST-2,sp)
1024  0024 1a02          	or	a,(OFST-1,sp)
1025  0026 ca525d        	or	a,21085
1026  0029 c7525d        	ld	21085,a
1027                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1027                     ; 312                           (uint8_t)TIM1_OCMode);
1029  002c c6525a        	ld	a,21082
1030  002f a48f          	and	a,#143
1031  0031 1a04          	or	a,(OFST+1,sp)
1032  0033 c7525a        	ld	21082,a
1033                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1035  0036 c6526f        	ld	a,21103
1036  0039 a4cf          	and	a,#207
1037  003b c7526f        	ld	21103,a
1038                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1038                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1040  003e 7b0e          	ld	a,(OFST+11,sp)
1041  0040 a420          	and	a,#32
1042  0042 6b03          	ld	(OFST+0,sp),a
1044  0044 7b0d          	ld	a,(OFST+10,sp)
1045  0046 a410          	and	a,#16
1046  0048 1a03          	or	a,(OFST+0,sp)
1047  004a ca526f        	or	a,21103
1048  004d c7526f        	ld	21103,a
1049                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1051  0050 7b09          	ld	a,(OFST+6,sp)
1052  0052 c75269        	ld	21097,a
1053                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1055  0055 7b0a          	ld	a,(OFST+7,sp)
1056  0057 c7526a        	ld	21098,a
1057                     ; 323 }
1060  005a 5b05          	addw	sp,#5
1061  005c 81            	ret	
1135                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1135                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1135                     ; 340                   uint16_t TIM1_Pulse,
1135                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1135                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1135                     ; 343 {
1136                     .text:	section	.text,new
1137  0000               _TIM1_OC4Init:
1139  0000 89            	pushw	x
1140  0001 88            	push	a
1141       00000001      OFST:	set	1
1144                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1146                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1148                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1150                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1152                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1154  0002 c6525d        	ld	a,21085
1155  0005 a4cf          	and	a,#207
1156  0007 c7525d        	ld	21085,a
1157                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1157                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1159  000a 7b08          	ld	a,(OFST+7,sp)
1160  000c a420          	and	a,#32
1161  000e 6b01          	ld	(OFST+0,sp),a
1163  0010 9f            	ld	a,xl
1164  0011 a410          	and	a,#16
1165  0013 1a01          	or	a,(OFST+0,sp)
1166  0015 ca525d        	or	a,21085
1167  0018 c7525d        	ld	21085,a
1168                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1168                     ; 358                           TIM1_OCMode);
1170  001b c6525b        	ld	a,21083
1171  001e a48f          	and	a,#143
1172  0020 1a02          	or	a,(OFST+1,sp)
1173  0022 c7525b        	ld	21083,a
1174                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1176  0025 7b09          	ld	a,(OFST+8,sp)
1177  0027 270a          	jreq	L534
1178                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1180  0029 c6526f        	ld	a,21103
1181  002c aadf          	or	a,#223
1182  002e c7526f        	ld	21103,a
1184  0031 2004          	jra	L734
1185  0033               L534:
1186                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1188  0033 721d526f      	bres	21103,#6
1189  0037               L734:
1190                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1192  0037 7b06          	ld	a,(OFST+5,sp)
1193  0039 c7526b        	ld	21099,a
1194                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1196  003c 7b07          	ld	a,(OFST+6,sp)
1197  003e c7526c        	ld	21100,a
1198                     ; 373 }
1201  0041 5b03          	addw	sp,#3
1202  0043 81            	ret	
1407                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1407                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1407                     ; 390                      uint8_t TIM1_DeadTime,
1407                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1407                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1407                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1407                     ; 394 {
1408                     .text:	section	.text,new
1409  0000               _TIM1_BDTRConfig:
1411  0000 89            	pushw	x
1412  0001 88            	push	a
1413       00000001      OFST:	set	1
1416                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1418                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1420                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1422                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1424                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1426                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1428  0002 7b06          	ld	a,(OFST+5,sp)
1429  0004 c7526e        	ld	21102,a
1430                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1430                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1430                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1432  0007 7b07          	ld	a,(OFST+6,sp)
1433  0009 1a08          	or	a,(OFST+7,sp)
1434  000b 1a09          	or	a,(OFST+8,sp)
1435  000d 6b01          	ld	(OFST+0,sp),a
1437  000f 9f            	ld	a,xl
1438  0010 1a02          	or	a,(OFST+1,sp)
1439  0012 1a01          	or	a,(OFST+0,sp)
1440  0014 c7526d        	ld	21101,a
1441                     ; 409 }
1444  0017 5b03          	addw	sp,#3
1445  0019 81            	ret	
1647                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1647                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1647                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1647                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1647                     ; 427                  uint8_t TIM1_ICFilter)
1647                     ; 428 {
1648                     .text:	section	.text,new
1649  0000               _TIM1_ICInit:
1651  0000 89            	pushw	x
1652       00000000      OFST:	set	0
1655                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1657                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1659                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1661                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1663                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1665                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1667  0001 9e            	ld	a,xh
1668  0002 4d            	tnz	a
1669  0003 2614          	jrne	L766
1670                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1670                     ; 440                (uint8_t)TIM1_ICSelection,
1670                     ; 441                (uint8_t)TIM1_ICFilter);
1672  0005 7b07          	ld	a,(OFST+7,sp)
1673  0007 88            	push	a
1674  0008 7b06          	ld	a,(OFST+6,sp)
1675  000a 97            	ld	xl,a
1676  000b 7b03          	ld	a,(OFST+3,sp)
1677  000d 95            	ld	xh,a
1678  000e cd0000        	call	L3_TI1_Config
1680  0011 84            	pop	a
1681                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1683  0012 7b06          	ld	a,(OFST+6,sp)
1684  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1687  0017 2044          	jra	L176
1688  0019               L766:
1689                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1691  0019 7b01          	ld	a,(OFST+1,sp)
1692  001b a101          	cp	a,#1
1693  001d 2614          	jrne	L376
1694                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1694                     ; 449                (uint8_t)TIM1_ICSelection,
1694                     ; 450                (uint8_t)TIM1_ICFilter);
1696  001f 7b07          	ld	a,(OFST+7,sp)
1697  0021 88            	push	a
1698  0022 7b06          	ld	a,(OFST+6,sp)
1699  0024 97            	ld	xl,a
1700  0025 7b03          	ld	a,(OFST+3,sp)
1701  0027 95            	ld	xh,a
1702  0028 cd0000        	call	L5_TI2_Config
1704  002b 84            	pop	a
1705                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1707  002c 7b06          	ld	a,(OFST+6,sp)
1708  002e cd0000        	call	_TIM1_SetIC2Prescaler
1711  0031 202a          	jra	L176
1712  0033               L376:
1713                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1715  0033 a102          	cp	a,#2
1716  0035 2614          	jrne	L776
1717                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1717                     ; 458                (uint8_t)TIM1_ICSelection,
1717                     ; 459                (uint8_t)TIM1_ICFilter);
1719  0037 7b07          	ld	a,(OFST+7,sp)
1720  0039 88            	push	a
1721  003a 7b06          	ld	a,(OFST+6,sp)
1722  003c 97            	ld	xl,a
1723  003d 7b03          	ld	a,(OFST+3,sp)
1724  003f 95            	ld	xh,a
1725  0040 cd0000        	call	L7_TI3_Config
1727  0043 84            	pop	a
1728                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1730  0044 7b06          	ld	a,(OFST+6,sp)
1731  0046 cd0000        	call	_TIM1_SetIC3Prescaler
1734  0049 2012          	jra	L176
1735  004b               L776:
1736                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1736                     ; 467                (uint8_t)TIM1_ICSelection,
1736                     ; 468                (uint8_t)TIM1_ICFilter);
1738  004b 7b07          	ld	a,(OFST+7,sp)
1739  004d 88            	push	a
1740  004e 7b06          	ld	a,(OFST+6,sp)
1741  0050 97            	ld	xl,a
1742  0051 7b03          	ld	a,(OFST+3,sp)
1743  0053 95            	ld	xh,a
1744  0054 cd0000        	call	L11_TI4_Config
1746  0057 84            	pop	a
1747                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1749  0058 7b06          	ld	a,(OFST+6,sp)
1750  005a cd0000        	call	_TIM1_SetIC4Prescaler
1752  005d               L176:
1753                     ; 472 }
1756  005d 85            	popw	x
1757  005e 81            	ret	
1853                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1853                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1853                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1853                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1853                     ; 492                      uint8_t TIM1_ICFilter)
1853                     ; 493 {
1854                     .text:	section	.text,new
1855  0000               _TIM1_PWMIConfig:
1857  0000 89            	pushw	x
1858  0001 89            	pushw	x
1859       00000002      OFST:	set	2
1862                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1864                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1866                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1868                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1870                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1872                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1874                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1876  0002 9f            	ld	a,xl
1877  0003 4a            	dec	a
1878  0004 2702          	jreq	L157
1879                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1881  0006 a601          	ld	a,#1
1883  0008               L157:
1884                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1886  0008 6b01          	ld	(OFST-1,sp),a
1888                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1890  000a 7b07          	ld	a,(OFST+5,sp)
1891  000c 4a            	dec	a
1892  000d 2604          	jrne	L557
1893                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1895  000f a602          	ld	a,#2
1897  0011 2002          	jra	L757
1898  0013               L557:
1899                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1901  0013 a601          	ld	a,#1
1902  0015               L757:
1903  0015 6b02          	ld	(OFST+0,sp),a
1905                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1907  0017 7b03          	ld	a,(OFST+1,sp)
1908  0019 2626          	jrne	L167
1909                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1909                     ; 527                (uint8_t)TIM1_ICFilter);
1911  001b 7b09          	ld	a,(OFST+7,sp)
1912  001d 88            	push	a
1913  001e 7b08          	ld	a,(OFST+6,sp)
1914  0020 97            	ld	xl,a
1915  0021 7b05          	ld	a,(OFST+3,sp)
1916  0023 95            	ld	xh,a
1917  0024 cd0000        	call	L3_TI1_Config
1919  0027 84            	pop	a
1920                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1922  0028 7b08          	ld	a,(OFST+6,sp)
1923  002a cd0000        	call	_TIM1_SetIC1Prescaler
1925                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1927  002d 7b09          	ld	a,(OFST+7,sp)
1928  002f 88            	push	a
1929  0030 7b03          	ld	a,(OFST+1,sp)
1930  0032 97            	ld	xl,a
1931  0033 7b02          	ld	a,(OFST+0,sp)
1932  0035 95            	ld	xh,a
1933  0036 cd0000        	call	L5_TI2_Config
1935  0039 84            	pop	a
1936                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1938  003a 7b08          	ld	a,(OFST+6,sp)
1939  003c cd0000        	call	_TIM1_SetIC2Prescaler
1942  003f 2024          	jra	L367
1943  0041               L167:
1944                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1944                     ; 542                (uint8_t)TIM1_ICFilter);
1946  0041 7b09          	ld	a,(OFST+7,sp)
1947  0043 88            	push	a
1948  0044 7b08          	ld	a,(OFST+6,sp)
1949  0046 97            	ld	xl,a
1950  0047 7b05          	ld	a,(OFST+3,sp)
1951  0049 95            	ld	xh,a
1952  004a cd0000        	call	L5_TI2_Config
1954  004d 84            	pop	a
1955                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1957  004e 7b08          	ld	a,(OFST+6,sp)
1958  0050 cd0000        	call	_TIM1_SetIC2Prescaler
1960                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1962  0053 7b09          	ld	a,(OFST+7,sp)
1963  0055 88            	push	a
1964  0056 7b03          	ld	a,(OFST+1,sp)
1965  0058 97            	ld	xl,a
1966  0059 7b02          	ld	a,(OFST+0,sp)
1967  005b 95            	ld	xh,a
1968  005c cd0000        	call	L3_TI1_Config
1970  005f 84            	pop	a
1971                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1973  0060 7b08          	ld	a,(OFST+6,sp)
1974  0062 cd0000        	call	_TIM1_SetIC1Prescaler
1976  0065               L367:
1977                     ; 553 }
1980  0065 5b04          	addw	sp,#4
1981  0067 81            	ret	
2036                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2036                     ; 562 {
2037                     .text:	section	.text,new
2038  0000               _TIM1_Cmd:
2042                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2044                     ; 567   if (NewState != DISABLE)
2046  0000 4d            	tnz	a
2047  0001 2705          	jreq	L3101
2048                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2050  0003 72105250      	bset	21072,#0
2053  0007 81            	ret	
2054  0008               L3101:
2055                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2057  0008 72115250      	bres	21072,#0
2058                     ; 575 }
2061  000c 81            	ret	
2097                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2097                     ; 584 {
2098                     .text:	section	.text,new
2099  0000               _TIM1_CtrlPWMOutputs:
2103                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2105                     ; 590   if (NewState != DISABLE)
2107  0000 4d            	tnz	a
2108  0001 2705          	jreq	L5301
2109                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2111  0003 721e526d      	bset	21101,#7
2114  0007 81            	ret	
2115  0008               L5301:
2116                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2118  0008 721f526d      	bres	21101,#7
2119                     ; 598 }
2122  000c 81            	ret	
2229                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2229                     ; 618 {
2230                     .text:	section	.text,new
2231  0000               _TIM1_ITConfig:
2233  0000 89            	pushw	x
2234       00000000      OFST:	set	0
2237                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2239                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2241                     ; 623   if (NewState != DISABLE)
2243  0001 9f            	ld	a,xl
2244  0002 4d            	tnz	a
2245  0003 2706          	jreq	L7011
2246                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2248  0005 9e            	ld	a,xh
2249  0006 ca5254        	or	a,21076
2251  0009 2006          	jra	L1111
2252  000b               L7011:
2253                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2255  000b 7b01          	ld	a,(OFST+1,sp)
2256  000d 43            	cpl	a
2257  000e c45254        	and	a,21076
2258  0011               L1111:
2259  0011 c75254        	ld	21076,a
2260                     ; 633 }
2263  0014 85            	popw	x
2264  0015 81            	ret	
2288                     ; 640 void TIM1_InternalClockConfig(void)
2288                     ; 641 {
2289                     .text:	section	.text,new
2290  0000               _TIM1_InternalClockConfig:
2294                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2296  0000 c65252        	ld	a,21074
2297  0003 a4f8          	and	a,#248
2298  0005 c75252        	ld	21074,a
2299                     ; 644 }
2302  0008 81            	ret	
2419                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2419                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2419                     ; 664                               uint8_t ExtTRGFilter)
2419                     ; 665 {
2420                     .text:	section	.text,new
2421  0000               _TIM1_ETRClockMode1Config:
2423  0000 89            	pushw	x
2424       00000000      OFST:	set	0
2427                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2429                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2431                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2433  0001 7b05          	ld	a,(OFST+5,sp)
2434  0003 88            	push	a
2435  0004 7b02          	ld	a,(OFST+2,sp)
2436  0006 95            	ld	xh,a
2437  0007 cd0000        	call	_TIM1_ETRConfig
2439  000a 84            	pop	a
2440                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2440                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2442  000b c65252        	ld	a,21074
2443  000e aa77          	or	a,#119
2444  0010 c75252        	ld	21074,a
2445                     ; 676 }
2448  0013 85            	popw	x
2449  0014 81            	ret	
2507                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2507                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2507                     ; 696                               uint8_t ExtTRGFilter)
2507                     ; 697 {
2508                     .text:	section	.text,new
2509  0000               _TIM1_ETRClockMode2Config:
2511  0000 89            	pushw	x
2512       00000000      OFST:	set	0
2515                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2517                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2519                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2521  0001 7b05          	ld	a,(OFST+5,sp)
2522  0003 88            	push	a
2523  0004 7b02          	ld	a,(OFST+2,sp)
2524  0006 95            	ld	xh,a
2525  0007 cd0000        	call	_TIM1_ETRConfig
2527  000a 721c5253      	bset	21075,#6
2528                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2530                     ; 707 }
2533  000e 5b03          	addw	sp,#3
2534  0010 81            	ret	
2590                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2590                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2590                     ; 727                     uint8_t ExtTRGFilter)
2590                     ; 728 {
2591                     .text:	section	.text,new
2592  0000               _TIM1_ETRConfig:
2594  0000 89            	pushw	x
2595       00000000      OFST:	set	0
2598                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2600                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2600                     ; 733                          (uint8_t)ExtTRGFilter );
2602  0001 9f            	ld	a,xl
2603  0002 1a01          	or	a,(OFST+1,sp)
2604  0004 1a05          	or	a,(OFST+5,sp)
2605  0006 ca5253        	or	a,21075
2606  0009 c75253        	ld	21075,a
2607                     ; 734 }
2610  000c 85            	popw	x
2611  000d 81            	ret	
2700                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2700                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2700                     ; 753                                  uint8_t ICFilter)
2700                     ; 754 {
2701                     .text:	section	.text,new
2702  0000               _TIM1_TIxExternalClockConfig:
2704  0000 89            	pushw	x
2705       00000000      OFST:	set	0
2708                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2710                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2712                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2714                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2716  0001 9e            	ld	a,xh
2717  0002 a160          	cp	a,#96
2718  0004 260d          	jrne	L1131
2719                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2721  0006 7b05          	ld	a,(OFST+5,sp)
2722  0008 88            	push	a
2723  0009 9f            	ld	a,xl
2724  000a ae0001        	ldw	x,#1
2725  000d 95            	ld	xh,a
2726  000e cd0000        	call	L5_TI2_Config
2729  0011 200c          	jra	L3131
2730  0013               L1131:
2731                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2733  0013 7b05          	ld	a,(OFST+5,sp)
2734  0015 88            	push	a
2735  0016 7b03          	ld	a,(OFST+3,sp)
2736  0018 ae0001        	ldw	x,#1
2737  001b 95            	ld	xh,a
2738  001c cd0000        	call	L3_TI1_Config
2740  001f               L3131:
2741  001f 84            	pop	a
2742                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2744  0020 7b01          	ld	a,(OFST+1,sp)
2745  0022 cd0000        	call	_TIM1_SelectInputTrigger
2747                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2749  0025 c65252        	ld	a,21074
2750  0028 aa07          	or	a,#7
2751  002a c75252        	ld	21074,a
2752                     ; 775 }
2755  002d 85            	popw	x
2756  002e 81            	ret	
2841                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2841                     ; 788 {
2842                     .text:	section	.text,new
2843  0000               _TIM1_SelectInputTrigger:
2845  0000 88            	push	a
2846       00000000      OFST:	set	0
2849                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2851                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2853  0001 c65252        	ld	a,21074
2854  0004 a48f          	and	a,#143
2855  0006 1a01          	or	a,(OFST+1,sp)
2856  0008 c75252        	ld	21074,a
2857                     ; 794 }
2860  000b 84            	pop	a
2861  000c 81            	ret	
2897                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2897                     ; 804 {
2898                     .text:	section	.text,new
2899  0000               _TIM1_UpdateDisableConfig:
2903                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2905                     ; 809   if (NewState != DISABLE)
2907  0000 4d            	tnz	a
2908  0001 2705          	jreq	L1731
2909                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2911  0003 72125250      	bset	21072,#1
2914  0007 81            	ret	
2915  0008               L1731:
2916                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2918  0008 72135250      	bres	21072,#1
2919                     ; 817 }
2922  000c 81            	ret	
2980                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2980                     ; 828 {
2981                     .text:	section	.text,new
2982  0000               _TIM1_UpdateRequestConfig:
2986                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2988                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2990  0000 4d            	tnz	a
2991  0001 2705          	jreq	L3241
2992                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
2994  0003 72145250      	bset	21072,#2
2997  0007 81            	ret	
2998  0008               L3241:
2999                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3001  0008 72155250      	bres	21072,#2
3002                     ; 841 }
3005  000c 81            	ret	
3041                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3041                     ; 850 {
3042                     .text:	section	.text,new
3043  0000               _TIM1_SelectHallSensor:
3047                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3049                     ; 855   if (NewState != DISABLE)
3051  0000 4d            	tnz	a
3052  0001 2705          	jreq	L5441
3053                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3055  0003 721e5251      	bset	21073,#7
3058  0007 81            	ret	
3059  0008               L5441:
3060                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3062  0008 721f5251      	bres	21073,#7
3063                     ; 863 }
3066  000c 81            	ret	
3123                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3123                     ; 874 {
3124                     .text:	section	.text,new
3125  0000               _TIM1_SelectOnePulseMode:
3129                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3131                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3133  0000 4d            	tnz	a
3134  0001 2705          	jreq	L7741
3135                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3137  0003 72165250      	bset	21072,#3
3140  0007 81            	ret	
3141  0008               L7741:
3142                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3144  0008 72175250      	bres	21072,#3
3145                     ; 888 }
3148  000c 81            	ret	
3246                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3246                     ; 904 {
3247                     .text:	section	.text,new
3248  0000               _TIM1_SelectOutputTrigger:
3250  0000 88            	push	a
3251       00000000      OFST:	set	0
3254                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3256                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3256                     ; 910                         (uint8_t) TIM1_TRGOSource);
3258  0001 c65251        	ld	a,21073
3259  0004 a48f          	and	a,#143
3260  0006 1a01          	or	a,(OFST+1,sp)
3261  0008 c75251        	ld	21073,a
3262                     ; 911 }
3265  000b 84            	pop	a
3266  000c 81            	ret	
3340                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3340                     ; 924 {
3341                     .text:	section	.text,new
3342  0000               _TIM1_SelectSlaveMode:
3344  0000 88            	push	a
3345       00000000      OFST:	set	0
3348                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3350                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3350                     ; 930                          (uint8_t)TIM1_SlaveMode);
3352  0001 c65252        	ld	a,21074
3353  0004 a4f8          	and	a,#248
3354  0006 1a01          	or	a,(OFST+1,sp)
3355  0008 c75252        	ld	21074,a
3356                     ; 931 }
3359  000b 84            	pop	a
3360  000c 81            	ret	
3396                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3396                     ; 940 {
3397                     .text:	section	.text,new
3398  0000               _TIM1_SelectMasterSlaveMode:
3402                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3404                     ; 945   if (NewState != DISABLE)
3406  0000 4d            	tnz	a
3407  0001 2705          	jreq	L3161
3408                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3410  0003 721e5252      	bset	21074,#7
3413  0007 81            	ret	
3414  0008               L3161:
3415                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3417  0008 721f5252      	bres	21074,#7
3418                     ; 953 }
3421  000c 81            	ret	
3507                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3507                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3507                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3507                     ; 978 {
3508                     .text:	section	.text,new
3509  0000               _TIM1_EncoderInterfaceConfig:
3511  0000 89            	pushw	x
3512       00000000      OFST:	set	0
3515                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3517                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3519                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3521                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3523  0001 9f            	ld	a,xl
3524  0002 4d            	tnz	a
3525  0003 2706          	jreq	L7561
3526                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3528  0005 7212525c      	bset	21084,#1
3530  0009 2004          	jra	L1661
3531  000b               L7561:
3532                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3534  000b 7213525c      	bres	21084,#1
3535  000f               L1661:
3536                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3538  000f 7b05          	ld	a,(OFST+5,sp)
3539  0011 2706          	jreq	L3661
3540                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3542  0013 721a525c      	bset	21084,#5
3544  0017 2004          	jra	L5661
3545  0019               L3661:
3546                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3548  0019 721b525c      	bres	21084,#5
3549  001d               L5661:
3550                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3550                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3552  001d c65252        	ld	a,21074
3553  0020 a4f0          	and	a,#240
3554  0022 1a01          	or	a,(OFST+1,sp)
3555  0024 c75252        	ld	21074,a
3556                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3556                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3558  0027 c65258        	ld	a,21080
3559  002a a4fc          	and	a,#252
3560  002c aa01          	or	a,#1
3561  002e c75258        	ld	21080,a
3562                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3562                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3564  0031 c65259        	ld	a,21081
3565  0034 a4fc          	and	a,#252
3566  0036 aa01          	or	a,#1
3567  0038 c75259        	ld	21081,a
3568                     ; 1011 }
3571  003b 85            	popw	x
3572  003c 81            	ret	
3639                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3639                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3639                     ; 1025 {
3640                     .text:	section	.text,new
3641  0000               _TIM1_PrescalerConfig:
3643       fffffffe      OFST: set -2
3646                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3648                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3650  0000 9e            	ld	a,xh
3651  0001 c75260        	ld	21088,a
3652                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3654  0004 9f            	ld	a,xl
3655  0005 c75261        	ld	21089,a
3656                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3658  0008 7b03          	ld	a,(OFST+5,sp)
3659  000a c75257        	ld	21079,a
3660                     ; 1035 }
3663  000d 81            	ret	
3699                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3699                     ; 1049 {
3700                     .text:	section	.text,new
3701  0000               _TIM1_CounterModeConfig:
3703  0000 88            	push	a
3704       00000000      OFST:	set	0
3707                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3709                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3709                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3711  0001 c65250        	ld	a,21072
3712  0004 a48f          	and	a,#143
3713  0006 1a01          	or	a,(OFST+1,sp)
3714  0008 c75250        	ld	21072,a
3715                     ; 1057 }
3718  000b 84            	pop	a
3719  000c 81            	ret	
3777                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3777                     ; 1068 {
3778                     .text:	section	.text,new
3779  0000               _TIM1_ForcedOC1Config:
3781  0000 88            	push	a
3782       00000000      OFST:	set	0
3785                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3787                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3787                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3789  0001 c65258        	ld	a,21080
3790  0004 a48f          	and	a,#143
3791  0006 1a01          	or	a,(OFST+1,sp)
3792  0008 c75258        	ld	21080,a
3793                     ; 1075 }
3796  000b 84            	pop	a
3797  000c 81            	ret	
3833                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3833                     ; 1086 {
3834                     .text:	section	.text,new
3835  0000               _TIM1_ForcedOC2Config:
3837  0000 88            	push	a
3838       00000000      OFST:	set	0
3841                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3843                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3843                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3845  0001 c65259        	ld	a,21081
3846  0004 a48f          	and	a,#143
3847  0006 1a01          	or	a,(OFST+1,sp)
3848  0008 c75259        	ld	21081,a
3849                     ; 1093 }
3852  000b 84            	pop	a
3853  000c 81            	ret	
3889                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3889                     ; 1105 {
3890                     .text:	section	.text,new
3891  0000               _TIM1_ForcedOC3Config:
3893  0000 88            	push	a
3894       00000000      OFST:	set	0
3897                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3899                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3899                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3901  0001 c6525a        	ld	a,21082
3902  0004 a48f          	and	a,#143
3903  0006 1a01          	or	a,(OFST+1,sp)
3904  0008 c7525a        	ld	21082,a
3905                     ; 1112 }
3908  000b 84            	pop	a
3909  000c 81            	ret	
3945                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3945                     ; 1124 {
3946                     .text:	section	.text,new
3947  0000               _TIM1_ForcedOC4Config:
3949  0000 88            	push	a
3950       00000000      OFST:	set	0
3953                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3955                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3955                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3957  0001 c6525b        	ld	a,21083
3958  0004 a48f          	and	a,#143
3959  0006 1a01          	or	a,(OFST+1,sp)
3960  0008 c7525b        	ld	21083,a
3961                     ; 1131 }
3964  000b 84            	pop	a
3965  000c 81            	ret	
4001                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
4001                     ; 1140 {
4002                     .text:	section	.text,new
4003  0000               _TIM1_ARRPreloadConfig:
4007                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4009                     ; 1145   if (NewState != DISABLE)
4011  0000 4d            	tnz	a
4012  0001 2705          	jreq	L5502
4013                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
4015  0003 721e5250      	bset	21072,#7
4018  0007 81            	ret	
4019  0008               L5502:
4020                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4022  0008 721f5250      	bres	21072,#7
4023                     ; 1153 }
4026  000c 81            	ret	
4061                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4061                     ; 1162 {
4062                     .text:	section	.text,new
4063  0000               _TIM1_SelectCOM:
4067                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4069                     ; 1167   if (NewState != DISABLE)
4071  0000 4d            	tnz	a
4072  0001 2705          	jreq	L7702
4073                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4075  0003 72145251      	bset	21073,#2
4078  0007 81            	ret	
4079  0008               L7702:
4080                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4082  0008 72155251      	bres	21073,#2
4083                     ; 1175 }
4086  000c 81            	ret	
4122                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4122                     ; 1184 {
4123                     .text:	section	.text,new
4124  0000               _TIM1_CCPreloadControl:
4128                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4130                     ; 1189   if (NewState != DISABLE)
4132  0000 4d            	tnz	a
4133  0001 2705          	jreq	L1212
4134                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4136  0003 72105251      	bset	21073,#0
4139  0007 81            	ret	
4140  0008               L1212:
4141                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4143  0008 72115251      	bres	21073,#0
4144                     ; 1197 }
4147  000c 81            	ret	
4183                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4183                     ; 1206 {
4184                     .text:	section	.text,new
4185  0000               _TIM1_OC1PreloadConfig:
4189                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4191                     ; 1211   if (NewState != DISABLE)
4193  0000 4d            	tnz	a
4194  0001 2705          	jreq	L3412
4195                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4197  0003 72165258      	bset	21080,#3
4200  0007 81            	ret	
4201  0008               L3412:
4202                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4204  0008 72175258      	bres	21080,#3
4205                     ; 1219 }
4208  000c 81            	ret	
4244                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4244                     ; 1228 {
4245                     .text:	section	.text,new
4246  0000               _TIM1_OC2PreloadConfig:
4250                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4252                     ; 1233   if (NewState != DISABLE)
4254  0000 4d            	tnz	a
4255  0001 2705          	jreq	L5612
4256                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4258  0003 72165259      	bset	21081,#3
4261  0007 81            	ret	
4262  0008               L5612:
4263                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4265  0008 72175259      	bres	21081,#3
4266                     ; 1241 }
4269  000c 81            	ret	
4305                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4305                     ; 1250 {
4306                     .text:	section	.text,new
4307  0000               _TIM1_OC3PreloadConfig:
4311                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4313                     ; 1255   if (NewState != DISABLE)
4315  0000 4d            	tnz	a
4316  0001 2705          	jreq	L7022
4317                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4319  0003 7216525a      	bset	21082,#3
4322  0007 81            	ret	
4323  0008               L7022:
4324                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4326  0008 7217525a      	bres	21082,#3
4327                     ; 1263 }
4330  000c 81            	ret	
4366                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4366                     ; 1272 {
4367                     .text:	section	.text,new
4368  0000               _TIM1_OC4PreloadConfig:
4372                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4374                     ; 1277   if (NewState != DISABLE)
4376  0000 4d            	tnz	a
4377  0001 2705          	jreq	L1322
4378                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4380  0003 7216525b      	bset	21083,#3
4383  0007 81            	ret	
4384  0008               L1322:
4385                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4387  0008 7217525b      	bres	21083,#3
4388                     ; 1285 }
4391  000c 81            	ret	
4426                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4426                     ; 1294 {
4427                     .text:	section	.text,new
4428  0000               _TIM1_OC1FastConfig:
4432                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4434                     ; 1299   if (NewState != DISABLE)
4436  0000 4d            	tnz	a
4437  0001 2705          	jreq	L3522
4438                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4440  0003 72145258      	bset	21080,#2
4443  0007 81            	ret	
4444  0008               L3522:
4445                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4447  0008 72155258      	bres	21080,#2
4448                     ; 1307 }
4451  000c 81            	ret	
4486                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4486                     ; 1316 {
4487                     .text:	section	.text,new
4488  0000               _TIM1_OC2FastConfig:
4492                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4494                     ; 1321   if (NewState != DISABLE)
4496  0000 4d            	tnz	a
4497  0001 2705          	jreq	L5722
4498                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4500  0003 72145259      	bset	21081,#2
4503  0007 81            	ret	
4504  0008               L5722:
4505                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4507  0008 72155259      	bres	21081,#2
4508                     ; 1329 }
4511  000c 81            	ret	
4546                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4546                     ; 1338 {
4547                     .text:	section	.text,new
4548  0000               _TIM1_OC3FastConfig:
4552                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4554                     ; 1343   if (NewState != DISABLE)
4556  0000 4d            	tnz	a
4557  0001 2705          	jreq	L7132
4558                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4560  0003 7214525a      	bset	21082,#2
4563  0007 81            	ret	
4564  0008               L7132:
4565                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4567  0008 7215525a      	bres	21082,#2
4568                     ; 1351 }
4571  000c 81            	ret	
4606                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4606                     ; 1360 {
4607                     .text:	section	.text,new
4608  0000               _TIM1_OC4FastConfig:
4612                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4614                     ; 1365   if (NewState != DISABLE)
4616  0000 4d            	tnz	a
4617  0001 2705          	jreq	L1432
4618                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4620  0003 7214525b      	bset	21083,#2
4623  0007 81            	ret	
4624  0008               L1432:
4625                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4627  0008 7215525b      	bres	21083,#2
4628                     ; 1373 }
4631  000c 81            	ret	
4736                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4736                     ; 1390 {
4737                     .text:	section	.text,new
4738  0000               _TIM1_GenerateEvent:
4742                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4744                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4746  0000 c75257        	ld	21079,a
4747                     ; 1396 }
4750  0003 81            	ret	
4786                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4786                     ; 1407 {
4787                     .text:	section	.text,new
4788  0000               _TIM1_OC1PolarityConfig:
4792                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4794                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4796  0000 4d            	tnz	a
4797  0001 2705          	jreq	L5242
4798                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4800  0003 7212525c      	bset	21084,#1
4803  0007 81            	ret	
4804  0008               L5242:
4805                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4807  0008 7213525c      	bres	21084,#1
4808                     ; 1420 }
4811  000c 81            	ret	
4847                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4847                     ; 1431 {
4848                     .text:	section	.text,new
4849  0000               _TIM1_OC1NPolarityConfig:
4853                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4855                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4857  0000 4d            	tnz	a
4858  0001 2705          	jreq	L7442
4859                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4861  0003 7216525c      	bset	21084,#3
4864  0007 81            	ret	
4865  0008               L7442:
4866                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4868  0008 7217525c      	bres	21084,#3
4869                     ; 1444 }
4872  000c 81            	ret	
4908                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4908                     ; 1455 {
4909                     .text:	section	.text,new
4910  0000               _TIM1_OC2PolarityConfig:
4914                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4916                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4918  0000 4d            	tnz	a
4919  0001 2705          	jreq	L1742
4920                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4922  0003 721a525c      	bset	21084,#5
4925  0007 81            	ret	
4926  0008               L1742:
4927                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4929  0008 721b525c      	bres	21084,#5
4930                     ; 1468 }
4933  000c 81            	ret	
4969                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4969                     ; 1479 {
4970                     .text:	section	.text,new
4971  0000               _TIM1_OC2NPolarityConfig:
4975                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4977                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4979  0000 4d            	tnz	a
4980  0001 2705          	jreq	L3152
4981                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4983  0003 721e525c      	bset	21084,#7
4986  0007 81            	ret	
4987  0008               L3152:
4988                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4990  0008 721f525c      	bres	21084,#7
4991                     ; 1492 }
4994  000c 81            	ret	
5030                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5030                     ; 1503 {
5031                     .text:	section	.text,new
5032  0000               _TIM1_OC3PolarityConfig:
5036                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5038                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5040  0000 4d            	tnz	a
5041  0001 2705          	jreq	L5352
5042                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5044  0003 7212525d      	bset	21085,#1
5047  0007 81            	ret	
5048  0008               L5352:
5049                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5051  0008 7213525d      	bres	21085,#1
5052                     ; 1516 }
5055  000c 81            	ret	
5091                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5091                     ; 1528 {
5092                     .text:	section	.text,new
5093  0000               _TIM1_OC3NPolarityConfig:
5097                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5099                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5101  0000 4d            	tnz	a
5102  0001 2705          	jreq	L7552
5103                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5105  0003 7216525d      	bset	21085,#3
5108  0007 81            	ret	
5109  0008               L7552:
5110                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5112  0008 7217525d      	bres	21085,#3
5113                     ; 1541 }
5116  000c 81            	ret	
5152                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5152                     ; 1552 {
5153                     .text:	section	.text,new
5154  0000               _TIM1_OC4PolarityConfig:
5158                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5160                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5162  0000 4d            	tnz	a
5163  0001 2705          	jreq	L1062
5164                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5166  0003 721a525d      	bset	21085,#5
5169  0007 81            	ret	
5170  0008               L1062:
5171                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5173  0008 721b525d      	bres	21085,#5
5174                     ; 1565 }
5177  000c 81            	ret	
5222                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5222                     ; 1580 {
5223                     .text:	section	.text,new
5224  0000               _TIM1_CCxCmd:
5226  0000 89            	pushw	x
5227       00000000      OFST:	set	0
5230                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5232                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5234                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5236  0001 9e            	ld	a,xh
5237  0002 4d            	tnz	a
5238  0003 2610          	jrne	L7262
5239                     ; 1588     if (NewState != DISABLE)
5241  0005 9f            	ld	a,xl
5242  0006 4d            	tnz	a
5243  0007 2706          	jreq	L1362
5244                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5246  0009 7210525c      	bset	21084,#0
5248  000d 203e          	jra	L5362
5249  000f               L1362:
5250                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5252  000f 7211525c      	bres	21084,#0
5253  0013 2038          	jra	L5362
5254  0015               L7262:
5255                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5257  0015 7b01          	ld	a,(OFST+1,sp)
5258  0017 a101          	cp	a,#1
5259  0019 2610          	jrne	L7362
5260                     ; 1601     if (NewState != DISABLE)
5262  001b 7b02          	ld	a,(OFST+2,sp)
5263  001d 2706          	jreq	L1462
5264                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5266  001f 7218525c      	bset	21084,#4
5268  0023 2028          	jra	L5362
5269  0025               L1462:
5270                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5272  0025 7219525c      	bres	21084,#4
5273  0029 2022          	jra	L5362
5274  002b               L7362:
5275                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5277  002b a102          	cp	a,#2
5278  002d 2610          	jrne	L7462
5279                     ; 1613     if (NewState != DISABLE)
5281  002f 7b02          	ld	a,(OFST+2,sp)
5282  0031 2706          	jreq	L1562
5283                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5285  0033 7210525d      	bset	21085,#0
5287  0037 2014          	jra	L5362
5288  0039               L1562:
5289                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5291  0039 7211525d      	bres	21085,#0
5292  003d 200e          	jra	L5362
5293  003f               L7462:
5294                     ; 1625     if (NewState != DISABLE)
5296  003f 7b02          	ld	a,(OFST+2,sp)
5297  0041 2706          	jreq	L7562
5298                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5300  0043 7218525d      	bset	21085,#4
5302  0047 2004          	jra	L5362
5303  0049               L7562:
5304                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5306  0049 7219525d      	bres	21085,#4
5307  004d               L5362:
5308                     ; 1634 }
5311  004d 85            	popw	x
5312  004e 81            	ret	
5357                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5357                     ; 1648 {
5358                     .text:	section	.text,new
5359  0000               _TIM1_CCxNCmd:
5361  0000 89            	pushw	x
5362       00000000      OFST:	set	0
5365                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5367                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5369                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5371  0001 9e            	ld	a,xh
5372  0002 4d            	tnz	a
5373  0003 2610          	jrne	L5072
5374                     ; 1656     if (NewState != DISABLE)
5376  0005 9f            	ld	a,xl
5377  0006 4d            	tnz	a
5378  0007 2706          	jreq	L7072
5379                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5381  0009 7214525c      	bset	21084,#2
5383  000d 2029          	jra	L3172
5384  000f               L7072:
5385                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5387  000f 7215525c      	bres	21084,#2
5388  0013 2023          	jra	L3172
5389  0015               L5072:
5390                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5392  0015 7b01          	ld	a,(OFST+1,sp)
5393  0017 4a            	dec	a
5394  0018 2610          	jrne	L5172
5395                     ; 1668     if (NewState != DISABLE)
5397  001a 7b02          	ld	a,(OFST+2,sp)
5398  001c 2706          	jreq	L7172
5399                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5401  001e 721c525c      	bset	21084,#6
5403  0022 2014          	jra	L3172
5404  0024               L7172:
5405                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5407  0024 721d525c      	bres	21084,#6
5408  0028 200e          	jra	L3172
5409  002a               L5172:
5410                     ; 1680     if (NewState != DISABLE)
5412  002a 7b02          	ld	a,(OFST+2,sp)
5413  002c 2706          	jreq	L5272
5414                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5416  002e 7214525d      	bset	21085,#2
5418  0032 2004          	jra	L3172
5419  0034               L5272:
5420                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5422  0034 7215525d      	bres	21085,#2
5423  0038               L3172:
5424                     ; 1689 }
5427  0038 85            	popw	x
5428  0039 81            	ret	
5473                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5473                     ; 1713 {
5474                     .text:	section	.text,new
5475  0000               _TIM1_SelectOCxM:
5477  0000 89            	pushw	x
5478       00000000      OFST:	set	0
5481                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5483                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5485                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5487  0001 9e            	ld	a,xh
5488  0002 4d            	tnz	a
5489  0003 2610          	jrne	L3572
5490                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5492  0005 7211525c      	bres	21084,#0
5493                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5493                     ; 1725                             | (uint8_t)TIM1_OCMode);
5495  0009 c65258        	ld	a,21080
5496  000c a48f          	and	a,#143
5497  000e 1a02          	or	a,(OFST+2,sp)
5498  0010 c75258        	ld	21080,a
5500  0013 2038          	jra	L5572
5501  0015               L3572:
5502                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5504  0015 7b01          	ld	a,(OFST+1,sp)
5505  0017 a101          	cp	a,#1
5506  0019 2610          	jrne	L7572
5507                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5509  001b 7219525c      	bres	21084,#4
5510                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5510                     ; 1734                             | (uint8_t)TIM1_OCMode);
5512  001f c65259        	ld	a,21081
5513  0022 a48f          	and	a,#143
5514  0024 1a02          	or	a,(OFST+2,sp)
5515  0026 c75259        	ld	21081,a
5517  0029 2022          	jra	L5572
5518  002b               L7572:
5519                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5521  002b a102          	cp	a,#2
5522  002d 2610          	jrne	L3672
5523                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5525  002f 7211525d      	bres	21085,#0
5526                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5526                     ; 1743                             | (uint8_t)TIM1_OCMode);
5528  0033 c6525a        	ld	a,21082
5529  0036 a48f          	and	a,#143
5530  0038 1a02          	or	a,(OFST+2,sp)
5531  003a c7525a        	ld	21082,a
5533  003d 200e          	jra	L5572
5534  003f               L3672:
5535                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5537  003f 7219525d      	bres	21085,#4
5538                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5538                     ; 1752                             | (uint8_t)TIM1_OCMode);
5540  0043 c6525b        	ld	a,21083
5541  0046 a48f          	and	a,#143
5542  0048 1a02          	or	a,(OFST+2,sp)
5543  004a c7525b        	ld	21083,a
5544  004d               L5572:
5545                     ; 1754 }
5548  004d 85            	popw	x
5549  004e 81            	ret	
5583                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5583                     ; 1763 {
5584                     .text:	section	.text,new
5585  0000               _TIM1_SetCounter:
5589                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5591  0000 9e            	ld	a,xh
5592  0001 c7525e        	ld	21086,a
5593                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5595  0004 9f            	ld	a,xl
5596  0005 c7525f        	ld	21087,a
5597                     ; 1767 }
5600  0008 81            	ret	
5634                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5634                     ; 1776 {
5635                     .text:	section	.text,new
5636  0000               _TIM1_SetAutoreload:
5640                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5642  0000 9e            	ld	a,xh
5643  0001 c75262        	ld	21090,a
5644                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5646  0004 9f            	ld	a,xl
5647  0005 c75263        	ld	21091,a
5648                     ; 1780  }
5651  0008 81            	ret	
5685                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5685                     ; 1789 {
5686                     .text:	section	.text,new
5687  0000               _TIM1_SetCompare1:
5691                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5693  0000 9e            	ld	a,xh
5694  0001 c75265        	ld	21093,a
5695                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5697  0004 9f            	ld	a,xl
5698  0005 c75266        	ld	21094,a
5699                     ; 1793 }
5702  0008 81            	ret	
5736                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5736                     ; 1802 {
5737                     .text:	section	.text,new
5738  0000               _TIM1_SetCompare2:
5742                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5744  0000 9e            	ld	a,xh
5745  0001 c75267        	ld	21095,a
5746                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5748  0004 9f            	ld	a,xl
5749  0005 c75268        	ld	21096,a
5750                     ; 1806 }
5753  0008 81            	ret	
5787                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5787                     ; 1815 {
5788                     .text:	section	.text,new
5789  0000               _TIM1_SetCompare3:
5793                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5795  0000 9e            	ld	a,xh
5796  0001 c75269        	ld	21097,a
5797                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5799  0004 9f            	ld	a,xl
5800  0005 c7526a        	ld	21098,a
5801                     ; 1819 }
5804  0008 81            	ret	
5838                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5838                     ; 1828 {
5839                     .text:	section	.text,new
5840  0000               _TIM1_SetCompare4:
5844                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5846  0000 9e            	ld	a,xh
5847  0001 c7526b        	ld	21099,a
5848                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5850  0004 9f            	ld	a,xl
5851  0005 c7526c        	ld	21100,a
5852                     ; 1832 }
5855  0008 81            	ret	
5891                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5891                     ; 1845 {
5892                     .text:	section	.text,new
5893  0000               _TIM1_SetIC1Prescaler:
5895  0000 88            	push	a
5896       00000000      OFST:	set	0
5899                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5901                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5901                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5903  0001 c65258        	ld	a,21080
5904  0004 a4f3          	and	a,#243
5905  0006 1a01          	or	a,(OFST+1,sp)
5906  0008 c75258        	ld	21080,a
5907                     ; 1852 }
5910  000b 84            	pop	a
5911  000c 81            	ret	
5947                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5947                     ; 1865 {
5948                     .text:	section	.text,new
5949  0000               _TIM1_SetIC2Prescaler:
5951  0000 88            	push	a
5952       00000000      OFST:	set	0
5955                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5957                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5957                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5959  0001 c65259        	ld	a,21081
5960  0004 a4f3          	and	a,#243
5961  0006 1a01          	or	a,(OFST+1,sp)
5962  0008 c75259        	ld	21081,a
5963                     ; 1873 }
5966  000b 84            	pop	a
5967  000c 81            	ret	
6003                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6003                     ; 1886 {
6004                     .text:	section	.text,new
6005  0000               _TIM1_SetIC3Prescaler:
6007  0000 88            	push	a
6008       00000000      OFST:	set	0
6011                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6013                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6013                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
6015  0001 c6525a        	ld	a,21082
6016  0004 a4f3          	and	a,#243
6017  0006 1a01          	or	a,(OFST+1,sp)
6018  0008 c7525a        	ld	21082,a
6019                     ; 1894 }
6022  000b 84            	pop	a
6023  000c 81            	ret	
6059                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6059                     ; 1907 {
6060                     .text:	section	.text,new
6061  0000               _TIM1_SetIC4Prescaler:
6063  0000 88            	push	a
6064       00000000      OFST:	set	0
6067                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6069                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6069                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6071  0001 c6525b        	ld	a,21083
6072  0004 a4f3          	and	a,#243
6073  0006 1a01          	or	a,(OFST+1,sp)
6074  0008 c7525b        	ld	21083,a
6075                     ; 1915 }
6078  000b 84            	pop	a
6079  000c 81            	ret	
6131                     ; 1922 uint16_t TIM1_GetCapture1(void)
6131                     ; 1923 {
6132                     .text:	section	.text,new
6133  0000               _TIM1_GetCapture1:
6135  0000 5204          	subw	sp,#4
6136       00000004      OFST:	set	4
6139                     ; 1926   uint16_t tmpccr1 = 0;
6141                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6145                     ; 1929   tmpccr1h = TIM1->CCR1H;
6147  0002 c65265        	ld	a,21093
6148  0005 6b02          	ld	(OFST-2,sp),a
6150                     ; 1930   tmpccr1l = TIM1->CCR1L;
6152  0007 c65266        	ld	a,21094
6153  000a 6b01          	ld	(OFST-3,sp),a
6155                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6157  000c 5f            	clrw	x
6158  000d 97            	ld	xl,a
6159  000e 1f03          	ldw	(OFST-1,sp),x
6161                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6163  0010 5f            	clrw	x
6164  0011 7b02          	ld	a,(OFST-2,sp)
6165  0013 97            	ld	xl,a
6166  0014 7b04          	ld	a,(OFST+0,sp)
6167  0016 01            	rrwa	x,a
6168  0017 1a03          	or	a,(OFST-1,sp)
6169  0019 01            	rrwa	x,a
6171                     ; 1935   return (uint16_t)tmpccr1;
6175  001a 5b04          	addw	sp,#4
6176  001c 81            	ret	
6228                     ; 1943 uint16_t TIM1_GetCapture2(void)
6228                     ; 1944 {
6229                     .text:	section	.text,new
6230  0000               _TIM1_GetCapture2:
6232  0000 5204          	subw	sp,#4
6233       00000004      OFST:	set	4
6236                     ; 1947   uint16_t tmpccr2 = 0;
6238                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6242                     ; 1950   tmpccr2h = TIM1->CCR2H;
6244  0002 c65267        	ld	a,21095
6245  0005 6b02          	ld	(OFST-2,sp),a
6247                     ; 1951   tmpccr2l = TIM1->CCR2L;
6249  0007 c65268        	ld	a,21096
6250  000a 6b01          	ld	(OFST-3,sp),a
6252                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6254  000c 5f            	clrw	x
6255  000d 97            	ld	xl,a
6256  000e 1f03          	ldw	(OFST-1,sp),x
6258                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6260  0010 5f            	clrw	x
6261  0011 7b02          	ld	a,(OFST-2,sp)
6262  0013 97            	ld	xl,a
6263  0014 7b04          	ld	a,(OFST+0,sp)
6264  0016 01            	rrwa	x,a
6265  0017 1a03          	or	a,(OFST-1,sp)
6266  0019 01            	rrwa	x,a
6268                     ; 1956   return (uint16_t)tmpccr2;
6272  001a 5b04          	addw	sp,#4
6273  001c 81            	ret	
6325                     ; 1964 uint16_t TIM1_GetCapture3(void)
6325                     ; 1965 {
6326                     .text:	section	.text,new
6327  0000               _TIM1_GetCapture3:
6329  0000 5204          	subw	sp,#4
6330       00000004      OFST:	set	4
6333                     ; 1967   uint16_t tmpccr3 = 0;
6335                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6339                     ; 1970   tmpccr3h = TIM1->CCR3H;
6341  0002 c65269        	ld	a,21097
6342  0005 6b02          	ld	(OFST-2,sp),a
6344                     ; 1971   tmpccr3l = TIM1->CCR3L;
6346  0007 c6526a        	ld	a,21098
6347  000a 6b01          	ld	(OFST-3,sp),a
6349                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6351  000c 5f            	clrw	x
6352  000d 97            	ld	xl,a
6353  000e 1f03          	ldw	(OFST-1,sp),x
6355                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6357  0010 5f            	clrw	x
6358  0011 7b02          	ld	a,(OFST-2,sp)
6359  0013 97            	ld	xl,a
6360  0014 7b04          	ld	a,(OFST+0,sp)
6361  0016 01            	rrwa	x,a
6362  0017 1a03          	or	a,(OFST-1,sp)
6363  0019 01            	rrwa	x,a
6365                     ; 1976   return (uint16_t)tmpccr3;
6369  001a 5b04          	addw	sp,#4
6370  001c 81            	ret	
6422                     ; 1984 uint16_t TIM1_GetCapture4(void)
6422                     ; 1985 {
6423                     .text:	section	.text,new
6424  0000               _TIM1_GetCapture4:
6426  0000 5204          	subw	sp,#4
6427       00000004      OFST:	set	4
6430                     ; 1987   uint16_t tmpccr4 = 0;
6432                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6436                     ; 1990   tmpccr4h = TIM1->CCR4H;
6438  0002 c6526b        	ld	a,21099
6439  0005 6b02          	ld	(OFST-2,sp),a
6441                     ; 1991   tmpccr4l = TIM1->CCR4L;
6443  0007 c6526c        	ld	a,21100
6444  000a 6b01          	ld	(OFST-3,sp),a
6446                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6448  000c 5f            	clrw	x
6449  000d 97            	ld	xl,a
6450  000e 1f03          	ldw	(OFST-1,sp),x
6452                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6454  0010 5f            	clrw	x
6455  0011 7b02          	ld	a,(OFST-2,sp)
6456  0013 97            	ld	xl,a
6457  0014 7b04          	ld	a,(OFST+0,sp)
6458  0016 01            	rrwa	x,a
6459  0017 1a03          	or	a,(OFST-1,sp)
6460  0019 01            	rrwa	x,a
6462                     ; 1996   return (uint16_t)tmpccr4;
6466  001a 5b04          	addw	sp,#4
6467  001c 81            	ret	
6501                     ; 2004 uint16_t TIM1_GetCounter(void)
6501                     ; 2005 {
6502                     .text:	section	.text,new
6503  0000               _TIM1_GetCounter:
6505  0000 89            	pushw	x
6506       00000002      OFST:	set	2
6509                     ; 2006   uint16_t tmpcntr = 0;
6511                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6513  0001 c6525e        	ld	a,21086
6514  0004 97            	ld	xl,a
6515  0005 4f            	clr	a
6516  0006 02            	rlwa	x,a
6517  0007 1f01          	ldw	(OFST-1,sp),x
6519                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6521  0009 c6525f        	ld	a,21087
6522  000c 5f            	clrw	x
6523  000d 97            	ld	xl,a
6524  000e 01            	rrwa	x,a
6525  000f 1a02          	or	a,(OFST+0,sp)
6526  0011 01            	rrwa	x,a
6527  0012 1a01          	or	a,(OFST-1,sp)
6528  0014 01            	rrwa	x,a
6531  0015 5b02          	addw	sp,#2
6532  0017 81            	ret	
6566                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6566                     ; 2020 {
6567                     .text:	section	.text,new
6568  0000               _TIM1_GetPrescaler:
6570  0000 89            	pushw	x
6571       00000002      OFST:	set	2
6574                     ; 2021   uint16_t temp = 0;
6576                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6578  0001 c65260        	ld	a,21088
6579  0004 97            	ld	xl,a
6580  0005 4f            	clr	a
6581  0006 02            	rlwa	x,a
6582  0007 1f01          	ldw	(OFST-1,sp),x
6584                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6586  0009 c65261        	ld	a,21089
6587  000c 5f            	clrw	x
6588  000d 97            	ld	xl,a
6589  000e 01            	rrwa	x,a
6590  000f 1a02          	or	a,(OFST+0,sp)
6591  0011 01            	rrwa	x,a
6592  0012 1a01          	or	a,(OFST-1,sp)
6593  0014 01            	rrwa	x,a
6596  0015 5b02          	addw	sp,#2
6597  0017 81            	ret	
6771                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6771                     ; 2048 {
6772                     .text:	section	.text,new
6773  0000               _TIM1_GetFlagStatus:
6775  0000 89            	pushw	x
6776  0001 89            	pushw	x
6777       00000002      OFST:	set	2
6780                     ; 2049   FlagStatus bitstatus = RESET;
6782                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6786                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6788                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6790  0002 9f            	ld	a,xl
6791  0003 c45255        	and	a,21077
6792  0006 6b01          	ld	(OFST-1,sp),a
6794                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6796  0008 7b03          	ld	a,(OFST+1,sp)
6797  000a 6b02          	ld	(OFST+0,sp),a
6799                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6801  000c c45256        	and	a,21078
6802  000f 1a01          	or	a,(OFST-1,sp)
6803  0011 2702          	jreq	L5643
6804                     ; 2060     bitstatus = SET;
6806  0013 a601          	ld	a,#1
6809  0015               L5643:
6810                     ; 2064     bitstatus = RESET;
6813                     ; 2066   return (FlagStatus)(bitstatus);
6817  0015 5b04          	addw	sp,#4
6818  0017 81            	ret	
6853                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6853                     ; 2088 {
6854                     .text:	section	.text,new
6855  0000               _TIM1_ClearFlag:
6857  0000 89            	pushw	x
6858       00000000      OFST:	set	0
6861                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6863                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6865  0001 9f            	ld	a,xl
6866  0002 43            	cpl	a
6867  0003 c75255        	ld	21077,a
6868                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6868                     ; 2095                         (uint8_t)0x1E);
6870  0006 7b01          	ld	a,(OFST+1,sp)
6871  0008 43            	cpl	a
6872  0009 a41e          	and	a,#30
6873  000b c75256        	ld	21078,a
6874                     ; 2096 }
6877  000e 85            	popw	x
6878  000f 81            	ret	
6942                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6942                     ; 2113 {
6943                     .text:	section	.text,new
6944  0000               _TIM1_GetITStatus:
6946  0000 88            	push	a
6947  0001 89            	pushw	x
6948       00000002      OFST:	set	2
6951                     ; 2114   ITStatus bitstatus = RESET;
6953                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6957                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6959                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6961  0002 c45255        	and	a,21077
6962  0005 6b01          	ld	(OFST-1,sp),a
6964                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6966  0007 c65254        	ld	a,21076
6967  000a 1403          	and	a,(OFST+1,sp)
6968  000c 6b02          	ld	(OFST+0,sp),a
6970                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6972  000e 7b01          	ld	a,(OFST-1,sp)
6973  0010 2708          	jreq	L1453
6975  0012 7b02          	ld	a,(OFST+0,sp)
6976  0014 2704          	jreq	L1453
6977                     ; 2126     bitstatus = SET;
6979  0016 a601          	ld	a,#1
6982  0018 2001          	jra	L3453
6983  001a               L1453:
6984                     ; 2130     bitstatus = RESET;
6986  001a 4f            	clr	a
6988  001b               L3453:
6989                     ; 2132   return (ITStatus)(bitstatus);
6993  001b 5b03          	addw	sp,#3
6994  001d 81            	ret	
7030                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7030                     ; 2150 {
7031                     .text:	section	.text,new
7032  0000               _TIM1_ClearITPendingBit:
7036                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7038                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7040  0000 43            	cpl	a
7041  0001 c75255        	ld	21077,a
7042                     ; 2156 }
7045  0004 81            	ret	
7097                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7097                     ; 2175                        uint8_t TIM1_ICSelection,
7097                     ; 2176                        uint8_t TIM1_ICFilter)
7097                     ; 2177 {
7098                     .text:	section	.text,new
7099  0000               L3_TI1_Config:
7101  0000 89            	pushw	x
7102  0001 88            	push	a
7103       00000001      OFST:	set	1
7106                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7108  0002 7211525c      	bres	21084,#0
7109                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7109                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7111  0006 7b06          	ld	a,(OFST+5,sp)
7112  0008 97            	ld	xl,a
7113  0009 a610          	ld	a,#16
7114  000b 42            	mul	x,a
7115  000c 9f            	ld	a,xl
7116  000d 1a03          	or	a,(OFST+2,sp)
7117  000f 6b01          	ld	(OFST+0,sp),a
7119  0011 c65258        	ld	a,21080
7120  0014 a40c          	and	a,#12
7121  0016 1a01          	or	a,(OFST+0,sp)
7122  0018 c75258        	ld	21080,a
7123                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7125  001b 7b02          	ld	a,(OFST+1,sp)
7126  001d 2706          	jreq	L1163
7127                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7129  001f 7212525c      	bset	21084,#1
7131  0023 2004          	jra	L3163
7132  0025               L1163:
7133                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7135  0025 7213525c      	bres	21084,#1
7136  0029               L3163:
7137                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7139  0029 7210525c      	bset	21084,#0
7140                     ; 2197 }
7143  002d 5b03          	addw	sp,#3
7144  002f 81            	ret	
7196                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7196                     ; 2216                        uint8_t TIM1_ICSelection,
7196                     ; 2217                        uint8_t TIM1_ICFilter)
7196                     ; 2218 {
7197                     .text:	section	.text,new
7198  0000               L5_TI2_Config:
7200  0000 89            	pushw	x
7201  0001 88            	push	a
7202       00000001      OFST:	set	1
7205                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7207  0002 7219525c      	bres	21084,#4
7208                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7208                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7210  0006 7b06          	ld	a,(OFST+5,sp)
7211  0008 97            	ld	xl,a
7212  0009 a610          	ld	a,#16
7213  000b 42            	mul	x,a
7214  000c 9f            	ld	a,xl
7215  000d 1a03          	or	a,(OFST+2,sp)
7216  000f 6b01          	ld	(OFST+0,sp),a
7218  0011 c65259        	ld	a,21081
7219  0014 a40c          	and	a,#12
7220  0016 1a01          	or	a,(OFST+0,sp)
7221  0018 c75259        	ld	21081,a
7222                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7224  001b 7b02          	ld	a,(OFST+1,sp)
7225  001d 2706          	jreq	L3463
7226                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7228  001f 721a525c      	bset	21084,#5
7230  0023 2004          	jra	L5463
7231  0025               L3463:
7232                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7234  0025 721b525c      	bres	21084,#5
7235  0029               L5463:
7236                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7238  0029 7218525c      	bset	21084,#4
7239                     ; 2236 }
7242  002d 5b03          	addw	sp,#3
7243  002f 81            	ret	
7295                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7295                     ; 2255                        uint8_t TIM1_ICSelection,
7295                     ; 2256                        uint8_t TIM1_ICFilter)
7295                     ; 2257 {
7296                     .text:	section	.text,new
7297  0000               L7_TI3_Config:
7299  0000 89            	pushw	x
7300  0001 88            	push	a
7301       00000001      OFST:	set	1
7304                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7306  0002 7211525d      	bres	21085,#0
7307                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7307                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7309  0006 7b06          	ld	a,(OFST+5,sp)
7310  0008 97            	ld	xl,a
7311  0009 a610          	ld	a,#16
7312  000b 42            	mul	x,a
7313  000c 9f            	ld	a,xl
7314  000d 1a03          	or	a,(OFST+2,sp)
7315  000f 6b01          	ld	(OFST+0,sp),a
7317  0011 c6525a        	ld	a,21082
7318  0014 a40c          	and	a,#12
7319  0016 1a01          	or	a,(OFST+0,sp)
7320  0018 c7525a        	ld	21082,a
7321                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7323  001b 7b02          	ld	a,(OFST+1,sp)
7324  001d 2706          	jreq	L5763
7325                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7327  001f 7212525d      	bset	21085,#1
7329  0023 2004          	jra	L7763
7330  0025               L5763:
7331                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7333  0025 7213525d      	bres	21085,#1
7334  0029               L7763:
7335                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7337  0029 7210525d      	bset	21085,#0
7338                     ; 2276 }
7341  002d 5b03          	addw	sp,#3
7342  002f 81            	ret	
7394                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7394                     ; 2295                        uint8_t TIM1_ICSelection,
7394                     ; 2296                        uint8_t TIM1_ICFilter)
7394                     ; 2297 {
7395                     .text:	section	.text,new
7396  0000               L11_TI4_Config:
7398  0000 89            	pushw	x
7399  0001 88            	push	a
7400       00000001      OFST:	set	1
7403                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7405  0002 7219525d      	bres	21085,#4
7406                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7406                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7408  0006 7b06          	ld	a,(OFST+5,sp)
7409  0008 97            	ld	xl,a
7410  0009 a610          	ld	a,#16
7411  000b 42            	mul	x,a
7412  000c 9f            	ld	a,xl
7413  000d 1a03          	or	a,(OFST+2,sp)
7414  000f 6b01          	ld	(OFST+0,sp),a
7416  0011 c6525b        	ld	a,21083
7417  0014 a40c          	and	a,#12
7418  0016 1a01          	or	a,(OFST+0,sp)
7419  0018 c7525b        	ld	21083,a
7420                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7422  001b 7b02          	ld	a,(OFST+1,sp)
7423  001d 2706          	jreq	L7273
7424                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7426  001f 721a525d      	bset	21085,#5
7428  0023 2004          	jra	L1373
7429  0025               L7273:
7430                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7432  0025 721b525d      	bres	21085,#5
7433  0029               L1373:
7434                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7436  0029 7218525d      	bset	21085,#4
7437                     ; 2317 }
7440  002d 5b03          	addw	sp,#3
7441  002f 81            	ret	
7467                     ; 2320 void TIM1_setup(void)
7467                     ; 2321 {
7468                     .text:	section	.text,new
7469  0000               _TIM1_setup:
7473                     ; 2323     TIM1_DeInit();
7475  0000 cd0000        	call	_TIM1_DeInit
7477                     ; 2326     TIM1_TimeBaseInit(16, TIM1_COUNTERMODE_DOWN, 500, 0); //ton = 16*500*1/16MHz => 1KHz del Buzzer
7479  0003 4b00          	push	#0
7480  0005 ae01f4        	ldw	x,#500
7481  0008 89            	pushw	x
7482  0009 4b10          	push	#16
7483  000b ae0010        	ldw	x,#16
7484  000e cd0000        	call	_TIM1_TimeBaseInit
7486  0011 5b04          	addw	sp,#4
7487                     ; 2328     TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
7489  0013 ae0101        	ldw	x,#257
7491                     ; 2331 } 
7494  0016 cc0000        	jp	_TIM1_ITConfig
7520                     ; 2333 void TIM1_setup2(void)
7520                     ; 2334 {
7521                     .text:	section	.text,new
7522  0000               _TIM1_setup2:
7526                     ; 2336     TIM1_DeInit();
7528  0000 cd0000        	call	_TIM1_DeInit
7530                     ; 2340     TIM1_TimeBaseInit(16, TIM1_COUNTERMODE_DOWN, 250, 0); //ton = 16*250*1/16MHz => 2KHz del Buzzer
7532  0003 4b00          	push	#0
7533  0005 ae00fa        	ldw	x,#250
7534  0008 89            	pushw	x
7535  0009 4b10          	push	#16
7536  000b ae0010        	ldw	x,#16
7537  000e cd0000        	call	_TIM1_TimeBaseInit
7539  0011 5b04          	addw	sp,#4
7540                     ; 2341     TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
7542  0013 ae0101        	ldw	x,#257
7544                     ; 2344 } 
7547  0016 cc0000        	jp	_TIM1_ITConfig
7560                     	xdef	_TIM1_setup
7561                     	xdef	_TIM1_setup2
7562                     	xdef	_TIM1_ClearITPendingBit
7563                     	xdef	_TIM1_GetITStatus
7564                     	xdef	_TIM1_ClearFlag
7565                     	xdef	_TIM1_GetFlagStatus
7566                     	xdef	_TIM1_GetPrescaler
7567                     	xdef	_TIM1_GetCounter
7568                     	xdef	_TIM1_GetCapture4
7569                     	xdef	_TIM1_GetCapture3
7570                     	xdef	_TIM1_GetCapture2
7571                     	xdef	_TIM1_GetCapture1
7572                     	xdef	_TIM1_SetIC4Prescaler
7573                     	xdef	_TIM1_SetIC3Prescaler
7574                     	xdef	_TIM1_SetIC2Prescaler
7575                     	xdef	_TIM1_SetIC1Prescaler
7576                     	xdef	_TIM1_SetCompare4
7577                     	xdef	_TIM1_SetCompare3
7578                     	xdef	_TIM1_SetCompare2
7579                     	xdef	_TIM1_SetCompare1
7580                     	xdef	_TIM1_SetAutoreload
7581                     	xdef	_TIM1_SetCounter
7582                     	xdef	_TIM1_SelectOCxM
7583                     	xdef	_TIM1_CCxNCmd
7584                     	xdef	_TIM1_CCxCmd
7585                     	xdef	_TIM1_OC4PolarityConfig
7586                     	xdef	_TIM1_OC3NPolarityConfig
7587                     	xdef	_TIM1_OC3PolarityConfig
7588                     	xdef	_TIM1_OC2NPolarityConfig
7589                     	xdef	_TIM1_OC2PolarityConfig
7590                     	xdef	_TIM1_OC1NPolarityConfig
7591                     	xdef	_TIM1_OC1PolarityConfig
7592                     	xdef	_TIM1_GenerateEvent
7593                     	xdef	_TIM1_OC4FastConfig
7594                     	xdef	_TIM1_OC3FastConfig
7595                     	xdef	_TIM1_OC2FastConfig
7596                     	xdef	_TIM1_OC1FastConfig
7597                     	xdef	_TIM1_OC4PreloadConfig
7598                     	xdef	_TIM1_OC3PreloadConfig
7599                     	xdef	_TIM1_OC2PreloadConfig
7600                     	xdef	_TIM1_OC1PreloadConfig
7601                     	xdef	_TIM1_CCPreloadControl
7602                     	xdef	_TIM1_SelectCOM
7603                     	xdef	_TIM1_ARRPreloadConfig
7604                     	xdef	_TIM1_ForcedOC4Config
7605                     	xdef	_TIM1_ForcedOC3Config
7606                     	xdef	_TIM1_ForcedOC2Config
7607                     	xdef	_TIM1_ForcedOC1Config
7608                     	xdef	_TIM1_CounterModeConfig
7609                     	xdef	_TIM1_PrescalerConfig
7610                     	xdef	_TIM1_EncoderInterfaceConfig
7611                     	xdef	_TIM1_SelectMasterSlaveMode
7612                     	xdef	_TIM1_SelectSlaveMode
7613                     	xdef	_TIM1_SelectOutputTrigger
7614                     	xdef	_TIM1_SelectOnePulseMode
7615                     	xdef	_TIM1_SelectHallSensor
7616                     	xdef	_TIM1_UpdateRequestConfig
7617                     	xdef	_TIM1_UpdateDisableConfig
7618                     	xdef	_TIM1_SelectInputTrigger
7619                     	xdef	_TIM1_TIxExternalClockConfig
7620                     	xdef	_TIM1_ETRConfig
7621                     	xdef	_TIM1_ETRClockMode2Config
7622                     	xdef	_TIM1_ETRClockMode1Config
7623                     	xdef	_TIM1_InternalClockConfig
7624                     	xdef	_TIM1_ITConfig
7625                     	xdef	_TIM1_CtrlPWMOutputs
7626                     	xdef	_TIM1_Cmd
7627                     	xdef	_TIM1_PWMIConfig
7628                     	xdef	_TIM1_ICInit
7629                     	xdef	_TIM1_BDTRConfig
7630                     	xdef	_TIM1_OC4Init
7631                     	xdef	_TIM1_OC3Init
7632                     	xdef	_TIM1_OC2Init
7633                     	xdef	_TIM1_OC1Init
7634                     	xdef	_TIM1_TimeBaseInit
7635                     	xdef	_TIM1_DeInit
7654                     	end
