   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  56                     ; 47 static void IndicatePowerOn(void)
  56                     ; 48 {
  58                     	switch	.text
  59  0000               L3_IndicatePowerOn:
  61  0000 88            	push	a
  62       00000001      OFST:	set	1
  65                     ; 49 	uint8_t i = 0;
  67  0001 0f01          	clr	(OFST+0,sp)
  69  0003               L13:
  70                     ; 52 		GPIO_WriteHigh(POWER_LED_PORT,POWER_LED);
  72  0003 4b20          	push	#32
  73  0005 ae5005        	ldw	x,#20485
  74  0008 cd0000        	call	_GPIO_WriteHigh
  76  000b 84            	pop	a
  77                     ; 53 		DelayMs(500);
  79  000c ae01f4        	ldw	x,#500
  80  000f 89            	pushw	x
  81  0010 ae0000        	ldw	x,#0
  82  0013 89            	pushw	x
  83  0014 cd0000        	call	_DelayMs
  85  0017 5b04          	addw	sp,#4
  86                     ; 54 		GPIO_WriteLow(POWER_LED_PORT,POWER_LED);
  88  0019 4b20          	push	#32
  89  001b ae5005        	ldw	x,#20485
  90  001e cd0000        	call	_GPIO_WriteLow
  92  0021 84            	pop	a
  93                     ; 55 		DelayMs(500);
  95  0022 ae01f4        	ldw	x,#500
  96  0025 89            	pushw	x
  97  0026 ae0000        	ldw	x,#0
  98  0029 89            	pushw	x
  99  002a cd0000        	call	_DelayMs
 101  002d 5b04          	addw	sp,#4
 102                     ; 56 		i++;
 104  002f 0c01          	inc	(OFST+0,sp)
 106                     ; 50 	while(i < 3)
 108  0031 7b01          	ld	a,(OFST+0,sp)
 109  0033 a103          	cp	a,#3
 110  0035 25cc          	jrult	L13
 111                     ; 58 }
 114  0037 84            	pop	a
 115  0038 81            	ret
 223                     ; 60 int main(void)
 223                     ; 61 {
 224                     	switch	.text
 225  0039               _main:
 227  0039 5210          	subw	sp,#16
 228       00000010      OFST:	set	16
 231                     ; 63 	uint32_t soapDispensationTime = 10000; //10 secs default
 233  003b ae2710        	ldw	x,#10000
 234  003e 1f03          	ldw	(OFST-13,sp),x
 235  0040 ae0000        	ldw	x,#0
 236  0043 1f01          	ldw	(OFST-15,sp),x
 238                     ; 64 	uint32_t soapValveShutOffTime = 60000; //1 minute default
 240  0045 aeea60        	ldw	x,#60000
 241  0048 1f07          	ldw	(OFST-9,sp),x
 242  004a ae0000        	ldw	x,#0
 243  004d 1f05          	ldw	(OFST-11,sp),x
 245                     ; 65 	uint8_t soapFlowDisabled = 0;
 247  004f 0f09          	clr	(OFST-7,sp)
 249                     ; 66 	uint8_t soapDispenseStarted = 0;
 251  0051 0f0a          	clr	(OFST-6,sp)
 253                     ; 67 	uint8_t soapValveShutOff = 0;
 255  0053 0f0b          	clr	(OFST-5,sp)
 257                     ; 68 	uint8_t firstTickMeasured = 0;
 259  0055 0f0c          	clr	(OFST-4,sp)
 261                     ; 69 	uint32_t currTick = 0; //current tick
 263  0057 ae0000        	ldw	x,#0
 264  005a 1f0f          	ldw	(OFST-1,sp),x
 265  005c ae0000        	ldw	x,#0
 266  005f 1f0d          	ldw	(OFST-3,sp),x
 268                     ; 71 	disableInterrupts();
 271  0061 9b            sim
 273                     ; 73 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 276  0062 4f            	clr	a
 277  0063 cd0000        	call	_CLK_HSIPrescalerConfig
 279                     ; 75 	GPIO_Init(SOAP_SENSOR_PORT,SOAP_SENSOR,SENSOR_INIT);
 281  0066 4b40          	push	#64
 282  0068 4b01          	push	#1
 283  006a ae5005        	ldw	x,#20485
 284  006d cd0000        	call	_GPIO_Init
 286  0070 85            	popw	x
 287                     ; 76 	GPIO_Init(FAN_SENSOR_PORT,FAN_SENSOR,SENSOR_INIT);
 289  0071 4b40          	push	#64
 290  0073 4b02          	push	#2
 291  0075 ae5005        	ldw	x,#20485
 292  0078 cd0000        	call	_GPIO_Init
 294  007b 85            	popw	x
 295                     ; 77 	GPIO_Init(WATER_SENSOR_PORT,WATER_SENSOR,SENSOR_INIT);
 297  007c 4b40          	push	#64
 298  007e 4b04          	push	#4
 299  0080 ae5005        	ldw	x,#20485
 300  0083 cd0000        	call	_GPIO_Init
 302  0086 85            	popw	x
 303                     ; 79 	GPIO_Init(SOAP_VALVE_PORT,SOAP_VALVE,OUTPUT_INIT);
 305  0087 4be0          	push	#224
 306  0089 4b04          	push	#4
 307  008b ae500f        	ldw	x,#20495
 308  008e cd0000        	call	_GPIO_Init
 310  0091 85            	popw	x
 311                     ; 80 	GPIO_Init(FAN_PORT,FAN,OUTPUT_INIT);
 313  0092 4be0          	push	#224
 314  0094 4b08          	push	#8
 315  0096 ae500f        	ldw	x,#20495
 316  0099 cd0000        	call	_GPIO_Init
 318  009c 85            	popw	x
 319                     ; 81 	GPIO_Init(WATER_VALVE_PORT,WATER_VALVE,OUTPUT_INIT);
 321  009d 4be0          	push	#224
 322  009f 4b10          	push	#16
 323  00a1 ae500f        	ldw	x,#20495
 324  00a4 cd0000        	call	_GPIO_Init
 326  00a7 85            	popw	x
 327                     ; 82 	GPIO_Init(SOAP_LED_PORT,SOAP_LED,OUTPUT_INIT);
 329  00a8 4be0          	push	#224
 330  00aa 4b10          	push	#16
 331  00ac ae5019        	ldw	x,#20505
 332  00af cd0000        	call	_GPIO_Init
 334  00b2 85            	popw	x
 335                     ; 83 	GPIO_Init(POWER_LED_PORT,POWER_LED,OUTPUT_INIT);
 337  00b3 4be0          	push	#224
 338  00b5 4b20          	push	#32
 339  00b7 ae5005        	ldw	x,#20485
 340  00ba cd0000        	call	_GPIO_Init
 342  00bd 85            	popw	x
 343                     ; 85 	GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 345  00be 4b04          	push	#4
 346  00c0 ae500f        	ldw	x,#20495
 347  00c3 cd0000        	call	_GPIO_WriteLow
 349  00c6 84            	pop	a
 350                     ; 86 	GPIO_WriteLow(FAN_PORT,FAN);
 352  00c7 4b08          	push	#8
 353  00c9 ae500f        	ldw	x,#20495
 354  00cc cd0000        	call	_GPIO_WriteLow
 356  00cf 84            	pop	a
 357                     ; 87 	GPIO_WriteHigh(WATER_VALVE_PORT,WATER_VALVE); //Active low
 359  00d0 4b10          	push	#16
 360  00d2 ae500f        	ldw	x,#20495
 361  00d5 cd0000        	call	_GPIO_WriteHigh
 363  00d8 84            	pop	a
 364                     ; 88 	GPIO_WriteLow(SOAP_LED_PORT,SOAP_LED);
 366  00d9 4b10          	push	#16
 367  00db ae5019        	ldw	x,#20505
 368  00de cd0000        	call	_GPIO_WriteLow
 370  00e1 84            	pop	a
 371                     ; 92 	TIM1_TimeBaseInit(128,TIM1_COUNTERMODE_UP,124,0);	
 373  00e2 4b00          	push	#0
 374  00e4 ae007c        	ldw	x,#124
 375  00e7 89            	pushw	x
 376  00e8 4b00          	push	#0
 377  00ea ae0080        	ldw	x,#128
 378  00ed cd0000        	call	_TIM1_TimeBaseInit
 380  00f0 5b04          	addw	sp,#4
 381                     ; 93 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
 383  00f2 ae0101        	ldw	x,#257
 384  00f5 cd0000        	call	_TIM1_ITConfig
 386                     ; 94 	TIM1_Cmd(ENABLE);
 388  00f8 a601          	ld	a,#1
 389  00fa cd0000        	call	_TIM1_Cmd
 391                     ; 97 	TIM2_TimeBaseInit(TIM2_PRESCALER_128,1249);
 393  00fd ae04e1        	ldw	x,#1249
 394  0100 89            	pushw	x
 395  0101 a607          	ld	a,#7
 396  0103 cd0000        	call	_TIM2_TimeBaseInit
 398  0106 85            	popw	x
 399                     ; 98 	TIM2_ITConfig(TIM2_IT_UPDATE,ENABLE);
 401  0107 ae0101        	ldw	x,#257
 402  010a cd0000        	call	_TIM2_ITConfig
 404                     ; 99 	TIM2_Cmd(ENABLE);
 406  010d a601          	ld	a,#1
 407  010f cd0000        	call	_TIM2_Cmd
 409                     ; 101 	enableInterrupts();
 412  0112 9a            rim
 414                     ; 103 	IndicatePowerOn();
 417  0113 cd0000        	call	L3_IndicatePowerOn
 419  0116               L501:
 420                     ; 108 		if(!GPIO_ReadInputPin(SOAP_SENSOR_PORT,SOAP_SENSOR))
 422  0116 4b01          	push	#1
 423  0118 ae5005        	ldw	x,#20485
 424  011b cd0000        	call	_GPIO_ReadInputPin
 426  011e 5b01          	addw	sp,#1
 427  0120 4d            	tnz	a
 428  0121 2625          	jrne	L111
 429                     ; 110 			if(!soapFlowDisabled)
 431  0123 0d09          	tnz	(OFST-7,sp)
 432  0125 262a          	jrne	L711
 433                     ; 112 				GPIO_WriteHigh(SOAP_VALVE_PORT,SOAP_VALVE);
 435  0127 4b04          	push	#4
 436  0129 ae500f        	ldw	x,#20495
 437  012c cd0000        	call	_GPIO_WriteHigh
 439  012f 84            	pop	a
 440                     ; 113 				soapDispenseStarted = 1;
 442  0130 a601          	ld	a,#1
 443  0132 6b0a          	ld	(OFST-6,sp),a
 445                     ; 114 				if(!firstTickMeasured)
 447  0134 0d0c          	tnz	(OFST-4,sp)
 448  0136 2619          	jrne	L711
 449                     ; 116 					currTick = GetTick();
 451  0138 cd0000        	call	_GetTick
 453  013b 96            	ldw	x,sp
 454  013c 1c000d        	addw	x,#OFST-3
 455  013f cd0000        	call	c_rtol
 458                     ; 117 					firstTickMeasured = 1;
 460  0142 a601          	ld	a,#1
 461  0144 6b0c          	ld	(OFST-4,sp),a
 463  0146 2009          	jra	L711
 464  0148               L111:
 465                     ; 123 			GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 467  0148 4b04          	push	#4
 468  014a ae500f        	ldw	x,#20495
 469  014d cd0000        	call	_GPIO_WriteLow
 471  0150 84            	pop	a
 472  0151               L711:
 473                     ; 127 		if(soapDispenseStarted)
 475  0151 0d0a          	tnz	(OFST-6,sp)
 476  0153 2733          	jreq	L121
 477                     ; 129 			if((GetTick() - currTick) >= soapDispensationTime)
 479  0155 cd0000        	call	_GetTick
 481  0158 96            	ldw	x,sp
 482  0159 1c000d        	addw	x,#OFST-3
 483  015c cd0000        	call	c_lsub
 485  015f 96            	ldw	x,sp
 486  0160 1c0001        	addw	x,#OFST-15
 487  0163 cd0000        	call	c_lcmp
 489  0166 2520          	jrult	L121
 490                     ; 131 				GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 492  0168 4b04          	push	#4
 493  016a ae500f        	ldw	x,#20495
 494  016d cd0000        	call	_GPIO_WriteLow
 496  0170 84            	pop	a
 497                     ; 132 				soapFlowDisabled = 1;
 499  0171 a601          	ld	a,#1
 500  0173 6b09          	ld	(OFST-7,sp),a
 502                     ; 133 				soapValveShutOff = 1;
 504  0175 a601          	ld	a,#1
 505  0177 6b0b          	ld	(OFST-5,sp),a
 507                     ; 134 				soapDispenseStarted = 0;
 509  0179 0f0a          	clr	(OFST-6,sp)
 511                     ; 135 				currTick = GetTick();
 513  017b cd0000        	call	_GetTick
 515  017e 96            	ldw	x,sp
 516  017f 1c000d        	addw	x,#OFST-3
 517  0182 cd0000        	call	c_rtol
 520                     ; 136 				StartTogglingLED();
 522  0185 cd0000        	call	_StartTogglingLED
 524  0188               L121:
 525                     ; 141 		if(soapValveShutOff)
 527  0188 0d0b          	tnz	(OFST-5,sp)
 528  018a 278a          	jreq	L501
 529                     ; 143 			if((GetTick() - currTick) >= soapValveShutOffTime)
 531  018c cd0000        	call	_GetTick
 533  018f 96            	ldw	x,sp
 534  0190 1c000d        	addw	x,#OFST-3
 535  0193 cd0000        	call	c_lsub
 537  0196 96            	ldw	x,sp
 538  0197 1c0005        	addw	x,#OFST-11
 539  019a cd0000        	call	c_lcmp
 541  019d 2403          	jruge	L01
 542  019f cc0116        	jp	L501
 543  01a2               L01:
 544                     ; 145 				soapValveShutOff = 0;
 546  01a2 0f0b          	clr	(OFST-5,sp)
 548                     ; 146 				soapFlowDisabled = 0;
 550  01a4 0f09          	clr	(OFST-7,sp)
 552                     ; 147 				firstTickMeasured = 0;
 554  01a6 0f0c          	clr	(OFST-4,sp)
 556                     ; 148 				StopTogglingLED();
 558  01a8 cd0000        	call	_StopTogglingLED
 560  01ab ac160116      	jpf	L501
 573                     	xdef	_main
 574                     	xref	_StopTogglingLED
 575                     	xref	_StartTogglingLED
 576                     	xref	_DelayMs
 577                     	xref	_GetTick
 578                     	xref	_TIM2_ITConfig
 579                     	xref	_TIM2_Cmd
 580                     	xref	_TIM2_TimeBaseInit
 581                     	xref	_TIM1_ITConfig
 582                     	xref	_TIM1_Cmd
 583                     	xref	_TIM1_TimeBaseInit
 584                     	xref	_GPIO_ReadInputPin
 585                     	xref	_GPIO_WriteLow
 586                     	xref	_GPIO_WriteHigh
 587                     	xref	_GPIO_Init
 588                     	xref	_CLK_HSIPrescalerConfig
 607                     	xref	c_lcmp
 608                     	xref	c_lsub
 609                     	xref	c_rtol
 610                     	end
