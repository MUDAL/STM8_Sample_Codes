   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  13                     .const:	section	.text
  14  0000               _HSIDivFactor:
  15  0000 01            	dc.b	1
  16  0001 02            	dc.b	2
  17  0002 04            	dc.b	4
  18  0003 08            	dc.b	8
  19  0004               _CLKPrescTable:
  20  0004 01            	dc.b	1
  21  0005 02            	dc.b	2
  22  0006 04            	dc.b	4
  23  0007 08            	dc.b	8
  24  0008 0a            	dc.b	10
  25  0009 10            	dc.b	16
  26  000a 14            	dc.b	20
  27  000b 28            	dc.b	40
  56                     ; 72 void CLK_DeInit(void)
  56                     ; 73 {
  58                     	switch	.text
  59  0000               _CLK_DeInit:
  63                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  65  0000 350150c0      	mov	20672,#1
  66                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  68  0004 725f50c1      	clr	20673
  69                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  71  0008 35e150c4      	mov	20676,#225
  72                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  74  000c 725f50c5      	clr	20677
  75                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  77  0010 351850c6      	mov	20678,#24
  78                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  80  0014 35ff50c7      	mov	20679,#255
  81                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  83  0018 35ff50ca      	mov	20682,#255
  84                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  86  001c 725f50c8      	clr	20680
  87                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  89  0020 725f50c9      	clr	20681
  91  0024               L52:
  92                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  94  0024 c650c9        	ld	a,20681
  95  0027 a501          	bcp	a,#1
  96  0029 26f9          	jrne	L52
  97                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  99  002b 725f50c9      	clr	20681
 100                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 102  002f 725f50cc      	clr	20684
 103                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 105  0033 725f50cd      	clr	20685
 106                     ; 88 }
 109  0037 81            	ret
 165                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 165                     ; 100 {
 166                     	switch	.text
 167  0038               _CLK_FastHaltWakeUpCmd:
 171                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 173                     ; 104   if (NewState != DISABLE)
 175  0038 4d            	tnz	a
 176  0039 2706          	jreq	L75
 177                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 179  003b 721450c0      	bset	20672,#2
 181  003f 2004          	jra	L16
 182  0041               L75:
 183                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 185  0041 721550c0      	bres	20672,#2
 186  0045               L16:
 187                     ; 114 }
 190  0045 81            	ret
 225                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 225                     ; 122 {
 226                     	switch	.text
 227  0046               _CLK_HSECmd:
 231                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 233                     ; 126   if (NewState != DISABLE)
 235  0046 4d            	tnz	a
 236  0047 2706          	jreq	L101
 237                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 239  0049 721050c1      	bset	20673,#0
 241  004d 2004          	jra	L301
 242  004f               L101:
 243                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 245  004f 721150c1      	bres	20673,#0
 246  0053               L301:
 247                     ; 136 }
 250  0053 81            	ret
 285                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 285                     ; 144 {
 286                     	switch	.text
 287  0054               _CLK_HSICmd:
 291                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 293                     ; 148   if (NewState != DISABLE)
 295  0054 4d            	tnz	a
 296  0055 2706          	jreq	L321
 297                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 299  0057 721050c0      	bset	20672,#0
 301  005b 2004          	jra	L521
 302  005d               L321:
 303                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 305  005d 721150c0      	bres	20672,#0
 306  0061               L521:
 307                     ; 158 }
 310  0061 81            	ret
 345                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 345                     ; 167 {
 346                     	switch	.text
 347  0062               _CLK_LSICmd:
 351                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 353                     ; 171   if (NewState != DISABLE)
 355  0062 4d            	tnz	a
 356  0063 2706          	jreq	L541
 357                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 359  0065 721650c0      	bset	20672,#3
 361  0069 2004          	jra	L741
 362  006b               L541:
 363                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 365  006b 721750c0      	bres	20672,#3
 366  006f               L741:
 367                     ; 181 }
 370  006f 81            	ret
 405                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 405                     ; 190 {
 406                     	switch	.text
 407  0070               _CLK_CCOCmd:
 411                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 413                     ; 194   if (NewState != DISABLE)
 415  0070 4d            	tnz	a
 416  0071 2706          	jreq	L761
 417                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 419  0073 721050c9      	bset	20681,#0
 421  0077 2004          	jra	L171
 422  0079               L761:
 423                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 425  0079 721150c9      	bres	20681,#0
 426  007d               L171:
 427                     ; 204 }
 430  007d 81            	ret
 465                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 465                     ; 214 {
 466                     	switch	.text
 467  007e               _CLK_ClockSwitchCmd:
 471                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 473                     ; 218   if (NewState != DISABLE )
 475  007e 4d            	tnz	a
 476  007f 2706          	jreq	L112
 477                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 479  0081 721250c5      	bset	20677,#1
 481  0085 2004          	jra	L312
 482  0087               L112:
 483                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 485  0087 721350c5      	bres	20677,#1
 486  008b               L312:
 487                     ; 228 }
 490  008b 81            	ret
 526                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 526                     ; 239 {
 527                     	switch	.text
 528  008c               _CLK_SlowActiveHaltWakeUpCmd:
 532                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 534                     ; 243   if (NewState != DISABLE)
 536  008c 4d            	tnz	a
 537  008d 2706          	jreq	L332
 538                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 540  008f 721a50c0      	bset	20672,#5
 542  0093 2004          	jra	L532
 543  0095               L332:
 544                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 546  0095 721b50c0      	bres	20672,#5
 547  0099               L532:
 548                     ; 253 }
 551  0099 81            	ret
 710                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 710                     ; 264 {
 711                     	switch	.text
 712  009a               _CLK_PeripheralClockConfig:
 714  009a 89            	pushw	x
 715       00000000      OFST:	set	0
 718                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 720                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 722                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 724  009b 9e            	ld	a,xh
 725  009c a510          	bcp	a,#16
 726  009e 2633          	jrne	L123
 727                     ; 271     if (NewState != DISABLE)
 729  00a0 0d02          	tnz	(OFST+2,sp)
 730  00a2 2717          	jreq	L323
 731                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 733  00a4 7b01          	ld	a,(OFST+1,sp)
 734  00a6 a40f          	and	a,#15
 735  00a8 5f            	clrw	x
 736  00a9 97            	ld	xl,a
 737  00aa a601          	ld	a,#1
 738  00ac 5d            	tnzw	x
 739  00ad 2704          	jreq	L62
 740  00af               L03:
 741  00af 48            	sll	a
 742  00b0 5a            	decw	x
 743  00b1 26fc          	jrne	L03
 744  00b3               L62:
 745  00b3 ca50c7        	or	a,20679
 746  00b6 c750c7        	ld	20679,a
 748  00b9 2049          	jra	L723
 749  00bb               L323:
 750                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 752  00bb 7b01          	ld	a,(OFST+1,sp)
 753  00bd a40f          	and	a,#15
 754  00bf 5f            	clrw	x
 755  00c0 97            	ld	xl,a
 756  00c1 a601          	ld	a,#1
 757  00c3 5d            	tnzw	x
 758  00c4 2704          	jreq	L23
 759  00c6               L43:
 760  00c6 48            	sll	a
 761  00c7 5a            	decw	x
 762  00c8 26fc          	jrne	L43
 763  00ca               L23:
 764  00ca 43            	cpl	a
 765  00cb c450c7        	and	a,20679
 766  00ce c750c7        	ld	20679,a
 767  00d1 2031          	jra	L723
 768  00d3               L123:
 769                     ; 284     if (NewState != DISABLE)
 771  00d3 0d02          	tnz	(OFST+2,sp)
 772  00d5 2717          	jreq	L133
 773                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 775  00d7 7b01          	ld	a,(OFST+1,sp)
 776  00d9 a40f          	and	a,#15
 777  00db 5f            	clrw	x
 778  00dc 97            	ld	xl,a
 779  00dd a601          	ld	a,#1
 780  00df 5d            	tnzw	x
 781  00e0 2704          	jreq	L63
 782  00e2               L04:
 783  00e2 48            	sll	a
 784  00e3 5a            	decw	x
 785  00e4 26fc          	jrne	L04
 786  00e6               L63:
 787  00e6 ca50ca        	or	a,20682
 788  00e9 c750ca        	ld	20682,a
 790  00ec 2016          	jra	L723
 791  00ee               L133:
 792                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 794  00ee 7b01          	ld	a,(OFST+1,sp)
 795  00f0 a40f          	and	a,#15
 796  00f2 5f            	clrw	x
 797  00f3 97            	ld	xl,a
 798  00f4 a601          	ld	a,#1
 799  00f6 5d            	tnzw	x
 800  00f7 2704          	jreq	L24
 801  00f9               L44:
 802  00f9 48            	sll	a
 803  00fa 5a            	decw	x
 804  00fb 26fc          	jrne	L44
 805  00fd               L24:
 806  00fd 43            	cpl	a
 807  00fe c450ca        	and	a,20682
 808  0101 c750ca        	ld	20682,a
 809  0104               L723:
 810                     ; 295 }
 813  0104 85            	popw	x
 814  0105 81            	ret
1002                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1002                     ; 310 {
1003                     	switch	.text
1004  0106               _CLK_ClockSwitchConfig:
1006  0106 89            	pushw	x
1007  0107 5204          	subw	sp,#4
1008       00000004      OFST:	set	4
1011                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1013  0109 aeffff        	ldw	x,#65535
1014  010c 1f03          	ldw	(OFST-1,sp),x
1016                     ; 313   ErrorStatus Swif = ERROR;
1018                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1020                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1022                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1024                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1026                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1028  010e c650c3        	ld	a,20675
1029  0111 6b01          	ld	(OFST-3,sp),a
1031                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1033  0113 7b05          	ld	a,(OFST+1,sp)
1034  0115 a101          	cp	a,#1
1035  0117 264b          	jrne	L544
1036                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1038  0119 721250c5      	bset	20677,#1
1039                     ; 331     if (ITState != DISABLE)
1041  011d 0d09          	tnz	(OFST+5,sp)
1042  011f 2706          	jreq	L744
1043                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1045  0121 721450c5      	bset	20677,#2
1047  0125 2004          	jra	L154
1048  0127               L744:
1049                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1051  0127 721550c5      	bres	20677,#2
1052  012b               L154:
1053                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1055  012b 7b06          	ld	a,(OFST+2,sp)
1056  012d c750c4        	ld	20676,a
1058  0130 2007          	jra	L754
1059  0132               L354:
1060                     ; 346       DownCounter--;
1062  0132 1e03          	ldw	x,(OFST-1,sp)
1063  0134 1d0001        	subw	x,#1
1064  0137 1f03          	ldw	(OFST-1,sp),x
1066  0139               L754:
1067                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1069  0139 c650c5        	ld	a,20677
1070  013c a501          	bcp	a,#1
1071  013e 2704          	jreq	L364
1073  0140 1e03          	ldw	x,(OFST-1,sp)
1074  0142 26ee          	jrne	L354
1075  0144               L364:
1076                     ; 349     if(DownCounter != 0)
1078  0144 1e03          	ldw	x,(OFST-1,sp)
1079  0146 2706          	jreq	L564
1080                     ; 351       Swif = SUCCESS;
1082  0148 a601          	ld	a,#1
1083  014a 6b02          	ld	(OFST-2,sp),a
1086  014c 2002          	jra	L174
1087  014e               L564:
1088                     ; 355       Swif = ERROR;
1090  014e 0f02          	clr	(OFST-2,sp)
1092  0150               L174:
1093                     ; 390   if(Swif != ERROR)
1095  0150 0d02          	tnz	(OFST-2,sp)
1096  0152 2767          	jreq	L515
1097                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1099  0154 0d0a          	tnz	(OFST+6,sp)
1100  0156 2645          	jrne	L715
1102  0158 7b01          	ld	a,(OFST-3,sp)
1103  015a a1e1          	cp	a,#225
1104  015c 263f          	jrne	L715
1105                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1107  015e 721150c0      	bres	20672,#0
1109  0162 2057          	jra	L515
1110  0164               L544:
1111                     ; 361     if (ITState != DISABLE)
1113  0164 0d09          	tnz	(OFST+5,sp)
1114  0166 2706          	jreq	L374
1115                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1117  0168 721450c5      	bset	20677,#2
1119  016c 2004          	jra	L574
1120  016e               L374:
1121                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1123  016e 721550c5      	bres	20677,#2
1124  0172               L574:
1125                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1127  0172 7b06          	ld	a,(OFST+2,sp)
1128  0174 c750c4        	ld	20676,a
1130  0177 2007          	jra	L305
1131  0179               L774:
1132                     ; 376       DownCounter--;
1134  0179 1e03          	ldw	x,(OFST-1,sp)
1135  017b 1d0001        	subw	x,#1
1136  017e 1f03          	ldw	(OFST-1,sp),x
1138  0180               L305:
1139                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1141  0180 c650c5        	ld	a,20677
1142  0183 a508          	bcp	a,#8
1143  0185 2704          	jreq	L705
1145  0187 1e03          	ldw	x,(OFST-1,sp)
1146  0189 26ee          	jrne	L774
1147  018b               L705:
1148                     ; 379     if(DownCounter != 0)
1150  018b 1e03          	ldw	x,(OFST-1,sp)
1151  018d 270a          	jreq	L115
1152                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1154  018f 721250c5      	bset	20677,#1
1155                     ; 383       Swif = SUCCESS;
1157  0193 a601          	ld	a,#1
1158  0195 6b02          	ld	(OFST-2,sp),a
1161  0197 20b7          	jra	L174
1162  0199               L115:
1163                     ; 387       Swif = ERROR;
1165  0199 0f02          	clr	(OFST-2,sp)
1167  019b 20b3          	jra	L174
1168  019d               L715:
1169                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1171  019d 0d0a          	tnz	(OFST+6,sp)
1172  019f 260c          	jrne	L325
1174  01a1 7b01          	ld	a,(OFST-3,sp)
1175  01a3 a1d2          	cp	a,#210
1176  01a5 2606          	jrne	L325
1177                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1179  01a7 721750c0      	bres	20672,#3
1181  01ab 200e          	jra	L515
1182  01ad               L325:
1183                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1185  01ad 0d0a          	tnz	(OFST+6,sp)
1186  01af 260a          	jrne	L515
1188  01b1 7b01          	ld	a,(OFST-3,sp)
1189  01b3 a1b4          	cp	a,#180
1190  01b5 2604          	jrne	L515
1191                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1193  01b7 721150c1      	bres	20673,#0
1194  01bb               L515:
1195                     ; 406   return(Swif);
1197  01bb 7b02          	ld	a,(OFST-2,sp)
1200  01bd 5b06          	addw	sp,#6
1201  01bf 81            	ret
1339                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1339                     ; 416 {
1340                     	switch	.text
1341  01c0               _CLK_HSIPrescalerConfig:
1343  01c0 88            	push	a
1344       00000000      OFST:	set	0
1347                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1349                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1351  01c1 c650c6        	ld	a,20678
1352  01c4 a4e7          	and	a,#231
1353  01c6 c750c6        	ld	20678,a
1354                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1356  01c9 c650c6        	ld	a,20678
1357  01cc 1a01          	or	a,(OFST+1,sp)
1358  01ce c750c6        	ld	20678,a
1359                     ; 425 }
1362  01d1 84            	pop	a
1363  01d2 81            	ret
1498                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1498                     ; 437 {
1499                     	switch	.text
1500  01d3               _CLK_CCOConfig:
1502  01d3 88            	push	a
1503       00000000      OFST:	set	0
1506                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1508                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1510  01d4 c650c9        	ld	a,20681
1511  01d7 a4e1          	and	a,#225
1512  01d9 c750c9        	ld	20681,a
1513                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1515  01dc c650c9        	ld	a,20681
1516  01df 1a01          	or	a,(OFST+1,sp)
1517  01e1 c750c9        	ld	20681,a
1518                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1520  01e4 721050c9      	bset	20681,#0
1521                     ; 449 }
1524  01e8 84            	pop	a
1525  01e9 81            	ret
1590                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1590                     ; 460 {
1591                     	switch	.text
1592  01ea               _CLK_ITConfig:
1594  01ea 89            	pushw	x
1595       00000000      OFST:	set	0
1598                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1600                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1602                     ; 465   if (NewState != DISABLE)
1604  01eb 9f            	ld	a,xl
1605  01ec 4d            	tnz	a
1606  01ed 2719          	jreq	L527
1607                     ; 467     switch (CLK_IT)
1609  01ef 9e            	ld	a,xh
1611                     ; 475     default:
1611                     ; 476       break;
1612  01f0 a00c          	sub	a,#12
1613  01f2 270a          	jreq	L166
1614  01f4 a010          	sub	a,#16
1615  01f6 2624          	jrne	L337
1616                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1616                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1618  01f8 721450c5      	bset	20677,#2
1619                     ; 471       break;
1621  01fc 201e          	jra	L337
1622  01fe               L166:
1623                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1623                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1625  01fe 721450c8      	bset	20680,#2
1626                     ; 474       break;
1628  0202 2018          	jra	L337
1629  0204               L366:
1630                     ; 475     default:
1630                     ; 476       break;
1632  0204 2016          	jra	L337
1633  0206               L137:
1635  0206 2014          	jra	L337
1636  0208               L527:
1637                     ; 481     switch (CLK_IT)
1639  0208 7b01          	ld	a,(OFST+1,sp)
1641                     ; 489     default:
1641                     ; 490       break;
1642  020a a00c          	sub	a,#12
1643  020c 270a          	jreq	L766
1644  020e a010          	sub	a,#16
1645  0210 260a          	jrne	L337
1646                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1646                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1648  0212 721550c5      	bres	20677,#2
1649                     ; 485       break;
1651  0216 2004          	jra	L337
1652  0218               L766:
1653                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1653                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1655  0218 721550c8      	bres	20680,#2
1656                     ; 488       break;
1657  021c               L337:
1658                     ; 493 }
1661  021c 85            	popw	x
1662  021d 81            	ret
1663  021e               L176:
1664                     ; 489     default:
1664                     ; 490       break;
1666  021e 20fc          	jra	L337
1667  0220               L737:
1668  0220 20fa          	jra	L337
1703                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1703                     ; 501 {
1704                     	switch	.text
1705  0222               _CLK_SYSCLKConfig:
1707  0222 88            	push	a
1708       00000000      OFST:	set	0
1711                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1713                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1715  0223 a580          	bcp	a,#128
1716  0225 2614          	jrne	L757
1717                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1719  0227 c650c6        	ld	a,20678
1720  022a a4e7          	and	a,#231
1721  022c c750c6        	ld	20678,a
1722                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1724  022f 7b01          	ld	a,(OFST+1,sp)
1725  0231 a418          	and	a,#24
1726  0233 ca50c6        	or	a,20678
1727  0236 c750c6        	ld	20678,a
1729  0239 2012          	jra	L167
1730  023b               L757:
1731                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1733  023b c650c6        	ld	a,20678
1734  023e a4f8          	and	a,#248
1735  0240 c750c6        	ld	20678,a
1736                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1738  0243 7b01          	ld	a,(OFST+1,sp)
1739  0245 a407          	and	a,#7
1740  0247 ca50c6        	or	a,20678
1741  024a c750c6        	ld	20678,a
1742  024d               L167:
1743                     ; 515 }
1746  024d 84            	pop	a
1747  024e 81            	ret
1803                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1803                     ; 524 {
1804                     	switch	.text
1805  024f               _CLK_SWIMConfig:
1809                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1811                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1813  024f 4d            	tnz	a
1814  0250 2706          	jreq	L1101
1815                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1817  0252 721050cd      	bset	20685,#0
1819  0256 2004          	jra	L3101
1820  0258               L1101:
1821                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1823  0258 721150cd      	bres	20685,#0
1824  025c               L3101:
1825                     ; 538 }
1828  025c 81            	ret
1852                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1852                     ; 548 {
1853                     	switch	.text
1854  025d               _CLK_ClockSecuritySystemEnable:
1858                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1860  025d 721050c8      	bset	20680,#0
1861                     ; 551 }
1864  0261 81            	ret
1889                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1889                     ; 560 {
1890                     	switch	.text
1891  0262               _CLK_GetSYSCLKSource:
1895                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1897  0262 c650c3        	ld	a,20675
1900  0265 81            	ret
1963                     ; 569 uint32_t CLK_GetClockFreq(void)
1963                     ; 570 {
1964                     	switch	.text
1965  0266               _CLK_GetClockFreq:
1967  0266 5209          	subw	sp,#9
1968       00000009      OFST:	set	9
1971                     ; 571   uint32_t clockfrequency = 0;
1973                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1975                     ; 573   uint8_t tmp = 0, presc = 0;
1979                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1981  0268 c650c3        	ld	a,20675
1982  026b 6b09          	ld	(OFST+0,sp),a
1984                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1986  026d 7b09          	ld	a,(OFST+0,sp)
1987  026f a1e1          	cp	a,#225
1988  0271 2641          	jrne	L7601
1989                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1991  0273 c650c6        	ld	a,20678
1992  0276 a418          	and	a,#24
1993  0278 6b09          	ld	(OFST+0,sp),a
1995                     ; 581     tmp = (uint8_t)(tmp >> 3);
1997  027a 0409          	srl	(OFST+0,sp)
1998  027c 0409          	srl	(OFST+0,sp)
1999  027e 0409          	srl	(OFST+0,sp)
2001                     ; 582     presc = HSIDivFactor[tmp];
2003  0280 7b09          	ld	a,(OFST+0,sp)
2004  0282 5f            	clrw	x
2005  0283 97            	ld	xl,a
2006  0284 d60000        	ld	a,(_HSIDivFactor,x)
2007  0287 6b09          	ld	(OFST+0,sp),a
2009                     ; 583     clockfrequency = HSI_VALUE / presc;
2011  0289 7b09          	ld	a,(OFST+0,sp)
2012  028b b703          	ld	c_lreg+3,a
2013  028d 3f02          	clr	c_lreg+2
2014  028f 3f01          	clr	c_lreg+1
2015  0291 3f00          	clr	c_lreg
2016  0293 96            	ldw	x,sp
2017  0294 1c0001        	addw	x,#OFST-8
2018  0297 cd0000        	call	c_rtol
2021  029a ae2400        	ldw	x,#9216
2022  029d bf02          	ldw	c_lreg+2,x
2023  029f ae00f4        	ldw	x,#244
2024  02a2 bf00          	ldw	c_lreg,x
2025  02a4 96            	ldw	x,sp
2026  02a5 1c0001        	addw	x,#OFST-8
2027  02a8 cd0000        	call	c_ludv
2029  02ab 96            	ldw	x,sp
2030  02ac 1c0005        	addw	x,#OFST-4
2031  02af cd0000        	call	c_rtol
2035  02b2 201c          	jra	L1701
2036  02b4               L7601:
2037                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2039  02b4 7b09          	ld	a,(OFST+0,sp)
2040  02b6 a1d2          	cp	a,#210
2041  02b8 260c          	jrne	L3701
2042                     ; 587     clockfrequency = LSI_VALUE;
2044  02ba aef400        	ldw	x,#62464
2045  02bd 1f07          	ldw	(OFST-2,sp),x
2046  02bf ae0001        	ldw	x,#1
2047  02c2 1f05          	ldw	(OFST-4,sp),x
2050  02c4 200a          	jra	L1701
2051  02c6               L3701:
2052                     ; 591     clockfrequency = HSE_VALUE;
2054  02c6 ae2400        	ldw	x,#9216
2055  02c9 1f07          	ldw	(OFST-2,sp),x
2056  02cb ae00f4        	ldw	x,#244
2057  02ce 1f05          	ldw	(OFST-4,sp),x
2059  02d0               L1701:
2060                     ; 594   return((uint32_t)clockfrequency);
2062  02d0 96            	ldw	x,sp
2063  02d1 1c0005        	addw	x,#OFST-4
2064  02d4 cd0000        	call	c_ltor
2068  02d7 5b09          	addw	sp,#9
2069  02d9 81            	ret
2168                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2168                     ; 605 {
2169                     	switch	.text
2170  02da               _CLK_AdjustHSICalibrationValue:
2172  02da 88            	push	a
2173       00000000      OFST:	set	0
2176                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2178                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2180  02db c650cc        	ld	a,20684
2181  02de a4f8          	and	a,#248
2182  02e0 1a01          	or	a,(OFST+1,sp)
2183  02e2 c750cc        	ld	20684,a
2184                     ; 611 }
2187  02e5 84            	pop	a
2188  02e6 81            	ret
2212                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2212                     ; 623 {
2213                     	switch	.text
2214  02e7               _CLK_SYSCLKEmergencyClear:
2218                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2220  02e7 721150c5      	bres	20677,#0
2221                     ; 625 }
2224  02eb 81            	ret
2377                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2377                     ; 635 {
2378                     	switch	.text
2379  02ec               _CLK_GetFlagStatus:
2381  02ec 89            	pushw	x
2382  02ed 5203          	subw	sp,#3
2383       00000003      OFST:	set	3
2386                     ; 636   uint16_t statusreg = 0;
2388                     ; 637   uint8_t tmpreg = 0;
2390                     ; 638   FlagStatus bitstatus = RESET;
2392                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2394                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2396  02ef 01            	rrwa	x,a
2397  02f0 9f            	ld	a,xl
2398  02f1 a4ff          	and	a,#255
2399  02f3 97            	ld	xl,a
2400  02f4 4f            	clr	a
2401  02f5 02            	rlwa	x,a
2402  02f6 1f01          	ldw	(OFST-2,sp),x
2403  02f8 01            	rrwa	x,a
2405                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2407  02f9 1e01          	ldw	x,(OFST-2,sp)
2408  02fb a30100        	cpw	x,#256
2409  02fe 2607          	jrne	L1421
2410                     ; 649     tmpreg = CLK->ICKR;
2412  0300 c650c0        	ld	a,20672
2413  0303 6b03          	ld	(OFST+0,sp),a
2416  0305 202f          	jra	L3421
2417  0307               L1421:
2418                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2420  0307 1e01          	ldw	x,(OFST-2,sp)
2421  0309 a30200        	cpw	x,#512
2422  030c 2607          	jrne	L5421
2423                     ; 653     tmpreg = CLK->ECKR;
2425  030e c650c1        	ld	a,20673
2426  0311 6b03          	ld	(OFST+0,sp),a
2429  0313 2021          	jra	L3421
2430  0315               L5421:
2431                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2433  0315 1e01          	ldw	x,(OFST-2,sp)
2434  0317 a30300        	cpw	x,#768
2435  031a 2607          	jrne	L1521
2436                     ; 657     tmpreg = CLK->SWCR;
2438  031c c650c5        	ld	a,20677
2439  031f 6b03          	ld	(OFST+0,sp),a
2442  0321 2013          	jra	L3421
2443  0323               L1521:
2444                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2446  0323 1e01          	ldw	x,(OFST-2,sp)
2447  0325 a30400        	cpw	x,#1024
2448  0328 2607          	jrne	L5521
2449                     ; 661     tmpreg = CLK->CSSR;
2451  032a c650c8        	ld	a,20680
2452  032d 6b03          	ld	(OFST+0,sp),a
2455  032f 2005          	jra	L3421
2456  0331               L5521:
2457                     ; 665     tmpreg = CLK->CCOR;
2459  0331 c650c9        	ld	a,20681
2460  0334 6b03          	ld	(OFST+0,sp),a
2462  0336               L3421:
2463                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2465  0336 7b05          	ld	a,(OFST+2,sp)
2466  0338 1503          	bcp	a,(OFST+0,sp)
2467  033a 2706          	jreq	L1621
2468                     ; 670     bitstatus = SET;
2470  033c a601          	ld	a,#1
2471  033e 6b03          	ld	(OFST+0,sp),a
2474  0340 2002          	jra	L3621
2475  0342               L1621:
2476                     ; 674     bitstatus = RESET;
2478  0342 0f03          	clr	(OFST+0,sp)
2480  0344               L3621:
2481                     ; 678   return((FlagStatus)bitstatus);
2483  0344 7b03          	ld	a,(OFST+0,sp)
2486  0346 5b05          	addw	sp,#5
2487  0348 81            	ret
2533                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2533                     ; 688 {
2534                     	switch	.text
2535  0349               _CLK_GetITStatus:
2537  0349 88            	push	a
2538  034a 88            	push	a
2539       00000001      OFST:	set	1
2542                     ; 689   ITStatus bitstatus = RESET;
2544                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2546                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2548  034b a11c          	cp	a,#28
2549  034d 2611          	jrne	L7031
2550                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2552  034f c450c5        	and	a,20677
2553  0352 a10c          	cp	a,#12
2554  0354 2606          	jrne	L1131
2555                     ; 699       bitstatus = SET;
2557  0356 a601          	ld	a,#1
2558  0358 6b01          	ld	(OFST+0,sp),a
2561  035a 2015          	jra	L5131
2562  035c               L1131:
2563                     ; 703       bitstatus = RESET;
2565  035c 0f01          	clr	(OFST+0,sp)
2567  035e 2011          	jra	L5131
2568  0360               L7031:
2569                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2571  0360 c650c8        	ld	a,20680
2572  0363 1402          	and	a,(OFST+1,sp)
2573  0365 a10c          	cp	a,#12
2574  0367 2606          	jrne	L7131
2575                     ; 711       bitstatus = SET;
2577  0369 a601          	ld	a,#1
2578  036b 6b01          	ld	(OFST+0,sp),a
2581  036d 2002          	jra	L5131
2582  036f               L7131:
2583                     ; 715       bitstatus = RESET;
2585  036f 0f01          	clr	(OFST+0,sp)
2587  0371               L5131:
2588                     ; 720   return bitstatus;
2590  0371 7b01          	ld	a,(OFST+0,sp)
2593  0373 85            	popw	x
2594  0374 81            	ret
2630                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2630                     ; 730 {
2631                     	switch	.text
2632  0375               _CLK_ClearITPendingBit:
2636                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2638                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2640  0375 a10c          	cp	a,#12
2641  0377 2606          	jrne	L1431
2642                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2644  0379 721750c8      	bres	20680,#3
2646  037d 2004          	jra	L3431
2647  037f               L1431:
2648                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2650  037f 721750c5      	bres	20677,#3
2651  0383               L3431:
2652                     ; 745 }
2655  0383 81            	ret
2690                     	xdef	_CLKPrescTable
2691                     	xdef	_HSIDivFactor
2692                     	xdef	_CLK_ClearITPendingBit
2693                     	xdef	_CLK_GetITStatus
2694                     	xdef	_CLK_GetFlagStatus
2695                     	xdef	_CLK_GetSYSCLKSource
2696                     	xdef	_CLK_GetClockFreq
2697                     	xdef	_CLK_AdjustHSICalibrationValue
2698                     	xdef	_CLK_SYSCLKEmergencyClear
2699                     	xdef	_CLK_ClockSecuritySystemEnable
2700                     	xdef	_CLK_SWIMConfig
2701                     	xdef	_CLK_SYSCLKConfig
2702                     	xdef	_CLK_ITConfig
2703                     	xdef	_CLK_CCOConfig
2704                     	xdef	_CLK_HSIPrescalerConfig
2705                     	xdef	_CLK_ClockSwitchConfig
2706                     	xdef	_CLK_PeripheralClockConfig
2707                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2708                     	xdef	_CLK_FastHaltWakeUpCmd
2709                     	xdef	_CLK_ClockSwitchCmd
2710                     	xdef	_CLK_CCOCmd
2711                     	xdef	_CLK_LSICmd
2712                     	xdef	_CLK_HSICmd
2713                     	xdef	_CLK_HSECmd
2714                     	xdef	_CLK_DeInit
2715                     	xref.b	c_lreg
2716                     	xref.b	c_x
2735                     	xref	c_ltor
2736                     	xref	c_ludv
2737                     	xref	c_rtol
2738                     	end
