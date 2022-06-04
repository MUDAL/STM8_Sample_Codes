   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  62                     ; 46 void DelayMs(uint32_t delay)
  62                     ; 47 {
  64                     	switch	.text
  65  0000               _DelayMs:
  67  0000 5204          	subw	sp,#4
  68       00000004      OFST:	set	4
  71                     ; 48 	uint32_t startTick = currentTick;
  73  0002 be05          	ldw	x,L3_currentTick+2
  74  0004 1f03          	ldw	(OFST-1,sp),x
  75  0006 be03          	ldw	x,L3_currentTick
  76  0008 1f01          	ldw	(OFST-3,sp),x
  79  000a               L34:
  80                     ; 49 	while((currentTick - startTick) < delay){}
  82  000a ae0003        	ldw	x,#L3_currentTick
  83  000d cd0000        	call	c_ltor
  85  0010 96            	ldw	x,sp
  86  0011 1c0001        	addw	x,#OFST-3
  87  0014 cd0000        	call	c_lsub
  89  0017 96            	ldw	x,sp
  90  0018 1c0007        	addw	x,#OFST+3
  91  001b cd0000        	call	c_lcmp
  93  001e 25ea          	jrult	L34
  94                     ; 50 }
  97  0020 5b04          	addw	sp,#4
  98  0022 81            	ret
 122                     ; 52 uint32_t GetTick(void)
 122                     ; 53 {
 123                     	switch	.text
 124  0023               _GetTick:
 128                     ; 54 	return currentTick;
 130  0023 ae0003        	ldw	x,#L3_currentTick
 131  0026 cd0000        	call	c_ltor
 135  0029 81            	ret
 159                     ; 57 void StartTogglingLED(void)
 159                     ; 58 {
 160                     	switch	.text
 161  002a               _StartTogglingLED:
 165                     ; 59 	toggleLED = 1;
 167  002a 35010002      	mov	L5_toggleLED,#1
 168                     ; 60 }
 171  002e 81            	ret
 195                     ; 62 void StopTogglingLED(void)
 195                     ; 63 {
 196                     	switch	.text
 197  002f               _StopTogglingLED:
 201                     ; 64 	toggleLED = 0;
 203  002f 3f02          	clr	L5_toggleLED
 204                     ; 65 }
 207  0031 81            	ret
 231                     ; 75 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 231                     ; 76 {
 233                     	switch	.text
 234  0032               f_NonHandledInterrupt:
 238                     ; 80 }
 241  0032 80            	iret
 263                     ; 88 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 263                     ; 89 {
 264                     	switch	.text
 265  0033               f_TRAP_IRQHandler:
 269                     ; 93 }
 272  0033 80            	iret
 294                     ; 100 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 294                     ; 101 
 294                     ; 102 {
 295                     	switch	.text
 296  0034               f_TLI_IRQHandler:
 300                     ; 106 }
 303  0034 80            	iret
 325                     ; 113 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 325                     ; 114 {
 326                     	switch	.text
 327  0035               f_AWU_IRQHandler:
 331                     ; 118 }
 334  0035 80            	iret
 356                     ; 125 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 356                     ; 126 {
 357                     	switch	.text
 358  0036               f_CLK_IRQHandler:
 362                     ; 130 }
 365  0036 80            	iret
 388                     ; 137 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 388                     ; 138 {
 389                     	switch	.text
 390  0037               f_EXTI_PORTA_IRQHandler:
 394                     ; 142 }
 397  0037 80            	iret
 420                     ; 149 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 420                     ; 150 {
 421                     	switch	.text
 422  0038               f_EXTI_PORTB_IRQHandler:
 426                     ; 154 }
 429  0038 80            	iret
 452                     ; 161 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 452                     ; 162 {
 453                     	switch	.text
 454  0039               f_EXTI_PORTC_IRQHandler:
 458                     ; 166 }
 461  0039 80            	iret
 484                     ; 173 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 484                     ; 174 {
 485                     	switch	.text
 486  003a               f_EXTI_PORTD_IRQHandler:
 490                     ; 178 }
 493  003a 80            	iret
 516                     ; 185 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 516                     ; 186 {
 517                     	switch	.text
 518  003b               f_EXTI_PORTE_IRQHandler:
 522                     ; 190 }
 525  003b 80            	iret
 547                     ; 237 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 547                     ; 238 {
 548                     	switch	.text
 549  003c               f_SPI_IRQHandler:
 553                     ; 242 }
 556  003c 80            	iret
 581                     ; 249 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 581                     ; 250 {
 582                     	switch	.text
 583  003d               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 585  003d 8a            	push	cc
 586  003e 84            	pop	a
 587  003f a4bf          	and	a,#191
 588  0041 88            	push	a
 589  0042 86            	pop	cc
 590  0043 3b0002        	push	c_x+2
 591  0046 be00          	ldw	x,c_x
 592  0048 89            	pushw	x
 593  0049 3b0002        	push	c_y+2
 594  004c be00          	ldw	x,c_y
 595  004e 89            	pushw	x
 598                     ; 254 	currentTick++;
 600  004f ae0003        	ldw	x,#L3_currentTick
 601  0052 a601          	ld	a,#1
 602  0054 cd0000        	call	c_lgadc
 604                     ; 255 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 606  0057 a601          	ld	a,#1
 607  0059 cd0000        	call	_TIM1_ClearITPendingBit
 609                     ; 256 }
 612  005c 85            	popw	x
 613  005d bf00          	ldw	c_y,x
 614  005f 320002        	pop	c_y+2
 615  0062 85            	popw	x
 616  0063 bf00          	ldw	c_x,x
 617  0065 320002        	pop	c_x+2
 618  0068 80            	iret
 641                     ; 263 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 641                     ; 264 {
 642                     	switch	.text
 643  0069               f_TIM1_CAP_COM_IRQHandler:
 647                     ; 268 }
 650  0069 80            	iret
 652                     	switch	.ubsct
 653  0000               L742_ledCounter:
 654  0000 0000          	ds.b	2
 693                     ; 301  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 693                     ; 302  {
 694                     	switch	.text
 695  006a               f_TIM2_UPD_OVF_BRK_IRQHandler:
 697  006a 8a            	push	cc
 698  006b 84            	pop	a
 699  006c a4bf          	and	a,#191
 700  006e 88            	push	a
 701  006f 86            	pop	cc
 702  0070 3b0002        	push	c_x+2
 703  0073 be00          	ldw	x,c_x
 704  0075 89            	pushw	x
 705  0076 3b0002        	push	c_y+2
 706  0079 be00          	ldw	x,c_y
 707  007b 89            	pushw	x
 710                     ; 307 	if(!GPIO_ReadInputPin(FAN_SENSOR_PORT,FAN_SENSOR))
 712  007c 4b02          	push	#2
 713  007e ae5005        	ldw	x,#20485
 714  0081 cd0000        	call	_GPIO_ReadInputPin
 716  0084 5b01          	addw	sp,#1
 717  0086 4d            	tnz	a
 718  0087 260b          	jrne	L762
 719                     ; 309 		GPIO_WriteHigh(FAN_PORT,FAN);
 721  0089 4b10          	push	#16
 722  008b ae5005        	ldw	x,#20485
 723  008e cd0000        	call	_GPIO_WriteHigh
 725  0091 84            	pop	a
 727  0092 2009          	jra	L172
 728  0094               L762:
 729                     ; 313 		GPIO_WriteLow(FAN_PORT,FAN);
 731  0094 4b10          	push	#16
 732  0096 ae5005        	ldw	x,#20485
 733  0099 cd0000        	call	_GPIO_WriteLow
 735  009c 84            	pop	a
 736  009d               L172:
 737                     ; 316 	if(!GPIO_ReadInputPin(WATER_SENSOR_PORT,WATER_SENSOR))
 739  009d 4b04          	push	#4
 740  009f ae5005        	ldw	x,#20485
 741  00a2 cd0000        	call	_GPIO_ReadInputPin
 743  00a5 5b01          	addw	sp,#1
 744  00a7 4d            	tnz	a
 745  00a8 260b          	jrne	L372
 746                     ; 318 		GPIO_WriteHigh(WATER_VALVE_PORT,WATER_VALVE);
 748  00aa 4b20          	push	#32
 749  00ac ae5005        	ldw	x,#20485
 750  00af cd0000        	call	_GPIO_WriteHigh
 752  00b2 84            	pop	a
 754  00b3 2009          	jra	L572
 755  00b5               L372:
 756                     ; 322 		GPIO_WriteLow(WATER_VALVE_PORT,WATER_VALVE);
 758  00b5 4b20          	push	#32
 759  00b7 ae5005        	ldw	x,#20485
 760  00ba cd0000        	call	_GPIO_WriteLow
 762  00bd 84            	pop	a
 763  00be               L572:
 764                     ; 325 	if(toggleLED)
 766  00be 3d02          	tnz	L5_toggleLED
 767  00c0 271e          	jreq	L772
 768                     ; 328 		if((ledCounter % 100) == 0)
 770  00c2 be00          	ldw	x,L742_ledCounter
 771  00c4 a664          	ld	a,#100
 772  00c6 62            	div	x,a
 773  00c7 5f            	clrw	x
 774  00c8 97            	ld	xl,a
 775  00c9 a30000        	cpw	x,#0
 776  00cc 2609          	jrne	L103
 777                     ; 330 			GPIO_WriteReverse(LED_PORT,LED);
 779  00ce 4b10          	push	#16
 780  00d0 ae5019        	ldw	x,#20505
 781  00d3 cd0000        	call	_GPIO_WriteReverse
 783  00d6 84            	pop	a
 784  00d7               L103:
 785                     ; 332 		ledCounter++;
 787  00d7 be00          	ldw	x,L742_ledCounter
 788  00d9 1c0001        	addw	x,#1
 789  00dc bf00          	ldw	L742_ledCounter,x
 791  00de 2009          	jra	L303
 792  00e0               L772:
 793                     ; 336 		GPIO_WriteLow(LED_PORT,LED);
 795  00e0 4b10          	push	#16
 796  00e2 ae5019        	ldw	x,#20505
 797  00e5 cd0000        	call	_GPIO_WriteLow
 799  00e8 84            	pop	a
 800  00e9               L303:
 801                     ; 338 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 803  00e9 a601          	ld	a,#1
 804  00eb cd0000        	call	_TIM2_ClearITPendingBit
 806                     ; 339  }
 809  00ee 85            	popw	x
 810  00ef bf00          	ldw	c_y,x
 811  00f1 320002        	pop	c_y+2
 812  00f4 85            	popw	x
 813  00f5 bf00          	ldw	c_x,x
 814  00f7 320002        	pop	c_x+2
 815  00fa 80            	iret
 838                     ; 346  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 838                     ; 347  {
 839                     	switch	.text
 840  00fb               f_TIM2_CAP_COM_IRQHandler:
 844                     ; 351  }
 847  00fb 80            	iret
 870                     ; 361  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 870                     ; 362  {
 871                     	switch	.text
 872  00fc               f_TIM3_UPD_OVF_BRK_IRQHandler:
 876                     ; 366  }
 879  00fc 80            	iret
 902                     ; 373  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 902                     ; 374  {
 903                     	switch	.text
 904  00fd               f_TIM3_CAP_COM_IRQHandler:
 908                     ; 378  }
 911  00fd 80            	iret
 933                     ; 439 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 933                     ; 440 {
 934                     	switch	.text
 935  00fe               f_I2C_IRQHandler:
 939                     ; 444 }
 942  00fe 80            	iret
 965                     ; 452  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 965                     ; 453  {
 966                     	switch	.text
 967  00ff               f_UART2_TX_IRQHandler:
 971                     ; 457  }
 974  00ff 80            	iret
 997                     ; 464  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 997                     ; 465  {
 998                     	switch	.text
 999  0100               f_UART2_RX_IRQHandler:
1003                     ; 469  }
1006  0100 80            	iret
1028                     ; 518  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
1028                     ; 519  {
1029                     	switch	.text
1030  0101               f_ADC1_IRQHandler:
1034                     ; 523  }
1037  0101 80            	iret
1060                     ; 544  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
1060                     ; 545  {
1061                     	switch	.text
1062  0102               f_TIM4_UPD_OVF_IRQHandler:
1066                     ; 549  }
1069  0102 80            	iret
1092                     ; 557 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1092                     ; 558 {
1093                     	switch	.text
1094  0103               f_EEPROM_EEC_IRQHandler:
1098                     ; 562 }
1101  0103 80            	iret
1133                     	switch	.ubsct
1134  0002               L5_toggleLED:
1135  0002 00            	ds.b	1
1136  0003               L3_currentTick:
1137  0003 00000000      	ds.b	4
1138                     	xdef	f_EEPROM_EEC_IRQHandler
1139                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1140                     	xdef	f_ADC1_IRQHandler
1141                     	xdef	f_UART2_TX_IRQHandler
1142                     	xdef	f_UART2_RX_IRQHandler
1143                     	xdef	f_I2C_IRQHandler
1144                     	xdef	f_TIM3_CAP_COM_IRQHandler
1145                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1146                     	xdef	f_TIM2_CAP_COM_IRQHandler
1147                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1148                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1149                     	xdef	f_TIM1_CAP_COM_IRQHandler
1150                     	xdef	f_SPI_IRQHandler
1151                     	xdef	f_EXTI_PORTE_IRQHandler
1152                     	xdef	f_EXTI_PORTD_IRQHandler
1153                     	xdef	f_EXTI_PORTC_IRQHandler
1154                     	xdef	f_EXTI_PORTB_IRQHandler
1155                     	xdef	f_EXTI_PORTA_IRQHandler
1156                     	xdef	f_CLK_IRQHandler
1157                     	xdef	f_AWU_IRQHandler
1158                     	xdef	f_TLI_IRQHandler
1159                     	xdef	f_TRAP_IRQHandler
1160                     	xdef	f_NonHandledInterrupt
1161                     	xdef	_StopTogglingLED
1162                     	xdef	_StartTogglingLED
1163                     	xdef	_GetTick
1164                     	xdef	_DelayMs
1165                     	xref	_TIM2_ClearITPendingBit
1166                     	xref	_TIM1_ClearITPendingBit
1167                     	xref	_GPIO_ReadInputPin
1168                     	xref	_GPIO_WriteReverse
1169                     	xref	_GPIO_WriteLow
1170                     	xref	_GPIO_WriteHigh
1171                     	xref.b	c_x
1172                     	xref.b	c_y
1192                     	xref	c_lgadc
1193                     	xref	c_lcmp
1194                     	xref	c_lsub
1195                     	xref	c_ltor
1196                     	end
