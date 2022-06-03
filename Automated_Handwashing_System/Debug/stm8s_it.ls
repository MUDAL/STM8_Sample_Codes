   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  13                     	bsct
  14  0000               L3_currentTick:
  15  0000 00000000      	dc.l	0
  65                     ; 45 void DelayMs(uint32_t delay)
  65                     ; 46 {
  67                     	switch	.text
  68  0000               _DelayMs:
  70  0000 5204          	subw	sp,#4
  71       00000004      OFST:	set	4
  74                     ; 47 	uint32_t startTick = currentTick;
  76  0002 be02          	ldw	x,L3_currentTick+2
  77  0004 1f03          	ldw	(OFST-1,sp),x
  78  0006 be00          	ldw	x,L3_currentTick
  79  0008 1f01          	ldw	(OFST-3,sp),x
  82  000a               L14:
  83                     ; 48 	while((currentTick - startTick) < delay){}
  85  000a ae0000        	ldw	x,#L3_currentTick
  86  000d cd0000        	call	c_ltor
  88  0010 96            	ldw	x,sp
  89  0011 1c0001        	addw	x,#OFST-3
  90  0014 cd0000        	call	c_lsub
  92  0017 96            	ldw	x,sp
  93  0018 1c0007        	addw	x,#OFST+3
  94  001b cd0000        	call	c_lcmp
  96  001e 25ea          	jrult	L14
  97                     ; 49 }
 100  0020 5b04          	addw	sp,#4
 101  0022 81            	ret
 125                     ; 59 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 125                     ; 60 {
 127                     	switch	.text
 128  0023               f_NonHandledInterrupt:
 132                     ; 64 }
 135  0023 80            	iret
 157                     ; 72 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 157                     ; 73 {
 158                     	switch	.text
 159  0024               f_TRAP_IRQHandler:
 163                     ; 77 }
 166  0024 80            	iret
 188                     ; 84 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 188                     ; 85 
 188                     ; 86 {
 189                     	switch	.text
 190  0025               f_TLI_IRQHandler:
 194                     ; 90 }
 197  0025 80            	iret
 219                     ; 97 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 219                     ; 98 {
 220                     	switch	.text
 221  0026               f_AWU_IRQHandler:
 225                     ; 102 }
 228  0026 80            	iret
 250                     ; 109 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 250                     ; 110 {
 251                     	switch	.text
 252  0027               f_CLK_IRQHandler:
 256                     ; 114 }
 259  0027 80            	iret
 282                     ; 121 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 282                     ; 122 {
 283                     	switch	.text
 284  0028               f_EXTI_PORTA_IRQHandler:
 288                     ; 126 }
 291  0028 80            	iret
 314                     ; 133 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 314                     ; 134 {
 315                     	switch	.text
 316  0029               f_EXTI_PORTB_IRQHandler:
 320                     ; 138 }
 323  0029 80            	iret
 346                     ; 145 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 346                     ; 146 {
 347                     	switch	.text
 348  002a               f_EXTI_PORTC_IRQHandler:
 352                     ; 150 }
 355  002a 80            	iret
 378                     ; 157 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 378                     ; 158 {
 379                     	switch	.text
 380  002b               f_EXTI_PORTD_IRQHandler:
 384                     ; 162 }
 387  002b 80            	iret
 410                     ; 169 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 410                     ; 170 {
 411                     	switch	.text
 412  002c               f_EXTI_PORTE_IRQHandler:
 416                     ; 174 }
 419  002c 80            	iret
 441                     ; 221 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 441                     ; 222 {
 442                     	switch	.text
 443  002d               f_SPI_IRQHandler:
 447                     ; 226 }
 450  002d 80            	iret
 475                     ; 233 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 475                     ; 234 {
 476                     	switch	.text
 477  002e               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 479  002e 8a            	push	cc
 480  002f 84            	pop	a
 481  0030 a4bf          	and	a,#191
 482  0032 88            	push	a
 483  0033 86            	pop	cc
 484  0034 3b0002        	push	c_x+2
 485  0037 be00          	ldw	x,c_x
 486  0039 89            	pushw	x
 487  003a 3b0002        	push	c_y+2
 488  003d be00          	ldw	x,c_y
 489  003f 89            	pushw	x
 492                     ; 238 	currentTick++;
 494  0040 ae0000        	ldw	x,#L3_currentTick
 495  0043 a601          	ld	a,#1
 496  0045 cd0000        	call	c_lgadc
 498                     ; 239 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 500  0048 a601          	ld	a,#1
 501  004a cd0000        	call	_TIM1_ClearITPendingBit
 503                     ; 240 }
 506  004d 85            	popw	x
 507  004e bf00          	ldw	c_y,x
 508  0050 320002        	pop	c_y+2
 509  0053 85            	popw	x
 510  0054 bf00          	ldw	c_x,x
 511  0056 320002        	pop	c_x+2
 512  0059 80            	iret
 535                     ; 247 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 535                     ; 248 {
 536                     	switch	.text
 537  005a               f_TIM1_CAP_COM_IRQHandler:
 541                     ; 252 }
 544  005a 80            	iret
 567                     ; 285  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 567                     ; 286  {
 568                     	switch	.text
 569  005b               f_TIM2_UPD_OVF_BRK_IRQHandler:
 573                     ; 290  }
 576  005b 80            	iret
 599                     ; 297  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 599                     ; 298  {
 600                     	switch	.text
 601  005c               f_TIM2_CAP_COM_IRQHandler:
 605                     ; 302  }
 608  005c 80            	iret
 631                     ; 312  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 631                     ; 313  {
 632                     	switch	.text
 633  005d               f_TIM3_UPD_OVF_BRK_IRQHandler:
 637                     ; 317  }
 640  005d 80            	iret
 663                     ; 324  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 663                     ; 325  {
 664                     	switch	.text
 665  005e               f_TIM3_CAP_COM_IRQHandler:
 669                     ; 329  }
 672  005e 80            	iret
 694                     ; 390 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 694                     ; 391 {
 695                     	switch	.text
 696  005f               f_I2C_IRQHandler:
 700                     ; 395 }
 703  005f 80            	iret
 726                     ; 403  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 726                     ; 404  {
 727                     	switch	.text
 728  0060               f_UART2_TX_IRQHandler:
 732                     ; 408  }
 735  0060 80            	iret
 758                     ; 415  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 758                     ; 416  {
 759                     	switch	.text
 760  0061               f_UART2_RX_IRQHandler:
 764                     ; 420  }
 767  0061 80            	iret
 789                     ; 469  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 789                     ; 470  {
 790                     	switch	.text
 791  0062               f_ADC1_IRQHandler:
 795                     ; 474  }
 798  0062 80            	iret
 821                     ; 495  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 821                     ; 496  {
 822                     	switch	.text
 823  0063               f_TIM4_UPD_OVF_IRQHandler:
 827                     ; 500  }
 830  0063 80            	iret
 853                     ; 508 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 853                     ; 509 {
 854                     	switch	.text
 855  0064               f_EEPROM_EEC_IRQHandler:
 859                     ; 513 }
 862  0064 80            	iret
 885                     	xdef	_DelayMs
 886                     	xdef	f_EEPROM_EEC_IRQHandler
 887                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 888                     	xdef	f_ADC1_IRQHandler
 889                     	xdef	f_UART2_TX_IRQHandler
 890                     	xdef	f_UART2_RX_IRQHandler
 891                     	xdef	f_I2C_IRQHandler
 892                     	xdef	f_TIM3_CAP_COM_IRQHandler
 893                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 894                     	xdef	f_TIM2_CAP_COM_IRQHandler
 895                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 896                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 897                     	xdef	f_TIM1_CAP_COM_IRQHandler
 898                     	xdef	f_SPI_IRQHandler
 899                     	xdef	f_EXTI_PORTE_IRQHandler
 900                     	xdef	f_EXTI_PORTD_IRQHandler
 901                     	xdef	f_EXTI_PORTC_IRQHandler
 902                     	xdef	f_EXTI_PORTB_IRQHandler
 903                     	xdef	f_EXTI_PORTA_IRQHandler
 904                     	xdef	f_CLK_IRQHandler
 905                     	xdef	f_AWU_IRQHandler
 906                     	xdef	f_TLI_IRQHandler
 907                     	xdef	f_TRAP_IRQHandler
 908                     	xdef	f_NonHandledInterrupt
 909                     	xref	_TIM1_ClearITPendingBit
 910                     	xref.b	c_x
 911                     	xref.b	c_y
 930                     	xref	c_lgadc
 931                     	xref	c_lcmp
 932                     	xref	c_lsub
 933                     	xref	c_ltor
 934                     	end
