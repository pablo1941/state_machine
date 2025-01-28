   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  68                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  68                     ; 54 {
  70                     .text:	section	.text,new
  71  0000               _WWDG_Init:
  73  0000 89            	pushw	x
  74       00000000      OFST:	set	0
  77                     ; 56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  79                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  81  0001 357f50d2      	mov	20690,#127
  82                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  84  0005 9e            	ld	a,xh
  85  0006 aac0          	or	a,#192
  86  0008 c750d1        	ld	20689,a
  87                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  89  000b 7b02          	ld	a,(OFST+2,sp)
  90  000d a47f          	and	a,#127
  91  000f aa40          	or	a,#64
  92  0011 c750d2        	ld	20690,a
  93                     ; 61 }
  96  0014 85            	popw	x
  97  0015 81            	ret	
 131                     ; 69 void WWDG_SetCounter(uint8_t Counter)
 131                     ; 70 {
 132                     .text:	section	.text,new
 133  0000               _WWDG_SetCounter:
 137                     ; 72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 139                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 141  0000 a47f          	and	a,#127
 142  0002 c750d1        	ld	20689,a
 143                     ; 77 }
 146  0005 81            	ret	
 169                     ; 86 uint8_t WWDG_GetCounter(void)
 169                     ; 87 {
 170                     .text:	section	.text,new
 171  0000               _WWDG_GetCounter:
 175                     ; 88   return(WWDG->CR);
 177  0000 c650d1        	ld	a,20689
 180  0003 81            	ret	
 203                     ; 96 void WWDG_SWReset(void)
 203                     ; 97 {
 204                     .text:	section	.text,new
 205  0000               _WWDG_SWReset:
 209                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 211  0000 358050d1      	mov	20689,#128
 212                     ; 99 }
 215  0004 81            	ret	
 250                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
 250                     ; 109 {
 251                     .text:	section	.text,new
 252  0000               _WWDG_SetWindowValue:
 256                     ; 111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 258                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 260  0000 a47f          	and	a,#127
 261  0002 aa40          	or	a,#64
 262  0004 c750d2        	ld	20690,a
 263                     ; 114 }
 266  0007 81            	ret	
 279                     	xdef	_WWDG_SetWindowValue
 280                     	xdef	_WWDG_SWReset
 281                     	xdef	_WWDG_GetCounter
 282                     	xdef	_WWDG_SetCounter
 283                     	xdef	_WWDG_Init
 302                     	end
