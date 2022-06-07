   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  55                     ; 46 static void IndicatePowerOn(void)
  55                     ; 47 {
  57                     	switch	.text
  58  0000               L3_IndicatePowerOn:
  60  0000 88            	push	a
  61       00000001      OFST:	set	1
  64                     ; 48 	uint8_t i = 0;
  66  0001 0f01          	clr	(OFST+0,sp)
  68  0003               L13:
  69                     ; 51 		GPIO_WriteHigh(POWER_LED_PORT,POWER_LED);
  71  0003 4b20          	push	#32
  72  0005 ae5005        	ldw	x,#20485
  73  0008 cd0000        	call	_GPIO_WriteHigh
  75  000b 84            	pop	a
  76                     ; 52 		DelayMs(500);
  78  000c ae01f4        	ldw	x,#500
  79  000f 89            	pushw	x
  80  0010 ae0000        	ldw	x,#0
  81  0013 89            	pushw	x
  82  0014 cd0000        	call	_DelayMs
  84  0017 5b04          	addw	sp,#4
  85                     ; 53 		GPIO_WriteLow(POWER_LED_PORT,POWER_LED);
  87  0019 4b20          	push	#32
  88  001b ae5005        	ldw	x,#20485
  89  001e cd0000        	call	_GPIO_WriteLow
  91  0021 84            	pop	a
  92                     ; 54 		DelayMs(500);
  94  0022 ae01f4        	ldw	x,#500
  95  0025 89            	pushw	x
  96  0026 ae0000        	ldw	x,#0
  97  0029 89            	pushw	x
  98  002a cd0000        	call	_DelayMs
 100  002d 5b04          	addw	sp,#4
 101                     ; 55 		i++;
 103  002f 0c01          	inc	(OFST+0,sp)
 105                     ; 49 	while(i < 3)
 107  0031 7b01          	ld	a,(OFST+0,sp)
 108  0033 a103          	cp	a,#3
 109  0035 25cc          	jrult	L13
 110                     ; 57 }
 113  0037 84            	pop	a
 114  0038 81            	ret
 222                     ; 59 int main(void)
 222                     ; 60 {
 223                     	switch	.text
 224  0039               _main:
 226  0039 5210          	subw	sp,#16
 227       00000010      OFST:	set	16
 230                     ; 62 	uint32_t soapDispensationTime = 10000; //10 secs default
 232  003b ae2710        	ldw	x,#10000
 233  003e 1f03          	ldw	(OFST-13,sp),x
 234  0040 ae0000        	ldw	x,#0
 235  0043 1f01          	ldw	(OFST-15,sp),x
 237                     ; 63 	uint32_t soapValveShutOffTime = 60000; //1 minute default
 239  0045 aeea60        	ldw	x,#60000
 240  0048 1f07          	ldw	(OFST-9,sp),x
 241  004a ae0000        	ldw	x,#0
 242  004d 1f05          	ldw	(OFST-11,sp),x
 244                     ; 64 	uint8_t soapFlowDisabled = 0;
 246  004f 0f09          	clr	(OFST-7,sp)
 248                     ; 65 	uint8_t soapDispenseStarted = 0;
 250  0051 0f0a          	clr	(OFST-6,sp)
 252                     ; 66 	uint8_t soapValveShutOff = 0;
 254  0053 0f0b          	clr	(OFST-5,sp)
 256                     ; 67 	uint8_t firstTickMeasured = 0;
 258  0055 0f0c          	clr	(OFST-4,sp)
 260                     ; 68 	uint32_t currentTick = 0;
 262  0057 ae0000        	ldw	x,#0
 263  005a 1f0f          	ldw	(OFST-1,sp),x
 264  005c ae0000        	ldw	x,#0
 265  005f 1f0d          	ldw	(OFST-3,sp),x
 267                     ; 70 	disableInterrupts();
 270  0061 9b            sim
 272                     ; 72 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 275  0062 4f            	clr	a
 276  0063 cd0000        	call	_CLK_HSIPrescalerConfig
 278                     ; 74 	GPIO_Init(SOAP_SENSOR_PORT,SOAP_SENSOR,SENSOR_INIT);
 280  0066 4b40          	push	#64
 281  0068 4b01          	push	#1
 282  006a ae5005        	ldw	x,#20485
 283  006d cd0000        	call	_GPIO_Init
 285  0070 85            	popw	x
 286                     ; 75 	GPIO_Init(FAN_SENSOR_PORT,FAN_SENSOR,SENSOR_INIT);
 288  0071 4b40          	push	#64
 289  0073 4b02          	push	#2
 290  0075 ae5005        	ldw	x,#20485
 291  0078 cd0000        	call	_GPIO_Init
 293  007b 85            	popw	x
 294                     ; 76 	GPIO_Init(WATER_SENSOR_PORT,WATER_SENSOR,SENSOR_INIT);
 296  007c 4b40          	push	#64
 297  007e 4b04          	push	#4
 298  0080 ae5005        	ldw	x,#20485
 299  0083 cd0000        	call	_GPIO_Init
 301  0086 85            	popw	x
 302                     ; 78 	GPIO_Init(SOAP_VALVE_PORT,SOAP_VALVE,OUTPUT_INIT);
 304  0087 4be0          	push	#224
 305  0089 4b04          	push	#4
 306  008b ae500f        	ldw	x,#20495
 307  008e cd0000        	call	_GPIO_Init
 309  0091 85            	popw	x
 310                     ; 79 	GPIO_Init(FAN_PORT,FAN,OUTPUT_INIT);
 312  0092 4be0          	push	#224
 313  0094 4b08          	push	#8
 314  0096 ae500f        	ldw	x,#20495
 315  0099 cd0000        	call	_GPIO_Init
 317  009c 85            	popw	x
 318                     ; 80 	GPIO_Init(WATER_VALVE_PORT,WATER_VALVE,OUTPUT_INIT);
 320  009d 4be0          	push	#224
 321  009f 4b10          	push	#16
 322  00a1 ae500f        	ldw	x,#20495
 323  00a4 cd0000        	call	_GPIO_Init
 325  00a7 85            	popw	x
 326                     ; 81 	GPIO_Init(SOAP_LED_PORT,SOAP_LED,OUTPUT_INIT);
 328  00a8 4be0          	push	#224
 329  00aa 4b10          	push	#16
 330  00ac ae5019        	ldw	x,#20505
 331  00af cd0000        	call	_GPIO_Init
 333  00b2 85            	popw	x
 334                     ; 82 	GPIO_Init(POWER_LED_PORT,POWER_LED,OUTPUT_INIT);
 336  00b3 4be0          	push	#224
 337  00b5 4b20          	push	#32
 338  00b7 ae5005        	ldw	x,#20485
 339  00ba cd0000        	call	_GPIO_Init
 341  00bd 85            	popw	x
 342                     ; 84 	GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 344  00be 4b04          	push	#4
 345  00c0 ae500f        	ldw	x,#20495
 346  00c3 cd0000        	call	_GPIO_WriteLow
 348  00c6 84            	pop	a
 349                     ; 85 	GPIO_WriteLow(FAN_PORT,FAN);
 351  00c7 4b08          	push	#8
 352  00c9 ae500f        	ldw	x,#20495
 353  00cc cd0000        	call	_GPIO_WriteLow
 355  00cf 84            	pop	a
 356                     ; 86 	GPIO_WriteLow(WATER_VALVE_PORT,WATER_VALVE);
 358  00d0 4b10          	push	#16
 359  00d2 ae500f        	ldw	x,#20495
 360  00d5 cd0000        	call	_GPIO_WriteLow
 362  00d8 84            	pop	a
 363                     ; 87 	GPIO_WriteLow(SOAP_LED_PORT,SOAP_LED);
 365  00d9 4b10          	push	#16
 366  00db ae5019        	ldw	x,#20505
 367  00de cd0000        	call	_GPIO_WriteLow
 369  00e1 84            	pop	a
 370                     ; 91 	TIM1_TimeBaseInit(128,TIM1_COUNTERMODE_UP,124,0);	
 372  00e2 4b00          	push	#0
 373  00e4 ae007c        	ldw	x,#124
 374  00e7 89            	pushw	x
 375  00e8 4b00          	push	#0
 376  00ea ae0080        	ldw	x,#128
 377  00ed cd0000        	call	_TIM1_TimeBaseInit
 379  00f0 5b04          	addw	sp,#4
 380                     ; 92 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
 382  00f2 ae0101        	ldw	x,#257
 383  00f5 cd0000        	call	_TIM1_ITConfig
 385                     ; 93 	TIM1_Cmd(ENABLE);
 387  00f8 a601          	ld	a,#1
 388  00fa cd0000        	call	_TIM1_Cmd
 390                     ; 96 	TIM2_TimeBaseInit(TIM2_PRESCALER_128,1249);
 392  00fd ae04e1        	ldw	x,#1249
 393  0100 89            	pushw	x
 394  0101 a607          	ld	a,#7
 395  0103 cd0000        	call	_TIM2_TimeBaseInit
 397  0106 85            	popw	x
 398                     ; 97 	TIM2_ITConfig(TIM2_IT_UPDATE,ENABLE);
 400  0107 ae0101        	ldw	x,#257
 401  010a cd0000        	call	_TIM2_ITConfig
 403                     ; 98 	TIM2_Cmd(ENABLE);
 405  010d a601          	ld	a,#1
 406  010f cd0000        	call	_TIM2_Cmd
 408                     ; 100 	enableInterrupts();
 411  0112 9a            rim
 413                     ; 102 	IndicatePowerOn();
 416  0113 cd0000        	call	L3_IndicatePowerOn
 418  0116               L501:
 419                     ; 107 		if(!GPIO_ReadInputPin(SOAP_SENSOR_PORT,SOAP_SENSOR))
 421  0116 4b01          	push	#1
 422  0118 ae5005        	ldw	x,#20485
 423  011b cd0000        	call	_GPIO_ReadInputPin
 425  011e 5b01          	addw	sp,#1
 426  0120 4d            	tnz	a
 427  0121 2625          	jrne	L111
 428                     ; 109 			if(!soapFlowDisabled)
 430  0123 0d09          	tnz	(OFST-7,sp)
 431  0125 262a          	jrne	L711
 432                     ; 111 				GPIO_WriteHigh(SOAP_VALVE_PORT,SOAP_VALVE);
 434  0127 4b04          	push	#4
 435  0129 ae500f        	ldw	x,#20495
 436  012c cd0000        	call	_GPIO_WriteHigh
 438  012f 84            	pop	a
 439                     ; 112 				soapDispenseStarted = 1;
 441  0130 a601          	ld	a,#1
 442  0132 6b0a          	ld	(OFST-6,sp),a
 444                     ; 113 				if(!firstTickMeasured)
 446  0134 0d0c          	tnz	(OFST-4,sp)
 447  0136 2619          	jrne	L711
 448                     ; 115 					currentTick = GetTick();
 450  0138 cd0000        	call	_GetTick
 452  013b 96            	ldw	x,sp
 453  013c 1c000d        	addw	x,#OFST-3
 454  013f cd0000        	call	c_rtol
 457                     ; 116 					firstTickMeasured = 1;
 459  0142 a601          	ld	a,#1
 460  0144 6b0c          	ld	(OFST-4,sp),a
 462  0146 2009          	jra	L711
 463  0148               L111:
 464                     ; 122 			GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 466  0148 4b04          	push	#4
 467  014a ae500f        	ldw	x,#20495
 468  014d cd0000        	call	_GPIO_WriteLow
 470  0150 84            	pop	a
 471  0151               L711:
 472                     ; 126 		if(soapDispenseStarted)
 474  0151 0d0a          	tnz	(OFST-6,sp)
 475  0153 2733          	jreq	L121
 476                     ; 128 			if((GetTick() - currentTick) >= soapDispensationTime)
 478  0155 cd0000        	call	_GetTick
 480  0158 96            	ldw	x,sp
 481  0159 1c000d        	addw	x,#OFST-3
 482  015c cd0000        	call	c_lsub
 484  015f 96            	ldw	x,sp
 485  0160 1c0001        	addw	x,#OFST-15
 486  0163 cd0000        	call	c_lcmp
 488  0166 2520          	jrult	L121
 489                     ; 130 				GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 491  0168 4b04          	push	#4
 492  016a ae500f        	ldw	x,#20495
 493  016d cd0000        	call	_GPIO_WriteLow
 495  0170 84            	pop	a
 496                     ; 131 				soapFlowDisabled = 1;
 498  0171 a601          	ld	a,#1
 499  0173 6b09          	ld	(OFST-7,sp),a
 501                     ; 132 				soapValveShutOff = 1;
 503  0175 a601          	ld	a,#1
 504  0177 6b0b          	ld	(OFST-5,sp),a
 506                     ; 133 				soapDispenseStarted = 0;
 508  0179 0f0a          	clr	(OFST-6,sp)
 510                     ; 134 				currentTick = GetTick();
 512  017b cd0000        	call	_GetTick
 514  017e 96            	ldw	x,sp
 515  017f 1c000d        	addw	x,#OFST-3
 516  0182 cd0000        	call	c_rtol
 519                     ; 135 				StartTogglingLED();
 521  0185 cd0000        	call	_StartTogglingLED
 523  0188               L121:
 524                     ; 140 		if(soapValveShutOff)
 526  0188 0d0b          	tnz	(OFST-5,sp)
 527  018a 278a          	jreq	L501
 528                     ; 142 			if((GetTick() - currentTick) >= soapValveShutOffTime)
 530  018c cd0000        	call	_GetTick
 532  018f 96            	ldw	x,sp
 533  0190 1c000d        	addw	x,#OFST-3
 534  0193 cd0000        	call	c_lsub
 536  0196 96            	ldw	x,sp
 537  0197 1c0005        	addw	x,#OFST-11
 538  019a cd0000        	call	c_lcmp
 540  019d 2403          	jruge	L01
 541  019f cc0116        	jp	L501
 542  01a2               L01:
 543                     ; 144 				soapValveShutOff = 0;
 545  01a2 0f0b          	clr	(OFST-5,sp)
 547                     ; 145 				soapFlowDisabled = 0;
 549  01a4 0f09          	clr	(OFST-7,sp)
 551                     ; 146 				firstTickMeasured = 0;
 553  01a6 0f0c          	clr	(OFST-4,sp)
 555                     ; 147 				StopTogglingLED();
 557  01a8 cd0000        	call	_StopTogglingLED
 559  01ab ac160116      	jpf	L501
 572                     	xdef	_main
 573                     	xref	_StopTogglingLED
 574                     	xref	_StartTogglingLED
 575                     	xref	_DelayMs
 576                     	xref	_GetTick
 577                     	xref	_TIM2_ITConfig
 578                     	xref	_TIM2_Cmd
 579                     	xref	_TIM2_TimeBaseInit
 580                     	xref	_TIM1_ITConfig
 581                     	xref	_TIM1_Cmd
 582                     	xref	_TIM1_TimeBaseInit
 583                     	xref	_GPIO_ReadInputPin
 584                     	xref	_GPIO_WriteLow
 585                     	xref	_GPIO_WriteHigh
 586                     	xref	_GPIO_Init
 587                     	xref	_CLK_HSIPrescalerConfig
 606                     	xref	c_lcmp
 607                     	xref	c_lsub
 608                     	xref	c_rtol
 609                     	end
