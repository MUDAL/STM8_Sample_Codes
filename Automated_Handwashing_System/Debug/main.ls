   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  98                     ; 45 int main(void)
  98                     ; 46 {
 100                     	switch	.text
 101  0000               _main:
 103  0000 520d          	subw	sp,#13
 104       0000000d      OFST:	set	13
 107                     ; 48 	uint32_t soapDispensationTime = 10000; //10 secs default
 109  0002 ae2710        	ldw	x,#10000
 110  0005 1f03          	ldw	(OFST-10,sp),x
 111  0007 ae0000        	ldw	x,#0
 112  000a 1f01          	ldw	(OFST-12,sp),x
 114                     ; 49 	uint32_t soapValveShutOffTime = 60000; //1 minute default
 116  000c aeea60        	ldw	x,#60000
 117  000f 1f07          	ldw	(OFST-6,sp),x
 118  0011 ae0000        	ldw	x,#0
 119  0014 1f05          	ldw	(OFST-8,sp),x
 121                     ; 50 	uint8_t soapFlowDisabled = 0;
 123  0016 0f0d          	clr	(OFST+0,sp)
 125                     ; 51 	uint32_t currentTick = 0;
 127  0018 ae0000        	ldw	x,#0
 128  001b 1f0b          	ldw	(OFST-2,sp),x
 129  001d ae0000        	ldw	x,#0
 130  0020 1f09          	ldw	(OFST-4,sp),x
 132                     ; 53 	disableInterrupts();
 135  0022 9b            sim
 137                     ; 55 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 140  0023 4f            	clr	a
 141  0024 cd0000        	call	_CLK_HSIPrescalerConfig
 143                     ; 57 	GPIO_Init(SOAP_SENSOR_PORT,SOAP_SENSOR,SENSOR_INIT);
 145  0027 4b40          	push	#64
 146  0029 4b01          	push	#1
 147  002b ae5005        	ldw	x,#20485
 148  002e cd0000        	call	_GPIO_Init
 150  0031 85            	popw	x
 151                     ; 58 	GPIO_Init(FAN_SENSOR_PORT,FAN_SENSOR,SENSOR_INIT);
 153  0032 4b40          	push	#64
 154  0034 4b02          	push	#2
 155  0036 ae5005        	ldw	x,#20485
 156  0039 cd0000        	call	_GPIO_Init
 158  003c 85            	popw	x
 159                     ; 59 	GPIO_Init(WATER_SENSOR_PORT,WATER_SENSOR,SENSOR_INIT);
 161  003d 4b40          	push	#64
 162  003f 4b04          	push	#4
 163  0041 ae5005        	ldw	x,#20485
 164  0044 cd0000        	call	_GPIO_Init
 166  0047 85            	popw	x
 167                     ; 61 	GPIO_Init(SOAP_VALVE_PORT,SOAP_VALVE,OUTPUT_INIT);
 169  0048 4be0          	push	#224
 170  004a 4b04          	push	#4
 171  004c ae500f        	ldw	x,#20495
 172  004f cd0000        	call	_GPIO_Init
 174  0052 85            	popw	x
 175                     ; 62 	GPIO_Init(FAN_PORT,FAN,OUTPUT_INIT);
 177  0053 4be0          	push	#224
 178  0055 4b08          	push	#8
 179  0057 ae500f        	ldw	x,#20495
 180  005a cd0000        	call	_GPIO_Init
 182  005d 85            	popw	x
 183                     ; 63 	GPIO_Init(WATER_VALVE_PORT,WATER_VALVE,OUTPUT_INIT);
 185  005e 4be0          	push	#224
 186  0060 4b10          	push	#16
 187  0062 ae500f        	ldw	x,#20495
 188  0065 cd0000        	call	_GPIO_Init
 190  0068 85            	popw	x
 191                     ; 64 	GPIO_Init(LED_PORT,LED,OUTPUT_INIT);
 193  0069 4be0          	push	#224
 194  006b 4b10          	push	#16
 195  006d ae5019        	ldw	x,#20505
 196  0070 cd0000        	call	_GPIO_Init
 198  0073 85            	popw	x
 199                     ; 66 	GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 201  0074 4b04          	push	#4
 202  0076 ae500f        	ldw	x,#20495
 203  0079 cd0000        	call	_GPIO_WriteLow
 205  007c 84            	pop	a
 206                     ; 67 	GPIO_WriteLow(FAN_PORT,FAN);
 208  007d 4b08          	push	#8
 209  007f ae500f        	ldw	x,#20495
 210  0082 cd0000        	call	_GPIO_WriteLow
 212  0085 84            	pop	a
 213                     ; 68 	GPIO_WriteLow(WATER_VALVE_PORT,WATER_VALVE);
 215  0086 4b10          	push	#16
 216  0088 ae500f        	ldw	x,#20495
 217  008b cd0000        	call	_GPIO_WriteLow
 219  008e 84            	pop	a
 220                     ; 69 	GPIO_WriteLow(LED_PORT,LED);
 222  008f 4b10          	push	#16
 223  0091 ae5019        	ldw	x,#20505
 224  0094 cd0000        	call	_GPIO_WriteLow
 226  0097 84            	pop	a
 227                     ; 73 	TIM1_TimeBaseInit(128,TIM1_COUNTERMODE_UP,124,0);	
 229  0098 4b00          	push	#0
 230  009a ae007c        	ldw	x,#124
 231  009d 89            	pushw	x
 232  009e 4b00          	push	#0
 233  00a0 ae0080        	ldw	x,#128
 234  00a3 cd0000        	call	_TIM1_TimeBaseInit
 236  00a6 5b04          	addw	sp,#4
 237                     ; 74 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
 239  00a8 ae0101        	ldw	x,#257
 240  00ab cd0000        	call	_TIM1_ITConfig
 242                     ; 75 	TIM1_Cmd(ENABLE);
 244  00ae a601          	ld	a,#1
 245  00b0 cd0000        	call	_TIM1_Cmd
 247                     ; 78 	TIM2_TimeBaseInit(128,1249);
 249  00b3 ae04e1        	ldw	x,#1249
 250  00b6 89            	pushw	x
 251  00b7 a680          	ld	a,#128
 252  00b9 cd0000        	call	_TIM2_TimeBaseInit
 254  00bc 85            	popw	x
 255                     ; 79 	TIM2_ITConfig(TIM2_IT_UPDATE,ENABLE);
 257  00bd ae0101        	ldw	x,#257
 258  00c0 cd0000        	call	_TIM2_ITConfig
 260                     ; 80 	TIM2_Cmd(ENABLE);
 262  00c3 a601          	ld	a,#1
 263  00c5 cd0000        	call	_TIM2_Cmd
 265                     ; 82 	enableInterrupts();
 268  00c8 9a            rim
 270  00c9               L34:
 271                     ; 86 		if(!soapFlowDisabled)
 273  00c9 0d0d          	tnz	(OFST+0,sp)
 274  00cb 263d          	jrne	L74
 275                     ; 88 			if(!GPIO_ReadInputPin(SOAP_SENSOR_PORT,SOAP_SENSOR))
 277  00cd 4b01          	push	#1
 278  00cf ae5005        	ldw	x,#20485
 279  00d2 cd0000        	call	_GPIO_ReadInputPin
 281  00d5 5b01          	addw	sp,#1
 282  00d7 4d            	tnz	a
 283  00d8 26ef          	jrne	L34
 284                     ; 90 				GPIO_WriteHigh(SOAP_VALVE_PORT,SOAP_VALVE);
 286  00da 4b04          	push	#4
 287  00dc ae500f        	ldw	x,#20495
 288  00df cd0000        	call	_GPIO_WriteHigh
 290  00e2 84            	pop	a
 291                     ; 91 				DelayMs(soapDispensationTime);
 293  00e3 1e03          	ldw	x,(OFST-10,sp)
 294  00e5 89            	pushw	x
 295  00e6 1e03          	ldw	x,(OFST-10,sp)
 296  00e8 89            	pushw	x
 297  00e9 cd0000        	call	_DelayMs
 299  00ec 5b04          	addw	sp,#4
 300                     ; 92 				GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 302  00ee 4b04          	push	#4
 303  00f0 ae500f        	ldw	x,#20495
 304  00f3 cd0000        	call	_GPIO_WriteLow
 306  00f6 84            	pop	a
 307                     ; 93 				StartTogglingLED();
 309  00f7 cd0000        	call	_StartTogglingLED
 311                     ; 94 				soapFlowDisabled = 1;
 313  00fa a601          	ld	a,#1
 314  00fc 6b0d          	ld	(OFST+0,sp),a
 316                     ; 95 				currentTick = GetTick();
 318  00fe cd0000        	call	_GetTick
 320  0101 96            	ldw	x,sp
 321  0102 1c0009        	addw	x,#OFST-4
 322  0105 cd0000        	call	c_rtol
 325  0108 20bf          	jra	L34
 326  010a               L74:
 327                     ; 100 			if((GetTick() - currentTick) >= soapValveShutOffTime)
 329  010a cd0000        	call	_GetTick
 331  010d 96            	ldw	x,sp
 332  010e 1c0009        	addw	x,#OFST-4
 333  0111 cd0000        	call	c_lsub
 335  0114 96            	ldw	x,sp
 336  0115 1c0005        	addw	x,#OFST-8
 337  0118 cd0000        	call	c_lcmp
 339  011b 25ac          	jrult	L34
 340                     ; 102 				StopTogglingLED();
 342  011d cd0000        	call	_StopTogglingLED
 344                     ; 103 				soapFlowDisabled = 0;
 346  0120 0f0d          	clr	(OFST+0,sp)
 348  0122 20a5          	jra	L34
 361                     	xdef	_main
 362                     	xref	_StopTogglingLED
 363                     	xref	_StartTogglingLED
 364                     	xref	_DelayMs
 365                     	xref	_GetTick
 366                     	xref	_TIM2_ITConfig
 367                     	xref	_TIM2_Cmd
 368                     	xref	_TIM2_TimeBaseInit
 369                     	xref	_TIM1_ITConfig
 370                     	xref	_TIM1_Cmd
 371                     	xref	_TIM1_TimeBaseInit
 372                     	xref	_GPIO_ReadInputPin
 373                     	xref	_GPIO_WriteLow
 374                     	xref	_GPIO_WriteHigh
 375                     	xref	_GPIO_Init
 376                     	xref	_CLK_HSIPrescalerConfig
 395                     	xref	c_lcmp
 396                     	xref	c_lsub
 397                     	xref	c_rtol
 398                     	end
