   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  55                     ; 46 static void IndicatePowerOn(void)
  55                     ; 47 {
  57                     	switch	.text
  58  0000               L3_IndicatePowerOn:
  60  0000 89            	pushw	x
  61       00000002      OFST:	set	2
  64                     ; 48 	uint16_t i = 0;
  66  0001 5f            	clrw	x
  67  0002 1f01          	ldw	(OFST-1,sp),x
  69  0004               L13:
  70                     ; 51 		GPIO_WriteHigh(POWER_LED_PORT,POWER_LED);
  72  0004 4b20          	push	#32
  73  0006 ae5005        	ldw	x,#20485
  74  0009 cd0000        	call	_GPIO_WriteHigh
  76  000c 84            	pop	a
  77                     ; 52 		DelayMs(500);
  79  000d ae01f4        	ldw	x,#500
  80  0010 89            	pushw	x
  81  0011 ae0000        	ldw	x,#0
  82  0014 89            	pushw	x
  83  0015 cd0000        	call	_DelayMs
  85  0018 5b04          	addw	sp,#4
  86                     ; 53 		GPIO_WriteLow(POWER_LED_PORT,POWER_LED);
  88  001a 4b20          	push	#32
  89  001c ae5005        	ldw	x,#20485
  90  001f cd0000        	call	_GPIO_WriteLow
  92  0022 84            	pop	a
  93                     ; 54 		DelayMs(500);
  95  0023 ae01f4        	ldw	x,#500
  96  0026 89            	pushw	x
  97  0027 ae0000        	ldw	x,#0
  98  002a 89            	pushw	x
  99  002b cd0000        	call	_DelayMs
 101  002e 5b04          	addw	sp,#4
 102                     ; 55 		i++;
 104  0030 1e01          	ldw	x,(OFST-1,sp)
 105  0032 1c0001        	addw	x,#1
 106  0035 1f01          	ldw	(OFST-1,sp),x
 108                     ; 49 	while(i < 3)
 110  0037 1e01          	ldw	x,(OFST-1,sp)
 111  0039 a30003        	cpw	x,#3
 112  003c 25c6          	jrult	L13
 113                     ; 57 }
 116  003e 85            	popw	x
 117  003f 81            	ret
 198                     ; 59 int main(void)
 198                     ; 60 {
 199                     	switch	.text
 200  0040               _main:
 202  0040 520d          	subw	sp,#13
 203       0000000d      OFST:	set	13
 206                     ; 62 	uint32_t soapDispensationTime = 10000; //10 secs default
 208  0042 ae2710        	ldw	x,#10000
 209  0045 1f03          	ldw	(OFST-10,sp),x
 210  0047 ae0000        	ldw	x,#0
 211  004a 1f01          	ldw	(OFST-12,sp),x
 213                     ; 63 	uint32_t soapValveShutOffTime = 60000; //1 minute default
 215  004c aeea60        	ldw	x,#60000
 216  004f 1f07          	ldw	(OFST-6,sp),x
 217  0051 ae0000        	ldw	x,#0
 218  0054 1f05          	ldw	(OFST-8,sp),x
 220                     ; 64 	uint8_t soapFlowDisabled = 0;
 222  0056 0f0d          	clr	(OFST+0,sp)
 224                     ; 65 	uint32_t currentTick = 0;
 226  0058 ae0000        	ldw	x,#0
 227  005b 1f0b          	ldw	(OFST-2,sp),x
 228  005d ae0000        	ldw	x,#0
 229  0060 1f09          	ldw	(OFST-4,sp),x
 231                     ; 67 	disableInterrupts();
 234  0062 9b            sim
 236                     ; 69 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 239  0063 4f            	clr	a
 240  0064 cd0000        	call	_CLK_HSIPrescalerConfig
 242                     ; 71 	GPIO_Init(SOAP_SENSOR_PORT,SOAP_SENSOR,SENSOR_INIT);
 244  0067 4b40          	push	#64
 245  0069 4b01          	push	#1
 246  006b ae5005        	ldw	x,#20485
 247  006e cd0000        	call	_GPIO_Init
 249  0071 85            	popw	x
 250                     ; 72 	GPIO_Init(FAN_SENSOR_PORT,FAN_SENSOR,SENSOR_INIT);
 252  0072 4b40          	push	#64
 253  0074 4b02          	push	#2
 254  0076 ae5005        	ldw	x,#20485
 255  0079 cd0000        	call	_GPIO_Init
 257  007c 85            	popw	x
 258                     ; 73 	GPIO_Init(WATER_SENSOR_PORT,WATER_SENSOR,SENSOR_INIT);
 260  007d 4b40          	push	#64
 261  007f 4b04          	push	#4
 262  0081 ae5005        	ldw	x,#20485
 263  0084 cd0000        	call	_GPIO_Init
 265  0087 85            	popw	x
 266                     ; 75 	GPIO_Init(SOAP_VALVE_PORT,SOAP_VALVE,OUTPUT_INIT);
 268  0088 4be0          	push	#224
 269  008a 4b04          	push	#4
 270  008c ae500f        	ldw	x,#20495
 271  008f cd0000        	call	_GPIO_Init
 273  0092 85            	popw	x
 274                     ; 76 	GPIO_Init(FAN_PORT,FAN,OUTPUT_INIT);
 276  0093 4be0          	push	#224
 277  0095 4b08          	push	#8
 278  0097 ae500f        	ldw	x,#20495
 279  009a cd0000        	call	_GPIO_Init
 281  009d 85            	popw	x
 282                     ; 77 	GPIO_Init(WATER_VALVE_PORT,WATER_VALVE,OUTPUT_INIT);
 284  009e 4be0          	push	#224
 285  00a0 4b10          	push	#16
 286  00a2 ae500f        	ldw	x,#20495
 287  00a5 cd0000        	call	_GPIO_Init
 289  00a8 85            	popw	x
 290                     ; 78 	GPIO_Init(SOAP_LED_PORT,SOAP_LED,OUTPUT_INIT);
 292  00a9 4be0          	push	#224
 293  00ab 4b10          	push	#16
 294  00ad ae5019        	ldw	x,#20505
 295  00b0 cd0000        	call	_GPIO_Init
 297  00b3 85            	popw	x
 298                     ; 79 	GPIO_Init(POWER_LED_PORT,POWER_LED,OUTPUT_INIT);
 300  00b4 4be0          	push	#224
 301  00b6 4b20          	push	#32
 302  00b8 ae5005        	ldw	x,#20485
 303  00bb cd0000        	call	_GPIO_Init
 305  00be 85            	popw	x
 306                     ; 81 	GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 308  00bf 4b04          	push	#4
 309  00c1 ae500f        	ldw	x,#20495
 310  00c4 cd0000        	call	_GPIO_WriteLow
 312  00c7 84            	pop	a
 313                     ; 82 	GPIO_WriteLow(FAN_PORT,FAN);
 315  00c8 4b08          	push	#8
 316  00ca ae500f        	ldw	x,#20495
 317  00cd cd0000        	call	_GPIO_WriteLow
 319  00d0 84            	pop	a
 320                     ; 83 	GPIO_WriteLow(WATER_VALVE_PORT,WATER_VALVE);
 322  00d1 4b10          	push	#16
 323  00d3 ae500f        	ldw	x,#20495
 324  00d6 cd0000        	call	_GPIO_WriteLow
 326  00d9 84            	pop	a
 327                     ; 84 	GPIO_WriteLow(SOAP_LED_PORT,SOAP_LED);
 329  00da 4b10          	push	#16
 330  00dc ae5019        	ldw	x,#20505
 331  00df cd0000        	call	_GPIO_WriteLow
 333  00e2 84            	pop	a
 334                     ; 88 	TIM1_TimeBaseInit(128,TIM1_COUNTERMODE_UP,124,0);	
 336  00e3 4b00          	push	#0
 337  00e5 ae007c        	ldw	x,#124
 338  00e8 89            	pushw	x
 339  00e9 4b00          	push	#0
 340  00eb ae0080        	ldw	x,#128
 341  00ee cd0000        	call	_TIM1_TimeBaseInit
 343  00f1 5b04          	addw	sp,#4
 344                     ; 89 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
 346  00f3 ae0101        	ldw	x,#257
 347  00f6 cd0000        	call	_TIM1_ITConfig
 349                     ; 90 	TIM1_Cmd(ENABLE);
 351  00f9 a601          	ld	a,#1
 352  00fb cd0000        	call	_TIM1_Cmd
 354                     ; 93 	TIM2_TimeBaseInit(TIM2_PRESCALER_128,1249);
 356  00fe ae04e1        	ldw	x,#1249
 357  0101 89            	pushw	x
 358  0102 a607          	ld	a,#7
 359  0104 cd0000        	call	_TIM2_TimeBaseInit
 361  0107 85            	popw	x
 362                     ; 94 	TIM2_ITConfig(TIM2_IT_UPDATE,ENABLE);
 364  0108 ae0101        	ldw	x,#257
 365  010b cd0000        	call	_TIM2_ITConfig
 367                     ; 95 	TIM2_Cmd(ENABLE);
 369  010e a601          	ld	a,#1
 370  0110 cd0000        	call	_TIM2_Cmd
 372                     ; 97 	enableInterrupts();
 375  0113 9a            rim
 377                     ; 99 	IndicatePowerOn();
 380  0114 cd0000        	call	L3_IndicatePowerOn
 382  0117               L17:
 383                     ; 103 		if(!soapFlowDisabled)
 385  0117 0d0d          	tnz	(OFST+0,sp)
 386  0119 263d          	jrne	L57
 387                     ; 105 			if(!GPIO_ReadInputPin(SOAP_SENSOR_PORT,SOAP_SENSOR))
 389  011b 4b01          	push	#1
 390  011d ae5005        	ldw	x,#20485
 391  0120 cd0000        	call	_GPIO_ReadInputPin
 393  0123 5b01          	addw	sp,#1
 394  0125 4d            	tnz	a
 395  0126 26ef          	jrne	L17
 396                     ; 107 				GPIO_WriteHigh(SOAP_VALVE_PORT,SOAP_VALVE);
 398  0128 4b04          	push	#4
 399  012a ae500f        	ldw	x,#20495
 400  012d cd0000        	call	_GPIO_WriteHigh
 402  0130 84            	pop	a
 403                     ; 108 				DelayMs(soapDispensationTime);
 405  0131 1e03          	ldw	x,(OFST-10,sp)
 406  0133 89            	pushw	x
 407  0134 1e03          	ldw	x,(OFST-10,sp)
 408  0136 89            	pushw	x
 409  0137 cd0000        	call	_DelayMs
 411  013a 5b04          	addw	sp,#4
 412                     ; 109 				GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 414  013c 4b04          	push	#4
 415  013e ae500f        	ldw	x,#20495
 416  0141 cd0000        	call	_GPIO_WriteLow
 418  0144 84            	pop	a
 419                     ; 110 				StartTogglingLED();
 421  0145 cd0000        	call	_StartTogglingLED
 423                     ; 111 				soapFlowDisabled = 1;
 425  0148 a601          	ld	a,#1
 426  014a 6b0d          	ld	(OFST+0,sp),a
 428                     ; 112 				currentTick = GetTick();
 430  014c cd0000        	call	_GetTick
 432  014f 96            	ldw	x,sp
 433  0150 1c0009        	addw	x,#OFST-4
 434  0153 cd0000        	call	c_rtol
 437  0156 20bf          	jra	L17
 438  0158               L57:
 439                     ; 117 			if((GetTick() - currentTick) >= soapValveShutOffTime)
 441  0158 cd0000        	call	_GetTick
 443  015b 96            	ldw	x,sp
 444  015c 1c0009        	addw	x,#OFST-4
 445  015f cd0000        	call	c_lsub
 447  0162 96            	ldw	x,sp
 448  0163 1c0005        	addw	x,#OFST-8
 449  0166 cd0000        	call	c_lcmp
 451  0169 25ac          	jrult	L17
 452                     ; 119 				StopTogglingLED();
 454  016b cd0000        	call	_StopTogglingLED
 456                     ; 120 				soapFlowDisabled = 0;
 458  016e 0f0d          	clr	(OFST+0,sp)
 460  0170 20a5          	jra	L17
 473                     	xdef	_main
 474                     	xref	_StopTogglingLED
 475                     	xref	_StartTogglingLED
 476                     	xref	_DelayMs
 477                     	xref	_GetTick
 478                     	xref	_TIM2_ITConfig
 479                     	xref	_TIM2_Cmd
 480                     	xref	_TIM2_TimeBaseInit
 481                     	xref	_TIM1_ITConfig
 482                     	xref	_TIM1_Cmd
 483                     	xref	_TIM1_TimeBaseInit
 484                     	xref	_GPIO_ReadInputPin
 485                     	xref	_GPIO_WriteLow
 486                     	xref	_GPIO_WriteHigh
 487                     	xref	_GPIO_Init
 488                     	xref	_CLK_HSIPrescalerConfig
 507                     	xref	c_lcmp
 508                     	xref	c_lsub
 509                     	xref	c_rtol
 510                     	end
