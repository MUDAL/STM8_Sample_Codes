   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
 127                     ; 47 int main(void)
 127                     ; 48 {
 129                     	switch	.text
 130  0000               _main:
 132  0000 5210          	subw	sp,#16
 133       00000010      OFST:	set	16
 136                     ; 50 	uint32_t soapDispensationTime = 10000; //10 secs default
 138  0002 ae2710        	ldw	x,#10000
 139  0005 1f03          	ldw	(OFST-13,sp),x
 140  0007 ae0000        	ldw	x,#0
 141  000a 1f01          	ldw	(OFST-15,sp),x
 143                     ; 51 	uint32_t soapValveShutOffTime = 60000; //1 minute default
 145  000c aeea60        	ldw	x,#60000
 146  000f 1f07          	ldw	(OFST-9,sp),x
 147  0011 ae0000        	ldw	x,#0
 148  0014 1f05          	ldw	(OFST-11,sp),x
 150                     ; 52 	uint8_t soapFlowDisabled = 0;
 152  0016 0f09          	clr	(OFST-7,sp)
 154                     ; 53 	uint8_t soapDispenseStarted = 0;
 156  0018 0f0a          	clr	(OFST-6,sp)
 158                     ; 54 	uint8_t soapValveShutOff = 0;
 160  001a 0f0b          	clr	(OFST-5,sp)
 162                     ; 55 	uint8_t firstTickMeasured = 0;
 164  001c 0f0c          	clr	(OFST-4,sp)
 166                     ; 56 	uint32_t currTick = 0; //current tick
 168  001e ae0000        	ldw	x,#0
 169  0021 1f0f          	ldw	(OFST-1,sp),x
 170  0023 ae0000        	ldw	x,#0
 171  0026 1f0d          	ldw	(OFST-3,sp),x
 173                     ; 58 	disableInterrupts();
 176  0028 9b            sim
 178                     ; 60 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 181  0029 4f            	clr	a
 182  002a cd0000        	call	_CLK_HSIPrescalerConfig
 184                     ; 62 	GPIO_Init(SOAP_SENSOR_PORT,SOAP_SENSOR,SENSOR_INIT);
 186  002d 4b40          	push	#64
 187  002f 4b01          	push	#1
 188  0031 ae5005        	ldw	x,#20485
 189  0034 cd0000        	call	_GPIO_Init
 191  0037 85            	popw	x
 192                     ; 63 	GPIO_Init(FAN_SENSOR_PORT,FAN_SENSOR,SENSOR_INIT);
 194  0038 4b40          	push	#64
 195  003a 4b02          	push	#2
 196  003c ae5005        	ldw	x,#20485
 197  003f cd0000        	call	_GPIO_Init
 199  0042 85            	popw	x
 200                     ; 64 	GPIO_Init(WATER_SENSOR_PORT,WATER_SENSOR,SENSOR_INIT);
 202  0043 4b40          	push	#64
 203  0045 4b04          	push	#4
 204  0047 ae5005        	ldw	x,#20485
 205  004a cd0000        	call	_GPIO_Init
 207  004d 85            	popw	x
 208                     ; 66 	GPIO_Init(SOAP_VALVE_PORT,SOAP_VALVE,OUTPUT_INIT);
 210  004e 4be0          	push	#224
 211  0050 4b04          	push	#4
 212  0052 ae500f        	ldw	x,#20495
 213  0055 cd0000        	call	_GPIO_Init
 215  0058 85            	popw	x
 216                     ; 67 	GPIO_Init(FAN_PORT,FAN,OUTPUT_INIT);
 218  0059 4be0          	push	#224
 219  005b 4b08          	push	#8
 220  005d ae500f        	ldw	x,#20495
 221  0060 cd0000        	call	_GPIO_Init
 223  0063 85            	popw	x
 224                     ; 68 	GPIO_Init(WATER_VALVE_PORT,WATER_VALVE,OUTPUT_INIT);
 226  0064 4be0          	push	#224
 227  0066 4b10          	push	#16
 228  0068 ae500f        	ldw	x,#20495
 229  006b cd0000        	call	_GPIO_Init
 231  006e 85            	popw	x
 232                     ; 69 	GPIO_Init(SOAP_LED_PORT,SOAP_LED,OUTPUT_INIT);
 234  006f 4be0          	push	#224
 235  0071 4b10          	push	#16
 236  0073 ae5019        	ldw	x,#20505
 237  0076 cd0000        	call	_GPIO_Init
 239  0079 85            	popw	x
 240                     ; 70 	GPIO_Init(POWER_LED_PORT,POWER_LED,OUTPUT_INIT);
 242  007a 4be0          	push	#224
 243  007c 4b10          	push	#16
 244  007e ae5005        	ldw	x,#20485
 245  0081 cd0000        	call	_GPIO_Init
 247  0084 85            	popw	x
 248                     ; 72 	GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 250  0085 4b04          	push	#4
 251  0087 ae500f        	ldw	x,#20495
 252  008a cd0000        	call	_GPIO_WriteLow
 254  008d 84            	pop	a
 255                     ; 73 	GPIO_WriteLow(FAN_PORT,FAN);
 257  008e 4b08          	push	#8
 258  0090 ae500f        	ldw	x,#20495
 259  0093 cd0000        	call	_GPIO_WriteLow
 261  0096 84            	pop	a
 262                     ; 74 	GPIO_WriteHigh(WATER_VALVE_PORT,WATER_VALVE); //Active low
 264  0097 4b10          	push	#16
 265  0099 ae500f        	ldw	x,#20495
 266  009c cd0000        	call	_GPIO_WriteHigh
 268  009f 84            	pop	a
 269                     ; 75 	GPIO_WriteLow(SOAP_LED_PORT,SOAP_LED);
 271  00a0 4b10          	push	#16
 272  00a2 ae5019        	ldw	x,#20505
 273  00a5 cd0000        	call	_GPIO_WriteLow
 275  00a8 84            	pop	a
 276                     ; 79 	TIM1_TimeBaseInit(128,TIM1_COUNTERMODE_UP,124,0);	
 278  00a9 4b00          	push	#0
 279  00ab ae007c        	ldw	x,#124
 280  00ae 89            	pushw	x
 281  00af 4b00          	push	#0
 282  00b1 ae0080        	ldw	x,#128
 283  00b4 cd0000        	call	_TIM1_TimeBaseInit
 285  00b7 5b04          	addw	sp,#4
 286                     ; 80 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
 288  00b9 ae0101        	ldw	x,#257
 289  00bc cd0000        	call	_TIM1_ITConfig
 291                     ; 81 	TIM1_Cmd(ENABLE);
 293  00bf a601          	ld	a,#1
 294  00c1 cd0000        	call	_TIM1_Cmd
 296                     ; 84 	TIM2_TimeBaseInit(TIM2_PRESCALER_128,1249);
 298  00c4 ae04e1        	ldw	x,#1249
 299  00c7 89            	pushw	x
 300  00c8 a607          	ld	a,#7
 301  00ca cd0000        	call	_TIM2_TimeBaseInit
 303  00cd 85            	popw	x
 304                     ; 85 	TIM2_ITConfig(TIM2_IT_UPDATE,ENABLE);
 306  00ce ae0101        	ldw	x,#257
 307  00d1 cd0000        	call	_TIM2_ITConfig
 309                     ; 86 	TIM2_Cmd(ENABLE);
 311  00d4 a601          	ld	a,#1
 312  00d6 cd0000        	call	_TIM2_Cmd
 314                     ; 88 	enableInterrupts();
 317  00d9 9a            rim
 319                     ; 90 	GPIO_WriteHigh(POWER_LED_PORT,POWER_LED);
 322  00da 4b10          	push	#16
 323  00dc ae5005        	ldw	x,#20485
 324  00df cd0000        	call	_GPIO_WriteHigh
 326  00e2 84            	pop	a
 327                     ; 91 	DelayMs(3000);
 329  00e3 ae0bb8        	ldw	x,#3000
 330  00e6 89            	pushw	x
 331  00e7 ae0000        	ldw	x,#0
 332  00ea 89            	pushw	x
 333  00eb cd0000        	call	_DelayMs
 335  00ee 5b04          	addw	sp,#4
 336                     ; 92 	GPIO_WriteLow(POWER_LED_PORT,POWER_LED);
 338  00f0 4b10          	push	#16
 339  00f2 ae5005        	ldw	x,#20485
 340  00f5 cd0000        	call	_GPIO_WriteLow
 342  00f8 84            	pop	a
 343  00f9               L75:
 344                     ; 97 		if(!GPIO_ReadInputPin(SOAP_SENSOR_PORT,SOAP_SENSOR))
 346  00f9 4b01          	push	#1
 347  00fb ae5005        	ldw	x,#20485
 348  00fe cd0000        	call	_GPIO_ReadInputPin
 350  0101 5b01          	addw	sp,#1
 351  0103 4d            	tnz	a
 352  0104 2625          	jrne	L36
 353                     ; 99 			if(!soapFlowDisabled)
 355  0106 0d09          	tnz	(OFST-7,sp)
 356  0108 262a          	jrne	L17
 357                     ; 101 				GPIO_WriteHigh(SOAP_VALVE_PORT,SOAP_VALVE);
 359  010a 4b04          	push	#4
 360  010c ae500f        	ldw	x,#20495
 361  010f cd0000        	call	_GPIO_WriteHigh
 363  0112 84            	pop	a
 364                     ; 102 				soapDispenseStarted = 1;
 366  0113 a601          	ld	a,#1
 367  0115 6b0a          	ld	(OFST-6,sp),a
 369                     ; 103 				if(!firstTickMeasured)
 371  0117 0d0c          	tnz	(OFST-4,sp)
 372  0119 2619          	jrne	L17
 373                     ; 105 					currTick = GetTick();
 375  011b cd0000        	call	_GetTick
 377  011e 96            	ldw	x,sp
 378  011f 1c000d        	addw	x,#OFST-3
 379  0122 cd0000        	call	c_rtol
 382                     ; 106 					firstTickMeasured = 1;
 384  0125 a601          	ld	a,#1
 385  0127 6b0c          	ld	(OFST-4,sp),a
 387  0129 2009          	jra	L17
 388  012b               L36:
 389                     ; 112 			GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 391  012b 4b04          	push	#4
 392  012d ae500f        	ldw	x,#20495
 393  0130 cd0000        	call	_GPIO_WriteLow
 395  0133 84            	pop	a
 396  0134               L17:
 397                     ; 116 		if(soapDispenseStarted)
 399  0134 0d0a          	tnz	(OFST-6,sp)
 400  0136 2733          	jreq	L37
 401                     ; 118 			if((GetTick() - currTick) >= soapDispensationTime)
 403  0138 cd0000        	call	_GetTick
 405  013b 96            	ldw	x,sp
 406  013c 1c000d        	addw	x,#OFST-3
 407  013f cd0000        	call	c_lsub
 409  0142 96            	ldw	x,sp
 410  0143 1c0001        	addw	x,#OFST-15
 411  0146 cd0000        	call	c_lcmp
 413  0149 2520          	jrult	L37
 414                     ; 120 				GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 416  014b 4b04          	push	#4
 417  014d ae500f        	ldw	x,#20495
 418  0150 cd0000        	call	_GPIO_WriteLow
 420  0153 84            	pop	a
 421                     ; 121 				soapFlowDisabled = 1;
 423  0154 a601          	ld	a,#1
 424  0156 6b09          	ld	(OFST-7,sp),a
 426                     ; 122 				soapValveShutOff = 1;
 428  0158 a601          	ld	a,#1
 429  015a 6b0b          	ld	(OFST-5,sp),a
 431                     ; 123 				soapDispenseStarted = 0;
 433  015c 0f0a          	clr	(OFST-6,sp)
 435                     ; 124 				currTick = GetTick();
 437  015e cd0000        	call	_GetTick
 439  0161 96            	ldw	x,sp
 440  0162 1c000d        	addw	x,#OFST-3
 441  0165 cd0000        	call	c_rtol
 444                     ; 125 				StartTogglingLED();
 446  0168 cd0000        	call	_StartTogglingLED
 448  016b               L37:
 449                     ; 130 		if(soapValveShutOff)
 451  016b 0d0b          	tnz	(OFST-5,sp)
 452  016d 278a          	jreq	L75
 453                     ; 132 			if((GetTick() - currTick) >= soapValveShutOffTime)
 455  016f cd0000        	call	_GetTick
 457  0172 96            	ldw	x,sp
 458  0173 1c000d        	addw	x,#OFST-3
 459  0176 cd0000        	call	c_lsub
 461  0179 96            	ldw	x,sp
 462  017a 1c0005        	addw	x,#OFST-11
 463  017d cd0000        	call	c_lcmp
 465  0180 2403          	jruge	L6
 466  0182 cc00f9        	jp	L75
 467  0185               L6:
 468                     ; 134 				soapValveShutOff = 0;
 470  0185 0f0b          	clr	(OFST-5,sp)
 472                     ; 135 				soapFlowDisabled = 0;
 474  0187 0f09          	clr	(OFST-7,sp)
 476                     ; 136 				firstTickMeasured = 0;
 478  0189 0f0c          	clr	(OFST-4,sp)
 480                     ; 137 				StopTogglingLED();
 482  018b cd0000        	call	_StopTogglingLED
 484  018e acf900f9      	jpf	L75
 497                     	xdef	_main
 498                     	xref	_StopTogglingLED
 499                     	xref	_StartTogglingLED
 500                     	xref	_DelayMs
 501                     	xref	_GetTick
 502                     	xref	_TIM2_ITConfig
 503                     	xref	_TIM2_Cmd
 504                     	xref	_TIM2_TimeBaseInit
 505                     	xref	_TIM1_ITConfig
 506                     	xref	_TIM1_Cmd
 507                     	xref	_TIM1_TimeBaseInit
 508                     	xref	_GPIO_ReadInputPin
 509                     	xref	_GPIO_WriteLow
 510                     	xref	_GPIO_WriteHigh
 511                     	xref	_GPIO_Init
 512                     	xref	_CLK_HSIPrescalerConfig
 531                     	xref	c_lcmp
 532                     	xref	c_lsub
 533                     	xref	c_rtol
 534                     	end
