   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 52 void ADC1_DeInit(void)
  41                     ; 53 {
  43                     	switch	.text
  44  0000               _ADC1_DeInit:
  48                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  50  0000 725f5400      	clr	21504
  51                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  53  0004 725f5401      	clr	21505
  54                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  56  0008 725f5402      	clr	21506
  57                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  59  000c 725f5403      	clr	21507
  60                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  62  0010 725f5406      	clr	21510
  63                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  65  0014 725f5407      	clr	21511
  66                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  68  0018 35ff5408      	mov	21512,#255
  69                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  71  001c 35035409      	mov	21513,#3
  72                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  74  0020 725f540a      	clr	21514
  75                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  77  0024 725f540b      	clr	21515
  78                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  80  0028 725f540e      	clr	21518
  81                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  83  002c 725f540f      	clr	21519
  84                     ; 66 }
  87  0030 81            	ret
 538                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 538                     ; 89 {
 539                     	switch	.text
 540  0031               _ADC1_Init:
 542  0031 89            	pushw	x
 543       00000000      OFST:	set	0
 546                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 548                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 550                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 552                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 554                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 556                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 558                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 560                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 562                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 564  0032 7b08          	ld	a,(OFST+8,sp)
 565  0034 88            	push	a
 566  0035 9f            	ld	a,xl
 567  0036 97            	ld	xl,a
 568  0037 7b02          	ld	a,(OFST+2,sp)
 569  0039 95            	ld	xh,a
 570  003a cd013d        	call	_ADC1_ConversionConfig
 572  003d 84            	pop	a
 573                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 575  003e 7b05          	ld	a,(OFST+5,sp)
 576  0040 ad5a          	call	_ADC1_PrescalerConfig
 578                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 580  0042 7b07          	ld	a,(OFST+7,sp)
 581  0044 97            	ld	xl,a
 582  0045 7b06          	ld	a,(OFST+6,sp)
 583  0047 95            	ld	xh,a
 584  0048 cd016b        	call	_ADC1_ExternalTriggerConfig
 586                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 588  004b 7b0a          	ld	a,(OFST+10,sp)
 589  004d 97            	ld	xl,a
 590  004e 7b09          	ld	a,(OFST+9,sp)
 591  0050 95            	ld	xh,a
 592  0051 ad5c          	call	_ADC1_SchmittTriggerConfig
 594                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 596  0053 72105401      	bset	21505,#0
 597                     ; 119 }
 600  0057 85            	popw	x
 601  0058 81            	ret
 636                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 636                     ; 127 {
 637                     	switch	.text
 638  0059               _ADC1_Cmd:
 642                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 644                     ; 131   if (NewState != DISABLE)
 646  0059 4d            	tnz	a
 647  005a 2706          	jreq	L362
 648                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 650  005c 72105401      	bset	21505,#0
 652  0060 2004          	jra	L562
 653  0062               L362:
 654                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 656  0062 72115401      	bres	21505,#0
 657  0066               L562:
 658                     ; 139 }
 661  0066 81            	ret
 696                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 696                     ; 147 {
 697                     	switch	.text
 698  0067               _ADC1_ScanModeCmd:
 702                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 704                     ; 151   if (NewState != DISABLE)
 706  0067 4d            	tnz	a
 707  0068 2706          	jreq	L503
 708                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 710  006a 72125402      	bset	21506,#1
 712  006e 2004          	jra	L703
 713  0070               L503:
 714                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 716  0070 72135402      	bres	21506,#1
 717  0074               L703:
 718                     ; 159 }
 721  0074 81            	ret
 756                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 756                     ; 167 {
 757                     	switch	.text
 758  0075               _ADC1_DataBufferCmd:
 762                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 764                     ; 171   if (NewState != DISABLE)
 766  0075 4d            	tnz	a
 767  0076 2706          	jreq	L723
 768                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 770  0078 721e5403      	bset	21507,#7
 772  007c 2004          	jra	L133
 773  007e               L723:
 774                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 776  007e 721f5403      	bres	21507,#7
 777  0082               L133:
 778                     ; 179 }
 781  0082 81            	ret
 937                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 937                     ; 191 {
 938                     	switch	.text
 939  0083               _ADC1_ITConfig:
 941  0083 89            	pushw	x
 942       00000000      OFST:	set	0
 945                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 947                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 949                     ; 196   if (NewState != DISABLE)
 951  0084 0d05          	tnz	(OFST+5,sp)
 952  0086 2709          	jreq	L714
 953                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 955  0088 9f            	ld	a,xl
 956  0089 ca5400        	or	a,21504
 957  008c c75400        	ld	21504,a
 959  008f 2009          	jra	L124
 960  0091               L714:
 961                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 963  0091 7b02          	ld	a,(OFST+2,sp)
 964  0093 43            	cpl	a
 965  0094 c45400        	and	a,21504
 966  0097 c75400        	ld	21504,a
 967  009a               L124:
 968                     ; 206 }
 971  009a 85            	popw	x
 972  009b 81            	ret
1008                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1008                     ; 215 {
1009                     	switch	.text
1010  009c               _ADC1_PrescalerConfig:
1012  009c 88            	push	a
1013       00000000      OFST:	set	0
1016                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1018                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1020  009d c65401        	ld	a,21505
1021  00a0 a48f          	and	a,#143
1022  00a2 c75401        	ld	21505,a
1023                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1025  00a5 c65401        	ld	a,21505
1026  00a8 1a01          	or	a,(OFST+1,sp)
1027  00aa c75401        	ld	21505,a
1028                     ; 223 }
1031  00ad 84            	pop	a
1032  00ae 81            	ret
1079                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1079                     ; 234 {
1080                     	switch	.text
1081  00af               _ADC1_SchmittTriggerConfig:
1083  00af 89            	pushw	x
1084       00000000      OFST:	set	0
1087                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1089                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1091                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1093  00b0 9e            	ld	a,xh
1094  00b1 a1ff          	cp	a,#255
1095  00b3 2620          	jrne	L364
1096                     ; 241     if (NewState != DISABLE)
1098  00b5 9f            	ld	a,xl
1099  00b6 4d            	tnz	a
1100  00b7 270a          	jreq	L564
1101                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1103  00b9 725f5407      	clr	21511
1104                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1106  00bd 725f5406      	clr	21510
1108  00c1 2078          	jra	L174
1109  00c3               L564:
1110                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1112  00c3 c65407        	ld	a,21511
1113  00c6 aaff          	or	a,#255
1114  00c8 c75407        	ld	21511,a
1115                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1117  00cb c65406        	ld	a,21510
1118  00ce aaff          	or	a,#255
1119  00d0 c75406        	ld	21510,a
1120  00d3 2066          	jra	L174
1121  00d5               L364:
1122                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1124  00d5 7b01          	ld	a,(OFST+1,sp)
1125  00d7 a108          	cp	a,#8
1126  00d9 242f          	jruge	L374
1127                     ; 254     if (NewState != DISABLE)
1129  00db 0d02          	tnz	(OFST+2,sp)
1130  00dd 2716          	jreq	L574
1131                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1133  00df 7b01          	ld	a,(OFST+1,sp)
1134  00e1 5f            	clrw	x
1135  00e2 97            	ld	xl,a
1136  00e3 a601          	ld	a,#1
1137  00e5 5d            	tnzw	x
1138  00e6 2704          	jreq	L42
1139  00e8               L62:
1140  00e8 48            	sll	a
1141  00e9 5a            	decw	x
1142  00ea 26fc          	jrne	L62
1143  00ec               L42:
1144  00ec 43            	cpl	a
1145  00ed c45407        	and	a,21511
1146  00f0 c75407        	ld	21511,a
1148  00f3 2046          	jra	L174
1149  00f5               L574:
1150                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1152  00f5 7b01          	ld	a,(OFST+1,sp)
1153  00f7 5f            	clrw	x
1154  00f8 97            	ld	xl,a
1155  00f9 a601          	ld	a,#1
1156  00fb 5d            	tnzw	x
1157  00fc 2704          	jreq	L03
1158  00fe               L23:
1159  00fe 48            	sll	a
1160  00ff 5a            	decw	x
1161  0100 26fc          	jrne	L23
1162  0102               L03:
1163  0102 ca5407        	or	a,21511
1164  0105 c75407        	ld	21511,a
1165  0108 2031          	jra	L174
1166  010a               L374:
1167                     ; 265     if (NewState != DISABLE)
1169  010a 0d02          	tnz	(OFST+2,sp)
1170  010c 2718          	jreq	L305
1171                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1173  010e 7b01          	ld	a,(OFST+1,sp)
1174  0110 a008          	sub	a,#8
1175  0112 5f            	clrw	x
1176  0113 97            	ld	xl,a
1177  0114 a601          	ld	a,#1
1178  0116 5d            	tnzw	x
1179  0117 2704          	jreq	L43
1180  0119               L63:
1181  0119 48            	sll	a
1182  011a 5a            	decw	x
1183  011b 26fc          	jrne	L63
1184  011d               L43:
1185  011d 43            	cpl	a
1186  011e c45406        	and	a,21510
1187  0121 c75406        	ld	21510,a
1189  0124 2015          	jra	L174
1190  0126               L305:
1191                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1193  0126 7b01          	ld	a,(OFST+1,sp)
1194  0128 a008          	sub	a,#8
1195  012a 5f            	clrw	x
1196  012b 97            	ld	xl,a
1197  012c a601          	ld	a,#1
1198  012e 5d            	tnzw	x
1199  012f 2704          	jreq	L04
1200  0131               L24:
1201  0131 48            	sll	a
1202  0132 5a            	decw	x
1203  0133 26fc          	jrne	L24
1204  0135               L04:
1205  0135 ca5406        	or	a,21510
1206  0138 c75406        	ld	21510,a
1207  013b               L174:
1208                     ; 274 }
1211  013b 85            	popw	x
1212  013c 81            	ret
1269                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1269                     ; 287 {
1270                     	switch	.text
1271  013d               _ADC1_ConversionConfig:
1273  013d 89            	pushw	x
1274       00000000      OFST:	set	0
1277                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1279                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1281                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1283                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1285  013e 72175402      	bres	21506,#3
1286                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1288  0142 c65402        	ld	a,21506
1289  0145 1a05          	or	a,(OFST+5,sp)
1290  0147 c75402        	ld	21506,a
1291                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1293  014a 9e            	ld	a,xh
1294  014b a101          	cp	a,#1
1295  014d 2606          	jrne	L535
1296                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1298  014f 72125401      	bset	21505,#1
1300  0153 2004          	jra	L735
1301  0155               L535:
1302                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1304  0155 72135401      	bres	21505,#1
1305  0159               L735:
1306                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1308  0159 c65400        	ld	a,21504
1309  015c a4f0          	and	a,#240
1310  015e c75400        	ld	21504,a
1311                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1313  0161 c65400        	ld	a,21504
1314  0164 1a02          	or	a,(OFST+2,sp)
1315  0166 c75400        	ld	21504,a
1316                     ; 313 }
1319  0169 85            	popw	x
1320  016a 81            	ret
1366                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1366                     ; 326 {
1367                     	switch	.text
1368  016b               _ADC1_ExternalTriggerConfig:
1370  016b 89            	pushw	x
1371       00000000      OFST:	set	0
1374                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1376                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1378                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1380  016c c65402        	ld	a,21506
1381  016f a4cf          	and	a,#207
1382  0171 c75402        	ld	21506,a
1383                     ; 334   if (NewState != DISABLE)
1385  0174 9f            	ld	a,xl
1386  0175 4d            	tnz	a
1387  0176 2706          	jreq	L365
1388                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1390  0178 721c5402      	bset	21506,#6
1392  017c 2004          	jra	L565
1393  017e               L365:
1394                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1396  017e 721d5402      	bres	21506,#6
1397  0182               L565:
1398                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1400  0182 c65402        	ld	a,21506
1401  0185 1a01          	or	a,(OFST+1,sp)
1402  0187 c75402        	ld	21506,a
1403                     ; 347 }
1406  018a 85            	popw	x
1407  018b 81            	ret
1431                     ; 358 void ADC1_StartConversion(void)
1431                     ; 359 {
1432                     	switch	.text
1433  018c               _ADC1_StartConversion:
1437                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1439  018c 72105401      	bset	21505,#0
1440                     ; 361 }
1443  0190 81            	ret
1487                     ; 370 uint16_t ADC1_GetConversionValue(void)
1487                     ; 371 {
1488                     	switch	.text
1489  0191               _ADC1_GetConversionValue:
1491  0191 5205          	subw	sp,#5
1492       00000005      OFST:	set	5
1495                     ; 372   uint16_t temph = 0;
1497                     ; 373   uint8_t templ = 0;
1499                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1501  0193 c65402        	ld	a,21506
1502  0196 a508          	bcp	a,#8
1503  0198 2715          	jreq	L126
1504                     ; 378     templ = ADC1->DRL;
1506  019a c65405        	ld	a,21509
1507  019d 6b03          	ld	(OFST-2,sp),a
1509                     ; 380     temph = ADC1->DRH;
1511  019f c65404        	ld	a,21508
1512  01a2 5f            	clrw	x
1513  01a3 97            	ld	xl,a
1514  01a4 1f04          	ldw	(OFST-1,sp),x
1516                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1518  01a6 1e04          	ldw	x,(OFST-1,sp)
1519  01a8 7b03          	ld	a,(OFST-2,sp)
1520  01aa 02            	rlwa	x,a
1521  01ab 1f04          	ldw	(OFST-1,sp),x
1524  01ad 2021          	jra	L326
1525  01af               L126:
1526                     ; 387     temph = ADC1->DRH;
1528  01af c65404        	ld	a,21508
1529  01b2 5f            	clrw	x
1530  01b3 97            	ld	xl,a
1531  01b4 1f04          	ldw	(OFST-1,sp),x
1533                     ; 389     templ = ADC1->DRL;
1535  01b6 c65405        	ld	a,21509
1536  01b9 6b03          	ld	(OFST-2,sp),a
1538                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1540  01bb 1e04          	ldw	x,(OFST-1,sp)
1541  01bd 4f            	clr	a
1542  01be 02            	rlwa	x,a
1543  01bf 1f01          	ldw	(OFST-4,sp),x
1545  01c1 7b03          	ld	a,(OFST-2,sp)
1546  01c3 97            	ld	xl,a
1547  01c4 a640          	ld	a,#64
1548  01c6 42            	mul	x,a
1549  01c7 01            	rrwa	x,a
1550  01c8 1a02          	or	a,(OFST-3,sp)
1551  01ca 01            	rrwa	x,a
1552  01cb 1a01          	or	a,(OFST-4,sp)
1553  01cd 01            	rrwa	x,a
1554  01ce 1f04          	ldw	(OFST-1,sp),x
1556  01d0               L326:
1557                     ; 394   return ((uint16_t)temph);
1559  01d0 1e04          	ldw	x,(OFST-1,sp)
1562  01d2 5b05          	addw	sp,#5
1563  01d4 81            	ret
1609                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1609                     ; 406 {
1610                     	switch	.text
1611  01d5               _ADC1_AWDChannelConfig:
1613  01d5 89            	pushw	x
1614       00000000      OFST:	set	0
1617                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1619                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1621                     ; 411   if (Channel < (uint8_t)8)
1623  01d6 9e            	ld	a,xh
1624  01d7 a108          	cp	a,#8
1625  01d9 242e          	jruge	L746
1626                     ; 413     if (NewState != DISABLE)
1628  01db 9f            	ld	a,xl
1629  01dc 4d            	tnz	a
1630  01dd 2714          	jreq	L156
1631                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1633  01df 9e            	ld	a,xh
1634  01e0 5f            	clrw	x
1635  01e1 97            	ld	xl,a
1636  01e2 a601          	ld	a,#1
1637  01e4 5d            	tnzw	x
1638  01e5 2704          	jreq	L65
1639  01e7               L06:
1640  01e7 48            	sll	a
1641  01e8 5a            	decw	x
1642  01e9 26fc          	jrne	L06
1643  01eb               L65:
1644  01eb ca540f        	or	a,21519
1645  01ee c7540f        	ld	21519,a
1647  01f1 2047          	jra	L556
1648  01f3               L156:
1649                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1651  01f3 7b01          	ld	a,(OFST+1,sp)
1652  01f5 5f            	clrw	x
1653  01f6 97            	ld	xl,a
1654  01f7 a601          	ld	a,#1
1655  01f9 5d            	tnzw	x
1656  01fa 2704          	jreq	L26
1657  01fc               L46:
1658  01fc 48            	sll	a
1659  01fd 5a            	decw	x
1660  01fe 26fc          	jrne	L46
1661  0200               L26:
1662  0200 43            	cpl	a
1663  0201 c4540f        	and	a,21519
1664  0204 c7540f        	ld	21519,a
1665  0207 2031          	jra	L556
1666  0209               L746:
1667                     ; 424     if (NewState != DISABLE)
1669  0209 0d02          	tnz	(OFST+2,sp)
1670  020b 2717          	jreq	L756
1671                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1673  020d 7b01          	ld	a,(OFST+1,sp)
1674  020f a008          	sub	a,#8
1675  0211 5f            	clrw	x
1676  0212 97            	ld	xl,a
1677  0213 a601          	ld	a,#1
1678  0215 5d            	tnzw	x
1679  0216 2704          	jreq	L66
1680  0218               L07:
1681  0218 48            	sll	a
1682  0219 5a            	decw	x
1683  021a 26fc          	jrne	L07
1684  021c               L66:
1685  021c ca540e        	or	a,21518
1686  021f c7540e        	ld	21518,a
1688  0222 2016          	jra	L556
1689  0224               L756:
1690                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1692  0224 7b01          	ld	a,(OFST+1,sp)
1693  0226 a008          	sub	a,#8
1694  0228 5f            	clrw	x
1695  0229 97            	ld	xl,a
1696  022a a601          	ld	a,#1
1697  022c 5d            	tnzw	x
1698  022d 2704          	jreq	L27
1699  022f               L47:
1700  022f 48            	sll	a
1701  0230 5a            	decw	x
1702  0231 26fc          	jrne	L47
1703  0233               L27:
1704  0233 43            	cpl	a
1705  0234 c4540e        	and	a,21518
1706  0237 c7540e        	ld	21518,a
1707  023a               L556:
1708                     ; 433 }
1711  023a 85            	popw	x
1712  023b 81            	ret
1747                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1747                     ; 442 {
1748                     	switch	.text
1749  023c               _ADC1_SetHighThreshold:
1751  023c 89            	pushw	x
1752       00000000      OFST:	set	0
1755                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1757  023d 54            	srlw	x
1758  023e 54            	srlw	x
1759  023f 9f            	ld	a,xl
1760  0240 c75408        	ld	21512,a
1761                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1763  0243 7b02          	ld	a,(OFST+2,sp)
1764  0245 c75409        	ld	21513,a
1765                     ; 445 }
1768  0248 85            	popw	x
1769  0249 81            	ret
1804                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1804                     ; 454 {
1805                     	switch	.text
1806  024a               _ADC1_SetLowThreshold:
1810                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1812  024a 9f            	ld	a,xl
1813  024b c7540b        	ld	21515,a
1814                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1816  024e 54            	srlw	x
1817  024f 54            	srlw	x
1818  0250 9f            	ld	a,xl
1819  0251 c7540a        	ld	21514,a
1820                     ; 457 }
1823  0254 81            	ret
1876                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1876                     ; 467 {
1877                     	switch	.text
1878  0255               _ADC1_GetBufferValue:
1880  0255 88            	push	a
1881  0256 5205          	subw	sp,#5
1882       00000005      OFST:	set	5
1885                     ; 468   uint16_t temph = 0;
1887                     ; 469   uint8_t templ = 0;
1889                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1891                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1893  0258 c65402        	ld	a,21506
1894  025b a508          	bcp	a,#8
1895  025d 271f          	jreq	L547
1896                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1898  025f 7b06          	ld	a,(OFST+1,sp)
1899  0261 48            	sll	a
1900  0262 5f            	clrw	x
1901  0263 97            	ld	xl,a
1902  0264 d653e1        	ld	a,(21473,x)
1903  0267 6b03          	ld	(OFST-2,sp),a
1905                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1907  0269 7b06          	ld	a,(OFST+1,sp)
1908  026b 48            	sll	a
1909  026c 5f            	clrw	x
1910  026d 97            	ld	xl,a
1911  026e d653e0        	ld	a,(21472,x)
1912  0271 5f            	clrw	x
1913  0272 97            	ld	xl,a
1914  0273 1f04          	ldw	(OFST-1,sp),x
1916                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1918  0275 1e04          	ldw	x,(OFST-1,sp)
1919  0277 7b03          	ld	a,(OFST-2,sp)
1920  0279 02            	rlwa	x,a
1921  027a 1f04          	ldw	(OFST-1,sp),x
1924  027c 202b          	jra	L747
1925  027e               L547:
1926                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1928  027e 7b06          	ld	a,(OFST+1,sp)
1929  0280 48            	sll	a
1930  0281 5f            	clrw	x
1931  0282 97            	ld	xl,a
1932  0283 d653e0        	ld	a,(21472,x)
1933  0286 5f            	clrw	x
1934  0287 97            	ld	xl,a
1935  0288 1f04          	ldw	(OFST-1,sp),x
1937                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1939  028a 7b06          	ld	a,(OFST+1,sp)
1940  028c 48            	sll	a
1941  028d 5f            	clrw	x
1942  028e 97            	ld	xl,a
1943  028f d653e1        	ld	a,(21473,x)
1944  0292 6b03          	ld	(OFST-2,sp),a
1946                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1948  0294 1e04          	ldw	x,(OFST-1,sp)
1949  0296 4f            	clr	a
1950  0297 02            	rlwa	x,a
1951  0298 1f01          	ldw	(OFST-4,sp),x
1953  029a 7b03          	ld	a,(OFST-2,sp)
1954  029c 97            	ld	xl,a
1955  029d a640          	ld	a,#64
1956  029f 42            	mul	x,a
1957  02a0 01            	rrwa	x,a
1958  02a1 1a02          	or	a,(OFST-3,sp)
1959  02a3 01            	rrwa	x,a
1960  02a4 1a01          	or	a,(OFST-4,sp)
1961  02a6 01            	rrwa	x,a
1962  02a7 1f04          	ldw	(OFST-1,sp),x
1964  02a9               L747:
1965                     ; 493   return ((uint16_t)temph);
1967  02a9 1e04          	ldw	x,(OFST-1,sp)
1970  02ab 5b06          	addw	sp,#6
1971  02ad 81            	ret
2037                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2037                     ; 503 {
2038                     	switch	.text
2039  02ae               _ADC1_GetAWDChannelStatus:
2041  02ae 88            	push	a
2042  02af 88            	push	a
2043       00000001      OFST:	set	1
2046                     ; 504   uint8_t status = 0;
2048                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2050                     ; 509   if (Channel < (uint8_t)8)
2052  02b0 a108          	cp	a,#8
2053  02b2 2412          	jruge	L3001
2054                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2056  02b4 5f            	clrw	x
2057  02b5 97            	ld	xl,a
2058  02b6 a601          	ld	a,#1
2059  02b8 5d            	tnzw	x
2060  02b9 2704          	jreq	L601
2061  02bb               L011:
2062  02bb 48            	sll	a
2063  02bc 5a            	decw	x
2064  02bd 26fc          	jrne	L011
2065  02bf               L601:
2066  02bf c4540d        	and	a,21517
2067  02c2 6b01          	ld	(OFST+0,sp),a
2070  02c4 2014          	jra	L5001
2071  02c6               L3001:
2072                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2074  02c6 7b02          	ld	a,(OFST+1,sp)
2075  02c8 a008          	sub	a,#8
2076  02ca 5f            	clrw	x
2077  02cb 97            	ld	xl,a
2078  02cc a601          	ld	a,#1
2079  02ce 5d            	tnzw	x
2080  02cf 2704          	jreq	L211
2081  02d1               L411:
2082  02d1 48            	sll	a
2083  02d2 5a            	decw	x
2084  02d3 26fc          	jrne	L411
2085  02d5               L211:
2086  02d5 c4540c        	and	a,21516
2087  02d8 6b01          	ld	(OFST+0,sp),a
2089  02da               L5001:
2090                     ; 518   return ((FlagStatus)status);
2092  02da 7b01          	ld	a,(OFST+0,sp)
2095  02dc 85            	popw	x
2096  02dd 81            	ret
2254                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2254                     ; 528 {
2255                     	switch	.text
2256  02de               _ADC1_GetFlagStatus:
2258  02de 88            	push	a
2259  02df 88            	push	a
2260       00000001      OFST:	set	1
2263                     ; 529   uint8_t flagstatus = 0;
2265                     ; 530   uint8_t temp = 0;
2267                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2269                     ; 535   if ((Flag & 0x0F) == 0x01)
2271  02e0 a40f          	and	a,#15
2272  02e2 a101          	cp	a,#1
2273  02e4 2609          	jrne	L5701
2274                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2276  02e6 c65403        	ld	a,21507
2277  02e9 a440          	and	a,#64
2278  02eb 6b01          	ld	(OFST+0,sp),a
2281  02ed 2045          	jra	L7701
2282  02ef               L5701:
2283                     ; 540   else if ((Flag & 0xF0) == 0x10)
2285  02ef 7b02          	ld	a,(OFST+1,sp)
2286  02f1 a4f0          	and	a,#240
2287  02f3 a110          	cp	a,#16
2288  02f5 2636          	jrne	L1011
2289                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2291  02f7 7b02          	ld	a,(OFST+1,sp)
2292  02f9 a40f          	and	a,#15
2293  02fb 6b01          	ld	(OFST+0,sp),a
2295                     ; 544     if (temp < 8)
2297  02fd 7b01          	ld	a,(OFST+0,sp)
2298  02ff a108          	cp	a,#8
2299  0301 2414          	jruge	L3011
2300                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2302  0303 7b01          	ld	a,(OFST+0,sp)
2303  0305 5f            	clrw	x
2304  0306 97            	ld	xl,a
2305  0307 a601          	ld	a,#1
2306  0309 5d            	tnzw	x
2307  030a 2704          	jreq	L021
2308  030c               L221:
2309  030c 48            	sll	a
2310  030d 5a            	decw	x
2311  030e 26fc          	jrne	L221
2312  0310               L021:
2313  0310 c4540d        	and	a,21517
2314  0313 6b01          	ld	(OFST+0,sp),a
2317  0315 201d          	jra	L7701
2318  0317               L3011:
2319                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2321  0317 7b01          	ld	a,(OFST+0,sp)
2322  0319 a008          	sub	a,#8
2323  031b 5f            	clrw	x
2324  031c 97            	ld	xl,a
2325  031d a601          	ld	a,#1
2326  031f 5d            	tnzw	x
2327  0320 2704          	jreq	L421
2328  0322               L621:
2329  0322 48            	sll	a
2330  0323 5a            	decw	x
2331  0324 26fc          	jrne	L621
2332  0326               L421:
2333  0326 c4540c        	and	a,21516
2334  0329 6b01          	ld	(OFST+0,sp),a
2336  032b 2007          	jra	L7701
2337  032d               L1011:
2338                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2340  032d c65400        	ld	a,21504
2341  0330 1402          	and	a,(OFST+1,sp)
2342  0332 6b01          	ld	(OFST+0,sp),a
2344  0334               L7701:
2345                     ; 557   return ((FlagStatus)flagstatus);
2347  0334 7b01          	ld	a,(OFST+0,sp)
2350  0336 85            	popw	x
2351  0337 81            	ret
2395                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2395                     ; 568 {
2396                     	switch	.text
2397  0338               _ADC1_ClearFlag:
2399  0338 88            	push	a
2400  0339 88            	push	a
2401       00000001      OFST:	set	1
2404                     ; 569   uint8_t temp = 0;
2406                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2408                     ; 574   if ((Flag & 0x0F) == 0x01)
2410  033a a40f          	and	a,#15
2411  033c a101          	cp	a,#1
2412  033e 2606          	jrne	L3311
2413                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2415  0340 721d5403      	bres	21507,#6
2417  0344 204b          	jra	L5311
2418  0346               L3311:
2419                     ; 579   else if ((Flag & 0xF0) == 0x10)
2421  0346 7b02          	ld	a,(OFST+1,sp)
2422  0348 a4f0          	and	a,#240
2423  034a a110          	cp	a,#16
2424  034c 263a          	jrne	L7311
2425                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2427  034e 7b02          	ld	a,(OFST+1,sp)
2428  0350 a40f          	and	a,#15
2429  0352 6b01          	ld	(OFST+0,sp),a
2431                     ; 583     if (temp < 8)
2433  0354 7b01          	ld	a,(OFST+0,sp)
2434  0356 a108          	cp	a,#8
2435  0358 2416          	jruge	L1411
2436                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2438  035a 7b01          	ld	a,(OFST+0,sp)
2439  035c 5f            	clrw	x
2440  035d 97            	ld	xl,a
2441  035e a601          	ld	a,#1
2442  0360 5d            	tnzw	x
2443  0361 2704          	jreq	L231
2444  0363               L431:
2445  0363 48            	sll	a
2446  0364 5a            	decw	x
2447  0365 26fc          	jrne	L431
2448  0367               L231:
2449  0367 43            	cpl	a
2450  0368 c4540d        	and	a,21517
2451  036b c7540d        	ld	21517,a
2453  036e 2021          	jra	L5311
2454  0370               L1411:
2455                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2457  0370 7b01          	ld	a,(OFST+0,sp)
2458  0372 a008          	sub	a,#8
2459  0374 5f            	clrw	x
2460  0375 97            	ld	xl,a
2461  0376 a601          	ld	a,#1
2462  0378 5d            	tnzw	x
2463  0379 2704          	jreq	L631
2464  037b               L041:
2465  037b 48            	sll	a
2466  037c 5a            	decw	x
2467  037d 26fc          	jrne	L041
2468  037f               L631:
2469  037f 43            	cpl	a
2470  0380 c4540c        	and	a,21516
2471  0383 c7540c        	ld	21516,a
2472  0386 2009          	jra	L5311
2473  0388               L7311:
2474                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2476  0388 7b02          	ld	a,(OFST+1,sp)
2477  038a 43            	cpl	a
2478  038b c45400        	and	a,21504
2479  038e c75400        	ld	21504,a
2480  0391               L5311:
2481                     ; 596 }
2484  0391 85            	popw	x
2485  0392 81            	ret
2540                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2540                     ; 617 {
2541                     	switch	.text
2542  0393               _ADC1_GetITStatus:
2544  0393 89            	pushw	x
2545  0394 88            	push	a
2546       00000001      OFST:	set	1
2549                     ; 618   ITStatus itstatus = RESET;
2551                     ; 619   uint8_t temp = 0;
2553                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2555                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2557  0395 01            	rrwa	x,a
2558  0396 a4f0          	and	a,#240
2559  0398 5f            	clrw	x
2560  0399 02            	rlwa	x,a
2561  039a a30010        	cpw	x,#16
2562  039d 2636          	jrne	L5711
2563                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2565  039f 7b03          	ld	a,(OFST+2,sp)
2566  03a1 a40f          	and	a,#15
2567  03a3 6b01          	ld	(OFST+0,sp),a
2569                     ; 628     if (temp < 8)
2571  03a5 7b01          	ld	a,(OFST+0,sp)
2572  03a7 a108          	cp	a,#8
2573  03a9 2414          	jruge	L7711
2574                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2576  03ab 7b01          	ld	a,(OFST+0,sp)
2577  03ad 5f            	clrw	x
2578  03ae 97            	ld	xl,a
2579  03af a601          	ld	a,#1
2580  03b1 5d            	tnzw	x
2581  03b2 2704          	jreq	L441
2582  03b4               L641:
2583  03b4 48            	sll	a
2584  03b5 5a            	decw	x
2585  03b6 26fc          	jrne	L641
2586  03b8               L441:
2587  03b8 c4540d        	and	a,21517
2588  03bb 6b01          	ld	(OFST+0,sp),a
2591  03bd 201d          	jra	L3021
2592  03bf               L7711:
2593                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2595  03bf 7b01          	ld	a,(OFST+0,sp)
2596  03c1 a008          	sub	a,#8
2597  03c3 5f            	clrw	x
2598  03c4 97            	ld	xl,a
2599  03c5 a601          	ld	a,#1
2600  03c7 5d            	tnzw	x
2601  03c8 2704          	jreq	L051
2602  03ca               L251:
2603  03ca 48            	sll	a
2604  03cb 5a            	decw	x
2605  03cc 26fc          	jrne	L251
2606  03ce               L051:
2607  03ce c4540c        	and	a,21516
2608  03d1 6b01          	ld	(OFST+0,sp),a
2610  03d3 2007          	jra	L3021
2611  03d5               L5711:
2612                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2614  03d5 c65400        	ld	a,21504
2615  03d8 1403          	and	a,(OFST+2,sp)
2616  03da 6b01          	ld	(OFST+0,sp),a
2618  03dc               L3021:
2619                     ; 641   return ((ITStatus)itstatus);
2621  03dc 7b01          	ld	a,(OFST+0,sp)
2624  03de 5b03          	addw	sp,#3
2625  03e0 81            	ret
2670                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2670                     ; 663 {
2671                     	switch	.text
2672  03e1               _ADC1_ClearITPendingBit:
2674  03e1 89            	pushw	x
2675  03e2 88            	push	a
2676       00000001      OFST:	set	1
2679                     ; 664   uint8_t temp = 0;
2681                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2683                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2685  03e3 01            	rrwa	x,a
2686  03e4 a4f0          	and	a,#240
2687  03e6 5f            	clrw	x
2688  03e7 02            	rlwa	x,a
2689  03e8 a30010        	cpw	x,#16
2690  03eb 263a          	jrne	L7221
2691                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2693  03ed 7b03          	ld	a,(OFST+2,sp)
2694  03ef a40f          	and	a,#15
2695  03f1 6b01          	ld	(OFST+0,sp),a
2697                     ; 673     if (temp < 8)
2699  03f3 7b01          	ld	a,(OFST+0,sp)
2700  03f5 a108          	cp	a,#8
2701  03f7 2416          	jruge	L1321
2702                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2704  03f9 7b01          	ld	a,(OFST+0,sp)
2705  03fb 5f            	clrw	x
2706  03fc 97            	ld	xl,a
2707  03fd a601          	ld	a,#1
2708  03ff 5d            	tnzw	x
2709  0400 2704          	jreq	L651
2710  0402               L061:
2711  0402 48            	sll	a
2712  0403 5a            	decw	x
2713  0404 26fc          	jrne	L061
2714  0406               L651:
2715  0406 43            	cpl	a
2716  0407 c4540d        	and	a,21517
2717  040a c7540d        	ld	21517,a
2719  040d 2021          	jra	L5321
2720  040f               L1321:
2721                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2723  040f 7b01          	ld	a,(OFST+0,sp)
2724  0411 a008          	sub	a,#8
2725  0413 5f            	clrw	x
2726  0414 97            	ld	xl,a
2727  0415 a601          	ld	a,#1
2728  0417 5d            	tnzw	x
2729  0418 2704          	jreq	L261
2730  041a               L461:
2731  041a 48            	sll	a
2732  041b 5a            	decw	x
2733  041c 26fc          	jrne	L461
2734  041e               L261:
2735  041e 43            	cpl	a
2736  041f c4540c        	and	a,21516
2737  0422 c7540c        	ld	21516,a
2738  0425 2009          	jra	L5321
2739  0427               L7221:
2740                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2742  0427 7b03          	ld	a,(OFST+2,sp)
2743  0429 43            	cpl	a
2744  042a c45400        	and	a,21504
2745  042d c75400        	ld	21504,a
2746  0430               L5321:
2747                     ; 686 }
2750  0430 5b03          	addw	sp,#3
2751  0432 81            	ret
2764                     	xdef	_ADC1_ClearITPendingBit
2765                     	xdef	_ADC1_GetITStatus
2766                     	xdef	_ADC1_ClearFlag
2767                     	xdef	_ADC1_GetFlagStatus
2768                     	xdef	_ADC1_GetAWDChannelStatus
2769                     	xdef	_ADC1_GetBufferValue
2770                     	xdef	_ADC1_SetLowThreshold
2771                     	xdef	_ADC1_SetHighThreshold
2772                     	xdef	_ADC1_GetConversionValue
2773                     	xdef	_ADC1_StartConversion
2774                     	xdef	_ADC1_AWDChannelConfig
2775                     	xdef	_ADC1_ExternalTriggerConfig
2776                     	xdef	_ADC1_ConversionConfig
2777                     	xdef	_ADC1_SchmittTriggerConfig
2778                     	xdef	_ADC1_PrescalerConfig
2779                     	xdef	_ADC1_ITConfig
2780                     	xdef	_ADC1_DataBufferCmd
2781                     	xdef	_ADC1_ScanModeCmd
2782                     	xdef	_ADC1_Cmd
2783                     	xdef	_ADC1_Init
2784                     	xdef	_ADC1_DeInit
2803                     	end
