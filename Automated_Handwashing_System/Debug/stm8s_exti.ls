   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 53 void EXTI_DeInit(void)
  41                     ; 54 {
  43                     	switch	.text
  44  0000               _EXTI_DeInit:
  48                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  50  0000 725f50a0      	clr	20640
  51                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  53  0004 725f50a1      	clr	20641
  54                     ; 57 }
  57  0008 81            	ret
 182                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 182                     ; 71 {
 183                     	switch	.text
 184  0009               _EXTI_SetExtIntSensitivity:
 186  0009 89            	pushw	x
 187       00000000      OFST:	set	0
 190                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 192                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 194                     ; 77   switch (Port)
 196  000a 9e            	ld	a,xh
 198                     ; 99   default:
 198                     ; 100     break;
 199  000b 4d            	tnz	a
 200  000c 270e          	jreq	L12
 201  000e 4a            	dec	a
 202  000f 271d          	jreq	L32
 203  0011 4a            	dec	a
 204  0012 272e          	jreq	L52
 205  0014 4a            	dec	a
 206  0015 2742          	jreq	L72
 207  0017 4a            	dec	a
 208  0018 2756          	jreq	L13
 209  001a 2064          	jra	L311
 210  001c               L12:
 211                     ; 79   case EXTI_PORT_GPIOA:
 211                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 213  001c c650a0        	ld	a,20640
 214  001f a4fc          	and	a,#252
 215  0021 c750a0        	ld	20640,a
 216                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 218  0024 c650a0        	ld	a,20640
 219  0027 1a02          	or	a,(OFST+2,sp)
 220  0029 c750a0        	ld	20640,a
 221                     ; 82     break;
 223  002c 2052          	jra	L311
 224  002e               L32:
 225                     ; 83   case EXTI_PORT_GPIOB:
 225                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 227  002e c650a0        	ld	a,20640
 228  0031 a4f3          	and	a,#243
 229  0033 c750a0        	ld	20640,a
 230                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 232  0036 7b02          	ld	a,(OFST+2,sp)
 233  0038 48            	sll	a
 234  0039 48            	sll	a
 235  003a ca50a0        	or	a,20640
 236  003d c750a0        	ld	20640,a
 237                     ; 86     break;
 239  0040 203e          	jra	L311
 240  0042               L52:
 241                     ; 87   case EXTI_PORT_GPIOC:
 241                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 243  0042 c650a0        	ld	a,20640
 244  0045 a4cf          	and	a,#207
 245  0047 c750a0        	ld	20640,a
 246                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 248  004a 7b02          	ld	a,(OFST+2,sp)
 249  004c 97            	ld	xl,a
 250  004d a610          	ld	a,#16
 251  004f 42            	mul	x,a
 252  0050 9f            	ld	a,xl
 253  0051 ca50a0        	or	a,20640
 254  0054 c750a0        	ld	20640,a
 255                     ; 90     break;
 257  0057 2027          	jra	L311
 258  0059               L72:
 259                     ; 91   case EXTI_PORT_GPIOD:
 259                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 261  0059 c650a0        	ld	a,20640
 262  005c a43f          	and	a,#63
 263  005e c750a0        	ld	20640,a
 264                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 266  0061 7b02          	ld	a,(OFST+2,sp)
 267  0063 97            	ld	xl,a
 268  0064 a640          	ld	a,#64
 269  0066 42            	mul	x,a
 270  0067 9f            	ld	a,xl
 271  0068 ca50a0        	or	a,20640
 272  006b c750a0        	ld	20640,a
 273                     ; 94     break;
 275  006e 2010          	jra	L311
 276  0070               L13:
 277                     ; 95   case EXTI_PORT_GPIOE:
 277                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 279  0070 c650a1        	ld	a,20641
 280  0073 a4fc          	and	a,#252
 281  0075 c750a1        	ld	20641,a
 282                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 284  0078 c650a1        	ld	a,20641
 285  007b 1a02          	or	a,(OFST+2,sp)
 286  007d c750a1        	ld	20641,a
 287                     ; 98     break;
 289  0080               L33:
 290                     ; 99   default:
 290                     ; 100     break;
 292  0080               L311:
 293                     ; 102 }
 296  0080 85            	popw	x
 297  0081 81            	ret
 355                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 355                     ; 112 {
 356                     	switch	.text
 357  0082               _EXTI_SetTLISensitivity:
 361                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 363                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 365  0082 721550a1      	bres	20641,#2
 366                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 368  0086 ca50a1        	or	a,20641
 369  0089 c750a1        	ld	20641,a
 370                     ; 119 }
 373  008c 81            	ret
 419                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 419                     ; 127 {
 420                     	switch	.text
 421  008d               _EXTI_GetExtIntSensitivity:
 423  008d 88            	push	a
 424       00000001      OFST:	set	1
 427                     ; 128   uint8_t value = 0;
 429  008e 0f01          	clr	(OFST+0,sp)
 431                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 433                     ; 133   switch (Port)
 436                     ; 150   default:
 436                     ; 151     break;
 437  0090 4d            	tnz	a
 438  0091 270e          	jreq	L341
 439  0093 4a            	dec	a
 440  0094 2714          	jreq	L541
 441  0096 4a            	dec	a
 442  0097 271c          	jreq	L741
 443  0099 4a            	dec	a
 444  009a 2725          	jreq	L151
 445  009c 4a            	dec	a
 446  009d 2730          	jreq	L351
 447  009f 2035          	jra	L302
 448  00a1               L341:
 449                     ; 135   case EXTI_PORT_GPIOA:
 449                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 451  00a1 c650a0        	ld	a,20640
 452  00a4 a403          	and	a,#3
 453  00a6 6b01          	ld	(OFST+0,sp),a
 455                     ; 137     break;
 457  00a8 202c          	jra	L302
 458  00aa               L541:
 459                     ; 138   case EXTI_PORT_GPIOB:
 459                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 461  00aa c650a0        	ld	a,20640
 462  00ad a40c          	and	a,#12
 463  00af 44            	srl	a
 464  00b0 44            	srl	a
 465  00b1 6b01          	ld	(OFST+0,sp),a
 467                     ; 140     break;
 469  00b3 2021          	jra	L302
 470  00b5               L741:
 471                     ; 141   case EXTI_PORT_GPIOC:
 471                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 473  00b5 c650a0        	ld	a,20640
 474  00b8 a430          	and	a,#48
 475  00ba 4e            	swap	a
 476  00bb a40f          	and	a,#15
 477  00bd 6b01          	ld	(OFST+0,sp),a
 479                     ; 143     break;
 481  00bf 2015          	jra	L302
 482  00c1               L151:
 483                     ; 144   case EXTI_PORT_GPIOD:
 483                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 485  00c1 c650a0        	ld	a,20640
 486  00c4 a4c0          	and	a,#192
 487  00c6 4e            	swap	a
 488  00c7 44            	srl	a
 489  00c8 44            	srl	a
 490  00c9 a403          	and	a,#3
 491  00cb 6b01          	ld	(OFST+0,sp),a
 493                     ; 146     break;
 495  00cd 2007          	jra	L302
 496  00cf               L351:
 497                     ; 147   case EXTI_PORT_GPIOE:
 497                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 499  00cf c650a1        	ld	a,20641
 500  00d2 a403          	and	a,#3
 501  00d4 6b01          	ld	(OFST+0,sp),a
 503                     ; 149     break;
 505  00d6               L551:
 506                     ; 150   default:
 506                     ; 151     break;
 508  00d6               L302:
 509                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 511  00d6 7b01          	ld	a,(OFST+0,sp)
 514  00d8 5b01          	addw	sp,#1
 515  00da 81            	ret
 551                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 551                     ; 163 {
 552                     	switch	.text
 553  00db               _EXTI_GetTLISensitivity:
 555  00db 88            	push	a
 556       00000001      OFST:	set	1
 559                     ; 164   uint8_t value = 0;
 561                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 563  00dc c650a1        	ld	a,20641
 564  00df a404          	and	a,#4
 565  00e1 6b01          	ld	(OFST+0,sp),a
 567                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 569  00e3 7b01          	ld	a,(OFST+0,sp)
 572  00e5 5b01          	addw	sp,#1
 573  00e7 81            	ret
 586                     	xdef	_EXTI_GetTLISensitivity
 587                     	xdef	_EXTI_GetExtIntSensitivity
 588                     	xdef	_EXTI_SetTLISensitivity
 589                     	xdef	_EXTI_SetExtIntSensitivity
 590                     	xdef	_EXTI_DeInit
 609                     	end
