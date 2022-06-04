   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  53                     ; 46 uint32_t GetTick(void)
  53                     ; 47 {
  55                     	switch	.text
  56  0000               _GetTick:
  58  0000 5204          	subw	sp,#4
  59       00000004      OFST:	set	4
  62                     ; 49 	tick = currentTick;
  64  0002 be04          	ldw	x,L3_currentTick+2
  65  0004 1f03          	ldw	(OFST-1,sp),x
  66  0006 be02          	ldw	x,L3_currentTick
  67  0008 1f01          	ldw	(OFST-3,sp),x
  69                     ; 50 	return tick;
  71  000a 96            	ldw	x,sp
  72  000b 1c0001        	addw	x,#OFST-3
  73  000e cd0000        	call	c_ltor
  77  0011 5b04          	addw	sp,#4
  78  0013 81            	ret
 123                     ; 53 void DelayMs(uint32_t delay)
 123                     ; 54 {
 124                     	switch	.text
 125  0014               _DelayMs:
 127  0014 5204          	subw	sp,#4
 128       00000004      OFST:	set	4
 131                     ; 56 	startTick = currentTick; 
 133  0016 be04          	ldw	x,L3_currentTick+2
 134  0018 1f03          	ldw	(OFST-1,sp),x
 135  001a be02          	ldw	x,L3_currentTick
 136  001c 1f01          	ldw	(OFST-3,sp),x
 139  001e               L16:
 140                     ; 57 	while((GetTick() - startTick) < delay){}
 142  001e ade0          	call	_GetTick
 144  0020 96            	ldw	x,sp
 145  0021 1c0001        	addw	x,#OFST-3
 146  0024 cd0000        	call	c_lsub
 148  0027 96            	ldw	x,sp
 149  0028 1c0007        	addw	x,#OFST+3
 150  002b cd0000        	call	c_lcmp
 152  002e 25ee          	jrult	L16
 153                     ; 58 }
 156  0030 5b04          	addw	sp,#4
 157  0032 81            	ret
 181                     ; 60 void StartTogglingLED(void)
 181                     ; 61 {
 182                     	switch	.text
 183  0033               _StartTogglingLED:
 187                     ; 62 	toggleLED = 1;
 189  0033 35010001      	mov	L5_toggleLED,#1
 190                     ; 63 }
 193  0037 81            	ret
 217                     ; 65 void StopTogglingLED(void)
 217                     ; 66 {
 218                     	switch	.text
 219  0038               _StopTogglingLED:
 223                     ; 67 	toggleLED = 0;
 225  0038 3f01          	clr	L5_toggleLED
 226                     ; 68 }
 229  003a 81            	ret
 253                     ; 78 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 253                     ; 79 {
 255                     	switch	.text
 256  003b               f_NonHandledInterrupt:
 260                     ; 83 }
 263  003b 80            	iret
 285                     ; 91 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 285                     ; 92 {
 286                     	switch	.text
 287  003c               f_TRAP_IRQHandler:
 291                     ; 96 }
 294  003c 80            	iret
 316                     ; 103 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 316                     ; 104 
 316                     ; 105 {
 317                     	switch	.text
 318  003d               f_TLI_IRQHandler:
 322                     ; 109 }
 325  003d 80            	iret
 347                     ; 116 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 347                     ; 117 {
 348                     	switch	.text
 349  003e               f_AWU_IRQHandler:
 353                     ; 121 }
 356  003e 80            	iret
 378                     ; 128 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 378                     ; 129 {
 379                     	switch	.text
 380  003f               f_CLK_IRQHandler:
 384                     ; 133 }
 387  003f 80            	iret
 410                     ; 140 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 410                     ; 141 {
 411                     	switch	.text
 412  0040               f_EXTI_PORTA_IRQHandler:
 416                     ; 145 }
 419  0040 80            	iret
 442                     ; 152 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 442                     ; 153 {
 443                     	switch	.text
 444  0041               f_EXTI_PORTB_IRQHandler:
 448                     ; 157 }
 451  0041 80            	iret
 474                     ; 164 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 474                     ; 165 {
 475                     	switch	.text
 476  0042               f_EXTI_PORTC_IRQHandler:
 480                     ; 169 }
 483  0042 80            	iret
 506                     ; 176 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 506                     ; 177 {
 507                     	switch	.text
 508  0043               f_EXTI_PORTD_IRQHandler:
 512                     ; 181 }
 515  0043 80            	iret
 538                     ; 188 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 538                     ; 189 {
 539                     	switch	.text
 540  0044               f_EXTI_PORTE_IRQHandler:
 544                     ; 193 }
 547  0044 80            	iret
 569                     ; 240 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 569                     ; 241 {
 570                     	switch	.text
 571  0045               f_SPI_IRQHandler:
 575                     ; 245 }
 578  0045 80            	iret
 603                     ; 252 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 603                     ; 253 {
 604                     	switch	.text
 605  0046               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 607  0046 8a            	push	cc
 608  0047 84            	pop	a
 609  0048 a4bf          	and	a,#191
 610  004a 88            	push	a
 611  004b 86            	pop	cc
 612  004c 3b0002        	push	c_x+2
 613  004f be00          	ldw	x,c_x
 614  0051 89            	pushw	x
 615  0052 3b0002        	push	c_y+2
 616  0055 be00          	ldw	x,c_y
 617  0057 89            	pushw	x
 620                     ; 257 	currentTick++; 
 622  0058 ae0002        	ldw	x,#L3_currentTick
 623  005b a601          	ld	a,#1
 624  005d cd0000        	call	c_lgadc
 626                     ; 258 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 628  0060 a601          	ld	a,#1
 629  0062 cd0000        	call	_TIM1_ClearITPendingBit
 631                     ; 259 }
 634  0065 85            	popw	x
 635  0066 bf00          	ldw	c_y,x
 636  0068 320002        	pop	c_y+2
 637  006b 85            	popw	x
 638  006c bf00          	ldw	c_x,x
 639  006e 320002        	pop	c_x+2
 640  0071 80            	iret
 663                     ; 266 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 663                     ; 267 {
 664                     	switch	.text
 665  0072               f_TIM1_CAP_COM_IRQHandler:
 669                     ; 271 }
 672  0072 80            	iret
 674                     	switch	.ubsct
 675  0000               L552_ledCounter:
 676  0000 00            	ds.b	1
 715                     ; 304  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 715                     ; 305  {
 716                     	switch	.text
 717  0073               f_TIM2_UPD_OVF_BRK_IRQHandler:
 719  0073 8a            	push	cc
 720  0074 84            	pop	a
 721  0075 a4bf          	and	a,#191
 722  0077 88            	push	a
 723  0078 86            	pop	cc
 724  0079 3b0002        	push	c_x+2
 725  007c be00          	ldw	x,c_x
 726  007e 89            	pushw	x
 727  007f 3b0002        	push	c_y+2
 728  0082 be00          	ldw	x,c_y
 729  0084 89            	pushw	x
 732                     ; 310 	if(!GPIO_ReadInputPin(FAN_SENSOR_PORT,FAN_SENSOR))
 734  0085 4b02          	push	#2
 735  0087 ae5005        	ldw	x,#20485
 736  008a cd0000        	call	_GPIO_ReadInputPin
 738  008d 5b01          	addw	sp,#1
 739  008f 4d            	tnz	a
 740  0090 260b          	jrne	L572
 741                     ; 312 		GPIO_WriteHigh(FAN_PORT,FAN);
 743  0092 4b08          	push	#8
 744  0094 ae500f        	ldw	x,#20495
 745  0097 cd0000        	call	_GPIO_WriteHigh
 747  009a 84            	pop	a
 749  009b 2009          	jra	L772
 750  009d               L572:
 751                     ; 316 		GPIO_WriteLow(FAN_PORT,FAN);
 753  009d 4b08          	push	#8
 754  009f ae500f        	ldw	x,#20495
 755  00a2 cd0000        	call	_GPIO_WriteLow
 757  00a5 84            	pop	a
 758  00a6               L772:
 759                     ; 319 	if(!GPIO_ReadInputPin(WATER_SENSOR_PORT,WATER_SENSOR))
 761  00a6 4b04          	push	#4
 762  00a8 ae5005        	ldw	x,#20485
 763  00ab cd0000        	call	_GPIO_ReadInputPin
 765  00ae 5b01          	addw	sp,#1
 766  00b0 4d            	tnz	a
 767  00b1 260b          	jrne	L103
 768                     ; 321 		GPIO_WriteHigh(WATER_VALVE_PORT,WATER_VALVE);
 770  00b3 4b10          	push	#16
 771  00b5 ae500f        	ldw	x,#20495
 772  00b8 cd0000        	call	_GPIO_WriteHigh
 774  00bb 84            	pop	a
 776  00bc 2009          	jra	L303
 777  00be               L103:
 778                     ; 325 		GPIO_WriteLow(WATER_VALVE_PORT,WATER_VALVE);
 780  00be 4b10          	push	#16
 781  00c0 ae500f        	ldw	x,#20495
 782  00c3 cd0000        	call	_GPIO_WriteLow
 784  00c6 84            	pop	a
 785  00c7               L303:
 786                     ; 328 	if(toggleLED)
 788  00c7 3d01          	tnz	L5_toggleLED
 789  00c9 271b          	jreq	L503
 790                     ; 331 		if((ledCounter % 100) == 0)
 792  00cb b600          	ld	a,L552_ledCounter
 793  00cd 5f            	clrw	x
 794  00ce 97            	ld	xl,a
 795  00cf a664          	ld	a,#100
 796  00d1 cd0000        	call	c_smodx
 798  00d4 a30000        	cpw	x,#0
 799  00d7 2609          	jrne	L703
 800                     ; 333 			GPIO_WriteReverse(SOAP_LED_PORT,SOAP_LED);
 802  00d9 4b10          	push	#16
 803  00db ae5019        	ldw	x,#20505
 804  00de cd0000        	call	_GPIO_WriteReverse
 806  00e1 84            	pop	a
 807  00e2               L703:
 808                     ; 335 		ledCounter++;
 810  00e2 3c00          	inc	L552_ledCounter
 812  00e4 2009          	jra	L113
 813  00e6               L503:
 814                     ; 339 		GPIO_WriteLow(SOAP_LED_PORT,SOAP_LED);
 816  00e6 4b10          	push	#16
 817  00e8 ae5019        	ldw	x,#20505
 818  00eb cd0000        	call	_GPIO_WriteLow
 820  00ee 84            	pop	a
 821  00ef               L113:
 822                     ; 341 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 824  00ef a601          	ld	a,#1
 825  00f1 cd0000        	call	_TIM2_ClearITPendingBit
 827                     ; 342  }
 830  00f4 85            	popw	x
 831  00f5 bf00          	ldw	c_y,x
 832  00f7 320002        	pop	c_y+2
 833  00fa 85            	popw	x
 834  00fb bf00          	ldw	c_x,x
 835  00fd 320002        	pop	c_x+2
 836  0100 80            	iret
 859                     ; 349  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 859                     ; 350  {
 860                     	switch	.text
 861  0101               f_TIM2_CAP_COM_IRQHandler:
 865                     ; 354  }
 868  0101 80            	iret
 891                     ; 364  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 891                     ; 365  {
 892                     	switch	.text
 893  0102               f_TIM3_UPD_OVF_BRK_IRQHandler:
 897                     ; 369  }
 900  0102 80            	iret
 923                     ; 376  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 923                     ; 377  {
 924                     	switch	.text
 925  0103               f_TIM3_CAP_COM_IRQHandler:
 929                     ; 381  }
 932  0103 80            	iret
 954                     ; 442 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 954                     ; 443 {
 955                     	switch	.text
 956  0104               f_I2C_IRQHandler:
 960                     ; 447 }
 963  0104 80            	iret
 986                     ; 455  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 986                     ; 456  {
 987                     	switch	.text
 988  0105               f_UART2_TX_IRQHandler:
 992                     ; 460  }
 995  0105 80            	iret
1018                     ; 467  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
1018                     ; 468  {
1019                     	switch	.text
1020  0106               f_UART2_RX_IRQHandler:
1024                     ; 472  }
1027  0106 80            	iret
1049                     ; 521  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
1049                     ; 522  {
1050                     	switch	.text
1051  0107               f_ADC1_IRQHandler:
1055                     ; 526  }
1058  0107 80            	iret
1081                     ; 547  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
1081                     ; 548  {
1082                     	switch	.text
1083  0108               f_TIM4_UPD_OVF_IRQHandler:
1087                     ; 552  }
1090  0108 80            	iret
1113                     ; 560 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1113                     ; 561 {
1114                     	switch	.text
1115  0109               f_EEPROM_EEC_IRQHandler:
1119                     ; 565 }
1122  0109 80            	iret
1154                     	switch	.ubsct
1155  0001               L5_toggleLED:
1156  0001 00            	ds.b	1
1157  0002               L3_currentTick:
1158  0002 00000000      	ds.b	4
1159                     	xdef	f_EEPROM_EEC_IRQHandler
1160                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1161                     	xdef	f_ADC1_IRQHandler
1162                     	xdef	f_UART2_TX_IRQHandler
1163                     	xdef	f_UART2_RX_IRQHandler
1164                     	xdef	f_I2C_IRQHandler
1165                     	xdef	f_TIM3_CAP_COM_IRQHandler
1166                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1167                     	xdef	f_TIM2_CAP_COM_IRQHandler
1168                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1169                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1170                     	xdef	f_TIM1_CAP_COM_IRQHandler
1171                     	xdef	f_SPI_IRQHandler
1172                     	xdef	f_EXTI_PORTE_IRQHandler
1173                     	xdef	f_EXTI_PORTD_IRQHandler
1174                     	xdef	f_EXTI_PORTC_IRQHandler
1175                     	xdef	f_EXTI_PORTB_IRQHandler
1176                     	xdef	f_EXTI_PORTA_IRQHandler
1177                     	xdef	f_CLK_IRQHandler
1178                     	xdef	f_AWU_IRQHandler
1179                     	xdef	f_TLI_IRQHandler
1180                     	xdef	f_TRAP_IRQHandler
1181                     	xdef	f_NonHandledInterrupt
1182                     	xdef	_StopTogglingLED
1183                     	xdef	_StartTogglingLED
1184                     	xdef	_DelayMs
1185                     	xdef	_GetTick
1186                     	xref	_TIM2_ClearITPendingBit
1187                     	xref	_TIM1_ClearITPendingBit
1188                     	xref	_GPIO_ReadInputPin
1189                     	xref	_GPIO_WriteReverse
1190                     	xref	_GPIO_WriteLow
1191                     	xref	_GPIO_WriteHigh
1192                     	xref.b	c_x
1193                     	xref.b	c_y
1213                     	xref	c_smodx
1214                     	xref	c_lgadc
1215                     	xref	c_lcmp
1216                     	xref	c_lsub
1217                     	xref	c_ltor
1218                     	end
