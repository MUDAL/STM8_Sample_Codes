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
 195                     ; 59 int main(void)
 195                     ; 60 {
 196                     	switch	.text
 197  0039               _main:
 199  0039 520d          	subw	sp,#13
 200       0000000d      OFST:	set	13
 203                     ; 62 	uint32_t soapDispensationTime = 10000; //10 secs default
 205  003b ae2710        	ldw	x,#10000
 206  003e 1f03          	ldw	(OFST-10,sp),x
 207  0040 ae0000        	ldw	x,#0
 208  0043 1f01          	ldw	(OFST-12,sp),x
 210                     ; 63 	uint32_t soapValveShutOffTime = 60000; //1 minute default
 212  0045 aeea60        	ldw	x,#60000
 213  0048 1f07          	ldw	(OFST-6,sp),x
 214  004a ae0000        	ldw	x,#0
 215  004d 1f05          	ldw	(OFST-8,sp),x
 217                     ; 64 	uint8_t soapFlowDisabled = 0;
 219  004f 0f0d          	clr	(OFST+0,sp)
 221                     ; 65 	uint32_t currentTick = 0;
 223  0051 ae0000        	ldw	x,#0
 224  0054 1f0b          	ldw	(OFST-2,sp),x
 225  0056 ae0000        	ldw	x,#0
 226  0059 1f09          	ldw	(OFST-4,sp),x
 228                     ; 67 	disableInterrupts();
 231  005b 9b            sim
 233                     ; 69 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 236  005c 4f            	clr	a
 237  005d cd0000        	call	_CLK_HSIPrescalerConfig
 239                     ; 71 	GPIO_Init(SOAP_SENSOR_PORT,SOAP_SENSOR,SENSOR_INIT);
 241  0060 4b40          	push	#64
 242  0062 4b01          	push	#1
 243  0064 ae5005        	ldw	x,#20485
 244  0067 cd0000        	call	_GPIO_Init
 246  006a 85            	popw	x
 247                     ; 72 	GPIO_Init(FAN_SENSOR_PORT,FAN_SENSOR,SENSOR_INIT);
 249  006b 4b40          	push	#64
 250  006d 4b02          	push	#2
 251  006f ae5005        	ldw	x,#20485
 252  0072 cd0000        	call	_GPIO_Init
 254  0075 85            	popw	x
 255                     ; 73 	GPIO_Init(WATER_SENSOR_PORT,WATER_SENSOR,SENSOR_INIT);
 257  0076 4b40          	push	#64
 258  0078 4b04          	push	#4
 259  007a ae5005        	ldw	x,#20485
 260  007d cd0000        	call	_GPIO_Init
 262  0080 85            	popw	x
 263                     ; 75 	GPIO_Init(SOAP_VALVE_PORT,SOAP_VALVE,OUTPUT_INIT);
 265  0081 4be0          	push	#224
 266  0083 4b04          	push	#4
 267  0085 ae500f        	ldw	x,#20495
 268  0088 cd0000        	call	_GPIO_Init
 270  008b 85            	popw	x
 271                     ; 76 	GPIO_Init(FAN_PORT,FAN,OUTPUT_INIT);
 273  008c 4be0          	push	#224
 274  008e 4b08          	push	#8
 275  0090 ae500f        	ldw	x,#20495
 276  0093 cd0000        	call	_GPIO_Init
 278  0096 85            	popw	x
 279                     ; 77 	GPIO_Init(WATER_VALVE_PORT,WATER_VALVE,OUTPUT_INIT);
 281  0097 4be0          	push	#224
 282  0099 4b10          	push	#16
 283  009b ae500f        	ldw	x,#20495
 284  009e cd0000        	call	_GPIO_Init
 286  00a1 85            	popw	x
 287                     ; 78 	GPIO_Init(SOAP_LED_PORT,SOAP_LED,OUTPUT_INIT);
 289  00a2 4be0          	push	#224
 290  00a4 4b10          	push	#16
 291  00a6 ae5019        	ldw	x,#20505
 292  00a9 cd0000        	call	_GPIO_Init
 294  00ac 85            	popw	x
 295                     ; 79 	GPIO_Init(POWER_LED_PORT,POWER_LED,OUTPUT_INIT);
 297  00ad 4be0          	push	#224
 298  00af 4b20          	push	#32
 299  00b1 ae5005        	ldw	x,#20485
 300  00b4 cd0000        	call	_GPIO_Init
 302  00b7 85            	popw	x
 303                     ; 81 	GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 305  00b8 4b04          	push	#4
 306  00ba ae500f        	ldw	x,#20495
 307  00bd cd0000        	call	_GPIO_WriteLow
 309  00c0 84            	pop	a
 310                     ; 82 	GPIO_WriteLow(FAN_PORT,FAN);
 312  00c1 4b08          	push	#8
 313  00c3 ae500f        	ldw	x,#20495
 314  00c6 cd0000        	call	_GPIO_WriteLow
 316  00c9 84            	pop	a
 317                     ; 83 	GPIO_WriteLow(WATER_VALVE_PORT,WATER_VALVE);
 319  00ca 4b10          	push	#16
 320  00cc ae500f        	ldw	x,#20495
 321  00cf cd0000        	call	_GPIO_WriteLow
 323  00d2 84            	pop	a
 324                     ; 84 	GPIO_WriteLow(SOAP_LED_PORT,SOAP_LED);
 326  00d3 4b10          	push	#16
 327  00d5 ae5019        	ldw	x,#20505
 328  00d8 cd0000        	call	_GPIO_WriteLow
 330  00db 84            	pop	a
 331                     ; 88 	TIM1_TimeBaseInit(128,TIM1_COUNTERMODE_UP,124,0);	
 333  00dc 4b00          	push	#0
 334  00de ae007c        	ldw	x,#124
 335  00e1 89            	pushw	x
 336  00e2 4b00          	push	#0
 337  00e4 ae0080        	ldw	x,#128
 338  00e7 cd0000        	call	_TIM1_TimeBaseInit
 340  00ea 5b04          	addw	sp,#4
 341                     ; 89 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
 343  00ec ae0101        	ldw	x,#257
 344  00ef cd0000        	call	_TIM1_ITConfig
 346                     ; 90 	TIM1_Cmd(ENABLE);
 348  00f2 a601          	ld	a,#1
 349  00f4 cd0000        	call	_TIM1_Cmd
 351                     ; 93 	TIM2_TimeBaseInit(TIM2_PRESCALER_128,1249);
 353  00f7 ae04e1        	ldw	x,#1249
 354  00fa 89            	pushw	x
 355  00fb a607          	ld	a,#7
 356  00fd cd0000        	call	_TIM2_TimeBaseInit
 358  0100 85            	popw	x
 359                     ; 94 	TIM2_ITConfig(TIM2_IT_UPDATE,ENABLE);
 361  0101 ae0101        	ldw	x,#257
 362  0104 cd0000        	call	_TIM2_ITConfig
 364                     ; 95 	TIM2_Cmd(ENABLE);
 366  0107 a601          	ld	a,#1
 367  0109 cd0000        	call	_TIM2_Cmd
 369                     ; 97 	enableInterrupts();
 372  010c 9a            rim
 374                     ; 99 	IndicatePowerOn();
 377  010d cd0000        	call	L3_IndicatePowerOn
 379  0110               L17:
 380                     ; 103 		if(!soapFlowDisabled)
 382  0110 0d0d          	tnz	(OFST+0,sp)
 383  0112 263d          	jrne	L57
 384                     ; 105 			if(!GPIO_ReadInputPin(SOAP_SENSOR_PORT,SOAP_SENSOR))
 386  0114 4b01          	push	#1
 387  0116 ae5005        	ldw	x,#20485
 388  0119 cd0000        	call	_GPIO_ReadInputPin
 390  011c 5b01          	addw	sp,#1
 391  011e 4d            	tnz	a
 392  011f 26ef          	jrne	L17
 393                     ; 107 				GPIO_WriteHigh(SOAP_VALVE_PORT,SOAP_VALVE);
 395  0121 4b04          	push	#4
 396  0123 ae500f        	ldw	x,#20495
 397  0126 cd0000        	call	_GPIO_WriteHigh
 399  0129 84            	pop	a
 400                     ; 108 				DelayMs(soapDispensationTime);
 402  012a 1e03          	ldw	x,(OFST-10,sp)
 403  012c 89            	pushw	x
 404  012d 1e03          	ldw	x,(OFST-10,sp)
 405  012f 89            	pushw	x
 406  0130 cd0000        	call	_DelayMs
 408  0133 5b04          	addw	sp,#4
 409                     ; 109 				GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 411  0135 4b04          	push	#4
 412  0137 ae500f        	ldw	x,#20495
 413  013a cd0000        	call	_GPIO_WriteLow
 415  013d 84            	pop	a
 416                     ; 110 				StartTogglingLED();
 418  013e cd0000        	call	_StartTogglingLED
 420                     ; 111 				soapFlowDisabled = 1;
 422  0141 a601          	ld	a,#1
 423  0143 6b0d          	ld	(OFST+0,sp),a
 425                     ; 112 				currentTick = GetTick();
 427  0145 cd0000        	call	_GetTick
 429  0148 96            	ldw	x,sp
 430  0149 1c0009        	addw	x,#OFST-4
 431  014c cd0000        	call	c_rtol
 434  014f 20bf          	jra	L17
 435  0151               L57:
 436                     ; 117 			if((GetTick() - currentTick) >= soapValveShutOffTime)
 438  0151 cd0000        	call	_GetTick
 440  0154 96            	ldw	x,sp
 441  0155 1c0009        	addw	x,#OFST-4
 442  0158 cd0000        	call	c_lsub
 444  015b 96            	ldw	x,sp
 445  015c 1c0005        	addw	x,#OFST-8
 446  015f cd0000        	call	c_lcmp
 448  0162 25ac          	jrult	L17
 449                     ; 119 				StopTogglingLED();
 451  0164 cd0000        	call	_StopTogglingLED
 453                     ; 120 				soapFlowDisabled = 0;
 455  0167 0f0d          	clr	(OFST+0,sp)
 457  0169 20a5          	jra	L17
 470                     	xdef	_main
 471                     	xref	_StopTogglingLED
 472                     	xref	_StartTogglingLED
 473                     	xref	_DelayMs
 474                     	xref	_GetTick
 475                     	xref	_TIM2_ITConfig
 476                     	xref	_TIM2_Cmd
 477                     	xref	_TIM2_TimeBaseInit
 478                     	xref	_TIM1_ITConfig
 479                     	xref	_TIM1_Cmd
 480                     	xref	_TIM1_TimeBaseInit
 481                     	xref	_GPIO_ReadInputPin
 482                     	xref	_GPIO_WriteLow
 483                     	xref	_GPIO_WriteHigh
 484                     	xref	_GPIO_Init
 485                     	xref	_CLK_HSIPrescalerConfig
 504                     	xref	c_lcmp
 505                     	xref	c_lsub
 506                     	xref	c_rtol
 507                     	end
