   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  55                     ; 46 uint32_t GetTick(void)
  55                     ; 47 {
  57                     	switch	.text
  58  0000               _GetTick:
  60  0000 5204          	subw	sp,#4
  61       00000004      OFST:	set	4
  64                     ; 49 	disableInterrupts();
  67  0002 9b            sim
  69                     ; 50 	tick = currentTick; //critical section
  72  0003 be04          	ldw	x,L3_currentTick+2
  73  0005 1f03          	ldw	(OFST-1,sp),x
  74  0007 be02          	ldw	x,L3_currentTick
  75  0009 1f01          	ldw	(OFST-3,sp),x
  77                     ; 51 	enableInterrupts();
  80  000b 9a            rim
  82                     ; 52 	return tick;
  85  000c 96            	ldw	x,sp
  86  000d 1c0001        	addw	x,#OFST-3
  87  0010 cd0000        	call	c_ltor
  91  0013 5b04          	addw	sp,#4
  92  0015 81            	ret
 139                     ; 55 void DelayMs(uint32_t delay)
 139                     ; 56 {
 140                     	switch	.text
 141  0016               _DelayMs:
 143  0016 5204          	subw	sp,#4
 144       00000004      OFST:	set	4
 147                     ; 58 	disableInterrupts();
 150  0018 9b            sim
 152                     ; 59 	startTick = currentTick; //critical section
 155  0019 be04          	ldw	x,L3_currentTick+2
 156  001b 1f03          	ldw	(OFST-1,sp),x
 157  001d be02          	ldw	x,L3_currentTick
 158  001f 1f01          	ldw	(OFST-3,sp),x
 160                     ; 60 	enableInterrupts();
 163  0021 9a            rim
 167  0022               L75:
 168                     ; 61 	while((GetTick() - startTick) < delay){}
 170  0022 addc          	call	_GetTick
 172  0024 96            	ldw	x,sp
 173  0025 1c0001        	addw	x,#OFST-3
 174  0028 cd0000        	call	c_lsub
 176  002b 96            	ldw	x,sp
 177  002c 1c0007        	addw	x,#OFST+3
 178  002f cd0000        	call	c_lcmp
 180  0032 25ee          	jrult	L75
 181                     ; 62 }
 184  0034 5b04          	addw	sp,#4
 185  0036 81            	ret
 209                     ; 64 void StartTogglingLED(void)
 209                     ; 65 {
 210                     	switch	.text
 211  0037               _StartTogglingLED:
 215                     ; 66 	toggleLED = 1;
 217  0037 35010001      	mov	L5_toggleLED,#1
 218                     ; 67 }
 221  003b 81            	ret
 245                     ; 69 void StopTogglingLED(void)
 245                     ; 70 {
 246                     	switch	.text
 247  003c               _StopTogglingLED:
 251                     ; 71 	toggleLED = 0;
 253  003c 3f01          	clr	L5_toggleLED
 254                     ; 72 }
 257  003e 81            	ret
 281                     ; 82 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 281                     ; 83 {
 283                     	switch	.text
 284  003f               f_NonHandledInterrupt:
 288                     ; 87 }
 291  003f 80            	iret
 313                     ; 95 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 313                     ; 96 {
 314                     	switch	.text
 315  0040               f_TRAP_IRQHandler:
 319                     ; 100 }
 322  0040 80            	iret
 344                     ; 107 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 344                     ; 108 
 344                     ; 109 {
 345                     	switch	.text
 346  0041               f_TLI_IRQHandler:
 350                     ; 113 }
 353  0041 80            	iret
 375                     ; 120 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 375                     ; 121 {
 376                     	switch	.text
 377  0042               f_AWU_IRQHandler:
 381                     ; 125 }
 384  0042 80            	iret
 406                     ; 132 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 406                     ; 133 {
 407                     	switch	.text
 408  0043               f_CLK_IRQHandler:
 412                     ; 137 }
 415  0043 80            	iret
 438                     ; 144 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 438                     ; 145 {
 439                     	switch	.text
 440  0044               f_EXTI_PORTA_IRQHandler:
 444                     ; 149 }
 447  0044 80            	iret
 470                     ; 156 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 470                     ; 157 {
 471                     	switch	.text
 472  0045               f_EXTI_PORTB_IRQHandler:
 476                     ; 161 }
 479  0045 80            	iret
 502                     ; 168 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 502                     ; 169 {
 503                     	switch	.text
 504  0046               f_EXTI_PORTC_IRQHandler:
 508                     ; 173 }
 511  0046 80            	iret
 534                     ; 180 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 534                     ; 181 {
 535                     	switch	.text
 536  0047               f_EXTI_PORTD_IRQHandler:
 540                     ; 185 }
 543  0047 80            	iret
 566                     ; 192 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 566                     ; 193 {
 567                     	switch	.text
 568  0048               f_EXTI_PORTE_IRQHandler:
 572                     ; 197 }
 575  0048 80            	iret
 597                     ; 244 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 597                     ; 245 {
 598                     	switch	.text
 599  0049               f_SPI_IRQHandler:
 603                     ; 249 }
 606  0049 80            	iret
 633                     ; 256 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 633                     ; 257 {
 634                     	switch	.text
 635  004a               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 637  004a 8a            	push	cc
 638  004b 84            	pop	a
 639  004c a4bf          	and	a,#191
 640  004e 88            	push	a
 641  004f 86            	pop	cc
 642  0050 3b0002        	push	c_x+2
 643  0053 be00          	ldw	x,c_x
 644  0055 89            	pushw	x
 645  0056 3b0002        	push	c_y+2
 646  0059 be00          	ldw	x,c_y
 647  005b 89            	pushw	x
 650                     ; 261 	disableInterrupts();
 653  005c 9b            sim
 655                     ; 262 	currentTick++; //critical section
 658  005d ae0002        	ldw	x,#L3_currentTick
 659  0060 a601          	ld	a,#1
 660  0062 cd0000        	call	c_lgadc
 662                     ; 263 	enableInterrupts();
 665  0065 9a            rim
 667                     ; 264 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 670  0066 a601          	ld	a,#1
 671  0068 cd0000        	call	_TIM1_ClearITPendingBit
 673                     ; 265 }
 676  006b 85            	popw	x
 677  006c bf00          	ldw	c_y,x
 678  006e 320002        	pop	c_y+2
 679  0071 85            	popw	x
 680  0072 bf00          	ldw	c_x,x
 681  0074 320002        	pop	c_x+2
 682  0077 80            	iret
 705                     ; 272 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 705                     ; 273 {
 706                     	switch	.text
 707  0078               f_TIM1_CAP_COM_IRQHandler:
 711                     ; 277 }
 714  0078 80            	iret
 716                     	switch	.ubsct
 717  0000               L352_ledCounter:
 718  0000 00            	ds.b	1
 757                     ; 310  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 757                     ; 311  {
 758                     	switch	.text
 759  0079               f_TIM2_UPD_OVF_BRK_IRQHandler:
 761  0079 8a            	push	cc
 762  007a 84            	pop	a
 763  007b a4bf          	and	a,#191
 764  007d 88            	push	a
 765  007e 86            	pop	cc
 766  007f 3b0002        	push	c_x+2
 767  0082 be00          	ldw	x,c_x
 768  0084 89            	pushw	x
 769  0085 3b0002        	push	c_y+2
 770  0088 be00          	ldw	x,c_y
 771  008a 89            	pushw	x
 774                     ; 316 	if(!GPIO_ReadInputPin(FAN_SENSOR_PORT,FAN_SENSOR))
 776  008b 4b02          	push	#2
 777  008d ae5005        	ldw	x,#20485
 778  0090 cd0000        	call	_GPIO_ReadInputPin
 780  0093 5b01          	addw	sp,#1
 781  0095 4d            	tnz	a
 782  0096 260b          	jrne	L372
 783                     ; 318 		GPIO_WriteHigh(FAN_PORT,FAN);
 785  0098 4b10          	push	#16
 786  009a ae5005        	ldw	x,#20485
 787  009d cd0000        	call	_GPIO_WriteHigh
 789  00a0 84            	pop	a
 791  00a1 2009          	jra	L572
 792  00a3               L372:
 793                     ; 322 		GPIO_WriteLow(FAN_PORT,FAN);
 795  00a3 4b10          	push	#16
 796  00a5 ae5005        	ldw	x,#20485
 797  00a8 cd0000        	call	_GPIO_WriteLow
 799  00ab 84            	pop	a
 800  00ac               L572:
 801                     ; 325 	if(!GPIO_ReadInputPin(WATER_SENSOR_PORT,WATER_SENSOR))
 803  00ac 4b04          	push	#4
 804  00ae ae5005        	ldw	x,#20485
 805  00b1 cd0000        	call	_GPIO_ReadInputPin
 807  00b4 5b01          	addw	sp,#1
 808  00b6 4d            	tnz	a
 809  00b7 260b          	jrne	L772
 810                     ; 327 		GPIO_WriteHigh(WATER_VALVE_PORT,WATER_VALVE);
 812  00b9 4b20          	push	#32
 813  00bb ae5005        	ldw	x,#20485
 814  00be cd0000        	call	_GPIO_WriteHigh
 816  00c1 84            	pop	a
 818  00c2 2009          	jra	L103
 819  00c4               L772:
 820                     ; 331 		GPIO_WriteLow(WATER_VALVE_PORT,WATER_VALVE);
 822  00c4 4b20          	push	#32
 823  00c6 ae5005        	ldw	x,#20485
 824  00c9 cd0000        	call	_GPIO_WriteLow
 826  00cc 84            	pop	a
 827  00cd               L103:
 828                     ; 334 	if(toggleLED)
 830  00cd 3d01          	tnz	L5_toggleLED
 831  00cf 271b          	jreq	L303
 832                     ; 337 		if((ledCounter % 100) == 0)
 834  00d1 b600          	ld	a,L352_ledCounter
 835  00d3 5f            	clrw	x
 836  00d4 97            	ld	xl,a
 837  00d5 a664          	ld	a,#100
 838  00d7 cd0000        	call	c_smodx
 840  00da a30000        	cpw	x,#0
 841  00dd 2609          	jrne	L503
 842                     ; 339 			GPIO_WriteReverse(LED_PORT,LED);
 844  00df 4b10          	push	#16
 845  00e1 ae5019        	ldw	x,#20505
 846  00e4 cd0000        	call	_GPIO_WriteReverse
 848  00e7 84            	pop	a
 849  00e8               L503:
 850                     ; 341 		ledCounter++;
 852  00e8 3c00          	inc	L352_ledCounter
 854  00ea 2009          	jra	L703
 855  00ec               L303:
 856                     ; 345 		GPIO_WriteLow(LED_PORT,LED);
 858  00ec 4b10          	push	#16
 859  00ee ae5019        	ldw	x,#20505
 860  00f1 cd0000        	call	_GPIO_WriteLow
 862  00f4 84            	pop	a
 863  00f5               L703:
 864                     ; 347 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 866  00f5 a601          	ld	a,#1
 867  00f7 cd0000        	call	_TIM2_ClearITPendingBit
 869                     ; 348  }
 872  00fa 85            	popw	x
 873  00fb bf00          	ldw	c_y,x
 874  00fd 320002        	pop	c_y+2
 875  0100 85            	popw	x
 876  0101 bf00          	ldw	c_x,x
 877  0103 320002        	pop	c_x+2
 878  0106 80            	iret
 901                     ; 355  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 901                     ; 356  {
 902                     	switch	.text
 903  0107               f_TIM2_CAP_COM_IRQHandler:
 907                     ; 360  }
 910  0107 80            	iret
 933                     ; 370  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 933                     ; 371  {
 934                     	switch	.text
 935  0108               f_TIM3_UPD_OVF_BRK_IRQHandler:
 939                     ; 375  }
 942  0108 80            	iret
 965                     ; 382  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 965                     ; 383  {
 966                     	switch	.text
 967  0109               f_TIM3_CAP_COM_IRQHandler:
 971                     ; 387  }
 974  0109 80            	iret
 996                     ; 448 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 996                     ; 449 {
 997                     	switch	.text
 998  010a               f_I2C_IRQHandler:
1002                     ; 453 }
1005  010a 80            	iret
1028                     ; 461  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
1028                     ; 462  {
1029                     	switch	.text
1030  010b               f_UART2_TX_IRQHandler:
1034                     ; 466  }
1037  010b 80            	iret
1060                     ; 473  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
1060                     ; 474  {
1061                     	switch	.text
1062  010c               f_UART2_RX_IRQHandler:
1066                     ; 478  }
1069  010c 80            	iret
1091                     ; 527  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
1091                     ; 528  {
1092                     	switch	.text
1093  010d               f_ADC1_IRQHandler:
1097                     ; 532  }
1100  010d 80            	iret
1123                     ; 553  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
1123                     ; 554  {
1124                     	switch	.text
1125  010e               f_TIM4_UPD_OVF_IRQHandler:
1129                     ; 558  }
1132  010e 80            	iret
1155                     ; 566 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1155                     ; 567 {
1156                     	switch	.text
1157  010f               f_EEPROM_EEC_IRQHandler:
1161                     ; 571 }
1164  010f 80            	iret
1196                     	switch	.ubsct
1197  0001               L5_toggleLED:
1198  0001 00            	ds.b	1
1199  0002               L3_currentTick:
1200  0002 00000000      	ds.b	4
1201                     	xdef	f_EEPROM_EEC_IRQHandler
1202                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1203                     	xdef	f_ADC1_IRQHandler
1204                     	xdef	f_UART2_TX_IRQHandler
1205                     	xdef	f_UART2_RX_IRQHandler
1206                     	xdef	f_I2C_IRQHandler
1207                     	xdef	f_TIM3_CAP_COM_IRQHandler
1208                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1209                     	xdef	f_TIM2_CAP_COM_IRQHandler
1210                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1211                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1212                     	xdef	f_TIM1_CAP_COM_IRQHandler
1213                     	xdef	f_SPI_IRQHandler
1214                     	xdef	f_EXTI_PORTE_IRQHandler
1215                     	xdef	f_EXTI_PORTD_IRQHandler
1216                     	xdef	f_EXTI_PORTC_IRQHandler
1217                     	xdef	f_EXTI_PORTB_IRQHandler
1218                     	xdef	f_EXTI_PORTA_IRQHandler
1219                     	xdef	f_CLK_IRQHandler
1220                     	xdef	f_AWU_IRQHandler
1221                     	xdef	f_TLI_IRQHandler
1222                     	xdef	f_TRAP_IRQHandler
1223                     	xdef	f_NonHandledInterrupt
1224                     	xdef	_StopTogglingLED
1225                     	xdef	_StartTogglingLED
1226                     	xdef	_DelayMs
1227                     	xdef	_GetTick
1228                     	xref	_TIM2_ClearITPendingBit
1229                     	xref	_TIM1_ClearITPendingBit
1230                     	xref	_GPIO_ReadInputPin
1231                     	xref	_GPIO_WriteReverse
1232                     	xref	_GPIO_WriteLow
1233                     	xref	_GPIO_WriteHigh
1234                     	xref.b	c_x
1235                     	xref.b	c_y
1255                     	xref	c_smodx
1256                     	xref	c_lgadc
1257                     	xref	c_lcmp
1258                     	xref	c_lsub
1259                     	xref	c_ltor
1260                     	end
