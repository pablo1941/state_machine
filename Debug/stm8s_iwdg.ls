   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
   4                     ; Optimizer V4.4.9 - 06 Feb 2019
  83                     ; 48 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  83                     ; 49 {
  85                     .text:	section	.text,new
  86  0000               _IWDG_WriteAccessCmd:
  90                     ; 51   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  92                     ; 53   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  94  0000 c750e0        	ld	20704,a
  95                     ; 54 }
  98  0003 81            	ret	
 188                     ; 63 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 188                     ; 64 {
 189                     .text:	section	.text,new
 190  0000               _IWDG_SetPrescaler:
 194                     ; 66   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 196                     ; 68   IWDG->PR = (uint8_t)IWDG_Prescaler;
 198  0000 c750e1        	ld	20705,a
 199                     ; 69 }
 202  0003 81            	ret	
 236                     ; 78 void IWDG_SetReload(uint8_t IWDG_Reload)
 236                     ; 79 {
 237                     .text:	section	.text,new
 238  0000               _IWDG_SetReload:
 242                     ; 80   IWDG->RLR = IWDG_Reload;
 244  0000 c750e2        	ld	20706,a
 245                     ; 81 }
 248  0003 81            	ret	
 271                     ; 89 void IWDG_ReloadCounter(void)
 271                     ; 90 {
 272                     .text:	section	.text,new
 273  0000               _IWDG_ReloadCounter:
 277                     ; 91   IWDG->KR = IWDG_KEY_REFRESH;
 279  0000 35aa50e0      	mov	20704,#170
 280                     ; 92 }
 283  0004 81            	ret	
 306                     ; 99 void IWDG_Enable(void)
 306                     ; 100 {
 307                     .text:	section	.text,new
 308  0000               _IWDG_Enable:
 312                     ; 101   IWDG->KR = IWDG_KEY_ENABLE;
 314  0000 35cc50e0      	mov	20704,#204
 315                     ; 102 }
 318  0004 81            	ret	
 345                     ; 104 void config_IWDT(void)
 345                     ; 105 {
 346                     .text:	section	.text,new
 347  0000               _config_IWDT:
 351                     ; 106   IWDG_Enable();
 353  0000 cd0000        	call	_IWDG_Enable
 355                     ; 107   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 357  0003 a655          	ld	a,#85
 358  0005 cd0000        	call	_IWDG_WriteAccessCmd
 360                     ; 108   IWDG_SetPrescaler(IWDG_Prescaler_256);
 362  0008 a606          	ld	a,#6
 363  000a cd0000        	call	_IWDG_SetPrescaler
 365                     ; 109   IWDG_SetReload(0xFF);
 367  000d a6ff          	ld	a,#255
 368  000f cd0000        	call	_IWDG_SetReload
 370                     ; 110   IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
 372  0012 4f            	clr	a
 374                     ; 112 }
 377  0013 cc0000        	jp	_IWDG_WriteAccessCmd
 390                     	xdef	_config_IWDT
 391                     	xdef	_IWDG_Enable
 392                     	xdef	_IWDG_ReloadCounter
 393                     	xdef	_IWDG_SetReload
 394                     	xdef	_IWDG_SetPrescaler
 395                     	xdef	_IWDG_WriteAccessCmd
 414                     	end
