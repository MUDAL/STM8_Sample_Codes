   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  14                     	bsct
  15  0000               L3_currTime:
  16  0000 00000000      	dc.l	0
  66                     ; 45 extern void TIM1_Delay(uint32_t delayMs)
  66                     ; 46 {
  68                     	switch	.text
  69  0000               _TIM1_Delay:
  71  0000 5204          	subw	sp,#4
  72       00000004      OFST:	set	4
  75                     ; 47 	uint32_t t = currTime;
  77  0002 be02          	ldw	x,L3_currTime+2
  78  0004 1f03          	ldw	(OFST-1,sp),x
  79  0006 be00          	ldw	x,L3_currTime
  80  0008 1f01          	ldw	(OFST-3,sp),x
  83  000a               L14:
  84                     ; 48   while((currTime - t) <= delayMs){}
  86  000a ae0000        	ldw	x,#L3_currTime
  87  000d cd0000        	call	c_ltor
  89  0010 96            	ldw	x,sp
  90  0011 1c0001        	addw	x,#OFST-3
  91  0014 cd0000        	call	c_lsub
  93  0017 96            	ldw	x,sp
  94  0018 1c0007        	addw	x,#OFST+3
  95  001b cd0000        	call	c_lcmp
  97  001e 23ea          	jrule	L14
  98                     ; 49 }
 101  0020 5b04          	addw	sp,#4
 102  0022 81            	ret
 126                     ; 59 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
 126                     ; 60 {
 128                     	switch	.text
 129  0023               f_NonHandledInterrupt:
 133                     ; 64 }
 136  0023 80            	iret
 158                     ; 72 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 158                     ; 73 {
 159                     	switch	.text
 160  0024               f_TRAP_IRQHandler:
 164                     ; 77 }
 167  0024 80            	iret
 189                     ; 84 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 189                     ; 85 
 189                     ; 86 {
 190                     	switch	.text
 191  0025               f_TLI_IRQHandler:
 195                     ; 90 }
 198  0025 80            	iret
 220                     ; 97 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 220                     ; 98 {
 221                     	switch	.text
 222  0026               f_AWU_IRQHandler:
 226                     ; 102 }
 229  0026 80            	iret
 251                     ; 109 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 251                     ; 110 {
 252                     	switch	.text
 253  0027               f_CLK_IRQHandler:
 257                     ; 114 }
 260  0027 80            	iret
 283                     ; 121 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 283                     ; 122 {
 284                     	switch	.text
 285  0028               f_EXTI_PORTA_IRQHandler:
 289                     ; 126 }
 292  0028 80            	iret
 315                     ; 133 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 315                     ; 134 {
 316                     	switch	.text
 317  0029               f_EXTI_PORTB_IRQHandler:
 321                     ; 138 }
 324  0029 80            	iret
 347                     ; 145 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 347                     ; 146 {
 348                     	switch	.text
 349  002a               f_EXTI_PORTC_IRQHandler:
 353                     ; 150 }
 356  002a 80            	iret
 379                     ; 157 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 379                     ; 158 {
 380                     	switch	.text
 381  002b               f_EXTI_PORTD_IRQHandler:
 385                     ; 162 }
 388  002b 80            	iret
 411                     ; 169 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 411                     ; 170 {
 412                     	switch	.text
 413  002c               f_EXTI_PORTE_IRQHandler:
 417                     ; 174 }
 420  002c 80            	iret
 442                     ; 221 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 442                     ; 222 {
 443                     	switch	.text
 444  002d               f_SPI_IRQHandler:
 448                     ; 226 }
 451  002d 80            	iret
 476                     ; 233 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 476                     ; 234 {
 477                     	switch	.text
 478  002e               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 480  002e 8a            	push	cc
 481  002f 84            	pop	a
 482  0030 a4bf          	and	a,#191
 483  0032 88            	push	a
 484  0033 86            	pop	cc
 485  0034 3b0002        	push	c_x+2
 486  0037 be00          	ldw	x,c_x
 487  0039 89            	pushw	x
 488  003a 3b0002        	push	c_y+2
 489  003d be00          	ldw	x,c_y
 490  003f 89            	pushw	x
 493                     ; 238 	currTime++;
 495  0040 ae0000        	ldw	x,#L3_currTime
 496  0043 a601          	ld	a,#1
 497  0045 cd0000        	call	c_lgadc
 499                     ; 239 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 501  0048 a601          	ld	a,#1
 502  004a cd0000        	call	_TIM1_ClearITPendingBit
 504                     ; 241 }
 507  004d 85            	popw	x
 508  004e bf00          	ldw	c_y,x
 509  0050 320002        	pop	c_y+2
 510  0053 85            	popw	x
 511  0054 bf00          	ldw	c_x,x
 512  0056 320002        	pop	c_x+2
 513  0059 80            	iret
 536                     ; 248 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 536                     ; 249 {
 537                     	switch	.text
 538  005a               f_TIM1_CAP_COM_IRQHandler:
 542                     ; 253 }
 545  005a 80            	iret
 568                     ; 286  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 568                     ; 287  {
 569                     	switch	.text
 570  005b               f_TIM2_UPD_OVF_BRK_IRQHandler:
 574                     ; 291  }
 577  005b 80            	iret
 600                     ; 298  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 600                     ; 299  {
 601                     	switch	.text
 602  005c               f_TIM2_CAP_COM_IRQHandler:
 606                     ; 303  }
 609  005c 80            	iret
 632                     ; 313  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 632                     ; 314  {
 633                     	switch	.text
 634  005d               f_TIM3_UPD_OVF_BRK_IRQHandler:
 638                     ; 318  }
 641  005d 80            	iret
 664                     ; 325  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 664                     ; 326  {
 665                     	switch	.text
 666  005e               f_TIM3_CAP_COM_IRQHandler:
 670                     ; 330  }
 673  005e 80            	iret
 695                     ; 391 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 695                     ; 392 {
 696                     	switch	.text
 697  005f               f_I2C_IRQHandler:
 701                     ; 396 }
 704  005f 80            	iret
 727                     ; 404  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 727                     ; 405  {
 728                     	switch	.text
 729  0060               f_UART2_TX_IRQHandler:
 733                     ; 409  }
 736  0060 80            	iret
 759                     ; 416  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 759                     ; 417  {
 760                     	switch	.text
 761  0061               f_UART2_RX_IRQHandler:
 765                     ; 421  }
 768  0061 80            	iret
 790                     ; 470  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 790                     ; 471  {
 791                     	switch	.text
 792  0062               f_ADC1_IRQHandler:
 796                     ; 475  }
 799  0062 80            	iret
 822                     ; 496  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 822                     ; 497  {
 823                     	switch	.text
 824  0063               f_TIM4_UPD_OVF_IRQHandler:
 828                     ; 501  }
 831  0063 80            	iret
 854                     ; 509 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 854                     ; 510 {
 855                     	switch	.text
 856  0064               f_EEPROM_EEC_IRQHandler:
 860                     ; 514 }
 863  0064 80            	iret
 886                     	xdef	_TIM1_Delay
 887                     	xdef	f_EEPROM_EEC_IRQHandler
 888                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 889                     	xdef	f_ADC1_IRQHandler
 890                     	xdef	f_UART2_TX_IRQHandler
 891                     	xdef	f_UART2_RX_IRQHandler
 892                     	xdef	f_I2C_IRQHandler
 893                     	xdef	f_TIM3_CAP_COM_IRQHandler
 894                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 895                     	xdef	f_TIM2_CAP_COM_IRQHandler
 896                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 897                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 898                     	xdef	f_TIM1_CAP_COM_IRQHandler
 899                     	xdef	f_SPI_IRQHandler
 900                     	xdef	f_EXTI_PORTE_IRQHandler
 901                     	xdef	f_EXTI_PORTD_IRQHandler
 902                     	xdef	f_EXTI_PORTC_IRQHandler
 903                     	xdef	f_EXTI_PORTB_IRQHandler
 904                     	xdef	f_EXTI_PORTA_IRQHandler
 905                     	xdef	f_CLK_IRQHandler
 906                     	xdef	f_AWU_IRQHandler
 907                     	xdef	f_TLI_IRQHandler
 908                     	xdef	f_TRAP_IRQHandler
 909                     	xdef	f_NonHandledInterrupt
 910                     	xref	_TIM1_ClearITPendingBit
 911                     	xref.b	c_x
 912                     	xref.b	c_y
 931                     	xref	c_lgadc
 932                     	xref	c_lcmp
 933                     	xref	c_lsub
 934                     	xref	c_ltor
 935                     	end
