   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
 122                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 122                     ; 55 {
 124                     .text:	section	.text,new
 125  0000               _RST_GetFlagStatus:
 129                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
 131                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 133  0000 c450b3        	and	a,20659
 134  0003 2702          	jreq	L01
 135  0005 a601          	ld	a,#1
 136  0007               L01:
 139  0007 81            	ret	
 174                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 174                     ; 70 {
 175                     .text:	section	.text,new
 176  0000               _RST_ClearFlag:
 180                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
 182                     ; 74   RST->SR = (uint8_t)RST_Flag;
 184  0000 c750b3        	ld	20659,a
 185                     ; 75 }
 188  0003 81            	ret	
 201                     	xdef	_RST_ClearFlag
 202                     	xdef	_RST_GetFlagStatus
 221                     	end
