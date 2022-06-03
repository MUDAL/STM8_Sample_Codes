   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  98                     ; 44 int main(void)
  98                     ; 45 {
 100                     	switch	.text
 101  0000               _main:
 103  0000 520d          	subw	sp,#13
 104       0000000d      OFST:	set	13
 107                     ; 47 	uint32_t soapDispensationTime = 10000; //10 secs default
 109  0002 ae2710        	ldw	x,#10000
 110  0005 1f03          	ldw	(OFST-10,sp),x
 111  0007 ae0000        	ldw	x,#0
 112  000a 1f01          	ldw	(OFST-12,sp),x
 114                     ; 48 	uint32_t soapValveShutOffTime = 60000; //1 minute default
 116  000c aeea60        	ldw	x,#60000
 117  000f 1f07          	ldw	(OFST-6,sp),x
 118  0011 ae0000        	ldw	x,#0
 119  0014 1f05          	ldw	(OFST-8,sp),x
 121                     ; 49 	uint8_t soapFlowDisabled = 0;
 123  0016 0f0d          	clr	(OFST+0,sp)
 125                     ; 50 	uint32_t currentTick = 0;
 127  0018 ae0000        	ldw	x,#0
 128  001b 1f0b          	ldw	(OFST-2,sp),x
 129  001d ae0000        	ldw	x,#0
 130  0020 1f09          	ldw	(OFST-4,sp),x
 132                     ; 52 	disableInterrupts();
 135  0022 9b            sim
 137                     ; 54 	GPIO_Init(SOAP_SENSOR_PORT,SOAP_SENSOR,SENSOR_INIT);
 140  0023 4b40          	push	#64
 141  0025 4b01          	push	#1
 142  0027 ae5005        	ldw	x,#20485
 143  002a cd0000        	call	_GPIO_Init
 145  002d 85            	popw	x
 146                     ; 55 	GPIO_Init(FAN_SENSOR_PORT,FAN_SENSOR,SENSOR_INIT);
 148  002e 4b40          	push	#64
 149  0030 4b02          	push	#2
 150  0032 ae5005        	ldw	x,#20485
 151  0035 cd0000        	call	_GPIO_Init
 153  0038 85            	popw	x
 154                     ; 56 	GPIO_Init(WATER_SENSOR_PORT,WATER_SENSOR,SENSOR_INIT);
 156  0039 4b40          	push	#64
 157  003b 4b04          	push	#4
 158  003d ae5005        	ldw	x,#20485
 159  0040 cd0000        	call	_GPIO_Init
 161  0043 85            	popw	x
 162                     ; 58 	GPIO_Init(SOAP_VALVE_PORT,SOAP_VALVE,OUTPUT_INIT);
 164  0044 4ba0          	push	#160
 165  0046 4b08          	push	#8
 166  0048 ae5005        	ldw	x,#20485
 167  004b cd0000        	call	_GPIO_Init
 169  004e 85            	popw	x
 170                     ; 59 	GPIO_Init(FAN_PORT,FAN,OUTPUT_INIT);
 172  004f 4ba0          	push	#160
 173  0051 4b10          	push	#16
 174  0053 ae5005        	ldw	x,#20485
 175  0056 cd0000        	call	_GPIO_Init
 177  0059 85            	popw	x
 178                     ; 60 	GPIO_Init(WATER_VALVE_PORT,WATER_VALVE,OUTPUT_INIT);
 180  005a 4ba0          	push	#160
 181  005c 4b20          	push	#32
 182  005e ae5005        	ldw	x,#20485
 183  0061 cd0000        	call	_GPIO_Init
 185  0064 85            	popw	x
 186                     ; 61 	GPIO_Init(LED_PORT,LED,OUTPUT_INIT);
 188  0065 4ba0          	push	#160
 189  0067 4b10          	push	#16
 190  0069 ae5019        	ldw	x,#20505
 191  006c cd0000        	call	_GPIO_Init
 193  006f 85            	popw	x
 194                     ; 63 	GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 196  0070 4b08          	push	#8
 197  0072 ae5005        	ldw	x,#20485
 198  0075 cd0000        	call	_GPIO_WriteLow
 200  0078 84            	pop	a
 201                     ; 64 	GPIO_WriteLow(FAN_PORT,FAN);
 203  0079 4b10          	push	#16
 204  007b ae5005        	ldw	x,#20485
 205  007e cd0000        	call	_GPIO_WriteLow
 207  0081 84            	pop	a
 208                     ; 65 	GPIO_WriteLow(WATER_VALVE_PORT,WATER_VALVE);
 210  0082 4b20          	push	#32
 211  0084 ae5005        	ldw	x,#20485
 212  0087 cd0000        	call	_GPIO_WriteLow
 214  008a 84            	pop	a
 215                     ; 66 	GPIO_WriteLow(LED_PORT,LED);
 217  008b 4b10          	push	#16
 218  008d ae5019        	ldw	x,#20505
 219  0090 cd0000        	call	_GPIO_WriteLow
 221  0093 84            	pop	a
 222                     ; 71 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);				 
 224  0094 4f            	clr	a
 225  0095 cd0000        	call	_CLK_HSIPrescalerConfig
 227                     ; 72 	TIM1_TimeBaseInit(128,TIM1_COUNTERMODE_UP,124,0);	
 229  0098 4b00          	push	#0
 230  009a ae007c        	ldw	x,#124
 231  009d 89            	pushw	x
 232  009e 4b00          	push	#0
 233  00a0 ae0080        	ldw	x,#128
 234  00a3 cd0000        	call	_TIM1_TimeBaseInit
 236  00a6 5b04          	addw	sp,#4
 237                     ; 73 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
 239  00a8 ae0101        	ldw	x,#257
 240  00ab cd0000        	call	_TIM1_ITConfig
 242                     ; 74 	TIM1_Cmd(ENABLE);
 244  00ae a601          	ld	a,#1
 245  00b0 cd0000        	call	_TIM1_Cmd
 247                     ; 77 	TIM2_TimeBaseInit(128,124);
 249  00b3 ae007c        	ldw	x,#124
 250  00b6 89            	pushw	x
 251  00b7 a680          	ld	a,#128
 252  00b9 cd0000        	call	_TIM2_TimeBaseInit
 254  00bc 85            	popw	x
 255                     ; 78 	TIM2_ITConfig(TIM2_IT_UPDATE,ENABLE);
 257  00bd ae0101        	ldw	x,#257
 258  00c0 cd0000        	call	_TIM2_ITConfig
 260                     ; 79 	TIM2_Cmd(ENABLE);
 262  00c3 a601          	ld	a,#1
 263  00c5 cd0000        	call	_TIM2_Cmd
 265                     ; 81 	enableInterrupts();
 268  00c8 9a            rim
 270  00c9               L34:
 271                     ; 86 		if(!soapFlowDisabled)
 273  00c9 0d0d          	tnz	(OFST+0,sp)
 274  00cb 2648          	jrne	L74
 275                     ; 88 			if(!GPIO_ReadInputPin(SOAP_SENSOR_PORT,SOAP_SENSOR))
 277  00cd 4b01          	push	#1
 278  00cf ae5005        	ldw	x,#20485
 279  00d2 cd0000        	call	_GPIO_ReadInputPin
 281  00d5 5b01          	addw	sp,#1
 282  00d7 4d            	tnz	a
 283  00d8 2630          	jrne	L15
 284                     ; 90 				GPIO_WriteHigh(SOAP_VALVE_PORT,SOAP_VALVE);
 286  00da 4b08          	push	#8
 287  00dc ae5005        	ldw	x,#20485
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
 302  00ee 4b08          	push	#8
 303  00f0 ae5005        	ldw	x,#20485
 304  00f3 cd0000        	call	_GPIO_WriteLow
 306  00f6 84            	pop	a
 307                     ; 93 				ToggleLED();
 309  00f7 cd0000        	call	_ToggleLED
 311                     ; 94 				soapFlowDisabled = 1;
 313  00fa a601          	ld	a,#1
 314  00fc 6b0d          	ld	(OFST+0,sp),a
 316                     ; 95 				currentTick = GetTick();
 318  00fe cd0000        	call	_GetTick
 320  0101 96            	ldw	x,sp
 321  0102 1c0009        	addw	x,#OFST-4
 322  0105 cd0000        	call	c_rtol
 326  0108 20bf          	jra	L34
 327  010a               L15:
 328                     ; 99 				GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
 330  010a 4b08          	push	#8
 331  010c ae5005        	ldw	x,#20485
 332  010f cd0000        	call	_GPIO_WriteLow
 334  0112 84            	pop	a
 335  0113 20b4          	jra	L34
 336  0115               L74:
 337                     ; 104 			if((GetTick() - currentTick) >= soapValveShutOffTime)
 339  0115 cd0000        	call	_GetTick
 341  0118 96            	ldw	x,sp
 342  0119 1c0009        	addw	x,#OFST-4
 343  011c cd0000        	call	c_lsub
 345  011f 96            	ldw	x,sp
 346  0120 1c0005        	addw	x,#OFST-8
 347  0123 cd0000        	call	c_lcmp
 349  0126 25a1          	jrult	L34
 350                     ; 106 				DisableLED();
 352  0128 cd0000        	call	_DisableLED
 354                     ; 107 				soapFlowDisabled = 0;
 356  012b 0f0d          	clr	(OFST+0,sp)
 358  012d 209a          	jra	L34
 371                     	xdef	_main
 372                     	xref	_DisableLED
 373                     	xref	_ToggleLED
 374                     	xref	_GetTick
 375                     	xref	_DelayMs
 376                     	xref	_TIM2_ITConfig
 377                     	xref	_TIM2_Cmd
 378                     	xref	_TIM2_TimeBaseInit
 379                     	xref	_TIM1_ITConfig
 380                     	xref	_TIM1_Cmd
 381                     	xref	_TIM1_TimeBaseInit
 382                     	xref	_GPIO_ReadInputPin
 383                     	xref	_GPIO_WriteLow
 384                     	xref	_GPIO_WriteHigh
 385                     	xref	_GPIO_Init
 386                     	xref	_CLK_HSIPrescalerConfig
 405                     	xref	c_lcmp
 406                     	xref	c_lsub
 407                     	xref	c_rtol
 408                     	end
