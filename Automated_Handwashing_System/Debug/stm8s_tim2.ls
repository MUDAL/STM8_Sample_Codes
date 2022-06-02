   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 52 void TIM2_DeInit(void)
  41                     ; 53 {
  43                     	switch	.text
  44  0000               _TIM2_DeInit:
  48                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  50  0000 725f5300      	clr	21248
  51                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  53  0004 725f5301      	clr	21249
  54                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  56  0008 725f5303      	clr	21251
  57                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  59  000c 725f5308      	clr	21256
  60                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  62  0010 725f5309      	clr	21257
  63                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  65  0014 725f5308      	clr	21256
  66                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  68  0018 725f5309      	clr	21257
  69                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  71  001c 725f5305      	clr	21253
  72                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  74  0020 725f5306      	clr	21254
  75                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  77  0024 725f5307      	clr	21255
  78                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  80  0028 725f530a      	clr	21258
  81                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  83  002c 725f530b      	clr	21259
  84                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  86  0030 725f530c      	clr	21260
  87                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  89  0034 35ff530d      	mov	21261,#255
  90                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  92  0038 35ff530e      	mov	21262,#255
  93                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  95  003c 725f530f      	clr	21263
  96                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
  98  0040 725f5310      	clr	21264
  99                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 101  0044 725f5311      	clr	21265
 102                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 104  0048 725f5312      	clr	21266
 105                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 107  004c 725f5313      	clr	21267
 108                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 110  0050 725f5314      	clr	21268
 111                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 113  0054 725f5302      	clr	21250
 114                     ; 81 }
 117  0058 81            	ret
 285                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 285                     ; 90                         uint16_t TIM2_Period)
 285                     ; 91 {
 286                     	switch	.text
 287  0059               _TIM2_TimeBaseInit:
 289  0059 88            	push	a
 290       00000000      OFST:	set	0
 293                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 295  005a c7530c        	ld	21260,a
 296                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 298  005d 7b04          	ld	a,(OFST+4,sp)
 299  005f c7530d        	ld	21261,a
 300                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 302  0062 7b05          	ld	a,(OFST+5,sp)
 303  0064 c7530e        	ld	21262,a
 304                     ; 97 }
 307  0067 84            	pop	a
 308  0068 81            	ret
 465                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 465                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 465                     ; 110                   uint16_t TIM2_Pulse,
 465                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 465                     ; 112 {
 466                     	switch	.text
 467  0069               _TIM2_OC1Init:
 469  0069 89            	pushw	x
 470  006a 88            	push	a
 471       00000001      OFST:	set	1
 474                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 476                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 478                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 480                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 482  006b c65308        	ld	a,21256
 483  006e a4fc          	and	a,#252
 484  0070 c75308        	ld	21256,a
 485                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 485                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 487  0073 7b08          	ld	a,(OFST+7,sp)
 488  0075 a402          	and	a,#2
 489  0077 6b01          	ld	(OFST+0,sp),a
 491  0079 9f            	ld	a,xl
 492  007a a401          	and	a,#1
 493  007c 1a01          	or	a,(OFST+0,sp)
 494  007e ca5308        	or	a,21256
 495  0081 c75308        	ld	21256,a
 496                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 496                     ; 126                           (uint8_t)TIM2_OCMode);
 498  0084 c65305        	ld	a,21253
 499  0087 a48f          	and	a,#143
 500  0089 1a02          	or	a,(OFST+1,sp)
 501  008b c75305        	ld	21253,a
 502                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 504  008e 7b06          	ld	a,(OFST+5,sp)
 505  0090 c7530f        	ld	21263,a
 506                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 508  0093 7b07          	ld	a,(OFST+6,sp)
 509  0095 c75310        	ld	21264,a
 510                     ; 131 }
 513  0098 5b03          	addw	sp,#3
 514  009a 81            	ret
 578                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 578                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 578                     ; 144                   uint16_t TIM2_Pulse,
 578                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 578                     ; 146 {
 579                     	switch	.text
 580  009b               _TIM2_OC2Init:
 582  009b 89            	pushw	x
 583  009c 88            	push	a
 584       00000001      OFST:	set	1
 587                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 589                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 591                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 593                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 595  009d c65308        	ld	a,21256
 596  00a0 a4cf          	and	a,#207
 597  00a2 c75308        	ld	21256,a
 598                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 598                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 600  00a5 7b08          	ld	a,(OFST+7,sp)
 601  00a7 a420          	and	a,#32
 602  00a9 6b01          	ld	(OFST+0,sp),a
 604  00ab 9f            	ld	a,xl
 605  00ac a410          	and	a,#16
 606  00ae 1a01          	or	a,(OFST+0,sp)
 607  00b0 ca5308        	or	a,21256
 608  00b3 c75308        	ld	21256,a
 609                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 609                     ; 162                           (uint8_t)TIM2_OCMode);
 611  00b6 c65306        	ld	a,21254
 612  00b9 a48f          	and	a,#143
 613  00bb 1a02          	or	a,(OFST+1,sp)
 614  00bd c75306        	ld	21254,a
 615                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 617  00c0 7b06          	ld	a,(OFST+5,sp)
 618  00c2 c75311        	ld	21265,a
 619                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 621  00c5 7b07          	ld	a,(OFST+6,sp)
 622  00c7 c75312        	ld	21266,a
 623                     ; 168 }
 626  00ca 5b03          	addw	sp,#3
 627  00cc 81            	ret
 691                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 691                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 691                     ; 181                   uint16_t TIM2_Pulse,
 691                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 691                     ; 183 {
 692                     	switch	.text
 693  00cd               _TIM2_OC3Init:
 695  00cd 89            	pushw	x
 696  00ce 88            	push	a
 697       00000001      OFST:	set	1
 700                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 702                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 704                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 706                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 708  00cf c65309        	ld	a,21257
 709  00d2 a4fc          	and	a,#252
 710  00d4 c75309        	ld	21257,a
 711                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 711                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 713  00d7 7b08          	ld	a,(OFST+7,sp)
 714  00d9 a402          	and	a,#2
 715  00db 6b01          	ld	(OFST+0,sp),a
 717  00dd 9f            	ld	a,xl
 718  00de a401          	and	a,#1
 719  00e0 1a01          	or	a,(OFST+0,sp)
 720  00e2 ca5309        	or	a,21257
 721  00e5 c75309        	ld	21257,a
 722                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 722                     ; 196                           (uint8_t)TIM2_OCMode);
 724  00e8 c65307        	ld	a,21255
 725  00eb a48f          	and	a,#143
 726  00ed 1a02          	or	a,(OFST+1,sp)
 727  00ef c75307        	ld	21255,a
 728                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 730  00f2 7b06          	ld	a,(OFST+5,sp)
 731  00f4 c75313        	ld	21267,a
 732                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 734  00f7 7b07          	ld	a,(OFST+6,sp)
 735  00f9 c75314        	ld	21268,a
 736                     ; 201 }
 739  00fc 5b03          	addw	sp,#3
 740  00fe 81            	ret
 933                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 933                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 933                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 933                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 933                     ; 216                  uint8_t TIM2_ICFilter)
 933                     ; 217 {
 934                     	switch	.text
 935  00ff               _TIM2_ICInit:
 937  00ff 89            	pushw	x
 938       00000000      OFST:	set	0
 941                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 943                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 945                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 947                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 949                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 951                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 953  0100 9e            	ld	a,xh
 954  0101 4d            	tnz	a
 955  0102 2614          	jrne	L104
 956                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 956                     ; 229                (uint8_t)TIM2_ICSelection,
 956                     ; 230                (uint8_t)TIM2_ICFilter);
 958  0104 7b07          	ld	a,(OFST+7,sp)
 959  0106 88            	push	a
 960  0107 7b06          	ld	a,(OFST+6,sp)
 961  0109 97            	ld	xl,a
 962  010a 7b03          	ld	a,(OFST+3,sp)
 963  010c 95            	ld	xh,a
 964  010d cd044a        	call	L3_TI1_Config
 966  0110 84            	pop	a
 967                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 969  0111 7b06          	ld	a,(OFST+6,sp)
 970  0113 cd0340        	call	_TIM2_SetIC1Prescaler
 973  0116 202c          	jra	L304
 974  0118               L104:
 975                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 977  0118 7b01          	ld	a,(OFST+1,sp)
 978  011a a101          	cp	a,#1
 979  011c 2614          	jrne	L504
 980                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 980                     ; 239                (uint8_t)TIM2_ICSelection,
 980                     ; 240                (uint8_t)TIM2_ICFilter);
 982  011e 7b07          	ld	a,(OFST+7,sp)
 983  0120 88            	push	a
 984  0121 7b06          	ld	a,(OFST+6,sp)
 985  0123 97            	ld	xl,a
 986  0124 7b03          	ld	a,(OFST+3,sp)
 987  0126 95            	ld	xh,a
 988  0127 cd047a        	call	L5_TI2_Config
 990  012a 84            	pop	a
 991                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 993  012b 7b06          	ld	a,(OFST+6,sp)
 994  012d cd034d        	call	_TIM2_SetIC2Prescaler
 997  0130 2012          	jra	L304
 998  0132               L504:
 999                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
 999                     ; 249                (uint8_t)TIM2_ICSelection,
 999                     ; 250                (uint8_t)TIM2_ICFilter);
1001  0132 7b07          	ld	a,(OFST+7,sp)
1002  0134 88            	push	a
1003  0135 7b06          	ld	a,(OFST+6,sp)
1004  0137 97            	ld	xl,a
1005  0138 7b03          	ld	a,(OFST+3,sp)
1006  013a 95            	ld	xh,a
1007  013b cd04aa        	call	L7_TI3_Config
1009  013e 84            	pop	a
1010                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1012  013f 7b06          	ld	a,(OFST+6,sp)
1013  0141 cd035a        	call	_TIM2_SetIC3Prescaler
1015  0144               L304:
1016                     ; 255 }
1019  0144 85            	popw	x
1020  0145 81            	ret
1116                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1116                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1116                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1116                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1116                     ; 270                      uint8_t TIM2_ICFilter)
1116                     ; 271 {
1117                     	switch	.text
1118  0146               _TIM2_PWMIConfig:
1120  0146 89            	pushw	x
1121  0147 89            	pushw	x
1122       00000002      OFST:	set	2
1125                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1127                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1129                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1131                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1133                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1135                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1137                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1139  0148 9f            	ld	a,xl
1140  0149 a144          	cp	a,#68
1141  014b 2706          	jreq	L754
1142                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1144  014d a644          	ld	a,#68
1145  014f 6b01          	ld	(OFST-1,sp),a
1148  0151 2002          	jra	L164
1149  0153               L754:
1150                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1152  0153 0f01          	clr	(OFST-1,sp)
1154  0155               L164:
1155                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1157  0155 7b07          	ld	a,(OFST+5,sp)
1158  0157 a101          	cp	a,#1
1159  0159 2606          	jrne	L364
1160                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1162  015b a602          	ld	a,#2
1163  015d 6b02          	ld	(OFST+0,sp),a
1166  015f 2004          	jra	L564
1167  0161               L364:
1168                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1170  0161 a601          	ld	a,#1
1171  0163 6b02          	ld	(OFST+0,sp),a
1173  0165               L564:
1174                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1176  0165 0d03          	tnz	(OFST+1,sp)
1177  0167 2626          	jrne	L764
1178                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1178                     ; 305                (uint8_t)TIM2_ICFilter);
1180  0169 7b09          	ld	a,(OFST+7,sp)
1181  016b 88            	push	a
1182  016c 7b08          	ld	a,(OFST+6,sp)
1183  016e 97            	ld	xl,a
1184  016f 7b05          	ld	a,(OFST+3,sp)
1185  0171 95            	ld	xh,a
1186  0172 cd044a        	call	L3_TI1_Config
1188  0175 84            	pop	a
1189                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1191  0176 7b08          	ld	a,(OFST+6,sp)
1192  0178 cd0340        	call	_TIM2_SetIC1Prescaler
1194                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1196  017b 7b09          	ld	a,(OFST+7,sp)
1197  017d 88            	push	a
1198  017e 7b03          	ld	a,(OFST+1,sp)
1199  0180 97            	ld	xl,a
1200  0181 7b02          	ld	a,(OFST+0,sp)
1201  0183 95            	ld	xh,a
1202  0184 cd047a        	call	L5_TI2_Config
1204  0187 84            	pop	a
1205                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1207  0188 7b08          	ld	a,(OFST+6,sp)
1208  018a cd034d        	call	_TIM2_SetIC2Prescaler
1211  018d 2024          	jra	L174
1212  018f               L764:
1213                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1213                     ; 320                (uint8_t)TIM2_ICFilter);
1215  018f 7b09          	ld	a,(OFST+7,sp)
1216  0191 88            	push	a
1217  0192 7b08          	ld	a,(OFST+6,sp)
1218  0194 97            	ld	xl,a
1219  0195 7b05          	ld	a,(OFST+3,sp)
1220  0197 95            	ld	xh,a
1221  0198 cd047a        	call	L5_TI2_Config
1223  019b 84            	pop	a
1224                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1226  019c 7b08          	ld	a,(OFST+6,sp)
1227  019e cd034d        	call	_TIM2_SetIC2Prescaler
1229                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1231  01a1 7b09          	ld	a,(OFST+7,sp)
1232  01a3 88            	push	a
1233  01a4 7b03          	ld	a,(OFST+1,sp)
1234  01a6 97            	ld	xl,a
1235  01a7 7b02          	ld	a,(OFST+0,sp)
1236  01a9 95            	ld	xh,a
1237  01aa cd044a        	call	L3_TI1_Config
1239  01ad 84            	pop	a
1240                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1242  01ae 7b08          	ld	a,(OFST+6,sp)
1243  01b0 cd0340        	call	_TIM2_SetIC1Prescaler
1245  01b3               L174:
1246                     ; 331 }
1249  01b3 5b04          	addw	sp,#4
1250  01b5 81            	ret
1305                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1305                     ; 340 {
1306                     	switch	.text
1307  01b6               _TIM2_Cmd:
1311                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1313                     ; 345   if (NewState != DISABLE)
1315  01b6 4d            	tnz	a
1316  01b7 2706          	jreq	L125
1317                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1319  01b9 72105300      	bset	21248,#0
1321  01bd 2004          	jra	L325
1322  01bf               L125:
1323                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1325  01bf 72115300      	bres	21248,#0
1326  01c3               L325:
1327                     ; 353 }
1330  01c3 81            	ret
1409                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1409                     ; 369 {
1410                     	switch	.text
1411  01c4               _TIM2_ITConfig:
1413  01c4 89            	pushw	x
1414       00000000      OFST:	set	0
1417                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1419                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1421                     ; 374   if (NewState != DISABLE)
1423  01c5 9f            	ld	a,xl
1424  01c6 4d            	tnz	a
1425  01c7 2709          	jreq	L365
1426                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1428  01c9 9e            	ld	a,xh
1429  01ca ca5301        	or	a,21249
1430  01cd c75301        	ld	21249,a
1432  01d0 2009          	jra	L565
1433  01d2               L365:
1434                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1436  01d2 7b01          	ld	a,(OFST+1,sp)
1437  01d4 43            	cpl	a
1438  01d5 c45301        	and	a,21249
1439  01d8 c75301        	ld	21249,a
1440  01db               L565:
1441                     ; 384 }
1444  01db 85            	popw	x
1445  01dc 81            	ret
1481                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1481                     ; 393 {
1482                     	switch	.text
1483  01dd               _TIM2_UpdateDisableConfig:
1487                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1489                     ; 398   if (NewState != DISABLE)
1491  01dd 4d            	tnz	a
1492  01de 2706          	jreq	L506
1493                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1495  01e0 72125300      	bset	21248,#1
1497  01e4 2004          	jra	L706
1498  01e6               L506:
1499                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1501  01e6 72135300      	bres	21248,#1
1502  01ea               L706:
1503                     ; 406 }
1506  01ea 81            	ret
1564                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1564                     ; 417 {
1565                     	switch	.text
1566  01eb               _TIM2_UpdateRequestConfig:
1570                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1572                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1574  01eb 4d            	tnz	a
1575  01ec 2706          	jreq	L736
1576                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1578  01ee 72145300      	bset	21248,#2
1580  01f2 2004          	jra	L146
1581  01f4               L736:
1582                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1584  01f4 72155300      	bres	21248,#2
1585  01f8               L146:
1586                     ; 430 }
1589  01f8 81            	ret
1646                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1646                     ; 441 {
1647                     	switch	.text
1648  01f9               _TIM2_SelectOnePulseMode:
1652                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1654                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1656  01f9 4d            	tnz	a
1657  01fa 2706          	jreq	L176
1658                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1660  01fc 72165300      	bset	21248,#3
1662  0200 2004          	jra	L376
1663  0202               L176:
1664                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1666  0202 72175300      	bres	21248,#3
1667  0206               L376:
1668                     ; 454 }
1671  0206 81            	ret
1739                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1739                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1739                     ; 486 {
1740                     	switch	.text
1741  0207               _TIM2_PrescalerConfig:
1745                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1747                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1749                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1751  0207 9e            	ld	a,xh
1752  0208 c7530c        	ld	21260,a
1753                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1755  020b 9f            	ld	a,xl
1756  020c c75304        	ld	21252,a
1757                     ; 496 }
1760  020f 81            	ret
1818                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1818                     ; 508 {
1819                     	switch	.text
1820  0210               _TIM2_ForcedOC1Config:
1822  0210 88            	push	a
1823       00000000      OFST:	set	0
1826                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1828                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1828                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1830  0211 c65305        	ld	a,21253
1831  0214 a48f          	and	a,#143
1832  0216 1a01          	or	a,(OFST+1,sp)
1833  0218 c75305        	ld	21253,a
1834                     ; 515 }
1837  021b 84            	pop	a
1838  021c 81            	ret
1874                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1874                     ; 527 {
1875                     	switch	.text
1876  021d               _TIM2_ForcedOC2Config:
1878  021d 88            	push	a
1879       00000000      OFST:	set	0
1882                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1884                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1884                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1886  021e c65306        	ld	a,21254
1887  0221 a48f          	and	a,#143
1888  0223 1a01          	or	a,(OFST+1,sp)
1889  0225 c75306        	ld	21254,a
1890                     ; 534 }
1893  0228 84            	pop	a
1894  0229 81            	ret
1930                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1930                     ; 546 {
1931                     	switch	.text
1932  022a               _TIM2_ForcedOC3Config:
1934  022a 88            	push	a
1935       00000000      OFST:	set	0
1938                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1940                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1940                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1942  022b c65307        	ld	a,21255
1943  022e a48f          	and	a,#143
1944  0230 1a01          	or	a,(OFST+1,sp)
1945  0232 c75307        	ld	21255,a
1946                     ; 553 }
1949  0235 84            	pop	a
1950  0236 81            	ret
1986                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1986                     ; 562 {
1987                     	switch	.text
1988  0237               _TIM2_ARRPreloadConfig:
1992                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1994                     ; 567   if (NewState != DISABLE)
1996  0237 4d            	tnz	a
1997  0238 2706          	jreq	L7201
1998                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2000  023a 721e5300      	bset	21248,#7
2002  023e 2004          	jra	L1301
2003  0240               L7201:
2004                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2006  0240 721f5300      	bres	21248,#7
2007  0244               L1301:
2008                     ; 575 }
2011  0244 81            	ret
2047                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2047                     ; 584 {
2048                     	switch	.text
2049  0245               _TIM2_OC1PreloadConfig:
2053                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2055                     ; 589   if (NewState != DISABLE)
2057  0245 4d            	tnz	a
2058  0246 2706          	jreq	L1501
2059                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2061  0248 72165305      	bset	21253,#3
2063  024c 2004          	jra	L3501
2064  024e               L1501:
2065                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2067  024e 72175305      	bres	21253,#3
2068  0252               L3501:
2069                     ; 597 }
2072  0252 81            	ret
2108                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2108                     ; 606 {
2109                     	switch	.text
2110  0253               _TIM2_OC2PreloadConfig:
2114                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2116                     ; 611   if (NewState != DISABLE)
2118  0253 4d            	tnz	a
2119  0254 2706          	jreq	L3701
2120                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2122  0256 72165306      	bset	21254,#3
2124  025a 2004          	jra	L5701
2125  025c               L3701:
2126                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2128  025c 72175306      	bres	21254,#3
2129  0260               L5701:
2130                     ; 619 }
2133  0260 81            	ret
2169                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2169                     ; 628 {
2170                     	switch	.text
2171  0261               _TIM2_OC3PreloadConfig:
2175                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2177                     ; 633   if (NewState != DISABLE)
2179  0261 4d            	tnz	a
2180  0262 2706          	jreq	L5111
2181                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2183  0264 72165307      	bset	21255,#3
2185  0268 2004          	jra	L7111
2186  026a               L5111:
2187                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2189  026a 72175307      	bres	21255,#3
2190  026e               L7111:
2191                     ; 641 }
2194  026e 81            	ret
2267                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2267                     ; 654 {
2268                     	switch	.text
2269  026f               _TIM2_GenerateEvent:
2273                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2275                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2277  026f c75304        	ld	21252,a
2278                     ; 660 }
2281  0272 81            	ret
2317                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2317                     ; 671 {
2318                     	switch	.text
2319  0273               _TIM2_OC1PolarityConfig:
2323                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2325                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2327  0273 4d            	tnz	a
2328  0274 2706          	jreq	L1711
2329                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2331  0276 72125308      	bset	21256,#1
2333  027a 2004          	jra	L3711
2334  027c               L1711:
2335                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2337  027c 72135308      	bres	21256,#1
2338  0280               L3711:
2339                     ; 684 }
2342  0280 81            	ret
2378                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2378                     ; 695 {
2379                     	switch	.text
2380  0281               _TIM2_OC2PolarityConfig:
2384                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2386                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2388  0281 4d            	tnz	a
2389  0282 2706          	jreq	L3121
2390                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2392  0284 721a5308      	bset	21256,#5
2394  0288 2004          	jra	L5121
2395  028a               L3121:
2396                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2398  028a 721b5308      	bres	21256,#5
2399  028e               L5121:
2400                     ; 708 }
2403  028e 81            	ret
2439                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2439                     ; 719 {
2440                     	switch	.text
2441  028f               _TIM2_OC3PolarityConfig:
2445                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2447                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2449  028f 4d            	tnz	a
2450  0290 2706          	jreq	L5321
2451                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2453  0292 72125309      	bset	21257,#1
2455  0296 2004          	jra	L7321
2456  0298               L5321:
2457                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2459  0298 72135309      	bres	21257,#1
2460  029c               L7321:
2461                     ; 732 }
2464  029c 81            	ret
2509                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2509                     ; 746 {
2510                     	switch	.text
2511  029d               _TIM2_CCxCmd:
2513  029d 89            	pushw	x
2514       00000000      OFST:	set	0
2517                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2519                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2521                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2523  029e 9e            	ld	a,xh
2524  029f 4d            	tnz	a
2525  02a0 2610          	jrne	L3621
2526                     ; 754     if (NewState != DISABLE)
2528  02a2 9f            	ld	a,xl
2529  02a3 4d            	tnz	a
2530  02a4 2706          	jreq	L5621
2531                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2533  02a6 72105308      	bset	21256,#0
2535  02aa 202a          	jra	L1721
2536  02ac               L5621:
2537                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2539  02ac 72115308      	bres	21256,#0
2540  02b0 2024          	jra	L1721
2541  02b2               L3621:
2542                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2544  02b2 7b01          	ld	a,(OFST+1,sp)
2545  02b4 a101          	cp	a,#1
2546  02b6 2610          	jrne	L3721
2547                     ; 767     if (NewState != DISABLE)
2549  02b8 0d02          	tnz	(OFST+2,sp)
2550  02ba 2706          	jreq	L5721
2551                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2553  02bc 72185308      	bset	21256,#4
2555  02c0 2014          	jra	L1721
2556  02c2               L5721:
2557                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2559  02c2 72195308      	bres	21256,#4
2560  02c6 200e          	jra	L1721
2561  02c8               L3721:
2562                     ; 779     if (NewState != DISABLE)
2564  02c8 0d02          	tnz	(OFST+2,sp)
2565  02ca 2706          	jreq	L3031
2566                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2568  02cc 72105309      	bset	21257,#0
2570  02d0 2004          	jra	L1721
2571  02d2               L3031:
2572                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2574  02d2 72115309      	bres	21257,#0
2575  02d6               L1721:
2576                     ; 788 }
2579  02d6 85            	popw	x
2580  02d7 81            	ret
2625                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2625                     ; 811 {
2626                     	switch	.text
2627  02d8               _TIM2_SelectOCxM:
2629  02d8 89            	pushw	x
2630       00000000      OFST:	set	0
2633                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2635                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2637                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2639  02d9 9e            	ld	a,xh
2640  02da 4d            	tnz	a
2641  02db 2610          	jrne	L1331
2642                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2644  02dd 72115308      	bres	21256,#0
2645                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2645                     ; 823                             | (uint8_t)TIM2_OCMode);
2647  02e1 c65305        	ld	a,21253
2648  02e4 a48f          	and	a,#143
2649  02e6 1a02          	or	a,(OFST+2,sp)
2650  02e8 c75305        	ld	21253,a
2652  02eb 2024          	jra	L3331
2653  02ed               L1331:
2654                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2656  02ed 7b01          	ld	a,(OFST+1,sp)
2657  02ef a101          	cp	a,#1
2658  02f1 2610          	jrne	L5331
2659                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2661  02f3 72195308      	bres	21256,#4
2662                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2662                     ; 832                             | (uint8_t)TIM2_OCMode);
2664  02f7 c65306        	ld	a,21254
2665  02fa a48f          	and	a,#143
2666  02fc 1a02          	or	a,(OFST+2,sp)
2667  02fe c75306        	ld	21254,a
2669  0301 200e          	jra	L3331
2670  0303               L5331:
2671                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2673  0303 72115309      	bres	21257,#0
2674                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2674                     ; 841                             | (uint8_t)TIM2_OCMode);
2676  0307 c65307        	ld	a,21255
2677  030a a48f          	and	a,#143
2678  030c 1a02          	or	a,(OFST+2,sp)
2679  030e c75307        	ld	21255,a
2680  0311               L3331:
2681                     ; 843 }
2684  0311 85            	popw	x
2685  0312 81            	ret
2719                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2719                     ; 852 {
2720                     	switch	.text
2721  0313               _TIM2_SetCounter:
2725                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2727  0313 9e            	ld	a,xh
2728  0314 c7530a        	ld	21258,a
2729                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2731  0317 9f            	ld	a,xl
2732  0318 c7530b        	ld	21259,a
2733                     ; 856 }
2736  031b 81            	ret
2770                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2770                     ; 865 {
2771                     	switch	.text
2772  031c               _TIM2_SetAutoreload:
2776                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2778  031c 9e            	ld	a,xh
2779  031d c7530d        	ld	21261,a
2780                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2782  0320 9f            	ld	a,xl
2783  0321 c7530e        	ld	21262,a
2784                     ; 869 }
2787  0324 81            	ret
2821                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2821                     ; 878 {
2822                     	switch	.text
2823  0325               _TIM2_SetCompare1:
2827                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2829  0325 9e            	ld	a,xh
2830  0326 c7530f        	ld	21263,a
2831                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2833  0329 9f            	ld	a,xl
2834  032a c75310        	ld	21264,a
2835                     ; 882 }
2838  032d 81            	ret
2872                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2872                     ; 891 {
2873                     	switch	.text
2874  032e               _TIM2_SetCompare2:
2878                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2880  032e 9e            	ld	a,xh
2881  032f c75311        	ld	21265,a
2882                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2884  0332 9f            	ld	a,xl
2885  0333 c75312        	ld	21266,a
2886                     ; 895 }
2889  0336 81            	ret
2923                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2923                     ; 904 {
2924                     	switch	.text
2925  0337               _TIM2_SetCompare3:
2929                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2931  0337 9e            	ld	a,xh
2932  0338 c75313        	ld	21267,a
2933                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2935  033b 9f            	ld	a,xl
2936  033c c75314        	ld	21268,a
2937                     ; 908 }
2940  033f 81            	ret
2976                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2976                     ; 921 {
2977                     	switch	.text
2978  0340               _TIM2_SetIC1Prescaler:
2980  0340 88            	push	a
2981       00000000      OFST:	set	0
2984                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2986                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2986                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2988  0341 c65305        	ld	a,21253
2989  0344 a4f3          	and	a,#243
2990  0346 1a01          	or	a,(OFST+1,sp)
2991  0348 c75305        	ld	21253,a
2992                     ; 928 }
2995  034b 84            	pop	a
2996  034c 81            	ret
3032                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3032                     ; 941 {
3033                     	switch	.text
3034  034d               _TIM2_SetIC2Prescaler:
3036  034d 88            	push	a
3037       00000000      OFST:	set	0
3040                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3042                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3042                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3044  034e c65306        	ld	a,21254
3045  0351 a4f3          	and	a,#243
3046  0353 1a01          	or	a,(OFST+1,sp)
3047  0355 c75306        	ld	21254,a
3048                     ; 948 }
3051  0358 84            	pop	a
3052  0359 81            	ret
3088                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3088                     ; 961 {
3089                     	switch	.text
3090  035a               _TIM2_SetIC3Prescaler:
3092  035a 88            	push	a
3093       00000000      OFST:	set	0
3096                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3098                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3098                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3100  035b c65307        	ld	a,21255
3101  035e a4f3          	and	a,#243
3102  0360 1a01          	or	a,(OFST+1,sp)
3103  0362 c75307        	ld	21255,a
3104                     ; 968 }
3107  0365 84            	pop	a
3108  0366 81            	ret
3160                     ; 975 uint16_t TIM2_GetCapture1(void)
3160                     ; 976 {
3161                     	switch	.text
3162  0367               _TIM2_GetCapture1:
3164  0367 5204          	subw	sp,#4
3165       00000004      OFST:	set	4
3168                     ; 978   uint16_t tmpccr1 = 0;
3170                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3174                     ; 981   tmpccr1h = TIM2->CCR1H;
3176  0369 c6530f        	ld	a,21263
3177  036c 6b02          	ld	(OFST-2,sp),a
3179                     ; 982   tmpccr1l = TIM2->CCR1L;
3181  036e c65310        	ld	a,21264
3182  0371 6b01          	ld	(OFST-3,sp),a
3184                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3186  0373 7b01          	ld	a,(OFST-3,sp)
3187  0375 5f            	clrw	x
3188  0376 97            	ld	xl,a
3189  0377 1f03          	ldw	(OFST-1,sp),x
3191                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3193  0379 7b02          	ld	a,(OFST-2,sp)
3194  037b 5f            	clrw	x
3195  037c 97            	ld	xl,a
3196  037d 4f            	clr	a
3197  037e 02            	rlwa	x,a
3198  037f 01            	rrwa	x,a
3199  0380 1a04          	or	a,(OFST+0,sp)
3200  0382 01            	rrwa	x,a
3201  0383 1a03          	or	a,(OFST-1,sp)
3202  0385 01            	rrwa	x,a
3203  0386 1f03          	ldw	(OFST-1,sp),x
3205                     ; 987   return (uint16_t)tmpccr1;
3207  0388 1e03          	ldw	x,(OFST-1,sp)
3210  038a 5b04          	addw	sp,#4
3211  038c 81            	ret
3263                     ; 995 uint16_t TIM2_GetCapture2(void)
3263                     ; 996 {
3264                     	switch	.text
3265  038d               _TIM2_GetCapture2:
3267  038d 5204          	subw	sp,#4
3268       00000004      OFST:	set	4
3271                     ; 998   uint16_t tmpccr2 = 0;
3273                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3277                     ; 1001   tmpccr2h = TIM2->CCR2H;
3279  038f c65311        	ld	a,21265
3280  0392 6b02          	ld	(OFST-2,sp),a
3282                     ; 1002   tmpccr2l = TIM2->CCR2L;
3284  0394 c65312        	ld	a,21266
3285  0397 6b01          	ld	(OFST-3,sp),a
3287                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3289  0399 7b01          	ld	a,(OFST-3,sp)
3290  039b 5f            	clrw	x
3291  039c 97            	ld	xl,a
3292  039d 1f03          	ldw	(OFST-1,sp),x
3294                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3296  039f 7b02          	ld	a,(OFST-2,sp)
3297  03a1 5f            	clrw	x
3298  03a2 97            	ld	xl,a
3299  03a3 4f            	clr	a
3300  03a4 02            	rlwa	x,a
3301  03a5 01            	rrwa	x,a
3302  03a6 1a04          	or	a,(OFST+0,sp)
3303  03a8 01            	rrwa	x,a
3304  03a9 1a03          	or	a,(OFST-1,sp)
3305  03ab 01            	rrwa	x,a
3306  03ac 1f03          	ldw	(OFST-1,sp),x
3308                     ; 1007   return (uint16_t)tmpccr2;
3310  03ae 1e03          	ldw	x,(OFST-1,sp)
3313  03b0 5b04          	addw	sp,#4
3314  03b2 81            	ret
3366                     ; 1015 uint16_t TIM2_GetCapture3(void)
3366                     ; 1016 {
3367                     	switch	.text
3368  03b3               _TIM2_GetCapture3:
3370  03b3 5204          	subw	sp,#4
3371       00000004      OFST:	set	4
3374                     ; 1018   uint16_t tmpccr3 = 0;
3376                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3380                     ; 1021   tmpccr3h = TIM2->CCR3H;
3382  03b5 c65313        	ld	a,21267
3383  03b8 6b02          	ld	(OFST-2,sp),a
3385                     ; 1022   tmpccr3l = TIM2->CCR3L;
3387  03ba c65314        	ld	a,21268
3388  03bd 6b01          	ld	(OFST-3,sp),a
3390                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3392  03bf 7b01          	ld	a,(OFST-3,sp)
3393  03c1 5f            	clrw	x
3394  03c2 97            	ld	xl,a
3395  03c3 1f03          	ldw	(OFST-1,sp),x
3397                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3399  03c5 7b02          	ld	a,(OFST-2,sp)
3400  03c7 5f            	clrw	x
3401  03c8 97            	ld	xl,a
3402  03c9 4f            	clr	a
3403  03ca 02            	rlwa	x,a
3404  03cb 01            	rrwa	x,a
3405  03cc 1a04          	or	a,(OFST+0,sp)
3406  03ce 01            	rrwa	x,a
3407  03cf 1a03          	or	a,(OFST-1,sp)
3408  03d1 01            	rrwa	x,a
3409  03d2 1f03          	ldw	(OFST-1,sp),x
3411                     ; 1027   return (uint16_t)tmpccr3;
3413  03d4 1e03          	ldw	x,(OFST-1,sp)
3416  03d6 5b04          	addw	sp,#4
3417  03d8 81            	ret
3451                     ; 1035 uint16_t TIM2_GetCounter(void)
3451                     ; 1036 {
3452                     	switch	.text
3453  03d9               _TIM2_GetCounter:
3455  03d9 89            	pushw	x
3456       00000002      OFST:	set	2
3459                     ; 1037   uint16_t tmpcntr = 0;
3461                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3463  03da c6530a        	ld	a,21258
3464  03dd 5f            	clrw	x
3465  03de 97            	ld	xl,a
3466  03df 4f            	clr	a
3467  03e0 02            	rlwa	x,a
3468  03e1 1f01          	ldw	(OFST-1,sp),x
3470                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3472  03e3 c6530b        	ld	a,21259
3473  03e6 5f            	clrw	x
3474  03e7 97            	ld	xl,a
3475  03e8 01            	rrwa	x,a
3476  03e9 1a02          	or	a,(OFST+0,sp)
3477  03eb 01            	rrwa	x,a
3478  03ec 1a01          	or	a,(OFST-1,sp)
3479  03ee 01            	rrwa	x,a
3482  03ef 5b02          	addw	sp,#2
3483  03f1 81            	ret
3507                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3507                     ; 1050 {
3508                     	switch	.text
3509  03f2               _TIM2_GetPrescaler:
3513                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3515  03f2 c6530c        	ld	a,21260
3518  03f5 81            	ret
3657                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3657                     ; 1069 {
3658                     	switch	.text
3659  03f6               _TIM2_GetFlagStatus:
3661  03f6 89            	pushw	x
3662  03f7 89            	pushw	x
3663       00000002      OFST:	set	2
3666                     ; 1070   FlagStatus bitstatus = RESET;
3668                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3672                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3674                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3676  03f8 9f            	ld	a,xl
3677  03f9 c45302        	and	a,21250
3678  03fc 6b01          	ld	(OFST-1,sp),a
3680                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3682  03fe 7b03          	ld	a,(OFST+1,sp)
3683  0400 6b02          	ld	(OFST+0,sp),a
3685                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3687  0402 c65303        	ld	a,21251
3688  0405 1402          	and	a,(OFST+0,sp)
3689  0407 1a01          	or	a,(OFST-1,sp)
3690  0409 2706          	jreq	L5371
3691                     ; 1081     bitstatus = SET;
3693  040b a601          	ld	a,#1
3694  040d 6b02          	ld	(OFST+0,sp),a
3697  040f 2002          	jra	L7371
3698  0411               L5371:
3699                     ; 1085     bitstatus = RESET;
3701  0411 0f02          	clr	(OFST+0,sp)
3703  0413               L7371:
3704                     ; 1087   return (FlagStatus)bitstatus;
3706  0413 7b02          	ld	a,(OFST+0,sp)
3709  0415 5b04          	addw	sp,#4
3710  0417 81            	ret
3745                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3745                     ; 1104 {
3746                     	switch	.text
3747  0418               _TIM2_ClearFlag:
3751                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3753                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3755  0418 9f            	ld	a,xl
3756  0419 43            	cpl	a
3757  041a c75302        	ld	21250,a
3758                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3760  041d 35ff5303      	mov	21251,#255
3761                     ; 1111 }
3764  0421 81            	ret
3828                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3828                     ; 1124 {
3829                     	switch	.text
3830  0422               _TIM2_GetITStatus:
3832  0422 88            	push	a
3833  0423 89            	pushw	x
3834       00000002      OFST:	set	2
3837                     ; 1125   ITStatus bitstatus = RESET;
3839                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3843                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3845                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3847  0424 c45302        	and	a,21250
3848  0427 6b01          	ld	(OFST-1,sp),a
3850                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3852  0429 c65301        	ld	a,21249
3853  042c 1403          	and	a,(OFST+1,sp)
3854  042e 6b02          	ld	(OFST+0,sp),a
3856                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3858  0430 0d01          	tnz	(OFST-1,sp)
3859  0432 270a          	jreq	L1102
3861  0434 0d02          	tnz	(OFST+0,sp)
3862  0436 2706          	jreq	L1102
3863                     ; 1137     bitstatus = SET;
3865  0438 a601          	ld	a,#1
3866  043a 6b02          	ld	(OFST+0,sp),a
3869  043c 2002          	jra	L3102
3870  043e               L1102:
3871                     ; 1141     bitstatus = RESET;
3873  043e 0f02          	clr	(OFST+0,sp)
3875  0440               L3102:
3876                     ; 1143   return (ITStatus)(bitstatus);
3878  0440 7b02          	ld	a,(OFST+0,sp)
3881  0442 5b03          	addw	sp,#3
3882  0444 81            	ret
3918                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3918                     ; 1157 {
3919                     	switch	.text
3920  0445               _TIM2_ClearITPendingBit:
3924                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3926                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3928  0445 43            	cpl	a
3929  0446 c75302        	ld	21250,a
3930                     ; 1163 }
3933  0449 81            	ret
3985                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3985                     ; 1182                        uint8_t TIM2_ICSelection,
3985                     ; 1183                        uint8_t TIM2_ICFilter)
3985                     ; 1184 {
3986                     	switch	.text
3987  044a               L3_TI1_Config:
3989  044a 89            	pushw	x
3990  044b 88            	push	a
3991       00000001      OFST:	set	1
3994                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3996  044c 72115308      	bres	21256,#0
3997                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3997                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3999  0450 7b06          	ld	a,(OFST+5,sp)
4000  0452 97            	ld	xl,a
4001  0453 a610          	ld	a,#16
4002  0455 42            	mul	x,a
4003  0456 9f            	ld	a,xl
4004  0457 1a03          	or	a,(OFST+2,sp)
4005  0459 6b01          	ld	(OFST+0,sp),a
4007  045b c65305        	ld	a,21253
4008  045e a40c          	and	a,#12
4009  0460 1a01          	or	a,(OFST+0,sp)
4010  0462 c75305        	ld	21253,a
4011                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4013  0465 0d02          	tnz	(OFST+1,sp)
4014  0467 2706          	jreq	L1602
4015                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
4017  0469 72125308      	bset	21256,#1
4019  046d 2004          	jra	L3602
4020  046f               L1602:
4021                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
4023  046f 72135308      	bres	21256,#1
4024  0473               L3602:
4025                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4027  0473 72105308      	bset	21256,#0
4028                     ; 1203 }
4031  0477 5b03          	addw	sp,#3
4032  0479 81            	ret
4084                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4084                     ; 1222                        uint8_t TIM2_ICSelection,
4084                     ; 1223                        uint8_t TIM2_ICFilter)
4084                     ; 1224 {
4085                     	switch	.text
4086  047a               L5_TI2_Config:
4088  047a 89            	pushw	x
4089  047b 88            	push	a
4090       00000001      OFST:	set	1
4093                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4095  047c 72195308      	bres	21256,#4
4096                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4096                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4098  0480 7b06          	ld	a,(OFST+5,sp)
4099  0482 97            	ld	xl,a
4100  0483 a610          	ld	a,#16
4101  0485 42            	mul	x,a
4102  0486 9f            	ld	a,xl
4103  0487 1a03          	or	a,(OFST+2,sp)
4104  0489 6b01          	ld	(OFST+0,sp),a
4106  048b c65306        	ld	a,21254
4107  048e a40c          	and	a,#12
4108  0490 1a01          	or	a,(OFST+0,sp)
4109  0492 c75306        	ld	21254,a
4110                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4112  0495 0d02          	tnz	(OFST+1,sp)
4113  0497 2706          	jreq	L3112
4114                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4116  0499 721a5308      	bset	21256,#5
4118  049d 2004          	jra	L5112
4119  049f               L3112:
4120                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4122  049f 721b5308      	bres	21256,#5
4123  04a3               L5112:
4124                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4126  04a3 72185308      	bset	21256,#4
4127                     ; 1245 }
4130  04a7 5b03          	addw	sp,#3
4131  04a9 81            	ret
4183                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4183                     ; 1262                        uint8_t TIM2_ICFilter)
4183                     ; 1263 {
4184                     	switch	.text
4185  04aa               L7_TI3_Config:
4187  04aa 89            	pushw	x
4188  04ab 88            	push	a
4189       00000001      OFST:	set	1
4192                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4194  04ac 72115309      	bres	21257,#0
4195                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4195                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4197  04b0 7b06          	ld	a,(OFST+5,sp)
4198  04b2 97            	ld	xl,a
4199  04b3 a610          	ld	a,#16
4200  04b5 42            	mul	x,a
4201  04b6 9f            	ld	a,xl
4202  04b7 1a03          	or	a,(OFST+2,sp)
4203  04b9 6b01          	ld	(OFST+0,sp),a
4205  04bb c65307        	ld	a,21255
4206  04be a40c          	and	a,#12
4207  04c0 1a01          	or	a,(OFST+0,sp)
4208  04c2 c75307        	ld	21255,a
4209                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4211  04c5 0d02          	tnz	(OFST+1,sp)
4212  04c7 2706          	jreq	L5412
4213                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4215  04c9 72125309      	bset	21257,#1
4217  04cd 2004          	jra	L7412
4218  04cf               L5412:
4219                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4221  04cf 72135309      	bres	21257,#1
4222  04d3               L7412:
4223                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4225  04d3 72105309      	bset	21257,#0
4226                     ; 1283 }
4229  04d7 5b03          	addw	sp,#3
4230  04d9 81            	ret
4243                     	xdef	_TIM2_ClearITPendingBit
4244                     	xdef	_TIM2_GetITStatus
4245                     	xdef	_TIM2_ClearFlag
4246                     	xdef	_TIM2_GetFlagStatus
4247                     	xdef	_TIM2_GetPrescaler
4248                     	xdef	_TIM2_GetCounter
4249                     	xdef	_TIM2_GetCapture3
4250                     	xdef	_TIM2_GetCapture2
4251                     	xdef	_TIM2_GetCapture1
4252                     	xdef	_TIM2_SetIC3Prescaler
4253                     	xdef	_TIM2_SetIC2Prescaler
4254                     	xdef	_TIM2_SetIC1Prescaler
4255                     	xdef	_TIM2_SetCompare3
4256                     	xdef	_TIM2_SetCompare2
4257                     	xdef	_TIM2_SetCompare1
4258                     	xdef	_TIM2_SetAutoreload
4259                     	xdef	_TIM2_SetCounter
4260                     	xdef	_TIM2_SelectOCxM
4261                     	xdef	_TIM2_CCxCmd
4262                     	xdef	_TIM2_OC3PolarityConfig
4263                     	xdef	_TIM2_OC2PolarityConfig
4264                     	xdef	_TIM2_OC1PolarityConfig
4265                     	xdef	_TIM2_GenerateEvent
4266                     	xdef	_TIM2_OC3PreloadConfig
4267                     	xdef	_TIM2_OC2PreloadConfig
4268                     	xdef	_TIM2_OC1PreloadConfig
4269                     	xdef	_TIM2_ARRPreloadConfig
4270                     	xdef	_TIM2_ForcedOC3Config
4271                     	xdef	_TIM2_ForcedOC2Config
4272                     	xdef	_TIM2_ForcedOC1Config
4273                     	xdef	_TIM2_PrescalerConfig
4274                     	xdef	_TIM2_SelectOnePulseMode
4275                     	xdef	_TIM2_UpdateRequestConfig
4276                     	xdef	_TIM2_UpdateDisableConfig
4277                     	xdef	_TIM2_ITConfig
4278                     	xdef	_TIM2_Cmd
4279                     	xdef	_TIM2_PWMIConfig
4280                     	xdef	_TIM2_ICInit
4281                     	xdef	_TIM2_OC3Init
4282                     	xdef	_TIM2_OC2Init
4283                     	xdef	_TIM2_OC1Init
4284                     	xdef	_TIM2_TimeBaseInit
4285                     	xdef	_TIM2_DeInit
4304                     	end
