   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  61                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  61                     ; 54 {
  63                     	switch	.text
  64  0000               _WWDG_Init:
  66  0000 89            	pushw	x
  67       00000000      OFST:	set	0
  70                     ; 56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  72                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  74  0001 357f50d2      	mov	20690,#127
  75                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  77  0005 9e            	ld	a,xh
  78  0006 aac0          	or	a,#192
  79  0008 c750d1        	ld	20689,a
  80                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  82  000b 7b02          	ld	a,(OFST+2,sp)
  83  000d aa40          	or	a,#64
  84  000f a47f          	and	a,#127
  85  0011 c750d2        	ld	20690,a
  86                     ; 61 }
  89  0014 85            	popw	x
  90  0015 81            	ret
 124                     ; 69 void WWDG_SetCounter(uint8_t Counter)
 124                     ; 70 {
 125                     	switch	.text
 126  0016               _WWDG_SetCounter:
 130                     ; 72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 132                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 134  0016 a47f          	and	a,#127
 135  0018 c750d1        	ld	20689,a
 136                     ; 77 }
 139  001b 81            	ret
 162                     ; 86 uint8_t WWDG_GetCounter(void)
 162                     ; 87 {
 163                     	switch	.text
 164  001c               _WWDG_GetCounter:
 168                     ; 88   return(WWDG->CR);
 170  001c c650d1        	ld	a,20689
 173  001f 81            	ret
 196                     ; 96 void WWDG_SWReset(void)
 196                     ; 97 {
 197                     	switch	.text
 198  0020               _WWDG_SWReset:
 202                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 204  0020 358050d1      	mov	20689,#128
 205                     ; 99 }
 208  0024 81            	ret
 243                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
 243                     ; 109 {
 244                     	switch	.text
 245  0025               _WWDG_SetWindowValue:
 249                     ; 111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 251                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 253  0025 aa40          	or	a,#64
 254  0027 a47f          	and	a,#127
 255  0029 c750d2        	ld	20690,a
 256                     ; 114 }
 259  002c 81            	ret
 272                     	xdef	_WWDG_SetWindowValue
 273                     	xdef	_WWDG_SWReset
 274                     	xdef	_WWDG_GetCounter
 275                     	xdef	_WWDG_SetCounter
 276                     	xdef	_WWDG_Init
 295                     	end
