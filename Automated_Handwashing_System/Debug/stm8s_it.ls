   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  43                     ; 52 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  43                     ; 53 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 57 }
  52  0000 80            	iret
  74                     ; 65 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  74                     ; 66 {
  75                     	switch	.text
  76  0001               f_TRAP_IRQHandler:
  80                     ; 70 }
  83  0001 80            	iret
 105                     ; 77 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 105                     ; 78 
 105                     ; 79 {
 106                     	switch	.text
 107  0002               f_TLI_IRQHandler:
 111                     ; 83 }
 114  0002 80            	iret
 136                     ; 90 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 136                     ; 91 {
 137                     	switch	.text
 138  0003               f_AWU_IRQHandler:
 142                     ; 95 }
 145  0003 80            	iret
 167                     ; 102 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 167                     ; 103 {
 168                     	switch	.text
 169  0004               f_CLK_IRQHandler:
 173                     ; 107 }
 176  0004 80            	iret
 199                     ; 114 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 199                     ; 115 {
 200                     	switch	.text
 201  0005               f_EXTI_PORTA_IRQHandler:
 205                     ; 119 }
 208  0005 80            	iret
 231                     ; 126 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 231                     ; 127 {
 232                     	switch	.text
 233  0006               f_EXTI_PORTB_IRQHandler:
 237                     ; 131 }
 240  0006 80            	iret
 263                     ; 138 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 263                     ; 139 {
 264                     	switch	.text
 265  0007               f_EXTI_PORTC_IRQHandler:
 269                     ; 143 }
 272  0007 80            	iret
 295                     ; 150 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 295                     ; 151 {
 296                     	switch	.text
 297  0008               f_EXTI_PORTD_IRQHandler:
 301                     ; 155 }
 304  0008 80            	iret
 327                     ; 162 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 327                     ; 163 {
 328                     	switch	.text
 329  0009               f_EXTI_PORTE_IRQHandler:
 333                     ; 167 }
 336  0009 80            	iret
 358                     ; 214 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 358                     ; 215 {
 359                     	switch	.text
 360  000a               f_SPI_IRQHandler:
 364                     ; 219 }
 367  000a 80            	iret
 390                     ; 226 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 390                     ; 227 {
 391                     	switch	.text
 392  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 396                     ; 231 }
 399  000b 80            	iret
 422                     ; 238 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 422                     ; 239 {
 423                     	switch	.text
 424  000c               f_TIM1_CAP_COM_IRQHandler:
 428                     ; 243 }
 431  000c 80            	iret
 454                     ; 276  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 454                     ; 277  {
 455                     	switch	.text
 456  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 460                     ; 281  }
 463  000d 80            	iret
 486                     ; 288  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 486                     ; 289  {
 487                     	switch	.text
 488  000e               f_TIM2_CAP_COM_IRQHandler:
 492                     ; 293  }
 495  000e 80            	iret
 518                     ; 303  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 518                     ; 304  {
 519                     	switch	.text
 520  000f               f_TIM3_UPD_OVF_BRK_IRQHandler:
 524                     ; 308  }
 527  000f 80            	iret
 550                     ; 315  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 550                     ; 316  {
 551                     	switch	.text
 552  0010               f_TIM3_CAP_COM_IRQHandler:
 556                     ; 320  }
 559  0010 80            	iret
 581                     ; 381 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 581                     ; 382 {
 582                     	switch	.text
 583  0011               f_I2C_IRQHandler:
 587                     ; 386 }
 590  0011 80            	iret
 613                     ; 394  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 613                     ; 395  {
 614                     	switch	.text
 615  0012               f_UART2_TX_IRQHandler:
 619                     ; 399  }
 622  0012 80            	iret
 645                     ; 406  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 645                     ; 407  {
 646                     	switch	.text
 647  0013               f_UART2_RX_IRQHandler:
 651                     ; 411  }
 654  0013 80            	iret
 676                     ; 460  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 676                     ; 461  {
 677                     	switch	.text
 678  0014               f_ADC1_IRQHandler:
 682                     ; 465  }
 685  0014 80            	iret
 708                     ; 486  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 708                     ; 487  {
 709                     	switch	.text
 710  0015               f_TIM4_UPD_OVF_IRQHandler:
 714                     ; 491  }
 717  0015 80            	iret
 740                     ; 499 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 740                     ; 500 {
 741                     	switch	.text
 742  0016               f_EEPROM_EEC_IRQHandler:
 746                     ; 504 }
 749  0016 80            	iret
 761                     	xdef	f_EEPROM_EEC_IRQHandler
 762                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 763                     	xdef	f_ADC1_IRQHandler
 764                     	xdef	f_UART2_TX_IRQHandler
 765                     	xdef	f_UART2_RX_IRQHandler
 766                     	xdef	f_I2C_IRQHandler
 767                     	xdef	f_TIM3_CAP_COM_IRQHandler
 768                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 769                     	xdef	f_TIM2_CAP_COM_IRQHandler
 770                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 771                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 772                     	xdef	f_TIM1_CAP_COM_IRQHandler
 773                     	xdef	f_SPI_IRQHandler
 774                     	xdef	f_EXTI_PORTE_IRQHandler
 775                     	xdef	f_EXTI_PORTD_IRQHandler
 776                     	xdef	f_EXTI_PORTC_IRQHandler
 777                     	xdef	f_EXTI_PORTB_IRQHandler
 778                     	xdef	f_EXTI_PORTA_IRQHandler
 779                     	xdef	f_CLK_IRQHandler
 780                     	xdef	f_AWU_IRQHandler
 781                     	xdef	f_TLI_IRQHandler
 782                     	xdef	f_TRAP_IRQHandler
 783                     	xdef	f_NonHandledInterrupt
 802                     	end
