   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 49 void TIM4_DeInit(void)
  41                     ; 50 {
  43                     	switch	.text
  44  0000               _TIM4_DeInit:
  48                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  50  0000 725f5340      	clr	21312
  51                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  53  0004 725f5341      	clr	21313
  54                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  56  0008 725f5344      	clr	21316
  57                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  59  000c 725f5345      	clr	21317
  60                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  62  0010 35ff5346      	mov	21318,#255
  63                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  65  0014 725f5342      	clr	21314
  66                     ; 57 }
  69  0018 81            	ret
 175                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 175                     ; 66 {
 176                     	switch	.text
 177  0019               _TIM4_TimeBaseInit:
 181                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 183                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 185  0019 9e            	ld	a,xh
 186  001a c75345        	ld	21317,a
 187                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 189  001d 9f            	ld	a,xl
 190  001e c75346        	ld	21318,a
 191                     ; 73 }
 194  0021 81            	ret
 249                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 249                     ; 82 {
 250                     	switch	.text
 251  0022               _TIM4_Cmd:
 255                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 257                     ; 87   if (NewState != DISABLE)
 259  0022 4d            	tnz	a
 260  0023 2706          	jreq	L511
 261                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 263  0025 72105340      	bset	21312,#0
 265  0029 2004          	jra	L711
 266  002b               L511:
 267                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 269  002b 72115340      	bres	21312,#0
 270  002f               L711:
 271                     ; 95 }
 274  002f 81            	ret
 332                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 332                     ; 108 {
 333                     	switch	.text
 334  0030               _TIM4_ITConfig:
 336  0030 89            	pushw	x
 337       00000000      OFST:	set	0
 340                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 342                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 344                     ; 113   if (NewState != DISABLE)
 346  0031 9f            	ld	a,xl
 347  0032 4d            	tnz	a
 348  0033 2709          	jreq	L151
 349                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 351  0035 9e            	ld	a,xh
 352  0036 ca5341        	or	a,21313
 353  0039 c75341        	ld	21313,a
 355  003c 2009          	jra	L351
 356  003e               L151:
 357                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 359  003e 7b01          	ld	a,(OFST+1,sp)
 360  0040 43            	cpl	a
 361  0041 c45341        	and	a,21313
 362  0044 c75341        	ld	21313,a
 363  0047               L351:
 364                     ; 123 }
 367  0047 85            	popw	x
 368  0048 81            	ret
 404                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 404                     ; 132 {
 405                     	switch	.text
 406  0049               _TIM4_UpdateDisableConfig:
 410                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 412                     ; 137   if (NewState != DISABLE)
 414  0049 4d            	tnz	a
 415  004a 2706          	jreq	L371
 416                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 418  004c 72125340      	bset	21312,#1
 420  0050 2004          	jra	L571
 421  0052               L371:
 422                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 424  0052 72135340      	bres	21312,#1
 425  0056               L571:
 426                     ; 145 }
 429  0056 81            	ret
 487                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 487                     ; 156 {
 488                     	switch	.text
 489  0057               _TIM4_UpdateRequestConfig:
 493                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 495                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 497  0057 4d            	tnz	a
 498  0058 2706          	jreq	L522
 499                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 501  005a 72145340      	bset	21312,#2
 503  005e 2004          	jra	L722
 504  0060               L522:
 505                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 507  0060 72155340      	bres	21312,#2
 508  0064               L722:
 509                     ; 169 }
 512  0064 81            	ret
 569                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 569                     ; 180 {
 570                     	switch	.text
 571  0065               _TIM4_SelectOnePulseMode:
 575                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 577                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 579  0065 4d            	tnz	a
 580  0066 2706          	jreq	L752
 581                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 583  0068 72165340      	bset	21312,#3
 585  006c 2004          	jra	L162
 586  006e               L752:
 587                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 589  006e 72175340      	bres	21312,#3
 590  0072               L162:
 591                     ; 193 }
 594  0072 81            	ret
 662                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 662                     ; 216 {
 663                     	switch	.text
 664  0073               _TIM4_PrescalerConfig:
 668                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 670                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 672                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 674  0073 9e            	ld	a,xh
 675  0074 c75345        	ld	21317,a
 676                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 678  0077 9f            	ld	a,xl
 679  0078 c75343        	ld	21315,a
 680                     ; 226 }
 683  007b 81            	ret
 719                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 719                     ; 235 {
 720                     	switch	.text
 721  007c               _TIM4_ARRPreloadConfig:
 725                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 727                     ; 240   if (NewState != DISABLE)
 729  007c 4d            	tnz	a
 730  007d 2706          	jreq	L333
 731                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 733  007f 721e5340      	bset	21312,#7
 735  0083 2004          	jra	L533
 736  0085               L333:
 737                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 739  0085 721f5340      	bres	21312,#7
 740  0089               L533:
 741                     ; 248 }
 744  0089 81            	ret
 793                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 793                     ; 258 {
 794                     	switch	.text
 795  008a               _TIM4_GenerateEvent:
 799                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 801                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 803  008a c75343        	ld	21315,a
 804                     ; 264 }
 807  008d 81            	ret
 841                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 841                     ; 273 {
 842                     	switch	.text
 843  008e               _TIM4_SetCounter:
 847                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 849  008e c75344        	ld	21316,a
 850                     ; 276 }
 853  0091 81            	ret
 887                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 887                     ; 285 {
 888                     	switch	.text
 889  0092               _TIM4_SetAutoreload:
 893                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 895  0092 c75346        	ld	21318,a
 896                     ; 288 }
 899  0095 81            	ret
 922                     ; 295 uint8_t TIM4_GetCounter(void)
 922                     ; 296 {
 923                     	switch	.text
 924  0096               _TIM4_GetCounter:
 928                     ; 298   return (uint8_t)(TIM4->CNTR);
 930  0096 c65344        	ld	a,21316
 933  0099 81            	ret
 957                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 957                     ; 307 {
 958                     	switch	.text
 959  009a               _TIM4_GetPrescaler:
 963                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 965  009a c65345        	ld	a,21317
 968  009d 81            	ret
1047                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1047                     ; 320 {
1048                     	switch	.text
1049  009e               _TIM4_GetFlagStatus:
1051  009e 88            	push	a
1052       00000001      OFST:	set	1
1055                     ; 321   FlagStatus bitstatus = RESET;
1057                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1059                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1061  009f c45342        	and	a,21314
1062  00a2 2706          	jreq	L774
1063                     ; 328     bitstatus = SET;
1065  00a4 a601          	ld	a,#1
1066  00a6 6b01          	ld	(OFST+0,sp),a
1069  00a8 2002          	jra	L105
1070  00aa               L774:
1071                     ; 332     bitstatus = RESET;
1073  00aa 0f01          	clr	(OFST+0,sp)
1075  00ac               L105:
1076                     ; 334   return ((FlagStatus)bitstatus);
1078  00ac 7b01          	ld	a,(OFST+0,sp)
1081  00ae 5b01          	addw	sp,#1
1082  00b0 81            	ret
1117                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1117                     ; 345 {
1118                     	switch	.text
1119  00b1               _TIM4_ClearFlag:
1123                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1125                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1127  00b1 43            	cpl	a
1128  00b2 c75342        	ld	21314,a
1129                     ; 351 }
1132  00b5 81            	ret
1196                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1196                     ; 361 {
1197                     	switch	.text
1198  00b6               _TIM4_GetITStatus:
1200  00b6 88            	push	a
1201  00b7 89            	pushw	x
1202       00000002      OFST:	set	2
1205                     ; 362   ITStatus bitstatus = RESET;
1207                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1211                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1213                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1215  00b8 c45342        	and	a,21314
1216  00bb 6b01          	ld	(OFST-1,sp),a
1218                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1220  00bd c65341        	ld	a,21313
1221  00c0 1403          	and	a,(OFST+1,sp)
1222  00c2 6b02          	ld	(OFST+0,sp),a
1224                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1226  00c4 0d01          	tnz	(OFST-1,sp)
1227  00c6 270a          	jreq	L355
1229  00c8 0d02          	tnz	(OFST+0,sp)
1230  00ca 2706          	jreq	L355
1231                     ; 375     bitstatus = (ITStatus)SET;
1233  00cc a601          	ld	a,#1
1234  00ce 6b02          	ld	(OFST+0,sp),a
1237  00d0 2002          	jra	L555
1238  00d2               L355:
1239                     ; 379     bitstatus = (ITStatus)RESET;
1241  00d2 0f02          	clr	(OFST+0,sp)
1243  00d4               L555:
1244                     ; 381   return ((ITStatus)bitstatus);
1246  00d4 7b02          	ld	a,(OFST+0,sp)
1249  00d6 5b03          	addw	sp,#3
1250  00d8 81            	ret
1286                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1286                     ; 392 {
1287                     	switch	.text
1288  00d9               _TIM4_ClearITPendingBit:
1292                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1294                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1296  00d9 43            	cpl	a
1297  00da c75342        	ld	21314,a
1298                     ; 398 }
1301  00dd 81            	ret
1314                     	xdef	_TIM4_ClearITPendingBit
1315                     	xdef	_TIM4_GetITStatus
1316                     	xdef	_TIM4_ClearFlag
1317                     	xdef	_TIM4_GetFlagStatus
1318                     	xdef	_TIM4_GetPrescaler
1319                     	xdef	_TIM4_GetCounter
1320                     	xdef	_TIM4_SetAutoreload
1321                     	xdef	_TIM4_SetCounter
1322                     	xdef	_TIM4_GenerateEvent
1323                     	xdef	_TIM4_ARRPreloadConfig
1324                     	xdef	_TIM4_PrescalerConfig
1325                     	xdef	_TIM4_SelectOnePulseMode
1326                     	xdef	_TIM4_UpdateRequestConfig
1327                     	xdef	_TIM4_UpdateDisableConfig
1328                     	xdef	_TIM4_ITConfig
1329                     	xdef	_TIM4_Cmd
1330                     	xdef	_TIM4_TimeBaseInit
1331                     	xdef	_TIM4_DeInit
1350                     	end
