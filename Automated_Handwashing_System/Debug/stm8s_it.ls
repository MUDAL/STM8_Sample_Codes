   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  42                     ; 52 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  42                     ; 53 {
  43                     	switch	.text
  44  0000               f_NonHandledInterrupt:
  48                     ; 57 }
  51  0000 80            	iret
  73                     ; 65 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  73                     ; 66 {
  74                     	switch	.text
  75  0001               f_TRAP_IRQHandler:
  79                     ; 70 }
  82  0001 80            	iret
 104                     ; 77 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 104                     ; 78 
 104                     ; 79 {
 105                     	switch	.text
 106  0002               f_TLI_IRQHandler:
 110                     ; 83 }
 113  0002 80            	iret
 135                     ; 90 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 135                     ; 91 {
 136                     	switch	.text
 137  0003               f_AWU_IRQHandler:
 141                     ; 95 }
 144  0003 80            	iret
 166                     ; 102 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 166                     ; 103 {
 167                     	switch	.text
 168  0004               f_CLK_IRQHandler:
 172                     ; 107 }
 175  0004 80            	iret
 198                     ; 114 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 198                     ; 115 {
 199                     	switch	.text
 200  0005               f_EXTI_PORTA_IRQHandler:
 204                     ; 119 }
 207  0005 80            	iret
 230                     ; 126 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 230                     ; 127 {
 231                     	switch	.text
 232  0006               f_EXTI_PORTB_IRQHandler:
 236                     ; 131 }
 239  0006 80            	iret
 262                     ; 138 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 262                     ; 139 {
 263                     	switch	.text
 264  0007               f_EXTI_PORTC_IRQHandler:
 268                     ; 143 }
 271  0007 80            	iret
 294                     ; 150 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 294                     ; 151 {
 295                     	switch	.text
 296  0008               f_EXTI_PORTD_IRQHandler:
 300                     ; 155 }
 303  0008 80            	iret
 326                     ; 162 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 326                     ; 163 {
 327                     	switch	.text
 328  0009               f_EXTI_PORTE_IRQHandler:
 332                     ; 167 }
 335  0009 80            	iret
 357                     ; 214 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 357                     ; 215 {
 358                     	switch	.text
 359  000a               f_SPI_IRQHandler:
 363                     ; 219 }
 366  000a 80            	iret
 389                     ; 226 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 389                     ; 227 {
 390                     	switch	.text
 391  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 395                     ; 231 }
 398  000b 80            	iret
 421                     ; 238 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 421                     ; 239 {
 422                     	switch	.text
 423  000c               f_TIM1_CAP_COM_IRQHandler:
 427                     ; 243 }
 430  000c 80            	iret
 453                     ; 276  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 453                     ; 277  {
 454                     	switch	.text
 455  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 459                     ; 281  }
 462  000d 80            	iret
 485                     ; 288  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 485                     ; 289  {
 486                     	switch	.text
 487  000e               f_TIM2_CAP_COM_IRQHandler:
 491                     ; 293  }
 494  000e 80            	iret
 517                     ; 303  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 517                     ; 304  {
 518                     	switch	.text
 519  000f               f_TIM3_UPD_OVF_BRK_IRQHandler:
 523                     ; 308  }
 526  000f 80            	iret
 549                     ; 315  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 549                     ; 316  {
 550                     	switch	.text
 551  0010               f_TIM3_CAP_COM_IRQHandler:
 555                     ; 320  }
 558  0010 80            	iret
 580                     ; 381 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 580                     ; 382 {
 581                     	switch	.text
 582  0011               f_I2C_IRQHandler:
 586                     ; 386 }
 589  0011 80            	iret
 612                     ; 394  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 612                     ; 395  {
 613                     	switch	.text
 614  0012               f_UART2_TX_IRQHandler:
 618                     ; 399  }
 621  0012 80            	iret
 644                     ; 406  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 644                     ; 407  {
 645                     	switch	.text
 646  0013               f_UART2_RX_IRQHandler:
 650                     ; 411  }
 653  0013 80            	iret
 675                     ; 460  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 675                     ; 461  {
 676                     	switch	.text
 677  0014               f_ADC1_IRQHandler:
 681                     ; 465  }
 684  0014 80            	iret
 707                     ; 486  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 707                     ; 487  {
 708                     	switch	.text
 709  0015               f_TIM4_UPD_OVF_IRQHandler:
 713                     ; 491  }
 716  0015 80            	iret
 739                     ; 499 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 739                     ; 500 {
 740                     	switch	.text
 741  0016               f_EEPROM_EEC_IRQHandler:
 745                     ; 504 }
 748  0016 80            	iret
 760                     	xdef	f_EEPROM_EEC_IRQHandler
 761                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 762                     	xdef	f_ADC1_IRQHandler
 763                     	xdef	f_UART2_TX_IRQHandler
 764                     	xdef	f_UART2_RX_IRQHandler
 765                     	xdef	f_I2C_IRQHandler
 766                     	xdef	f_TIM3_CAP_COM_IRQHandler
 767                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 768                     	xdef	f_TIM2_CAP_COM_IRQHandler
 769                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 770                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 771                     	xdef	f_TIM1_CAP_COM_IRQHandler
 772                     	xdef	f_SPI_IRQHandler
 773                     	xdef	f_EXTI_PORTE_IRQHandler
 774                     	xdef	f_EXTI_PORTD_IRQHandler
 775                     	xdef	f_EXTI_PORTC_IRQHandler
 776                     	xdef	f_EXTI_PORTB_IRQHandler
 777                     	xdef	f_EXTI_PORTA_IRQHandler
 778                     	xdef	f_CLK_IRQHandler
 779                     	xdef	f_AWU_IRQHandler
 780                     	xdef	f_TLI_IRQHandler
 781                     	xdef	f_TRAP_IRQHandler
 782                     	xdef	f_NonHandledInterrupt
 801                     	end
