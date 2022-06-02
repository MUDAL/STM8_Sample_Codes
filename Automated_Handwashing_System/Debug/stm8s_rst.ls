   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
 115                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 115                     ; 55 {
 117                     	switch	.text
 118  0000               _RST_GetFlagStatus:
 122                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
 124                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 126  0000 c450b3        	and	a,20659
 127  0003 2603          	jrne	L6
 128  0005 4f            	clr	a
 129  0006 2002          	jra	L01
 130  0008               L6:
 131  0008 a601          	ld	a,#1
 132  000a               L01:
 135  000a 81            	ret
 170                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 170                     ; 70 {
 171                     	switch	.text
 172  000b               _RST_ClearFlag:
 176                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
 178                     ; 74   RST->SR = (uint8_t)RST_Flag;
 180  000b c750b3        	ld	20659,a
 181                     ; 75 }
 184  000e 81            	ret
 197                     	xdef	_RST_ClearFlag
 198                     	xdef	_RST_GetFlagStatus
 217                     	end
