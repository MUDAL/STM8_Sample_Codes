   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  54                     ; 46 uint32_t GetTick(void)
  54                     ; 47 {
  56                     	switch	.text
  57  0000               _GetTick:
  59  0000 5204          	subw	sp,#4
  60       00000004      OFST:	set	4
  63                     ; 49 	tick = currentTick;
  65  0002 be04          	ldw	x,L3_currentTick+2
  66  0004 1f03          	ldw	(OFST-1,sp),x
  67  0006 be02          	ldw	x,L3_currentTick
  68  0008 1f01          	ldw	(OFST-3,sp),x
  70                     ; 50 	return tick;
  72  000a 96            	ldw	x,sp
  73  000b 1c0001        	addw	x,#OFST-3
  74  000e cd0000        	call	c_ltor
  78  0011 5b04          	addw	sp,#4
  79  0013 81            	ret
 124                     ; 53 void DelayMs(uint32_t delay)
 124                     ; 54 {
 125                     	switch	.text
 126  0014               _DelayMs:
 128  0014 5204          	subw	sp,#4
 129       00000004      OFST:	set	4
 132                     ; 56 	startTick = currentTick; 
 134  0016 be04          	ldw	x,L3_currentTick+2
 135  0018 1f03          	ldw	(OFST-1,sp),x
 136  001a be02          	ldw	x,L3_currentTick
 137  001c 1f01          	ldw	(OFST-3,sp),x
 140  001e               L16:
 141                     ; 57 	while((GetTick() - startTick) < delay){}
 143  001e ade0          	call	_GetTick
 145  0020 96            	ldw	x,sp
 146  0021 1c0001        	addw	x,#OFST-3
 147  0024 cd0000        	call	c_lsub
 149  0027 96            	ldw	x,sp
 150  0028 1c0007        	addw	x,#OFST+3
 151  002b cd0000        	call	c_lcmp
 153  002e 25ee          	jrult	L16
 154                     ; 58 }
 157  0030 5b04          	addw	sp,#4
 158  0032 81            	ret
 182                     ; 60 void StartTogglingLED(void)
 182                     ; 61 {
 183                     	switch	.text
 184  0033               _StartTogglingLED:
 188                     ; 62 	toggleLED = 1;
 190  0033 35010001      	mov	L5_toggleLED,#1
 191                     ; 63 }
 194  0037 81            	ret
 218                     ; 65 void StopTogglingLED(void)
 218                     ; 66 {
 219                     	switch	.text
 220  0038               _StopTogglingLED:
 224                     ; 67 	toggleLED = 0;
 226  0038 3f01          	clr	L5_toggleLED
 227                     ; 68 }
 230  003a 81            	ret
 254                     ; 78 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 254                     ; 79 {
 256                     	switch	.text
 257  003b               f_NonHandledInterrupt:
 261                     ; 83 }
 264  003b 80            	iret
 286                     ; 91 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 286                     ; 92 {
 287                     	switch	.text
 288  003c               f_TRAP_IRQHandler:
 292                     ; 96 }
 295  003c 80            	iret
 317                     ; 103 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 317                     ; 104 
 317                     ; 105 {
 318                     	switch	.text
 319  003d               f_TLI_IRQHandler:
 323                     ; 109 }
 326  003d 80            	iret
 348                     ; 116 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 348                     ; 117 {
 349                     	switch	.text
 350  003e               f_AWU_IRQHandler:
 354                     ; 121 }
 357  003e 80            	iret
 379                     ; 128 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 379                     ; 129 {
 380                     	switch	.text
 381  003f               f_CLK_IRQHandler:
 385                     ; 133 }
 388  003f 80            	iret
 411                     ; 140 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 411                     ; 141 {
 412                     	switch	.text
 413  0040               f_EXTI_PORTA_IRQHandler:
 417                     ; 145 }
 420  0040 80            	iret
 443                     ; 152 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 443                     ; 153 {
 444                     	switch	.text
 445  0041               f_EXTI_PORTB_IRQHandler:
 449                     ; 157 }
 452  0041 80            	iret
 475                     ; 164 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 475                     ; 165 {
 476                     	switch	.text
 477  0042               f_EXTI_PORTC_IRQHandler:
 481                     ; 169 }
 484  0042 80            	iret
 507                     ; 176 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 507                     ; 177 {
 508                     	switch	.text
 509  0043               f_EXTI_PORTD_IRQHandler:
 513                     ; 181 }
 516  0043 80            	iret
 539                     ; 188 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 539                     ; 189 {
 540                     	switch	.text
 541  0044               f_EXTI_PORTE_IRQHandler:
 545                     ; 193 }
 548  0044 80            	iret
 570                     ; 240 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 570                     ; 241 {
 571                     	switch	.text
 572  0045               f_SPI_IRQHandler:
 576                     ; 245 }
 579  0045 80            	iret
 604                     ; 252 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 604                     ; 253 {
 605                     	switch	.text
 606  0046               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 608  0046 8a            	push	cc
 609  0047 84            	pop	a
 610  0048 a4bf          	and	a,#191
 611  004a 88            	push	a
 612  004b 86            	pop	cc
 613  004c 3b0002        	push	c_x+2
 614  004f be00          	ldw	x,c_x
 615  0051 89            	pushw	x
 616  0052 3b0002        	push	c_y+2
 617  0055 be00          	ldw	x,c_y
 618  0057 89            	pushw	x
 621                     ; 257 	currentTick++; 
 623  0058 ae0002        	ldw	x,#L3_currentTick
 624  005b a601          	ld	a,#1
 625  005d cd0000        	call	c_lgadc
 627                     ; 258 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 629  0060 a601          	ld	a,#1
 630  0062 cd0000        	call	_TIM1_ClearITPendingBit
 632                     ; 259 }
 635  0065 85            	popw	x
 636  0066 bf00          	ldw	c_y,x
 637  0068 320002        	pop	c_y+2
 638  006b 85            	popw	x
 639  006c bf00          	ldw	c_x,x
 640  006e 320002        	pop	c_x+2
 641  0071 80            	iret
 664                     ; 266 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 664                     ; 267 {
 665                     	switch	.text
 666  0072               f_TIM1_CAP_COM_IRQHandler:
 670                     ; 271 }
 673  0072 80            	iret
 675                     	switch	.ubsct
 676  0000               L552_ledCounter:
 677  0000 00            	ds.b	1
 716                     ; 304  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 716                     ; 305  {
 717                     	switch	.text
 718  0073               f_TIM2_UPD_OVF_BRK_IRQHandler:
 720  0073 8a            	push	cc
 721  0074 84            	pop	a
 722  0075 a4bf          	and	a,#191
 723  0077 88            	push	a
 724  0078 86            	pop	cc
 725  0079 3b0002        	push	c_x+2
 726  007c be00          	ldw	x,c_x
 727  007e 89            	pushw	x
 728  007f 3b0002        	push	c_y+2
 729  0082 be00          	ldw	x,c_y
 730  0084 89            	pushw	x
 733                     ; 310 	if(!GPIO_ReadInputPin(FAN_SENSOR_PORT,FAN_SENSOR))
 735  0085 4b02          	push	#2
 736  0087 ae5005        	ldw	x,#20485
 737  008a cd0000        	call	_GPIO_ReadInputPin
 739  008d 5b01          	addw	sp,#1
 740  008f 4d            	tnz	a
 741  0090 260b          	jrne	L572
 742                     ; 312 		GPIO_WriteHigh(FAN_PORT,FAN);
 744  0092 4b08          	push	#8
 745  0094 ae500f        	ldw	x,#20495
 746  0097 cd0000        	call	_GPIO_WriteHigh
 748  009a 84            	pop	a
 750  009b 2009          	jra	L772
 751  009d               L572:
 752                     ; 316 		GPIO_WriteLow(FAN_PORT,FAN);
 754  009d 4b08          	push	#8
 755  009f ae500f        	ldw	x,#20495
 756  00a2 cd0000        	call	_GPIO_WriteLow
 758  00a5 84            	pop	a
 759  00a6               L772:
 760                     ; 319 	if(!GPIO_ReadInputPin(WATER_SENSOR_PORT,WATER_SENSOR))
 762  00a6 4b04          	push	#4
 763  00a8 ae5005        	ldw	x,#20485
 764  00ab cd0000        	call	_GPIO_ReadInputPin
 766  00ae 5b01          	addw	sp,#1
 767  00b0 4d            	tnz	a
 768  00b1 260b          	jrne	L103
 769                     ; 321 		GPIO_WriteLow(WATER_VALVE_PORT,WATER_VALVE);
 771  00b3 4b10          	push	#16
 772  00b5 ae500f        	ldw	x,#20495
 773  00b8 cd0000        	call	_GPIO_WriteLow
 775  00bb 84            	pop	a
 777  00bc 2009          	jra	L303
 778  00be               L103:
 779                     ; 325 		GPIO_WriteHigh(WATER_VALVE_PORT,WATER_VALVE);
 781  00be 4b10          	push	#16
 782  00c0 ae500f        	ldw	x,#20495
 783  00c3 cd0000        	call	_GPIO_WriteHigh
 785  00c6 84            	pop	a
 786  00c7               L303:
 787                     ; 328 	if(toggleLED)
 789  00c7 3d01          	tnz	L5_toggleLED
 790  00c9 271b          	jreq	L503
 791                     ; 331 		if((ledCounter % 100) == 0)
 793  00cb b600          	ld	a,L552_ledCounter
 794  00cd 5f            	clrw	x
 795  00ce 97            	ld	xl,a
 796  00cf a664          	ld	a,#100
 797  00d1 cd0000        	call	c_smodx
 799  00d4 a30000        	cpw	x,#0
 800  00d7 2609          	jrne	L703
 801                     ; 333 			GPIO_WriteReverse(SOAP_LED_PORT,SOAP_LED);
 803  00d9 4b10          	push	#16
 804  00db ae5019        	ldw	x,#20505
 805  00de cd0000        	call	_GPIO_WriteReverse
 807  00e1 84            	pop	a
 808  00e2               L703:
 809                     ; 335 		ledCounter++;
 811  00e2 3c00          	inc	L552_ledCounter
 813  00e4 2009          	jra	L113
 814  00e6               L503:
 815                     ; 339 		GPIO_WriteLow(SOAP_LED_PORT,SOAP_LED);
 817  00e6 4b10          	push	#16
 818  00e8 ae5019        	ldw	x,#20505
 819  00eb cd0000        	call	_GPIO_WriteLow
 821  00ee 84            	pop	a
 822  00ef               L113:
 823                     ; 341 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 825  00ef a601          	ld	a,#1
 826  00f1 cd0000        	call	_TIM2_ClearITPendingBit
 828                     ; 342  }
 831  00f4 85            	popw	x
 832  00f5 bf00          	ldw	c_y,x
 833  00f7 320002        	pop	c_y+2
 834  00fa 85            	popw	x
 835  00fb bf00          	ldw	c_x,x
 836  00fd 320002        	pop	c_x+2
 837  0100 80            	iret
 860                     ; 349  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 860                     ; 350  {
 861                     	switch	.text
 862  0101               f_TIM2_CAP_COM_IRQHandler:
 866                     ; 354  }
 869  0101 80            	iret
 892                     ; 364  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 892                     ; 365  {
 893                     	switch	.text
 894  0102               f_TIM3_UPD_OVF_BRK_IRQHandler:
 898                     ; 369  }
 901  0102 80            	iret
 924                     ; 376  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 924                     ; 377  {
 925                     	switch	.text
 926  0103               f_TIM3_CAP_COM_IRQHandler:
 930                     ; 381  }
 933  0103 80            	iret
 955                     ; 442 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 955                     ; 443 {
 956                     	switch	.text
 957  0104               f_I2C_IRQHandler:
 961                     ; 447 }
 964  0104 80            	iret
 987                     ; 455  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 987                     ; 456  {
 988                     	switch	.text
 989  0105               f_UART2_TX_IRQHandler:
 993                     ; 460  }
 996  0105 80            	iret
1019                     ; 467  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
1019                     ; 468  {
1020                     	switch	.text
1021  0106               f_UART2_RX_IRQHandler:
1025                     ; 472  }
1028  0106 80            	iret
1050                     ; 521  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
1050                     ; 522  {
1051                     	switch	.text
1052  0107               f_ADC1_IRQHandler:
1056                     ; 526  }
1059  0107 80            	iret
1082                     ; 547  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
1082                     ; 548  {
1083                     	switch	.text
1084  0108               f_TIM4_UPD_OVF_IRQHandler:
1088                     ; 552  }
1091  0108 80            	iret
1114                     ; 560 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1114                     ; 561 {
1115                     	switch	.text
1116  0109               f_EEPROM_EEC_IRQHandler:
1120                     ; 565 }
1123  0109 80            	iret
1155                     	switch	.ubsct
1156  0001               L5_toggleLED:
1157  0001 00            	ds.b	1
1158  0002               L3_currentTick:
1159  0002 00000000      	ds.b	4
1160                     	xdef	f_EEPROM_EEC_IRQHandler
1161                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1162                     	xdef	f_ADC1_IRQHandler
1163                     	xdef	f_UART2_TX_IRQHandler
1164                     	xdef	f_UART2_RX_IRQHandler
1165                     	xdef	f_I2C_IRQHandler
1166                     	xdef	f_TIM3_CAP_COM_IRQHandler
1167                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1168                     	xdef	f_TIM2_CAP_COM_IRQHandler
1169                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1170                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1171                     	xdef	f_TIM1_CAP_COM_IRQHandler
1172                     	xdef	f_SPI_IRQHandler
1173                     	xdef	f_EXTI_PORTE_IRQHandler
1174                     	xdef	f_EXTI_PORTD_IRQHandler
1175                     	xdef	f_EXTI_PORTC_IRQHandler
1176                     	xdef	f_EXTI_PORTB_IRQHandler
1177                     	xdef	f_EXTI_PORTA_IRQHandler
1178                     	xdef	f_CLK_IRQHandler
1179                     	xdef	f_AWU_IRQHandler
1180                     	xdef	f_TLI_IRQHandler
1181                     	xdef	f_TRAP_IRQHandler
1182                     	xdef	f_NonHandledInterrupt
1183                     	xdef	_StopTogglingLED
1184                     	xdef	_StartTogglingLED
1185                     	xdef	_DelayMs
1186                     	xdef	_GetTick
1187                     	xref	_TIM2_ClearITPendingBit
1188                     	xref	_TIM1_ClearITPendingBit
1189                     	xref	_GPIO_ReadInputPin
1190                     	xref	_GPIO_WriteReverse
1191                     	xref	_GPIO_WriteLow
1192                     	xref	_GPIO_WriteHigh
1193                     	xref.b	c_x
1194                     	xref.b	c_y
1214                     	xref	c_smodx
1215                     	xref	c_lgadc
1216                     	xref	c_lcmp
1217                     	xref	c_lsub
1218                     	xref	c_ltor
1219                     	end
