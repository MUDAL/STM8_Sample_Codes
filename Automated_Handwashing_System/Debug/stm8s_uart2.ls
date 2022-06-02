   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 53 void UART2_DeInit(void)
  41                     ; 54 {
  43                     	switch	.text
  44  0000               _UART2_DeInit:
  48                     ; 57   (void) UART2->SR;
  50  0000 c65240        	ld	a,21056
  51                     ; 58   (void)UART2->DR;
  53  0003 c65241        	ld	a,21057
  54                     ; 60   UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  56  0006 725f5243      	clr	21059
  57                     ; 61   UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  59  000a 725f5242      	clr	21058
  60                     ; 63   UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  62  000e 725f5244      	clr	21060
  63                     ; 64   UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  65  0012 725f5245      	clr	21061
  66                     ; 65   UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  68  0016 725f5246      	clr	21062
  69                     ; 66   UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  71  001a 725f5247      	clr	21063
  72                     ; 67   UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  74  001e 725f5248      	clr	21064
  75                     ; 68   UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  77  0022 725f5249      	clr	21065
  78                     ; 69 }
  81  0026 81            	ret
 402                     .const:	section	.text
 403  0000               L01:
 404  0000 00000064      	dc.l	100
 405                     ; 85 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 405                     ; 86 {
 406                     	switch	.text
 407  0027               _UART2_Init:
 409  0027 520e          	subw	sp,#14
 410       0000000e      OFST:	set	14
 413                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 417                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 421                     ; 91   assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 423                     ; 92   assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 425                     ; 93   assert_param(IS_UART2_STOPBITS_OK(StopBits));
 427                     ; 94   assert_param(IS_UART2_PARITY_OK(Parity));
 429                     ; 95   assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 431                     ; 96   assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 433                     ; 99   UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 435  0029 72195244      	bres	21060,#4
 436                     ; 101   UART2->CR1 |= (uint8_t)WordLength; 
 438  002d c65244        	ld	a,21060
 439  0030 1a15          	or	a,(OFST+7,sp)
 440  0032 c75244        	ld	21060,a
 441                     ; 104   UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 443  0035 c65246        	ld	a,21062
 444  0038 a4cf          	and	a,#207
 445  003a c75246        	ld	21062,a
 446                     ; 106   UART2->CR3 |= (uint8_t)StopBits; 
 448  003d c65246        	ld	a,21062
 449  0040 1a16          	or	a,(OFST+8,sp)
 450  0042 c75246        	ld	21062,a
 451                     ; 109   UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 453  0045 c65244        	ld	a,21060
 454  0048 a4f9          	and	a,#249
 455  004a c75244        	ld	21060,a
 456                     ; 111   UART2->CR1 |= (uint8_t)Parity;
 458  004d c65244        	ld	a,21060
 459  0050 1a17          	or	a,(OFST+9,sp)
 460  0052 c75244        	ld	21060,a
 461                     ; 114   UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 463  0055 725f5242      	clr	21058
 464                     ; 116   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 466  0059 c65243        	ld	a,21059
 467  005c a40f          	and	a,#15
 468  005e c75243        	ld	21059,a
 469                     ; 118   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 471  0061 c65243        	ld	a,21059
 472  0064 a4f0          	and	a,#240
 473  0066 c75243        	ld	21059,a
 474                     ; 121   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 476  0069 96            	ldw	x,sp
 477  006a 1c0011        	addw	x,#OFST+3
 478  006d cd0000        	call	c_ltor
 480  0070 a604          	ld	a,#4
 481  0072 cd0000        	call	c_llsh
 483  0075 96            	ldw	x,sp
 484  0076 1c0001        	addw	x,#OFST-13
 485  0079 cd0000        	call	c_rtol
 488  007c cd0000        	call	_CLK_GetClockFreq
 490  007f 96            	ldw	x,sp
 491  0080 1c0001        	addw	x,#OFST-13
 492  0083 cd0000        	call	c_ludv
 494  0086 96            	ldw	x,sp
 495  0087 1c000b        	addw	x,#OFST-3
 496  008a cd0000        	call	c_rtol
 499                     ; 122   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 501  008d 96            	ldw	x,sp
 502  008e 1c0011        	addw	x,#OFST+3
 503  0091 cd0000        	call	c_ltor
 505  0094 a604          	ld	a,#4
 506  0096 cd0000        	call	c_llsh
 508  0099 96            	ldw	x,sp
 509  009a 1c0001        	addw	x,#OFST-13
 510  009d cd0000        	call	c_rtol
 513  00a0 cd0000        	call	_CLK_GetClockFreq
 515  00a3 a664          	ld	a,#100
 516  00a5 cd0000        	call	c_smul
 518  00a8 96            	ldw	x,sp
 519  00a9 1c0001        	addw	x,#OFST-13
 520  00ac cd0000        	call	c_ludv
 522  00af 96            	ldw	x,sp
 523  00b0 1c0007        	addw	x,#OFST-7
 524  00b3 cd0000        	call	c_rtol
 527                     ; 126   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 527                     ; 127                                 << 4) / 100) & (uint8_t)0x0F); 
 529  00b6 96            	ldw	x,sp
 530  00b7 1c000b        	addw	x,#OFST-3
 531  00ba cd0000        	call	c_ltor
 533  00bd a664          	ld	a,#100
 534  00bf cd0000        	call	c_smul
 536  00c2 96            	ldw	x,sp
 537  00c3 1c0001        	addw	x,#OFST-13
 538  00c6 cd0000        	call	c_rtol
 541  00c9 96            	ldw	x,sp
 542  00ca 1c0007        	addw	x,#OFST-7
 543  00cd cd0000        	call	c_ltor
 545  00d0 96            	ldw	x,sp
 546  00d1 1c0001        	addw	x,#OFST-13
 547  00d4 cd0000        	call	c_lsub
 549  00d7 a604          	ld	a,#4
 550  00d9 cd0000        	call	c_llsh
 552  00dc ae0000        	ldw	x,#L01
 553  00df cd0000        	call	c_ludv
 555  00e2 b603          	ld	a,c_lreg+3
 556  00e4 a40f          	and	a,#15
 557  00e6 6b05          	ld	(OFST-9,sp),a
 559                     ; 128   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 561  00e8 1e0d          	ldw	x,(OFST-1,sp)
 562  00ea 54            	srlw	x
 563  00eb 54            	srlw	x
 564  00ec 54            	srlw	x
 565  00ed 54            	srlw	x
 566  00ee 01            	rrwa	x,a
 567  00ef a4f0          	and	a,#240
 568  00f1 5f            	clrw	x
 569  00f2 6b06          	ld	(OFST-8,sp),a
 571                     ; 130   UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 573  00f4 7b05          	ld	a,(OFST-9,sp)
 574  00f6 1a06          	or	a,(OFST-8,sp)
 575  00f8 c75243        	ld	21059,a
 576                     ; 132   UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 578  00fb 7b0e          	ld	a,(OFST+0,sp)
 579  00fd c75242        	ld	21058,a
 580                     ; 135   UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 582  0100 c65245        	ld	a,21061
 583  0103 a4f3          	and	a,#243
 584  0105 c75245        	ld	21061,a
 585                     ; 137   UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 587  0108 c65246        	ld	a,21062
 588  010b a4f8          	and	a,#248
 589  010d c75246        	ld	21062,a
 590                     ; 139   UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 590                     ; 140     UART2_CR3_CPHA | UART2_CR3_LBCL));
 592  0110 7b18          	ld	a,(OFST+10,sp)
 593  0112 a407          	and	a,#7
 594  0114 ca5246        	or	a,21062
 595  0117 c75246        	ld	21062,a
 596                     ; 142   if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 598  011a 7b19          	ld	a,(OFST+11,sp)
 599  011c a504          	bcp	a,#4
 600  011e 2706          	jreq	L302
 601                     ; 145     UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 603  0120 72165245      	bset	21061,#3
 605  0124 2004          	jra	L502
 606  0126               L302:
 607                     ; 150     UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 609  0126 72175245      	bres	21061,#3
 610  012a               L502:
 611                     ; 152   if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 613  012a 7b19          	ld	a,(OFST+11,sp)
 614  012c a508          	bcp	a,#8
 615  012e 2706          	jreq	L702
 616                     ; 155     UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 618  0130 72145245      	bset	21061,#2
 620  0134 2004          	jra	L112
 621  0136               L702:
 622                     ; 160     UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 624  0136 72155245      	bres	21061,#2
 625  013a               L112:
 626                     ; 164   if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 628  013a 7b18          	ld	a,(OFST+10,sp)
 629  013c a580          	bcp	a,#128
 630  013e 2706          	jreq	L312
 631                     ; 167     UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 633  0140 72175246      	bres	21062,#3
 635  0144 200a          	jra	L512
 636  0146               L312:
 637                     ; 171     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 639  0146 7b18          	ld	a,(OFST+10,sp)
 640  0148 a408          	and	a,#8
 641  014a ca5246        	or	a,21062
 642  014d c75246        	ld	21062,a
 643  0150               L512:
 644                     ; 173 }
 647  0150 5b0e          	addw	sp,#14
 648  0152 81            	ret
 703                     ; 181 void UART2_Cmd(FunctionalState NewState)
 703                     ; 182 {
 704                     	switch	.text
 705  0153               _UART2_Cmd:
 709                     ; 183   if (NewState != DISABLE)
 711  0153 4d            	tnz	a
 712  0154 2706          	jreq	L542
 713                     ; 186     UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 715  0156 721b5244      	bres	21060,#5
 717  015a 2004          	jra	L742
 718  015c               L542:
 719                     ; 191     UART2->CR1 |= UART2_CR1_UARTD; 
 721  015c 721a5244      	bset	21060,#5
 722  0160               L742:
 723                     ; 193 }
 726  0160 81            	ret
 858                     ; 210 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 858                     ; 211 {
 859                     	switch	.text
 860  0161               _UART2_ITConfig:
 862  0161 89            	pushw	x
 863  0162 89            	pushw	x
 864       00000002      OFST:	set	2
 867                     ; 212   uint8_t uartreg = 0, itpos = 0x00;
 871                     ; 215   assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 873                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 875                     ; 219   uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
 877  0163 9e            	ld	a,xh
 878  0164 6b01          	ld	(OFST-1,sp),a
 880                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
 882  0166 9f            	ld	a,xl
 883  0167 a40f          	and	a,#15
 884  0169 5f            	clrw	x
 885  016a 97            	ld	xl,a
 886  016b a601          	ld	a,#1
 887  016d 5d            	tnzw	x
 888  016e 2704          	jreq	L61
 889  0170               L02:
 890  0170 48            	sll	a
 891  0171 5a            	decw	x
 892  0172 26fc          	jrne	L02
 893  0174               L61:
 894  0174 6b02          	ld	(OFST+0,sp),a
 896                     ; 224   if (NewState != DISABLE)
 898  0176 0d07          	tnz	(OFST+5,sp)
 899  0178 273a          	jreq	L133
 900                     ; 227     if (uartreg == 0x01)
 902  017a 7b01          	ld	a,(OFST-1,sp)
 903  017c a101          	cp	a,#1
 904  017e 260a          	jrne	L333
 905                     ; 229       UART2->CR1 |= itpos;
 907  0180 c65244        	ld	a,21060
 908  0183 1a02          	or	a,(OFST+0,sp)
 909  0185 c75244        	ld	21060,a
 911  0188 2066          	jra	L743
 912  018a               L333:
 913                     ; 231     else if (uartreg == 0x02)
 915  018a 7b01          	ld	a,(OFST-1,sp)
 916  018c a102          	cp	a,#2
 917  018e 260a          	jrne	L733
 918                     ; 233       UART2->CR2 |= itpos;
 920  0190 c65245        	ld	a,21061
 921  0193 1a02          	or	a,(OFST+0,sp)
 922  0195 c75245        	ld	21061,a
 924  0198 2056          	jra	L743
 925  019a               L733:
 926                     ; 235     else if (uartreg == 0x03)
 928  019a 7b01          	ld	a,(OFST-1,sp)
 929  019c a103          	cp	a,#3
 930  019e 260a          	jrne	L343
 931                     ; 237       UART2->CR4 |= itpos;
 933  01a0 c65247        	ld	a,21063
 934  01a3 1a02          	or	a,(OFST+0,sp)
 935  01a5 c75247        	ld	21063,a
 937  01a8 2046          	jra	L743
 938  01aa               L343:
 939                     ; 241       UART2->CR6 |= itpos;
 941  01aa c65249        	ld	a,21065
 942  01ad 1a02          	or	a,(OFST+0,sp)
 943  01af c75249        	ld	21065,a
 944  01b2 203c          	jra	L743
 945  01b4               L133:
 946                     ; 247     if (uartreg == 0x01)
 948  01b4 7b01          	ld	a,(OFST-1,sp)
 949  01b6 a101          	cp	a,#1
 950  01b8 260b          	jrne	L153
 951                     ; 249       UART2->CR1 &= (uint8_t)(~itpos);
 953  01ba 7b02          	ld	a,(OFST+0,sp)
 954  01bc 43            	cpl	a
 955  01bd c45244        	and	a,21060
 956  01c0 c75244        	ld	21060,a
 958  01c3 202b          	jra	L743
 959  01c5               L153:
 960                     ; 251     else if (uartreg == 0x02)
 962  01c5 7b01          	ld	a,(OFST-1,sp)
 963  01c7 a102          	cp	a,#2
 964  01c9 260b          	jrne	L553
 965                     ; 253       UART2->CR2 &= (uint8_t)(~itpos);
 967  01cb 7b02          	ld	a,(OFST+0,sp)
 968  01cd 43            	cpl	a
 969  01ce c45245        	and	a,21061
 970  01d1 c75245        	ld	21061,a
 972  01d4 201a          	jra	L743
 973  01d6               L553:
 974                     ; 255     else if (uartreg == 0x03)
 976  01d6 7b01          	ld	a,(OFST-1,sp)
 977  01d8 a103          	cp	a,#3
 978  01da 260b          	jrne	L163
 979                     ; 257       UART2->CR4 &= (uint8_t)(~itpos);
 981  01dc 7b02          	ld	a,(OFST+0,sp)
 982  01de 43            	cpl	a
 983  01df c45247        	and	a,21063
 984  01e2 c75247        	ld	21063,a
 986  01e5 2009          	jra	L743
 987  01e7               L163:
 988                     ; 261       UART2->CR6 &= (uint8_t)(~itpos);
 990  01e7 7b02          	ld	a,(OFST+0,sp)
 991  01e9 43            	cpl	a
 992  01ea c45249        	and	a,21065
 993  01ed c75249        	ld	21065,a
 994  01f0               L743:
 995                     ; 264 }
 998  01f0 5b04          	addw	sp,#4
 999  01f2 81            	ret
1056                     ; 272 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1056                     ; 273 {
1057                     	switch	.text
1058  01f3               _UART2_IrDAConfig:
1062                     ; 274   assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1064                     ; 276   if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1066  01f3 4d            	tnz	a
1067  01f4 2706          	jreq	L314
1068                     ; 278     UART2->CR5 |= UART2_CR5_IRLP;
1070  01f6 72145248      	bset	21064,#2
1072  01fa 2004          	jra	L514
1073  01fc               L314:
1074                     ; 282     UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1076  01fc 72155248      	bres	21064,#2
1077  0200               L514:
1078                     ; 284 }
1081  0200 81            	ret
1116                     ; 292 void UART2_IrDACmd(FunctionalState NewState)
1116                     ; 293 {
1117                     	switch	.text
1118  0201               _UART2_IrDACmd:
1122                     ; 295   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1124                     ; 297   if (NewState != DISABLE)
1126  0201 4d            	tnz	a
1127  0202 2706          	jreq	L534
1128                     ; 300     UART2->CR5 |= UART2_CR5_IREN;
1130  0204 72125248      	bset	21064,#1
1132  0208 2004          	jra	L734
1133  020a               L534:
1134                     ; 305     UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1136  020a 72135248      	bres	21064,#1
1137  020e               L734:
1138                     ; 307 }
1141  020e 81            	ret
1200                     ; 316 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1200                     ; 317 {
1201                     	switch	.text
1202  020f               _UART2_LINBreakDetectionConfig:
1206                     ; 319   assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1208                     ; 321   if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1210  020f 4d            	tnz	a
1211  0210 2706          	jreq	L764
1212                     ; 323     UART2->CR4 |= UART2_CR4_LBDL;
1214  0212 721a5247      	bset	21063,#5
1216  0216 2004          	jra	L174
1217  0218               L764:
1218                     ; 327     UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1220  0218 721b5247      	bres	21063,#5
1221  021c               L174:
1222                     ; 329 }
1225  021c 81            	ret
1346                     ; 341 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1346                     ; 342                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1346                     ; 343                      UART2_LinDivUp_TypeDef UART2_DivUp)
1346                     ; 344 {
1347                     	switch	.text
1348  021d               _UART2_LINConfig:
1350  021d 89            	pushw	x
1351       00000000      OFST:	set	0
1354                     ; 346   assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1356                     ; 347   assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1358                     ; 348   assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1360                     ; 350   if (UART2_Mode != UART2_LIN_MODE_MASTER)
1362  021e 9e            	ld	a,xh
1363  021f 4d            	tnz	a
1364  0220 2706          	jreq	L155
1365                     ; 352     UART2->CR6 |=  UART2_CR6_LSLV;
1367  0222 721a5249      	bset	21065,#5
1369  0226 2004          	jra	L355
1370  0228               L155:
1371                     ; 356     UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1373  0228 721b5249      	bres	21065,#5
1374  022c               L355:
1375                     ; 359   if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1377  022c 0d02          	tnz	(OFST+2,sp)
1378  022e 2706          	jreq	L555
1379                     ; 361     UART2->CR6 |=  UART2_CR6_LASE ;
1381  0230 72185249      	bset	21065,#4
1383  0234 2004          	jra	L755
1384  0236               L555:
1385                     ; 365     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1387  0236 72195249      	bres	21065,#4
1388  023a               L755:
1389                     ; 368   if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1391  023a 0d05          	tnz	(OFST+5,sp)
1392  023c 2706          	jreq	L165
1393                     ; 370     UART2->CR6 |=  UART2_CR6_LDUM;
1395  023e 721e5249      	bset	21065,#7
1397  0242 2004          	jra	L365
1398  0244               L165:
1399                     ; 374     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1401  0244 721f5249      	bres	21065,#7
1402  0248               L365:
1403                     ; 376 }
1406  0248 85            	popw	x
1407  0249 81            	ret
1442                     ; 384 void UART2_LINCmd(FunctionalState NewState)
1442                     ; 385 {
1443                     	switch	.text
1444  024a               _UART2_LINCmd:
1448                     ; 386   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1450                     ; 388   if (NewState != DISABLE)
1452  024a 4d            	tnz	a
1453  024b 2706          	jreq	L306
1454                     ; 391     UART2->CR3 |= UART2_CR3_LINEN;
1456  024d 721c5246      	bset	21062,#6
1458  0251 2004          	jra	L506
1459  0253               L306:
1460                     ; 396     UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1462  0253 721d5246      	bres	21062,#6
1463  0257               L506:
1464                     ; 398 }
1467  0257 81            	ret
1502                     ; 406 void UART2_SmartCardCmd(FunctionalState NewState)
1502                     ; 407 {
1503                     	switch	.text
1504  0258               _UART2_SmartCardCmd:
1508                     ; 409   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1510                     ; 411   if (NewState != DISABLE)
1512  0258 4d            	tnz	a
1513  0259 2706          	jreq	L526
1514                     ; 414     UART2->CR5 |= UART2_CR5_SCEN;
1516  025b 721a5248      	bset	21064,#5
1518  025f 2004          	jra	L726
1519  0261               L526:
1520                     ; 419     UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1522  0261 721b5248      	bres	21064,#5
1523  0265               L726:
1524                     ; 421 }
1527  0265 81            	ret
1563                     ; 429 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1563                     ; 430 {
1564                     	switch	.text
1565  0266               _UART2_SmartCardNACKCmd:
1569                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1571                     ; 434   if (NewState != DISABLE)
1573  0266 4d            	tnz	a
1574  0267 2706          	jreq	L746
1575                     ; 437     UART2->CR5 |= UART2_CR5_NACK;
1577  0269 72185248      	bset	21064,#4
1579  026d 2004          	jra	L156
1580  026f               L746:
1581                     ; 442     UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1583  026f 72195248      	bres	21064,#4
1584  0273               L156:
1585                     ; 444 }
1588  0273 81            	ret
1645                     ; 452 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1645                     ; 453 {
1646                     	switch	.text
1647  0274               _UART2_WakeUpConfig:
1651                     ; 454   assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1653                     ; 456   UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
1655  0274 72175244      	bres	21060,#3
1656                     ; 457   UART2->CR1 |= (uint8_t)UART2_WakeUp;
1658  0278 ca5244        	or	a,21060
1659  027b c75244        	ld	21060,a
1660                     ; 458 }
1663  027e 81            	ret
1699                     ; 466 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1699                     ; 467 {
1700                     	switch	.text
1701  027f               _UART2_ReceiverWakeUpCmd:
1705                     ; 468   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1707                     ; 470   if (NewState != DISABLE)
1709  027f 4d            	tnz	a
1710  0280 2706          	jreq	L717
1711                     ; 473     UART2->CR2 |= UART2_CR2_RWU;
1713  0282 72125245      	bset	21061,#1
1715  0286 2004          	jra	L127
1716  0288               L717:
1717                     ; 478     UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
1719  0288 72135245      	bres	21061,#1
1720  028c               L127:
1721                     ; 480 }
1724  028c 81            	ret
1747                     ; 487 uint8_t UART2_ReceiveData8(void)
1747                     ; 488 {
1748                     	switch	.text
1749  028d               _UART2_ReceiveData8:
1753                     ; 489   return ((uint8_t)UART2->DR);
1755  028d c65241        	ld	a,21057
1758  0290 81            	ret
1792                     ; 497 uint16_t UART2_ReceiveData9(void)
1792                     ; 498 {
1793                     	switch	.text
1794  0291               _UART2_ReceiveData9:
1796  0291 89            	pushw	x
1797       00000002      OFST:	set	2
1800                     ; 499   uint16_t temp = 0;
1802                     ; 501   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
1804  0292 c65244        	ld	a,21060
1805  0295 5f            	clrw	x
1806  0296 a480          	and	a,#128
1807  0298 5f            	clrw	x
1808  0299 02            	rlwa	x,a
1809  029a 58            	sllw	x
1810  029b 1f01          	ldw	(OFST-1,sp),x
1812                     ; 503   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
1814  029d c65241        	ld	a,21057
1815  02a0 5f            	clrw	x
1816  02a1 97            	ld	xl,a
1817  02a2 01            	rrwa	x,a
1818  02a3 1a02          	or	a,(OFST+0,sp)
1819  02a5 01            	rrwa	x,a
1820  02a6 1a01          	or	a,(OFST-1,sp)
1821  02a8 01            	rrwa	x,a
1822  02a9 01            	rrwa	x,a
1823  02aa a4ff          	and	a,#255
1824  02ac 01            	rrwa	x,a
1825  02ad a401          	and	a,#1
1826  02af 01            	rrwa	x,a
1829  02b0 5b02          	addw	sp,#2
1830  02b2 81            	ret
1864                     ; 511 void UART2_SendData8(uint8_t Data)
1864                     ; 512 {
1865                     	switch	.text
1866  02b3               _UART2_SendData8:
1870                     ; 514   UART2->DR = Data;
1872  02b3 c75241        	ld	21057,a
1873                     ; 515 }
1876  02b6 81            	ret
1910                     ; 522 void UART2_SendData9(uint16_t Data)
1910                     ; 523 {
1911                     	switch	.text
1912  02b7               _UART2_SendData9:
1914  02b7 89            	pushw	x
1915       00000000      OFST:	set	0
1918                     ; 525   UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
1920  02b8 721d5244      	bres	21060,#6
1921                     ; 528   UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
1923  02bc 54            	srlw	x
1924  02bd 54            	srlw	x
1925  02be 9f            	ld	a,xl
1926  02bf a440          	and	a,#64
1927  02c1 ca5244        	or	a,21060
1928  02c4 c75244        	ld	21060,a
1929                     ; 531   UART2->DR   = (uint8_t)(Data);                    
1931  02c7 7b02          	ld	a,(OFST+2,sp)
1932  02c9 c75241        	ld	21057,a
1933                     ; 532 }
1936  02cc 85            	popw	x
1937  02cd 81            	ret
1960                     ; 539 void UART2_SendBreak(void)
1960                     ; 540 {
1961                     	switch	.text
1962  02ce               _UART2_SendBreak:
1966                     ; 541   UART2->CR2 |= UART2_CR2_SBK;
1968  02ce 72105245      	bset	21061,#0
1969                     ; 542 }
1972  02d2 81            	ret
2006                     ; 549 void UART2_SetAddress(uint8_t UART2_Address)
2006                     ; 550 {
2007                     	switch	.text
2008  02d3               _UART2_SetAddress:
2010  02d3 88            	push	a
2011       00000000      OFST:	set	0
2014                     ; 552   assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2016                     ; 555   UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
2018  02d4 c65247        	ld	a,21063
2019  02d7 a4f0          	and	a,#240
2020  02d9 c75247        	ld	21063,a
2021                     ; 557   UART2->CR4 |= UART2_Address;
2023  02dc c65247        	ld	a,21063
2024  02df 1a01          	or	a,(OFST+1,sp)
2025  02e1 c75247        	ld	21063,a
2026                     ; 558 }
2029  02e4 84            	pop	a
2030  02e5 81            	ret
2064                     ; 566 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2064                     ; 567 {
2065                     	switch	.text
2066  02e6               _UART2_SetGuardTime:
2070                     ; 569   UART2->GTR = UART2_GuardTime;
2072  02e6 c7524a        	ld	21066,a
2073                     ; 570 }
2076  02e9 81            	ret
2110                     ; 594 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2110                     ; 595 {
2111                     	switch	.text
2112  02ea               _UART2_SetPrescaler:
2116                     ; 597   UART2->PSCR = UART2_Prescaler;
2118  02ea c7524b        	ld	21067,a
2119                     ; 598 }
2122  02ed 81            	ret
2279                     ; 606 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2279                     ; 607 {
2280                     	switch	.text
2281  02ee               _UART2_GetFlagStatus:
2283  02ee 89            	pushw	x
2284  02ef 88            	push	a
2285       00000001      OFST:	set	1
2288                     ; 608   FlagStatus status = RESET;
2290                     ; 611   assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2292                     ; 614   if (UART2_FLAG == UART2_FLAG_LBDF)
2294  02f0 a30210        	cpw	x,#528
2295  02f3 2610          	jrne	L5511
2296                     ; 616     if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2298  02f5 9f            	ld	a,xl
2299  02f6 c45247        	and	a,21063
2300  02f9 2706          	jreq	L7511
2301                     ; 619       status = SET;
2303  02fb a601          	ld	a,#1
2304  02fd 6b01          	ld	(OFST+0,sp),a
2307  02ff 2039          	jra	L3611
2308  0301               L7511:
2309                     ; 624       status = RESET;
2311  0301 0f01          	clr	(OFST+0,sp)
2313  0303 2035          	jra	L3611
2314  0305               L5511:
2315                     ; 627   else if (UART2_FLAG == UART2_FLAG_SBK)
2317  0305 1e02          	ldw	x,(OFST+1,sp)
2318  0307 a30101        	cpw	x,#257
2319  030a 2611          	jrne	L5611
2320                     ; 629     if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2322  030c c65245        	ld	a,21061
2323  030f 1503          	bcp	a,(OFST+2,sp)
2324  0311 2706          	jreq	L7611
2325                     ; 632       status = SET;
2327  0313 a601          	ld	a,#1
2328  0315 6b01          	ld	(OFST+0,sp),a
2331  0317 2021          	jra	L3611
2332  0319               L7611:
2333                     ; 637       status = RESET;
2335  0319 0f01          	clr	(OFST+0,sp)
2337  031b 201d          	jra	L3611
2338  031d               L5611:
2339                     ; 640   else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2341  031d 1e02          	ldw	x,(OFST+1,sp)
2342  031f a30302        	cpw	x,#770
2343  0322 2707          	jreq	L7711
2345  0324 1e02          	ldw	x,(OFST+1,sp)
2346  0326 a30301        	cpw	x,#769
2347  0329 2614          	jrne	L5711
2348  032b               L7711:
2349                     ; 642     if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2351  032b c65249        	ld	a,21065
2352  032e 1503          	bcp	a,(OFST+2,sp)
2353  0330 2706          	jreq	L1021
2354                     ; 645       status = SET;
2356  0332 a601          	ld	a,#1
2357  0334 6b01          	ld	(OFST+0,sp),a
2360  0336 2002          	jra	L3611
2361  0338               L1021:
2362                     ; 650       status = RESET;
2364  0338 0f01          	clr	(OFST+0,sp)
2366  033a               L3611:
2367                     ; 668   return  status;
2369  033a 7b01          	ld	a,(OFST+0,sp)
2372  033c 5b03          	addw	sp,#3
2373  033e 81            	ret
2374  033f               L5711:
2375                     ; 655     if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2377  033f c65240        	ld	a,21056
2378  0342 1503          	bcp	a,(OFST+2,sp)
2379  0344 2706          	jreq	L7021
2380                     ; 658       status = SET;
2382  0346 a601          	ld	a,#1
2383  0348 6b01          	ld	(OFST+0,sp),a
2386  034a 20ee          	jra	L3611
2387  034c               L7021:
2388                     ; 663       status = RESET;
2390  034c 0f01          	clr	(OFST+0,sp)
2392  034e 20ea          	jra	L3611
2427                     ; 699 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2427                     ; 700 {
2428                     	switch	.text
2429  0350               _UART2_ClearFlag:
2431  0350 89            	pushw	x
2432       00000000      OFST:	set	0
2435                     ; 701   assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2437                     ; 704   if (UART2_FLAG == UART2_FLAG_RXNE)
2439  0351 a30020        	cpw	x,#32
2440  0354 2606          	jrne	L1321
2441                     ; 706     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2443  0356 35df5240      	mov	21056,#223
2445  035a 201e          	jra	L3321
2446  035c               L1321:
2447                     ; 709   else if (UART2_FLAG == UART2_FLAG_LBDF)
2449  035c 1e01          	ldw	x,(OFST+1,sp)
2450  035e a30210        	cpw	x,#528
2451  0361 2606          	jrne	L5321
2452                     ; 711     UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2454  0363 72195247      	bres	21063,#4
2456  0367 2011          	jra	L3321
2457  0369               L5321:
2458                     ; 714   else if (UART2_FLAG == UART2_FLAG_LHDF)
2460  0369 1e01          	ldw	x,(OFST+1,sp)
2461  036b a30302        	cpw	x,#770
2462  036e 2606          	jrne	L1421
2463                     ; 716     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2465  0370 72135249      	bres	21065,#1
2467  0374 2004          	jra	L3321
2468  0376               L1421:
2469                     ; 721     UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2471  0376 72115249      	bres	21065,#0
2472  037a               L3321:
2473                     ; 723 }
2476  037a 85            	popw	x
2477  037b 81            	ret
2559                     ; 738 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2559                     ; 739 {
2560                     	switch	.text
2561  037c               _UART2_GetITStatus:
2563  037c 89            	pushw	x
2564  037d 89            	pushw	x
2565       00000002      OFST:	set	2
2568                     ; 740   ITStatus pendingbitstatus = RESET;
2570                     ; 741   uint8_t itpos = 0;
2572                     ; 742   uint8_t itmask1 = 0;
2574                     ; 743   uint8_t itmask2 = 0;
2576                     ; 744   uint8_t enablestatus = 0;
2578                     ; 747   assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2580                     ; 750   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
2582  037e 9f            	ld	a,xl
2583  037f a40f          	and	a,#15
2584  0381 5f            	clrw	x
2585  0382 97            	ld	xl,a
2586  0383 a601          	ld	a,#1
2587  0385 5d            	tnzw	x
2588  0386 2704          	jreq	L27
2589  0388               L47:
2590  0388 48            	sll	a
2591  0389 5a            	decw	x
2592  038a 26fc          	jrne	L47
2593  038c               L27:
2594  038c 6b01          	ld	(OFST-1,sp),a
2596                     ; 752   itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
2598  038e 7b04          	ld	a,(OFST+2,sp)
2599  0390 4e            	swap	a
2600  0391 a40f          	and	a,#15
2601  0393 6b02          	ld	(OFST+0,sp),a
2603                     ; 754   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2605  0395 7b02          	ld	a,(OFST+0,sp)
2606  0397 5f            	clrw	x
2607  0398 97            	ld	xl,a
2608  0399 a601          	ld	a,#1
2609  039b 5d            	tnzw	x
2610  039c 2704          	jreq	L67
2611  039e               L001:
2612  039e 48            	sll	a
2613  039f 5a            	decw	x
2614  03a0 26fc          	jrne	L001
2615  03a2               L67:
2616  03a2 6b02          	ld	(OFST+0,sp),a
2618                     ; 757   if (UART2_IT == UART2_IT_PE)
2620  03a4 1e03          	ldw	x,(OFST+1,sp)
2621  03a6 a30100        	cpw	x,#256
2622  03a9 261c          	jrne	L7031
2623                     ; 760     enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
2625  03ab c65244        	ld	a,21060
2626  03ae 1402          	and	a,(OFST+0,sp)
2627  03b0 6b02          	ld	(OFST+0,sp),a
2629                     ; 763     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2631  03b2 c65240        	ld	a,21056
2632  03b5 1501          	bcp	a,(OFST-1,sp)
2633  03b7 270a          	jreq	L1131
2635  03b9 0d02          	tnz	(OFST+0,sp)
2636  03bb 2706          	jreq	L1131
2637                     ; 766       pendingbitstatus = SET;
2639  03bd a601          	ld	a,#1
2640  03bf 6b02          	ld	(OFST+0,sp),a
2643  03c1 2064          	jra	L5131
2644  03c3               L1131:
2645                     ; 771       pendingbitstatus = RESET;
2647  03c3 0f02          	clr	(OFST+0,sp)
2649  03c5 2060          	jra	L5131
2650  03c7               L7031:
2651                     ; 774   else if (UART2_IT == UART2_IT_LBDF)
2653  03c7 1e03          	ldw	x,(OFST+1,sp)
2654  03c9 a30346        	cpw	x,#838
2655  03cc 261c          	jrne	L7131
2656                     ; 777     enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
2658  03ce c65247        	ld	a,21063
2659  03d1 1402          	and	a,(OFST+0,sp)
2660  03d3 6b02          	ld	(OFST+0,sp),a
2662                     ; 779     if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2664  03d5 c65247        	ld	a,21063
2665  03d8 1501          	bcp	a,(OFST-1,sp)
2666  03da 270a          	jreq	L1231
2668  03dc 0d02          	tnz	(OFST+0,sp)
2669  03de 2706          	jreq	L1231
2670                     ; 782       pendingbitstatus = SET;
2672  03e0 a601          	ld	a,#1
2673  03e2 6b02          	ld	(OFST+0,sp),a
2676  03e4 2041          	jra	L5131
2677  03e6               L1231:
2678                     ; 787       pendingbitstatus = RESET;
2680  03e6 0f02          	clr	(OFST+0,sp)
2682  03e8 203d          	jra	L5131
2683  03ea               L7131:
2684                     ; 790   else if (UART2_IT == UART2_IT_LHDF)
2686  03ea 1e03          	ldw	x,(OFST+1,sp)
2687  03ec a30412        	cpw	x,#1042
2688  03ef 261c          	jrne	L7231
2689                     ; 793     enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
2691  03f1 c65249        	ld	a,21065
2692  03f4 1402          	and	a,(OFST+0,sp)
2693  03f6 6b02          	ld	(OFST+0,sp),a
2695                     ; 795     if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2697  03f8 c65249        	ld	a,21065
2698  03fb 1501          	bcp	a,(OFST-1,sp)
2699  03fd 270a          	jreq	L1331
2701  03ff 0d02          	tnz	(OFST+0,sp)
2702  0401 2706          	jreq	L1331
2703                     ; 798       pendingbitstatus = SET;
2705  0403 a601          	ld	a,#1
2706  0405 6b02          	ld	(OFST+0,sp),a
2709  0407 201e          	jra	L5131
2710  0409               L1331:
2711                     ; 803       pendingbitstatus = RESET;
2713  0409 0f02          	clr	(OFST+0,sp)
2715  040b 201a          	jra	L5131
2716  040d               L7231:
2717                     ; 809     enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
2719  040d c65245        	ld	a,21061
2720  0410 1402          	and	a,(OFST+0,sp)
2721  0412 6b02          	ld	(OFST+0,sp),a
2723                     ; 811     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2725  0414 c65240        	ld	a,21056
2726  0417 1501          	bcp	a,(OFST-1,sp)
2727  0419 270a          	jreq	L7331
2729  041b 0d02          	tnz	(OFST+0,sp)
2730  041d 2706          	jreq	L7331
2731                     ; 814       pendingbitstatus = SET;
2733  041f a601          	ld	a,#1
2734  0421 6b02          	ld	(OFST+0,sp),a
2737  0423 2002          	jra	L5131
2738  0425               L7331:
2739                     ; 819       pendingbitstatus = RESET;
2741  0425 0f02          	clr	(OFST+0,sp)
2743  0427               L5131:
2744                     ; 823   return  pendingbitstatus;
2746  0427 7b02          	ld	a,(OFST+0,sp)
2749  0429 5b04          	addw	sp,#4
2750  042b 81            	ret
2786                     ; 852 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
2786                     ; 853 {
2787                     	switch	.text
2788  042c               _UART2_ClearITPendingBit:
2790  042c 89            	pushw	x
2791       00000000      OFST:	set	0
2794                     ; 854   assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
2796                     ; 857   if (UART2_IT == UART2_IT_RXNE)
2798  042d a30255        	cpw	x,#597
2799  0430 2606          	jrne	L1631
2800                     ; 859     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2802  0432 35df5240      	mov	21056,#223
2804  0436 2011          	jra	L3631
2805  0438               L1631:
2806                     ; 862   else if (UART2_IT == UART2_IT_LBDF)
2808  0438 1e01          	ldw	x,(OFST+1,sp)
2809  043a a30346        	cpw	x,#838
2810  043d 2606          	jrne	L5631
2811                     ; 864     UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
2813  043f 72195247      	bres	21063,#4
2815  0443 2004          	jra	L3631
2816  0445               L5631:
2817                     ; 869     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2819  0445 72135249      	bres	21065,#1
2820  0449               L3631:
2821                     ; 871 }
2824  0449 85            	popw	x
2825  044a 81            	ret
2838                     	xdef	_UART2_ClearITPendingBit
2839                     	xdef	_UART2_GetITStatus
2840                     	xdef	_UART2_ClearFlag
2841                     	xdef	_UART2_GetFlagStatus
2842                     	xdef	_UART2_SetPrescaler
2843                     	xdef	_UART2_SetGuardTime
2844                     	xdef	_UART2_SetAddress
2845                     	xdef	_UART2_SendBreak
2846                     	xdef	_UART2_SendData9
2847                     	xdef	_UART2_SendData8
2848                     	xdef	_UART2_ReceiveData9
2849                     	xdef	_UART2_ReceiveData8
2850                     	xdef	_UART2_ReceiverWakeUpCmd
2851                     	xdef	_UART2_WakeUpConfig
2852                     	xdef	_UART2_SmartCardNACKCmd
2853                     	xdef	_UART2_SmartCardCmd
2854                     	xdef	_UART2_LINCmd
2855                     	xdef	_UART2_LINConfig
2856                     	xdef	_UART2_LINBreakDetectionConfig
2857                     	xdef	_UART2_IrDACmd
2858                     	xdef	_UART2_IrDAConfig
2859                     	xdef	_UART2_ITConfig
2860                     	xdef	_UART2_Cmd
2861                     	xdef	_UART2_Init
2862                     	xdef	_UART2_DeInit
2863                     	xref	_CLK_GetClockFreq
2864                     	xref.b	c_lreg
2865                     	xref.b	c_x
2884                     	xref	c_lsub
2885                     	xref	c_smul
2886                     	xref	c_ludv
2887                     	xref	c_rtol
2888                     	xref	c_llsh
2889                     	xref	c_ltor
2890                     	end
