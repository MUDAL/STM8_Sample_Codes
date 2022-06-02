   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 51 void TIM3_DeInit(void)
  41                     ; 52 {
  43                     	switch	.text
  44  0000               _TIM3_DeInit:
  48                     ; 53   TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  50  0000 725f5320      	clr	21280
  51                     ; 54   TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  53  0004 725f5321      	clr	21281
  54                     ; 55   TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  56  0008 725f5323      	clr	21283
  57                     ; 58   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  59  000c 725f5327      	clr	21287
  60                     ; 61   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  62  0010 725f5327      	clr	21287
  63                     ; 62   TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  65  0014 725f5325      	clr	21285
  66                     ; 63   TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  68  0018 725f5326      	clr	21286
  69                     ; 64   TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  71  001c 725f5328      	clr	21288
  72                     ; 65   TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  74  0020 725f5329      	clr	21289
  75                     ; 66   TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  77  0024 725f532a      	clr	21290
  78                     ; 67   TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  80  0028 35ff532b      	mov	21291,#255
  81                     ; 68   TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  83  002c 35ff532c      	mov	21292,#255
  84                     ; 69   TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  86  0030 725f532d      	clr	21293
  87                     ; 70   TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  89  0034 725f532e      	clr	21294
  90                     ; 71   TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  92  0038 725f532f      	clr	21295
  93                     ; 72   TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
  95  003c 725f5330      	clr	21296
  96                     ; 73   TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
  98  0040 725f5322      	clr	21282
  99                     ; 74 }
 102  0044 81            	ret
 270                     ; 82 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 270                     ; 83                         uint16_t TIM3_Period)
 270                     ; 84 {
 271                     	switch	.text
 272  0045               _TIM3_TimeBaseInit:
 274  0045 88            	push	a
 275       00000000      OFST:	set	0
 278                     ; 86   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 280  0046 c7532a        	ld	21290,a
 281                     ; 88   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 283  0049 7b04          	ld	a,(OFST+4,sp)
 284  004b c7532b        	ld	21291,a
 285                     ; 89   TIM3->ARRL = (uint8_t)(TIM3_Period);
 287  004e 7b05          	ld	a,(OFST+5,sp)
 288  0050 c7532c        	ld	21292,a
 289                     ; 90 }
 292  0053 84            	pop	a
 293  0054 81            	ret
 450                     ; 100 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 450                     ; 101                   TIM3_OutputState_TypeDef TIM3_OutputState,
 450                     ; 102                   uint16_t TIM3_Pulse,
 450                     ; 103                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 450                     ; 104 {
 451                     	switch	.text
 452  0055               _TIM3_OC1Init:
 454  0055 89            	pushw	x
 455  0056 88            	push	a
 456       00000001      OFST:	set	1
 459                     ; 106   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 461                     ; 107   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 463                     ; 108   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 465                     ; 111   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 467  0057 c65327        	ld	a,21287
 468  005a a4fc          	and	a,#252
 469  005c c75327        	ld	21287,a
 470                     ; 113   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 472  005f 7b08          	ld	a,(OFST+7,sp)
 473  0061 a402          	and	a,#2
 474  0063 6b01          	ld	(OFST+0,sp),a
 476  0065 9f            	ld	a,xl
 477  0066 a401          	and	a,#1
 478  0068 1a01          	or	a,(OFST+0,sp)
 479  006a ca5327        	or	a,21287
 480  006d c75327        	ld	21287,a
 481                     ; 116   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 483  0070 c65325        	ld	a,21285
 484  0073 a48f          	and	a,#143
 485  0075 1a02          	or	a,(OFST+1,sp)
 486  0077 c75325        	ld	21285,a
 487                     ; 119   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 489  007a 7b06          	ld	a,(OFST+5,sp)
 490  007c c7532d        	ld	21293,a
 491                     ; 120   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 493  007f 7b07          	ld	a,(OFST+6,sp)
 494  0081 c7532e        	ld	21294,a
 495                     ; 121 }
 498  0084 5b03          	addw	sp,#3
 499  0086 81            	ret
 563                     ; 131 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 563                     ; 132                   TIM3_OutputState_TypeDef TIM3_OutputState,
 563                     ; 133                   uint16_t TIM3_Pulse,
 563                     ; 134                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 563                     ; 135 {
 564                     	switch	.text
 565  0087               _TIM3_OC2Init:
 567  0087 89            	pushw	x
 568  0088 88            	push	a
 569       00000001      OFST:	set	1
 572                     ; 137   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 574                     ; 138   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 576                     ; 139   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 578                     ; 143   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 580  0089 c65327        	ld	a,21287
 581  008c a4cf          	and	a,#207
 582  008e c75327        	ld	21287,a
 583                     ; 145   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 585  0091 7b08          	ld	a,(OFST+7,sp)
 586  0093 a420          	and	a,#32
 587  0095 6b01          	ld	(OFST+0,sp),a
 589  0097 9f            	ld	a,xl
 590  0098 a410          	and	a,#16
 591  009a 1a01          	or	a,(OFST+0,sp)
 592  009c ca5327        	or	a,21287
 593  009f c75327        	ld	21287,a
 594                     ; 149   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 596  00a2 c65326        	ld	a,21286
 597  00a5 a48f          	and	a,#143
 598  00a7 1a02          	or	a,(OFST+1,sp)
 599  00a9 c75326        	ld	21286,a
 600                     ; 153   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 602  00ac 7b06          	ld	a,(OFST+5,sp)
 603  00ae c7532f        	ld	21295,a
 604                     ; 154   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 606  00b1 7b07          	ld	a,(OFST+6,sp)
 607  00b3 c75330        	ld	21296,a
 608                     ; 155 }
 611  00b6 5b03          	addw	sp,#3
 612  00b8 81            	ret
 796                     ; 166 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 796                     ; 167                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 796                     ; 168                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 796                     ; 169                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 796                     ; 170                  uint8_t TIM3_ICFilter)
 796                     ; 171 {
 797                     	switch	.text
 798  00b9               _TIM3_ICInit:
 800  00b9 89            	pushw	x
 801       00000000      OFST:	set	0
 804                     ; 173   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 806                     ; 174   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 808                     ; 175   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 810                     ; 176   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 812                     ; 177   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 814                     ; 179   if (TIM3_Channel != TIM3_CHANNEL_2)
 816  00ba 9e            	ld	a,xh
 817  00bb a101          	cp	a,#1
 818  00bd 2714          	jreq	L343
 819                     ; 182     TI1_Config((uint8_t)TIM3_ICPolarity,
 819                     ; 183                (uint8_t)TIM3_ICSelection,
 819                     ; 184                (uint8_t)TIM3_ICFilter);
 821  00bf 7b07          	ld	a,(OFST+7,sp)
 822  00c1 88            	push	a
 823  00c2 7b06          	ld	a,(OFST+6,sp)
 824  00c4 97            	ld	xl,a
 825  00c5 7b03          	ld	a,(OFST+3,sp)
 826  00c7 95            	ld	xh,a
 827  00c8 cd0360        	call	L3_TI1_Config
 829  00cb 84            	pop	a
 830                     ; 187     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 832  00cc 7b06          	ld	a,(OFST+6,sp)
 833  00ce cd0285        	call	_TIM3_SetIC1Prescaler
 836  00d1 2012          	jra	L543
 837  00d3               L343:
 838                     ; 192     TI2_Config((uint8_t)TIM3_ICPolarity,
 838                     ; 193                (uint8_t)TIM3_ICSelection,
 838                     ; 194                (uint8_t)TIM3_ICFilter);
 840  00d3 7b07          	ld	a,(OFST+7,sp)
 841  00d5 88            	push	a
 842  00d6 7b06          	ld	a,(OFST+6,sp)
 843  00d8 97            	ld	xl,a
 844  00d9 7b03          	ld	a,(OFST+3,sp)
 845  00db 95            	ld	xh,a
 846  00dc cd0390        	call	L5_TI2_Config
 848  00df 84            	pop	a
 849                     ; 197     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 851  00e0 7b06          	ld	a,(OFST+6,sp)
 852  00e2 cd0292        	call	_TIM3_SetIC2Prescaler
 854  00e5               L543:
 855                     ; 199 }
 858  00e5 85            	popw	x
 859  00e6 81            	ret
 955                     ; 210 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 955                     ; 211                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 955                     ; 212                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 955                     ; 213                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 955                     ; 214                      uint8_t TIM3_ICFilter)
 955                     ; 215 {
 956                     	switch	.text
 957  00e7               _TIM3_PWMIConfig:
 959  00e7 89            	pushw	x
 960  00e8 89            	pushw	x
 961       00000002      OFST:	set	2
 964                     ; 216   uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 966                     ; 217   uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 968                     ; 220   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 970                     ; 221   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 972                     ; 222   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 974                     ; 223   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 976                     ; 226   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 978  00e9 9f            	ld	a,xl
 979  00ea a144          	cp	a,#68
 980  00ec 2706          	jreq	L514
 981                     ; 228     icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
 983  00ee a644          	ld	a,#68
 984  00f0 6b01          	ld	(OFST-1,sp),a
 987  00f2 2002          	jra	L714
 988  00f4               L514:
 989                     ; 232     icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 991  00f4 0f01          	clr	(OFST-1,sp)
 993  00f6               L714:
 994                     ; 236   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 996  00f6 7b07          	ld	a,(OFST+5,sp)
 997  00f8 a101          	cp	a,#1
 998  00fa 2606          	jrne	L124
 999                     ; 238     icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
1001  00fc a602          	ld	a,#2
1002  00fe 6b02          	ld	(OFST+0,sp),a
1005  0100 2004          	jra	L324
1006  0102               L124:
1007                     ; 242     icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1009  0102 a601          	ld	a,#1
1010  0104 6b02          	ld	(OFST+0,sp),a
1012  0106               L324:
1013                     ; 245   if (TIM3_Channel != TIM3_CHANNEL_2)
1015  0106 7b03          	ld	a,(OFST+1,sp)
1016  0108 a101          	cp	a,#1
1017  010a 2726          	jreq	L524
1018                     ; 248     TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1018                     ; 249                (uint8_t)TIM3_ICFilter);
1020  010c 7b09          	ld	a,(OFST+7,sp)
1021  010e 88            	push	a
1022  010f 7b08          	ld	a,(OFST+6,sp)
1023  0111 97            	ld	xl,a
1024  0112 7b05          	ld	a,(OFST+3,sp)
1025  0114 95            	ld	xh,a
1026  0115 cd0360        	call	L3_TI1_Config
1028  0118 84            	pop	a
1029                     ; 252     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1031  0119 7b08          	ld	a,(OFST+6,sp)
1032  011b cd0285        	call	_TIM3_SetIC1Prescaler
1034                     ; 255     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1036  011e 7b09          	ld	a,(OFST+7,sp)
1037  0120 88            	push	a
1038  0121 7b03          	ld	a,(OFST+1,sp)
1039  0123 97            	ld	xl,a
1040  0124 7b02          	ld	a,(OFST+0,sp)
1041  0126 95            	ld	xh,a
1042  0127 cd0390        	call	L5_TI2_Config
1044  012a 84            	pop	a
1045                     ; 258     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1047  012b 7b08          	ld	a,(OFST+6,sp)
1048  012d cd0292        	call	_TIM3_SetIC2Prescaler
1051  0130 2024          	jra	L724
1052  0132               L524:
1053                     ; 263     TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1053                     ; 264                (uint8_t)TIM3_ICFilter);
1055  0132 7b09          	ld	a,(OFST+7,sp)
1056  0134 88            	push	a
1057  0135 7b08          	ld	a,(OFST+6,sp)
1058  0137 97            	ld	xl,a
1059  0138 7b05          	ld	a,(OFST+3,sp)
1060  013a 95            	ld	xh,a
1061  013b cd0390        	call	L5_TI2_Config
1063  013e 84            	pop	a
1064                     ; 267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1066  013f 7b08          	ld	a,(OFST+6,sp)
1067  0141 cd0292        	call	_TIM3_SetIC2Prescaler
1069                     ; 270     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1071  0144 7b09          	ld	a,(OFST+7,sp)
1072  0146 88            	push	a
1073  0147 7b03          	ld	a,(OFST+1,sp)
1074  0149 97            	ld	xl,a
1075  014a 7b02          	ld	a,(OFST+0,sp)
1076  014c 95            	ld	xh,a
1077  014d cd0360        	call	L3_TI1_Config
1079  0150 84            	pop	a
1080                     ; 273     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1082  0151 7b08          	ld	a,(OFST+6,sp)
1083  0153 cd0285        	call	_TIM3_SetIC1Prescaler
1085  0156               L724:
1086                     ; 275 }
1089  0156 5b04          	addw	sp,#4
1090  0158 81            	ret
1145                     ; 283 void TIM3_Cmd(FunctionalState NewState)
1145                     ; 284 {
1146                     	switch	.text
1147  0159               _TIM3_Cmd:
1151                     ; 286   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1153                     ; 289   if (NewState != DISABLE)
1155  0159 4d            	tnz	a
1156  015a 2706          	jreq	L754
1157                     ; 291     TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1159  015c 72105320      	bset	21280,#0
1161  0160 2004          	jra	L164
1162  0162               L754:
1163                     ; 295     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1165  0162 72115320      	bres	21280,#0
1166  0166               L164:
1167                     ; 297 }
1170  0166 81            	ret
1242                     ; 311 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1242                     ; 312 {
1243                     	switch	.text
1244  0167               _TIM3_ITConfig:
1246  0167 89            	pushw	x
1247       00000000      OFST:	set	0
1250                     ; 314   assert_param(IS_TIM3_IT_OK(TIM3_IT));
1252                     ; 315   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1254                     ; 317   if (NewState != DISABLE)
1256  0168 9f            	ld	a,xl
1257  0169 4d            	tnz	a
1258  016a 2709          	jreq	L715
1259                     ; 320     TIM3->IER |= (uint8_t)TIM3_IT;
1261  016c 9e            	ld	a,xh
1262  016d ca5321        	or	a,21281
1263  0170 c75321        	ld	21281,a
1265  0173 2009          	jra	L125
1266  0175               L715:
1267                     ; 325     TIM3->IER &= (uint8_t)(~TIM3_IT);
1269  0175 7b01          	ld	a,(OFST+1,sp)
1270  0177 43            	cpl	a
1271  0178 c45321        	and	a,21281
1272  017b c75321        	ld	21281,a
1273  017e               L125:
1274                     ; 327 }
1277  017e 85            	popw	x
1278  017f 81            	ret
1314                     ; 335 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1314                     ; 336 {
1315                     	switch	.text
1316  0180               _TIM3_UpdateDisableConfig:
1320                     ; 338   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1322                     ; 341   if (NewState != DISABLE)
1324  0180 4d            	tnz	a
1325  0181 2706          	jreq	L145
1326                     ; 343     TIM3->CR1 |= TIM3_CR1_UDIS;
1328  0183 72125320      	bset	21280,#1
1330  0187 2004          	jra	L345
1331  0189               L145:
1332                     ; 347     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1334  0189 72135320      	bres	21280,#1
1335  018d               L345:
1336                     ; 349 }
1339  018d 81            	ret
1397                     ; 359 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1397                     ; 360 {
1398                     	switch	.text
1399  018e               _TIM3_UpdateRequestConfig:
1403                     ; 362   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1405                     ; 365   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1407  018e 4d            	tnz	a
1408  018f 2706          	jreq	L375
1409                     ; 367     TIM3->CR1 |= TIM3_CR1_URS;
1411  0191 72145320      	bset	21280,#2
1413  0195 2004          	jra	L575
1414  0197               L375:
1415                     ; 371     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1417  0197 72155320      	bres	21280,#2
1418  019b               L575:
1419                     ; 373 }
1422  019b 81            	ret
1479                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1479                     ; 384 {
1480                     	switch	.text
1481  019c               _TIM3_SelectOnePulseMode:
1485                     ; 386   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1487                     ; 389   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1489  019c 4d            	tnz	a
1490  019d 2706          	jreq	L526
1491                     ; 391     TIM3->CR1 |= TIM3_CR1_OPM;
1493  019f 72165320      	bset	21280,#3
1495  01a3 2004          	jra	L726
1496  01a5               L526:
1497                     ; 395     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1499  01a5 72175320      	bres	21280,#3
1500  01a9               L726:
1501                     ; 397 }
1504  01a9 81            	ret
1572                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1572                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1572                     ; 429 {
1573                     	switch	.text
1574  01aa               _TIM3_PrescalerConfig:
1578                     ; 431   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1580                     ; 432   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1582                     ; 435   TIM3->PSCR = (uint8_t)Prescaler;
1584  01aa 9e            	ld	a,xh
1585  01ab c7532a        	ld	21290,a
1586                     ; 438   TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
1588  01ae 9f            	ld	a,xl
1589  01af c75324        	ld	21284,a
1590                     ; 439 }
1593  01b2 81            	ret
1651                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1651                     ; 451 {
1652                     	switch	.text
1653  01b3               _TIM3_ForcedOC1Config:
1655  01b3 88            	push	a
1656       00000000      OFST:	set	0
1659                     ; 453   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1661                     ; 456   TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
1663  01b4 c65325        	ld	a,21285
1664  01b7 a48f          	and	a,#143
1665  01b9 1a01          	or	a,(OFST+1,sp)
1666  01bb c75325        	ld	21285,a
1667                     ; 457 }
1670  01be 84            	pop	a
1671  01bf 81            	ret
1707                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1707                     ; 469 {
1708                     	switch	.text
1709  01c0               _TIM3_ForcedOC2Config:
1711  01c0 88            	push	a
1712       00000000      OFST:	set	0
1715                     ; 471   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1717                     ; 474   TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
1719  01c1 c65326        	ld	a,21286
1720  01c4 a48f          	and	a,#143
1721  01c6 1a01          	or	a,(OFST+1,sp)
1722  01c8 c75326        	ld	21286,a
1723                     ; 475 }
1726  01cb 84            	pop	a
1727  01cc 81            	ret
1763                     ; 483 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1763                     ; 484 {
1764                     	switch	.text
1765  01cd               _TIM3_ARRPreloadConfig:
1769                     ; 486   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1771                     ; 489   if (NewState != DISABLE)
1773  01cd 4d            	tnz	a
1774  01ce 2706          	jreq	L547
1775                     ; 491     TIM3->CR1 |= TIM3_CR1_ARPE;
1777  01d0 721e5320      	bset	21280,#7
1779  01d4 2004          	jra	L747
1780  01d6               L547:
1781                     ; 495     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
1783  01d6 721f5320      	bres	21280,#7
1784  01da               L747:
1785                     ; 497 }
1788  01da 81            	ret
1824                     ; 505 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1824                     ; 506 {
1825                     	switch	.text
1826  01db               _TIM3_OC1PreloadConfig:
1830                     ; 508   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1832                     ; 511   if (NewState != DISABLE)
1834  01db 4d            	tnz	a
1835  01dc 2706          	jreq	L767
1836                     ; 513     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1838  01de 72165325      	bset	21285,#3
1840  01e2 2004          	jra	L177
1841  01e4               L767:
1842                     ; 517     TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1844  01e4 72175325      	bres	21285,#3
1845  01e8               L177:
1846                     ; 519 }
1849  01e8 81            	ret
1885                     ; 527 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1885                     ; 528 {
1886                     	switch	.text
1887  01e9               _TIM3_OC2PreloadConfig:
1891                     ; 530   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1893                     ; 533   if (NewState != DISABLE)
1895  01e9 4d            	tnz	a
1896  01ea 2706          	jreq	L1101
1897                     ; 535     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1899  01ec 72165326      	bset	21286,#3
1901  01f0 2004          	jra	L3101
1902  01f2               L1101:
1903                     ; 539     TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1905  01f2 72175326      	bres	21286,#3
1906  01f6               L3101:
1907                     ; 541 }
1910  01f6 81            	ret
1975                     ; 552 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1975                     ; 553 {
1976                     	switch	.text
1977  01f7               _TIM3_GenerateEvent:
1981                     ; 555   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1983                     ; 558   TIM3->EGR = (uint8_t)TIM3_EventSource;
1985  01f7 c75324        	ld	21284,a
1986                     ; 559 }
1989  01fa 81            	ret
2025                     ; 569 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2025                     ; 570 {
2026                     	switch	.text
2027  01fb               _TIM3_OC1PolarityConfig:
2031                     ; 572   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2033                     ; 575   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2035  01fb 4d            	tnz	a
2036  01fc 2706          	jreq	L3601
2037                     ; 577     TIM3->CCER1 |= TIM3_CCER1_CC1P;
2039  01fe 72125327      	bset	21287,#1
2041  0202 2004          	jra	L5601
2042  0204               L3601:
2043                     ; 581     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2045  0204 72135327      	bres	21287,#1
2046  0208               L5601:
2047                     ; 583 }
2050  0208 81            	ret
2086                     ; 593 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2086                     ; 594 {
2087                     	switch	.text
2088  0209               _TIM3_OC2PolarityConfig:
2092                     ; 596   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2094                     ; 599   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2096  0209 4d            	tnz	a
2097  020a 2706          	jreq	L5011
2098                     ; 601     TIM3->CCER1 |= TIM3_CCER1_CC2P;
2100  020c 721a5327      	bset	21287,#5
2102  0210 2004          	jra	L7011
2103  0212               L5011:
2104                     ; 605     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2106  0212 721b5327      	bres	21287,#5
2107  0216               L7011:
2108                     ; 607 }
2111  0216 81            	ret
2156                     ; 619 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2156                     ; 620 {
2157                     	switch	.text
2158  0217               _TIM3_CCxCmd:
2160  0217 89            	pushw	x
2161       00000000      OFST:	set	0
2164                     ; 622   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2166                     ; 623   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2168                     ; 625   if (TIM3_Channel == TIM3_CHANNEL_1)
2170  0218 9e            	ld	a,xh
2171  0219 4d            	tnz	a
2172  021a 2610          	jrne	L3311
2173                     ; 628     if (NewState != DISABLE)
2175  021c 9f            	ld	a,xl
2176  021d 4d            	tnz	a
2177  021e 2706          	jreq	L5311
2178                     ; 630       TIM3->CCER1 |= TIM3_CCER1_CC1E;
2180  0220 72105327      	bset	21287,#0
2182  0224 2014          	jra	L1411
2183  0226               L5311:
2184                     ; 634       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2186  0226 72115327      	bres	21287,#0
2187  022a 200e          	jra	L1411
2188  022c               L3311:
2189                     ; 641     if (NewState != DISABLE)
2191  022c 0d02          	tnz	(OFST+2,sp)
2192  022e 2706          	jreq	L3411
2193                     ; 643       TIM3->CCER1 |= TIM3_CCER1_CC2E;
2195  0230 72185327      	bset	21287,#4
2197  0234 2004          	jra	L1411
2198  0236               L3411:
2199                     ; 647       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2201  0236 72195327      	bres	21287,#4
2202  023a               L1411:
2203                     ; 650 }
2206  023a 85            	popw	x
2207  023b 81            	ret
2252                     ; 671 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2252                     ; 672 {
2253                     	switch	.text
2254  023c               _TIM3_SelectOCxM:
2256  023c 89            	pushw	x
2257       00000000      OFST:	set	0
2260                     ; 674   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2262                     ; 675   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2264                     ; 677   if (TIM3_Channel == TIM3_CHANNEL_1)
2266  023d 9e            	ld	a,xh
2267  023e 4d            	tnz	a
2268  023f 2610          	jrne	L1711
2269                     ; 680     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2271  0241 72115327      	bres	21287,#0
2272                     ; 683     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2274  0245 c65325        	ld	a,21285
2275  0248 a48f          	and	a,#143
2276  024a 1a02          	or	a,(OFST+2,sp)
2277  024c c75325        	ld	21285,a
2279  024f 200e          	jra	L3711
2280  0251               L1711:
2281                     ; 688     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2283  0251 72195327      	bres	21287,#4
2284                     ; 691     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2286  0255 c65326        	ld	a,21286
2287  0258 a48f          	and	a,#143
2288  025a 1a02          	or	a,(OFST+2,sp)
2289  025c c75326        	ld	21286,a
2290  025f               L3711:
2291                     ; 693 }
2294  025f 85            	popw	x
2295  0260 81            	ret
2329                     ; 701 void TIM3_SetCounter(uint16_t Counter)
2329                     ; 702 {
2330                     	switch	.text
2331  0261               _TIM3_SetCounter:
2335                     ; 704   TIM3->CNTRH = (uint8_t)(Counter >> 8);
2337  0261 9e            	ld	a,xh
2338  0262 c75328        	ld	21288,a
2339                     ; 705   TIM3->CNTRL = (uint8_t)(Counter);
2341  0265 9f            	ld	a,xl
2342  0266 c75329        	ld	21289,a
2343                     ; 706 }
2346  0269 81            	ret
2380                     ; 714 void TIM3_SetAutoreload(uint16_t Autoreload)
2380                     ; 715 {
2381                     	switch	.text
2382  026a               _TIM3_SetAutoreload:
2386                     ; 717   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
2388  026a 9e            	ld	a,xh
2389  026b c7532b        	ld	21291,a
2390                     ; 718   TIM3->ARRL = (uint8_t)(Autoreload);
2392  026e 9f            	ld	a,xl
2393  026f c7532c        	ld	21292,a
2394                     ; 719 }
2397  0272 81            	ret
2431                     ; 727 void TIM3_SetCompare1(uint16_t Compare1)
2431                     ; 728 {
2432                     	switch	.text
2433  0273               _TIM3_SetCompare1:
2437                     ; 730   TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
2439  0273 9e            	ld	a,xh
2440  0274 c7532d        	ld	21293,a
2441                     ; 731   TIM3->CCR1L = (uint8_t)(Compare1);
2443  0277 9f            	ld	a,xl
2444  0278 c7532e        	ld	21294,a
2445                     ; 732 }
2448  027b 81            	ret
2482                     ; 740 void TIM3_SetCompare2(uint16_t Compare2)
2482                     ; 741 {
2483                     	switch	.text
2484  027c               _TIM3_SetCompare2:
2488                     ; 743   TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
2490  027c 9e            	ld	a,xh
2491  027d c7532f        	ld	21295,a
2492                     ; 744   TIM3->CCR2L = (uint8_t)(Compare2);
2494  0280 9f            	ld	a,xl
2495  0281 c75330        	ld	21296,a
2496                     ; 745 }
2499  0284 81            	ret
2535                     ; 757 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2535                     ; 758 {
2536                     	switch	.text
2537  0285               _TIM3_SetIC1Prescaler:
2539  0285 88            	push	a
2540       00000000      OFST:	set	0
2543                     ; 760   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2545                     ; 763   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
2547  0286 c65325        	ld	a,21285
2548  0289 a4f3          	and	a,#243
2549  028b 1a01          	or	a,(OFST+1,sp)
2550  028d c75325        	ld	21285,a
2551                     ; 764 }
2554  0290 84            	pop	a
2555  0291 81            	ret
2591                     ; 776 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2591                     ; 777 {
2592                     	switch	.text
2593  0292               _TIM3_SetIC2Prescaler:
2595  0292 88            	push	a
2596       00000000      OFST:	set	0
2599                     ; 779   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2601                     ; 782   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
2603  0293 c65326        	ld	a,21286
2604  0296 a4f3          	and	a,#243
2605  0298 1a01          	or	a,(OFST+1,sp)
2606  029a c75326        	ld	21286,a
2607                     ; 783 }
2610  029d 84            	pop	a
2611  029e 81            	ret
2663                     ; 790 uint16_t TIM3_GetCapture1(void)
2663                     ; 791 {
2664                     	switch	.text
2665  029f               _TIM3_GetCapture1:
2667  029f 5204          	subw	sp,#4
2668       00000004      OFST:	set	4
2671                     ; 793   uint16_t tmpccr1 = 0;
2673                     ; 794   uint8_t tmpccr1l=0, tmpccr1h=0;
2677                     ; 796   tmpccr1h = TIM3->CCR1H;
2679  02a1 c6532d        	ld	a,21293
2680  02a4 6b02          	ld	(OFST-2,sp),a
2682                     ; 797   tmpccr1l = TIM3->CCR1L;
2684  02a6 c6532e        	ld	a,21294
2685  02a9 6b01          	ld	(OFST-3,sp),a
2687                     ; 799   tmpccr1 = (uint16_t)(tmpccr1l);
2689  02ab 7b01          	ld	a,(OFST-3,sp)
2690  02ad 5f            	clrw	x
2691  02ae 97            	ld	xl,a
2692  02af 1f03          	ldw	(OFST-1,sp),x
2694                     ; 800   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
2696  02b1 7b02          	ld	a,(OFST-2,sp)
2697  02b3 5f            	clrw	x
2698  02b4 97            	ld	xl,a
2699  02b5 4f            	clr	a
2700  02b6 02            	rlwa	x,a
2701  02b7 01            	rrwa	x,a
2702  02b8 1a04          	or	a,(OFST+0,sp)
2703  02ba 01            	rrwa	x,a
2704  02bb 1a03          	or	a,(OFST-1,sp)
2705  02bd 01            	rrwa	x,a
2706  02be 1f03          	ldw	(OFST-1,sp),x
2708                     ; 802   return (uint16_t)tmpccr1;
2710  02c0 1e03          	ldw	x,(OFST-1,sp)
2713  02c2 5b04          	addw	sp,#4
2714  02c4 81            	ret
2766                     ; 810 uint16_t TIM3_GetCapture2(void)
2766                     ; 811 {
2767                     	switch	.text
2768  02c5               _TIM3_GetCapture2:
2770  02c5 5204          	subw	sp,#4
2771       00000004      OFST:	set	4
2774                     ; 813   uint16_t tmpccr2 = 0;
2776                     ; 814   uint8_t tmpccr2l=0, tmpccr2h=0;
2780                     ; 816   tmpccr2h = TIM3->CCR2H;
2782  02c7 c6532f        	ld	a,21295
2783  02ca 6b02          	ld	(OFST-2,sp),a
2785                     ; 817   tmpccr2l = TIM3->CCR2L;
2787  02cc c65330        	ld	a,21296
2788  02cf 6b01          	ld	(OFST-3,sp),a
2790                     ; 819   tmpccr2 = (uint16_t)(tmpccr2l);
2792  02d1 7b01          	ld	a,(OFST-3,sp)
2793  02d3 5f            	clrw	x
2794  02d4 97            	ld	xl,a
2795  02d5 1f03          	ldw	(OFST-1,sp),x
2797                     ; 820   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
2799  02d7 7b02          	ld	a,(OFST-2,sp)
2800  02d9 5f            	clrw	x
2801  02da 97            	ld	xl,a
2802  02db 4f            	clr	a
2803  02dc 02            	rlwa	x,a
2804  02dd 01            	rrwa	x,a
2805  02de 1a04          	or	a,(OFST+0,sp)
2806  02e0 01            	rrwa	x,a
2807  02e1 1a03          	or	a,(OFST-1,sp)
2808  02e3 01            	rrwa	x,a
2809  02e4 1f03          	ldw	(OFST-1,sp),x
2811                     ; 822   return (uint16_t)tmpccr2;
2813  02e6 1e03          	ldw	x,(OFST-1,sp)
2816  02e8 5b04          	addw	sp,#4
2817  02ea 81            	ret
2851                     ; 830 uint16_t TIM3_GetCounter(void)
2851                     ; 831 {
2852                     	switch	.text
2853  02eb               _TIM3_GetCounter:
2855  02eb 89            	pushw	x
2856       00000002      OFST:	set	2
2859                     ; 832   uint16_t tmpcntr = 0;
2861                     ; 834   tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
2863  02ec c65328        	ld	a,21288
2864  02ef 5f            	clrw	x
2865  02f0 97            	ld	xl,a
2866  02f1 4f            	clr	a
2867  02f2 02            	rlwa	x,a
2868  02f3 1f01          	ldw	(OFST-1,sp),x
2870                     ; 836   return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
2872  02f5 c65329        	ld	a,21289
2873  02f8 5f            	clrw	x
2874  02f9 97            	ld	xl,a
2875  02fa 01            	rrwa	x,a
2876  02fb 1a02          	or	a,(OFST+0,sp)
2877  02fd 01            	rrwa	x,a
2878  02fe 1a01          	or	a,(OFST-1,sp)
2879  0300 01            	rrwa	x,a
2882  0301 5b02          	addw	sp,#2
2883  0303 81            	ret
2907                     ; 844 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2907                     ; 845 {
2908                     	switch	.text
2909  0304               _TIM3_GetPrescaler:
2913                     ; 847   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2915  0304 c6532a        	ld	a,21290
2918  0307 81            	ret
3043                     ; 861 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3043                     ; 862 {
3044                     	switch	.text
3045  0308               _TIM3_GetFlagStatus:
3047  0308 89            	pushw	x
3048  0309 89            	pushw	x
3049       00000002      OFST:	set	2
3052                     ; 863   FlagStatus bitstatus = RESET;
3054                     ; 864   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3058                     ; 867   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3060                     ; 869   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3062  030a 9f            	ld	a,xl
3063  030b c45322        	and	a,21282
3064  030e 6b01          	ld	(OFST-1,sp),a
3066                     ; 870   tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3068  0310 7b03          	ld	a,(OFST+1,sp)
3069  0312 6b02          	ld	(OFST+0,sp),a
3071                     ; 872   if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3073  0314 c65323        	ld	a,21283
3074  0317 1402          	and	a,(OFST+0,sp)
3075  0319 1a01          	or	a,(OFST-1,sp)
3076  031b 2706          	jreq	L3051
3077                     ; 874     bitstatus = SET;
3079  031d a601          	ld	a,#1
3080  031f 6b02          	ld	(OFST+0,sp),a
3083  0321 2002          	jra	L5051
3084  0323               L3051:
3085                     ; 878     bitstatus = RESET;
3087  0323 0f02          	clr	(OFST+0,sp)
3089  0325               L5051:
3090                     ; 880   return (FlagStatus)bitstatus;
3092  0325 7b02          	ld	a,(OFST+0,sp)
3095  0327 5b04          	addw	sp,#4
3096  0329 81            	ret
3131                     ; 894 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3131                     ; 895 {
3132                     	switch	.text
3133  032a               _TIM3_ClearFlag:
3135  032a 89            	pushw	x
3136       00000000      OFST:	set	0
3139                     ; 897   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3141                     ; 900   TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3143  032b 9f            	ld	a,xl
3144  032c 43            	cpl	a
3145  032d c75322        	ld	21282,a
3146                     ; 901   TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3148  0330 7b01          	ld	a,(OFST+1,sp)
3149  0332 43            	cpl	a
3150  0333 c75323        	ld	21283,a
3151                     ; 902 }
3154  0336 85            	popw	x
3155  0337 81            	ret
3219                     ; 913 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3219                     ; 914 {
3220                     	switch	.text
3221  0338               _TIM3_GetITStatus:
3223  0338 88            	push	a
3224  0339 89            	pushw	x
3225       00000002      OFST:	set	2
3228                     ; 915   ITStatus bitstatus = RESET;
3230                     ; 916   uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
3234                     ; 919   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3236                     ; 921   TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
3238  033a c45322        	and	a,21282
3239  033d 6b01          	ld	(OFST-1,sp),a
3241                     ; 923   TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
3243  033f c65321        	ld	a,21281
3244  0342 1403          	and	a,(OFST+1,sp)
3245  0344 6b02          	ld	(OFST+0,sp),a
3247                     ; 925   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
3249  0346 0d01          	tnz	(OFST-1,sp)
3250  0348 270a          	jreq	L7551
3252  034a 0d02          	tnz	(OFST+0,sp)
3253  034c 2706          	jreq	L7551
3254                     ; 927     bitstatus = SET;
3256  034e a601          	ld	a,#1
3257  0350 6b02          	ld	(OFST+0,sp),a
3260  0352 2002          	jra	L1651
3261  0354               L7551:
3262                     ; 931     bitstatus = RESET;
3264  0354 0f02          	clr	(OFST+0,sp)
3266  0356               L1651:
3267                     ; 933   return (ITStatus)(bitstatus);
3269  0356 7b02          	ld	a,(OFST+0,sp)
3272  0358 5b03          	addw	sp,#3
3273  035a 81            	ret
3309                     ; 945 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3309                     ; 946 {
3310                     	switch	.text
3311  035b               _TIM3_ClearITPendingBit:
3315                     ; 948   assert_param(IS_TIM3_IT_OK(TIM3_IT));
3317                     ; 951   TIM3->SR1 = (uint8_t)(~TIM3_IT);
3319  035b 43            	cpl	a
3320  035c c75322        	ld	21282,a
3321                     ; 952 }
3324  035f 81            	ret
3376                     ; 970 static void TI1_Config(uint8_t TIM3_ICPolarity,
3376                     ; 971                        uint8_t TIM3_ICSelection,
3376                     ; 972                        uint8_t TIM3_ICFilter)
3376                     ; 973 {
3377                     	switch	.text
3378  0360               L3_TI1_Config:
3380  0360 89            	pushw	x
3381  0361 88            	push	a
3382       00000001      OFST:	set	1
3385                     ; 975   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3387  0362 72115327      	bres	21287,#0
3388                     ; 978   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
3390  0366 7b06          	ld	a,(OFST+5,sp)
3391  0368 97            	ld	xl,a
3392  0369 a610          	ld	a,#16
3393  036b 42            	mul	x,a
3394  036c 9f            	ld	a,xl
3395  036d 1a03          	or	a,(OFST+2,sp)
3396  036f 6b01          	ld	(OFST+0,sp),a
3398  0371 c65325        	ld	a,21285
3399  0374 a40c          	and	a,#12
3400  0376 1a01          	or	a,(OFST+0,sp)
3401  0378 c75325        	ld	21285,a
3402                     ; 981   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3404  037b 0d02          	tnz	(OFST+1,sp)
3405  037d 2706          	jreq	L7261
3406                     ; 983     TIM3->CCER1 |= TIM3_CCER1_CC1P;
3408  037f 72125327      	bset	21287,#1
3410  0383 2004          	jra	L1361
3411  0385               L7261:
3412                     ; 987     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
3414  0385 72135327      	bres	21287,#1
3415  0389               L1361:
3416                     ; 990   TIM3->CCER1 |= TIM3_CCER1_CC1E;
3418  0389 72105327      	bset	21287,#0
3419                     ; 991 }
3422  038d 5b03          	addw	sp,#3
3423  038f 81            	ret
3475                     ; 1009 static void TI2_Config(uint8_t TIM3_ICPolarity,
3475                     ; 1010                        uint8_t TIM3_ICSelection,
3475                     ; 1011                        uint8_t TIM3_ICFilter)
3475                     ; 1012 {
3476                     	switch	.text
3477  0390               L5_TI2_Config:
3479  0390 89            	pushw	x
3480  0391 88            	push	a
3481       00000001      OFST:	set	1
3484                     ; 1014   TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
3486  0392 72195327      	bres	21287,#4
3487                     ; 1017   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
3487                     ; 1018                                                               TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
3487                     ; 1019                                                                                                 ((uint8_t)( TIM3_ICFilter << 4))));
3489  0396 7b06          	ld	a,(OFST+5,sp)
3490  0398 97            	ld	xl,a
3491  0399 a610          	ld	a,#16
3492  039b 42            	mul	x,a
3493  039c 9f            	ld	a,xl
3494  039d 1a03          	or	a,(OFST+2,sp)
3495  039f 6b01          	ld	(OFST+0,sp),a
3497  03a1 c65326        	ld	a,21286
3498  03a4 a40c          	and	a,#12
3499  03a6 1a01          	or	a,(OFST+0,sp)
3500  03a8 c75326        	ld	21286,a
3501                     ; 1022   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3503  03ab 0d02          	tnz	(OFST+1,sp)
3504  03ad 2706          	jreq	L1661
3505                     ; 1024     TIM3->CCER1 |= TIM3_CCER1_CC2P;
3507  03af 721a5327      	bset	21287,#5
3509  03b3 2004          	jra	L3661
3510  03b5               L1661:
3511                     ; 1028     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
3513  03b5 721b5327      	bres	21287,#5
3514  03b9               L3661:
3515                     ; 1032   TIM3->CCER1 |= TIM3_CCER1_CC2E;
3517  03b9 72185327      	bset	21287,#4
3518                     ; 1033 }
3521  03bd 5b03          	addw	sp,#3
3522  03bf 81            	ret
3535                     	xdef	_TIM3_ClearITPendingBit
3536                     	xdef	_TIM3_GetITStatus
3537                     	xdef	_TIM3_ClearFlag
3538                     	xdef	_TIM3_GetFlagStatus
3539                     	xdef	_TIM3_GetPrescaler
3540                     	xdef	_TIM3_GetCounter
3541                     	xdef	_TIM3_GetCapture2
3542                     	xdef	_TIM3_GetCapture1
3543                     	xdef	_TIM3_SetIC2Prescaler
3544                     	xdef	_TIM3_SetIC1Prescaler
3545                     	xdef	_TIM3_SetCompare2
3546                     	xdef	_TIM3_SetCompare1
3547                     	xdef	_TIM3_SetAutoreload
3548                     	xdef	_TIM3_SetCounter
3549                     	xdef	_TIM3_SelectOCxM
3550                     	xdef	_TIM3_CCxCmd
3551                     	xdef	_TIM3_OC2PolarityConfig
3552                     	xdef	_TIM3_OC1PolarityConfig
3553                     	xdef	_TIM3_GenerateEvent
3554                     	xdef	_TIM3_OC2PreloadConfig
3555                     	xdef	_TIM3_OC1PreloadConfig
3556                     	xdef	_TIM3_ARRPreloadConfig
3557                     	xdef	_TIM3_ForcedOC2Config
3558                     	xdef	_TIM3_ForcedOC1Config
3559                     	xdef	_TIM3_PrescalerConfig
3560                     	xdef	_TIM3_SelectOnePulseMode
3561                     	xdef	_TIM3_UpdateRequestConfig
3562                     	xdef	_TIM3_UpdateDisableConfig
3563                     	xdef	_TIM3_ITConfig
3564                     	xdef	_TIM3_Cmd
3565                     	xdef	_TIM3_PWMIConfig
3566                     	xdef	_TIM3_ICInit
3567                     	xdef	_TIM3_OC2Init
3568                     	xdef	_TIM3_OC1Init
3569                     	xdef	_TIM3_TimeBaseInit
3570                     	xdef	_TIM3_DeInit
3589                     	end
