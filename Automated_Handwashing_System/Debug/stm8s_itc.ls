   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 50 uint8_t ITC_GetCPUCC(void)
  41                     ; 51 {
  43                     	switch	.text
  44  0000               _ITC_GetCPUCC:
  48                     ; 53   _asm("push cc");
  51  0000 8a            push cc
  53                     ; 54   _asm("pop a");
  56  0001 84            pop a
  58                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  61  0002 81            	ret
  84                     ; 80 void ITC_DeInit(void)
  84                     ; 81 {
  85                     	switch	.text
  86  0003               _ITC_DeInit:
  90                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  92  0003 35ff7f70      	mov	32624,#255
  93                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  95  0007 35ff7f71      	mov	32625,#255
  96                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  98  000b 35ff7f72      	mov	32626,#255
  99                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 101  000f 35ff7f73      	mov	32627,#255
 102                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 104  0013 35ff7f74      	mov	32628,#255
 105                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 107  0017 35ff7f75      	mov	32629,#255
 108                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 110  001b 35ff7f76      	mov	32630,#255
 111                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 113  001f 35ff7f77      	mov	32631,#255
 114                     ; 90 }
 117  0023 81            	ret
 142                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 142                     ; 98 {
 143                     	switch	.text
 144  0024               _ITC_GetSoftIntStatus:
 148                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 150  0024 adda          	call	_ITC_GetCPUCC
 152  0026 a428          	and	a,#40
 155  0028 81            	ret
 404                     .const:	section	.text
 405  0000               L22:
 406  0000 004c          	dc.w	L14
 407  0002 004c          	dc.w	L14
 408  0004 004c          	dc.w	L14
 409  0006 004c          	dc.w	L14
 410  0008 0055          	dc.w	L34
 411  000a 0055          	dc.w	L34
 412  000c 0055          	dc.w	L34
 413  000e 0055          	dc.w	L34
 414  0010 0089          	dc.w	L302
 415  0012 0089          	dc.w	L302
 416  0014 005e          	dc.w	L54
 417  0016 005e          	dc.w	L54
 418  0018 0067          	dc.w	L74
 419  001a 0067          	dc.w	L74
 420  001c 0067          	dc.w	L74
 421  001e 0067          	dc.w	L74
 422  0020 0070          	dc.w	L15
 423  0022 0089          	dc.w	L302
 424  0024 0089          	dc.w	L302
 425  0026 0070          	dc.w	L15
 426  0028 0079          	dc.w	L35
 427  002a 0079          	dc.w	L35
 428  002c 0079          	dc.w	L35
 429  002e 0079          	dc.w	L35
 430  0030 0082          	dc.w	L55
 431                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 431                     ; 108 {
 432                     	switch	.text
 433  0029               _ITC_GetSoftwarePriority:
 435  0029 88            	push	a
 436  002a 89            	pushw	x
 437       00000002      OFST:	set	2
 440                     ; 109   uint8_t Value = 0;
 442  002b 0f02          	clr	(OFST+0,sp)
 444                     ; 110   uint8_t Mask = 0;
 446                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 448                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 450  002d a403          	and	a,#3
 451  002f 48            	sll	a
 452  0030 5f            	clrw	x
 453  0031 97            	ld	xl,a
 454  0032 a603          	ld	a,#3
 455  0034 5d            	tnzw	x
 456  0035 2704          	jreq	L41
 457  0037               L61:
 458  0037 48            	sll	a
 459  0038 5a            	decw	x
 460  0039 26fc          	jrne	L61
 461  003b               L41:
 462  003b 6b01          	ld	(OFST-1,sp),a
 464                     ; 118   switch (IrqNum)
 466  003d 7b03          	ld	a,(OFST+1,sp)
 468                     ; 198   default:
 468                     ; 199     break;
 469  003f a119          	cp	a,#25
 470  0041 2407          	jruge	L02
 471  0043 5f            	clrw	x
 472  0044 97            	ld	xl,a
 473  0045 58            	sllw	x
 474  0046 de0000        	ldw	x,(L22,x)
 475  0049 fc            	jp	(x)
 476  004a               L02:
 477  004a 203d          	jra	L302
 478  004c               L14:
 479                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 479                     ; 121   case ITC_IRQ_AWU:
 479                     ; 122   case ITC_IRQ_CLK:
 479                     ; 123   case ITC_IRQ_PORTA:
 479                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 481  004c c67f70        	ld	a,32624
 482  004f 1401          	and	a,(OFST-1,sp)
 483  0051 6b02          	ld	(OFST+0,sp),a
 485                     ; 125     break;
 487  0053 2034          	jra	L302
 488  0055               L34:
 489                     ; 127   case ITC_IRQ_PORTB:
 489                     ; 128   case ITC_IRQ_PORTC:
 489                     ; 129   case ITC_IRQ_PORTD:
 489                     ; 130   case ITC_IRQ_PORTE:
 489                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 491  0055 c67f71        	ld	a,32625
 492  0058 1401          	and	a,(OFST-1,sp)
 493  005a 6b02          	ld	(OFST+0,sp),a
 495                     ; 132     break;
 497  005c 202b          	jra	L302
 498  005e               L54:
 499                     ; 141   case ITC_IRQ_SPI:
 499                     ; 142   case ITC_IRQ_TIM1_OVF:
 499                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 501  005e c67f72        	ld	a,32626
 502  0061 1401          	and	a,(OFST-1,sp)
 503  0063 6b02          	ld	(OFST+0,sp),a
 505                     ; 144     break;
 507  0065 2022          	jra	L302
 508  0067               L74:
 509                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 509                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 509                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 509                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 509                     ; 150 #else
 509                     ; 151   case ITC_IRQ_TIM2_OVF:
 509                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 509                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 509                     ; 154   case ITC_IRQ_TIM3_OVF:
 509                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 511  0067 c67f73        	ld	a,32627
 512  006a 1401          	and	a,(OFST-1,sp)
 513  006c 6b02          	ld	(OFST+0,sp),a
 515                     ; 156     break;
 517  006e 2019          	jra	L302
 518  0070               L15:
 519                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 519                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 519                     ; 160     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 519                     ; 161   case ITC_IRQ_UART1_TX:
 519                     ; 162   case ITC_IRQ_UART1_RX:
 519                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 519                     ; 164 #if defined(STM8AF622x)
 519                     ; 165   case ITC_IRQ_UART4_TX:
 519                     ; 166   case ITC_IRQ_UART4_RX:
 519                     ; 167 #endif /*STM8AF622x */
 519                     ; 168   case ITC_IRQ_I2C:
 519                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 521  0070 c67f74        	ld	a,32628
 522  0073 1401          	and	a,(OFST-1,sp)
 523  0075 6b02          	ld	(OFST+0,sp),a
 525                     ; 170     break;
 527  0077 2010          	jra	L302
 528  0079               L35:
 529                     ; 173   case ITC_IRQ_UART2_TX:
 529                     ; 174   case ITC_IRQ_UART2_RX:
 529                     ; 175 #endif /*STM8S105 or STM8AF626x*/
 529                     ; 176 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 529                     ; 177     defined(STM8AF62Ax)
 529                     ; 178   case ITC_IRQ_UART3_TX:
 529                     ; 179   case ITC_IRQ_UART3_RX:
 529                     ; 180   case ITC_IRQ_ADC2:
 529                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 529                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 529                     ; 183     defined(STM8S001) || defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 529                     ; 184   case ITC_IRQ_ADC1:
 529                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 529                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 529                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 529                     ; 188 #else
 529                     ; 189   case ITC_IRQ_TIM4_OVF:
 529                     ; 190 #endif /*STM8S903 or STM8AF622x */
 529                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 531  0079 c67f75        	ld	a,32629
 532  007c 1401          	and	a,(OFST-1,sp)
 533  007e 6b02          	ld	(OFST+0,sp),a
 535                     ; 192     break;
 537  0080 2007          	jra	L302
 538  0082               L55:
 539                     ; 194   case ITC_IRQ_EEPROM_EEC:
 539                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 541  0082 c67f76        	ld	a,32630
 542  0085 1401          	and	a,(OFST-1,sp)
 543  0087 6b02          	ld	(OFST+0,sp),a
 545                     ; 196     break;
 547  0089               L75:
 548                     ; 198   default:
 548                     ; 199     break;
 550  0089               L302:
 551                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 553  0089 7b03          	ld	a,(OFST+1,sp)
 554  008b a403          	and	a,#3
 555  008d 48            	sll	a
 556  008e 5f            	clrw	x
 557  008f 97            	ld	xl,a
 558  0090 7b02          	ld	a,(OFST+0,sp)
 559  0092 5d            	tnzw	x
 560  0093 2704          	jreq	L42
 561  0095               L62:
 562  0095 44            	srl	a
 563  0096 5a            	decw	x
 564  0097 26fc          	jrne	L62
 565  0099               L42:
 566  0099 6b02          	ld	(OFST+0,sp),a
 568                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 570  009b 7b02          	ld	a,(OFST+0,sp)
 573  009d 5b03          	addw	sp,#3
 574  009f 81            	ret
 638                     	switch	.const
 639  0032               L44:
 640  0032 00d5          	dc.w	L502
 641  0034 00d5          	dc.w	L502
 642  0036 00d5          	dc.w	L502
 643  0038 00d5          	dc.w	L502
 644  003a 00e7          	dc.w	L702
 645  003c 00e7          	dc.w	L702
 646  003e 00e7          	dc.w	L702
 647  0040 00e7          	dc.w	L702
 648  0042 0151          	dc.w	L162
 649  0044 0151          	dc.w	L162
 650  0046 00f9          	dc.w	L112
 651  0048 00f9          	dc.w	L112
 652  004a 010b          	dc.w	L312
 653  004c 010b          	dc.w	L312
 654  004e 010b          	dc.w	L312
 655  0050 010b          	dc.w	L312
 656  0052 011d          	dc.w	L512
 657  0054 0151          	dc.w	L162
 658  0056 0151          	dc.w	L162
 659  0058 011d          	dc.w	L512
 660  005a 012f          	dc.w	L712
 661  005c 012f          	dc.w	L712
 662  005e 012f          	dc.w	L712
 663  0060 012f          	dc.w	L712
 664  0062 0141          	dc.w	L122
 665                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 665                     ; 221 {
 666                     	switch	.text
 667  00a0               _ITC_SetSoftwarePriority:
 669  00a0 89            	pushw	x
 670  00a1 89            	pushw	x
 671       00000002      OFST:	set	2
 674                     ; 222   uint8_t Mask = 0;
 676                     ; 223   uint8_t NewPriority = 0;
 678                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 680                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 682                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 684                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 686  00a2 9e            	ld	a,xh
 687  00a3 a403          	and	a,#3
 688  00a5 48            	sll	a
 689  00a6 5f            	clrw	x
 690  00a7 97            	ld	xl,a
 691  00a8 a603          	ld	a,#3
 692  00aa 5d            	tnzw	x
 693  00ab 2704          	jreq	L23
 694  00ad               L43:
 695  00ad 48            	sll	a
 696  00ae 5a            	decw	x
 697  00af 26fc          	jrne	L43
 698  00b1               L23:
 699  00b1 43            	cpl	a
 700  00b2 6b01          	ld	(OFST-1,sp),a
 702                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 704  00b4 7b03          	ld	a,(OFST+1,sp)
 705  00b6 a403          	and	a,#3
 706  00b8 48            	sll	a
 707  00b9 5f            	clrw	x
 708  00ba 97            	ld	xl,a
 709  00bb 7b04          	ld	a,(OFST+2,sp)
 710  00bd 5d            	tnzw	x
 711  00be 2704          	jreq	L63
 712  00c0               L04:
 713  00c0 48            	sll	a
 714  00c1 5a            	decw	x
 715  00c2 26fc          	jrne	L04
 716  00c4               L63:
 717  00c4 6b02          	ld	(OFST+0,sp),a
 719                     ; 239   switch (IrqNum)
 721  00c6 7b03          	ld	a,(OFST+1,sp)
 723                     ; 329   default:
 723                     ; 330     break;
 724  00c8 a119          	cp	a,#25
 725  00ca 2407          	jruge	L24
 726  00cc 5f            	clrw	x
 727  00cd 97            	ld	xl,a
 728  00ce 58            	sllw	x
 729  00cf de0032        	ldw	x,(L44,x)
 730  00d2 fc            	jp	(x)
 731  00d3               L24:
 732  00d3 207c          	jra	L162
 733  00d5               L502:
 734                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 734                     ; 242   case ITC_IRQ_AWU:
 734                     ; 243   case ITC_IRQ_CLK:
 734                     ; 244   case ITC_IRQ_PORTA:
 734                     ; 245     ITC->ISPR1 &= Mask;
 736  00d5 c67f70        	ld	a,32624
 737  00d8 1401          	and	a,(OFST-1,sp)
 738  00da c77f70        	ld	32624,a
 739                     ; 246     ITC->ISPR1 |= NewPriority;
 741  00dd c67f70        	ld	a,32624
 742  00e0 1a02          	or	a,(OFST+0,sp)
 743  00e2 c77f70        	ld	32624,a
 744                     ; 247     break;
 746  00e5 206a          	jra	L162
 747  00e7               L702:
 748                     ; 249   case ITC_IRQ_PORTB:
 748                     ; 250   case ITC_IRQ_PORTC:
 748                     ; 251   case ITC_IRQ_PORTD:
 748                     ; 252   case ITC_IRQ_PORTE:
 748                     ; 253     ITC->ISPR2 &= Mask;
 750  00e7 c67f71        	ld	a,32625
 751  00ea 1401          	and	a,(OFST-1,sp)
 752  00ec c77f71        	ld	32625,a
 753                     ; 254     ITC->ISPR2 |= NewPriority;
 755  00ef c67f71        	ld	a,32625
 756  00f2 1a02          	or	a,(OFST+0,sp)
 757  00f4 c77f71        	ld	32625,a
 758                     ; 255     break;
 760  00f7 2058          	jra	L162
 761  00f9               L112:
 762                     ; 264   case ITC_IRQ_SPI:
 762                     ; 265   case ITC_IRQ_TIM1_OVF:
 762                     ; 266     ITC->ISPR3 &= Mask;
 764  00f9 c67f72        	ld	a,32626
 765  00fc 1401          	and	a,(OFST-1,sp)
 766  00fe c77f72        	ld	32626,a
 767                     ; 267     ITC->ISPR3 |= NewPriority;
 769  0101 c67f72        	ld	a,32626
 770  0104 1a02          	or	a,(OFST+0,sp)
 771  0106 c77f72        	ld	32626,a
 772                     ; 268     break;
 774  0109 2046          	jra	L162
 775  010b               L312:
 776                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 776                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 776                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 776                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 776                     ; 274 #else
 776                     ; 275   case ITC_IRQ_TIM2_OVF:
 776                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 776                     ; 277 #endif /*STM8S903 or STM8AF622x */
 776                     ; 278   case ITC_IRQ_TIM3_OVF:
 776                     ; 279     ITC->ISPR4 &= Mask;
 778  010b c67f73        	ld	a,32627
 779  010e 1401          	and	a,(OFST-1,sp)
 780  0110 c77f73        	ld	32627,a
 781                     ; 280     ITC->ISPR4 |= NewPriority;
 783  0113 c67f73        	ld	a,32627
 784  0116 1a02          	or	a,(OFST+0,sp)
 785  0118 c77f73        	ld	32627,a
 786                     ; 281     break;
 788  011b 2034          	jra	L162
 789  011d               L512:
 790                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 790                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 790                     ; 285     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 790                     ; 286   case ITC_IRQ_UART1_TX:
 790                     ; 287   case ITC_IRQ_UART1_RX:
 790                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 790                     ; 289 #if defined(STM8AF622x)
 790                     ; 290   case ITC_IRQ_UART4_TX:
 790                     ; 291   case ITC_IRQ_UART4_RX:
 790                     ; 292 #endif /*STM8AF622x */
 790                     ; 293   case ITC_IRQ_I2C:
 790                     ; 294     ITC->ISPR5 &= Mask;
 792  011d c67f74        	ld	a,32628
 793  0120 1401          	and	a,(OFST-1,sp)
 794  0122 c77f74        	ld	32628,a
 795                     ; 295     ITC->ISPR5 |= NewPriority;
 797  0125 c67f74        	ld	a,32628
 798  0128 1a02          	or	a,(OFST+0,sp)
 799  012a c77f74        	ld	32628,a
 800                     ; 296     break;
 802  012d 2022          	jra	L162
 803  012f               L712:
 804                     ; 299   case ITC_IRQ_UART2_TX:
 804                     ; 300   case ITC_IRQ_UART2_RX:
 804                     ; 301 #endif /*STM8S105 or STM8AF626x */
 804                     ; 302     
 804                     ; 303 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 804                     ; 304     defined(STM8AF62Ax)
 804                     ; 305   case ITC_IRQ_UART3_TX:
 804                     ; 306   case ITC_IRQ_UART3_RX:
 804                     ; 307   case ITC_IRQ_ADC2:
 804                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 804                     ; 309     
 804                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 804                     ; 311     defined(STM8S001) || defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 804                     ; 312   case ITC_IRQ_ADC1:
 804                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 804                     ; 314     
 804                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 804                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 804                     ; 317 #else
 804                     ; 318   case ITC_IRQ_TIM4_OVF:
 804                     ; 319 #endif /* STM8S903 or STM8AF622x */
 804                     ; 320     ITC->ISPR6 &= Mask;
 806  012f c67f75        	ld	a,32629
 807  0132 1401          	and	a,(OFST-1,sp)
 808  0134 c77f75        	ld	32629,a
 809                     ; 321     ITC->ISPR6 |= NewPriority;
 811  0137 c67f75        	ld	a,32629
 812  013a 1a02          	or	a,(OFST+0,sp)
 813  013c c77f75        	ld	32629,a
 814                     ; 322     break;
 816  013f 2010          	jra	L162
 817  0141               L122:
 818                     ; 324   case ITC_IRQ_EEPROM_EEC:
 818                     ; 325     ITC->ISPR7 &= Mask;
 820  0141 c67f76        	ld	a,32630
 821  0144 1401          	and	a,(OFST-1,sp)
 822  0146 c77f76        	ld	32630,a
 823                     ; 326     ITC->ISPR7 |= NewPriority;
 825  0149 c67f76        	ld	a,32630
 826  014c 1a02          	or	a,(OFST+0,sp)
 827  014e c77f76        	ld	32630,a
 828                     ; 327     break;
 830  0151               L322:
 831                     ; 329   default:
 831                     ; 330     break;
 833  0151               L162:
 834                     ; 332 }
 837  0151 5b04          	addw	sp,#4
 838  0153 81            	ret
 851                     	xdef	_ITC_GetSoftwarePriority
 852                     	xdef	_ITC_SetSoftwarePriority
 853                     	xdef	_ITC_GetSoftIntStatus
 854                     	xdef	_ITC_DeInit
 855                     	xdef	_ITC_GetCPUCC
 874                     	end
