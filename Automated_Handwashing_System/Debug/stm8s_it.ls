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
 159                     ; 57 void ToggleLED(void)
 159                     ; 58 {
 160                     	switch	.text
 161  002a               _ToggleLED:
 165                     ; 59 	toggleLED = 1;
 167  002a 35010002      	mov	L5_toggleLED,#1
 168                     ; 60 }
 171  002e 81            	ret
 195                     ; 62 void DisableLED(void)
 195                     ; 63 {
 196                     	switch	.text
 197  002f               _DisableLED:
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
 767  00c0 271f          	jreq	L772
 768                     ; 328 		if((ledCounter % 1000) == 0)
 770  00c2 be00          	ldw	x,L742_ledCounter
 771  00c4 90ae03e8      	ldw	y,#1000
 772  00c8 65            	divw	x,y
 773  00c9 51            	exgw	x,y
 774  00ca a30000        	cpw	x,#0
 775  00cd 2609          	jrne	L103
 776                     ; 330 			GPIO_WriteReverse(LED_PORT,LED);
 778  00cf 4b10          	push	#16
 779  00d1 ae5019        	ldw	x,#20505
 780  00d4 cd0000        	call	_GPIO_WriteReverse
 782  00d7 84            	pop	a
 783  00d8               L103:
 784                     ; 332 		ledCounter++;
 786  00d8 be00          	ldw	x,L742_ledCounter
 787  00da 1c0001        	addw	x,#1
 788  00dd bf00          	ldw	L742_ledCounter,x
 790  00df 2009          	jra	L303
 791  00e1               L772:
 792                     ; 336 		GPIO_WriteLow(LED_PORT,LED);
 794  00e1 4b10          	push	#16
 795  00e3 ae5019        	ldw	x,#20505
 796  00e6 cd0000        	call	_GPIO_WriteLow
 798  00e9 84            	pop	a
 799  00ea               L303:
 800                     ; 338 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 802  00ea a601          	ld	a,#1
 803  00ec cd0000        	call	_TIM2_ClearITPendingBit
 805                     ; 339  }
 808  00ef 85            	popw	x
 809  00f0 bf00          	ldw	c_y,x
 810  00f2 320002        	pop	c_y+2
 811  00f5 85            	popw	x
 812  00f6 bf00          	ldw	c_x,x
 813  00f8 320002        	pop	c_x+2
 814  00fb 80            	iret
 837                     ; 346  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 837                     ; 347  {
 838                     	switch	.text
 839  00fc               f_TIM2_CAP_COM_IRQHandler:
 843                     ; 351  }
 846  00fc 80            	iret
 869                     ; 361  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 869                     ; 362  {
 870                     	switch	.text
 871  00fd               f_TIM3_UPD_OVF_BRK_IRQHandler:
 875                     ; 366  }
 878  00fd 80            	iret
 901                     ; 373  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 901                     ; 374  {
 902                     	switch	.text
 903  00fe               f_TIM3_CAP_COM_IRQHandler:
 907                     ; 378  }
 910  00fe 80            	iret
 932                     ; 439 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 932                     ; 440 {
 933                     	switch	.text
 934  00ff               f_I2C_IRQHandler:
 938                     ; 444 }
 941  00ff 80            	iret
 964                     ; 452  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 964                     ; 453  {
 965                     	switch	.text
 966  0100               f_UART2_TX_IRQHandler:
 970                     ; 457  }
 973  0100 80            	iret
 996                     ; 464  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 996                     ; 465  {
 997                     	switch	.text
 998  0101               f_UART2_RX_IRQHandler:
1002                     ; 469  }
1005  0101 80            	iret
1027                     ; 518  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
1027                     ; 519  {
1028                     	switch	.text
1029  0102               f_ADC1_IRQHandler:
1033                     ; 523  }
1036  0102 80            	iret
1059                     ; 544  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
1059                     ; 545  {
1060                     	switch	.text
1061  0103               f_TIM4_UPD_OVF_IRQHandler:
1065                     ; 549  }
1068  0103 80            	iret
1091                     ; 557 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1091                     ; 558 {
1092                     	switch	.text
1093  0104               f_EEPROM_EEC_IRQHandler:
1097                     ; 562 }
1100  0104 80            	iret
1132                     	switch	.ubsct
1133  0002               L5_toggleLED:
1134  0002 00            	ds.b	1
1135  0003               L3_currentTick:
1136  0003 00000000      	ds.b	4
1137                     	xdef	f_EEPROM_EEC_IRQHandler
1138                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1139                     	xdef	f_ADC1_IRQHandler
1140                     	xdef	f_UART2_TX_IRQHandler
1141                     	xdef	f_UART2_RX_IRQHandler
1142                     	xdef	f_I2C_IRQHandler
1143                     	xdef	f_TIM3_CAP_COM_IRQHandler
1144                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1145                     	xdef	f_TIM2_CAP_COM_IRQHandler
1146                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1147                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1148                     	xdef	f_TIM1_CAP_COM_IRQHandler
1149                     	xdef	f_SPI_IRQHandler
1150                     	xdef	f_EXTI_PORTE_IRQHandler
1151                     	xdef	f_EXTI_PORTD_IRQHandler
1152                     	xdef	f_EXTI_PORTC_IRQHandler
1153                     	xdef	f_EXTI_PORTB_IRQHandler
1154                     	xdef	f_EXTI_PORTA_IRQHandler
1155                     	xdef	f_CLK_IRQHandler
1156                     	xdef	f_AWU_IRQHandler
1157                     	xdef	f_TLI_IRQHandler
1158                     	xdef	f_TRAP_IRQHandler
1159                     	xdef	f_NonHandledInterrupt
1160                     	xdef	_DisableLED
1161                     	xdef	_ToggleLED
1162                     	xdef	_GetTick
1163                     	xdef	_DelayMs
1164                     	xref	_TIM2_ClearITPendingBit
1165                     	xref	_TIM1_ClearITPendingBit
1166                     	xref	_GPIO_ReadInputPin
1167                     	xref	_GPIO_WriteReverse
1168                     	xref	_GPIO_WriteLow
1169                     	xref	_GPIO_WriteHigh
1170                     	xref.b	c_x
1171                     	xref.b	c_y
1191                     	xref	c_lgadc
1192                     	xref	c_lcmp
1193                     	xref	c_lsub
1194                     	xref	c_ltor
1195                     	end
