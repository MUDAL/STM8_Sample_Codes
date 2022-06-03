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
 125                     ; 51 uint32_t GetTick(void)
 125                     ; 52 {
 126                     	switch	.text
 127  0023               _GetTick:
 131                     ; 53 	return currentTick;
 133  0023 ae0000        	ldw	x,#L3_currentTick
 134  0026 cd0000        	call	c_ltor
 138  0029 81            	ret
 162                     ; 64 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 162                     ; 65 {
 164                     	switch	.text
 165  002a               f_NonHandledInterrupt:
 169                     ; 69 }
 172  002a 80            	iret
 194                     ; 77 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 194                     ; 78 {
 195                     	switch	.text
 196  002b               f_TRAP_IRQHandler:
 200                     ; 82 }
 203  002b 80            	iret
 225                     ; 89 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 225                     ; 90 
 225                     ; 91 {
 226                     	switch	.text
 227  002c               f_TLI_IRQHandler:
 231                     ; 95 }
 234  002c 80            	iret
 256                     ; 102 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 256                     ; 103 {
 257                     	switch	.text
 258  002d               f_AWU_IRQHandler:
 262                     ; 107 }
 265  002d 80            	iret
 287                     ; 114 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 287                     ; 115 {
 288                     	switch	.text
 289  002e               f_CLK_IRQHandler:
 293                     ; 119 }
 296  002e 80            	iret
 319                     ; 126 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 319                     ; 127 {
 320                     	switch	.text
 321  002f               f_EXTI_PORTA_IRQHandler:
 325                     ; 131 }
 328  002f 80            	iret
 351                     ; 138 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 351                     ; 139 {
 352                     	switch	.text
 353  0030               f_EXTI_PORTB_IRQHandler:
 357                     ; 143 }
 360  0030 80            	iret
 383                     ; 150 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 383                     ; 151 {
 384                     	switch	.text
 385  0031               f_EXTI_PORTC_IRQHandler:
 389                     ; 155 }
 392  0031 80            	iret
 415                     ; 162 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 415                     ; 163 {
 416                     	switch	.text
 417  0032               f_EXTI_PORTD_IRQHandler:
 421                     ; 167 }
 424  0032 80            	iret
 447                     ; 174 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 447                     ; 175 {
 448                     	switch	.text
 449  0033               f_EXTI_PORTE_IRQHandler:
 453                     ; 179 }
 456  0033 80            	iret
 478                     ; 226 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 478                     ; 227 {
 479                     	switch	.text
 480  0034               f_SPI_IRQHandler:
 484                     ; 231 }
 487  0034 80            	iret
 512                     ; 238 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 512                     ; 239 {
 513                     	switch	.text
 514  0035               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 516  0035 8a            	push	cc
 517  0036 84            	pop	a
 518  0037 a4bf          	and	a,#191
 519  0039 88            	push	a
 520  003a 86            	pop	cc
 521  003b 3b0002        	push	c_x+2
 522  003e be00          	ldw	x,c_x
 523  0040 89            	pushw	x
 524  0041 3b0002        	push	c_y+2
 525  0044 be00          	ldw	x,c_y
 526  0046 89            	pushw	x
 529                     ; 243 	currentTick++;
 531  0047 ae0000        	ldw	x,#L3_currentTick
 532  004a a601          	ld	a,#1
 533  004c cd0000        	call	c_lgadc
 535                     ; 244 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 537  004f a601          	ld	a,#1
 538  0051 cd0000        	call	_TIM1_ClearITPendingBit
 540                     ; 245 }
 543  0054 85            	popw	x
 544  0055 bf00          	ldw	c_y,x
 545  0057 320002        	pop	c_y+2
 546  005a 85            	popw	x
 547  005b bf00          	ldw	c_x,x
 548  005d 320002        	pop	c_x+2
 549  0060 80            	iret
 572                     ; 252 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 572                     ; 253 {
 573                     	switch	.text
 574  0061               f_TIM1_CAP_COM_IRQHandler:
 578                     ; 257 }
 581  0061 80            	iret
 604                     ; 290  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 604                     ; 291  {
 605                     	switch	.text
 606  0062               f_TIM2_UPD_OVF_BRK_IRQHandler:
 610                     ; 295  }
 613  0062 80            	iret
 636                     ; 302  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 636                     ; 303  {
 637                     	switch	.text
 638  0063               f_TIM2_CAP_COM_IRQHandler:
 642                     ; 307  }
 645  0063 80            	iret
 668                     ; 317  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 668                     ; 318  {
 669                     	switch	.text
 670  0064               f_TIM3_UPD_OVF_BRK_IRQHandler:
 674                     ; 322  }
 677  0064 80            	iret
 700                     ; 329  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 700                     ; 330  {
 701                     	switch	.text
 702  0065               f_TIM3_CAP_COM_IRQHandler:
 706                     ; 334  }
 709  0065 80            	iret
 731                     ; 395 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 731                     ; 396 {
 732                     	switch	.text
 733  0066               f_I2C_IRQHandler:
 737                     ; 400 }
 740  0066 80            	iret
 763                     ; 408  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 763                     ; 409  {
 764                     	switch	.text
 765  0067               f_UART2_TX_IRQHandler:
 769                     ; 413  }
 772  0067 80            	iret
 795                     ; 420  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 795                     ; 421  {
 796                     	switch	.text
 797  0068               f_UART2_RX_IRQHandler:
 801                     ; 425  }
 804  0068 80            	iret
 826                     ; 474  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 826                     ; 475  {
 827                     	switch	.text
 828  0069               f_ADC1_IRQHandler:
 832                     ; 479  }
 835  0069 80            	iret
 858                     ; 500  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 858                     ; 501  {
 859                     	switch	.text
 860  006a               f_TIM4_UPD_OVF_IRQHandler:
 864                     ; 505  }
 867  006a 80            	iret
 890                     ; 513 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 890                     ; 514 {
 891                     	switch	.text
 892  006b               f_EEPROM_EEC_IRQHandler:
 896                     ; 518 }
 899  006b 80            	iret
 922                     	xdef	_GetTick
 923                     	xdef	_DelayMs
 924                     	xdef	f_EEPROM_EEC_IRQHandler
 925                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 926                     	xdef	f_ADC1_IRQHandler
 927                     	xdef	f_UART2_TX_IRQHandler
 928                     	xdef	f_UART2_RX_IRQHandler
 929                     	xdef	f_I2C_IRQHandler
 930                     	xdef	f_TIM3_CAP_COM_IRQHandler
 931                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 932                     	xdef	f_TIM2_CAP_COM_IRQHandler
 933                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 934                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 935                     	xdef	f_TIM1_CAP_COM_IRQHandler
 936                     	xdef	f_SPI_IRQHandler
 937                     	xdef	f_EXTI_PORTE_IRQHandler
 938                     	xdef	f_EXTI_PORTD_IRQHandler
 939                     	xdef	f_EXTI_PORTC_IRQHandler
 940                     	xdef	f_EXTI_PORTB_IRQHandler
 941                     	xdef	f_EXTI_PORTA_IRQHandler
 942                     	xdef	f_CLK_IRQHandler
 943                     	xdef	f_AWU_IRQHandler
 944                     	xdef	f_TLI_IRQHandler
 945                     	xdef	f_TRAP_IRQHandler
 946                     	xdef	f_NonHandledInterrupt
 947                     	xref	_TIM1_ClearITPendingBit
 948                     	xref.b	c_x
 949                     	xref.b	c_y
 968                     	xref	c_lgadc
 969                     	xref	c_lcmp
 970                     	xref	c_lsub
 971                     	xref	c_ltor
 972                     	end
