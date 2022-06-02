   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  73                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  73                     ; 88 {
  75                     	switch	.text
  76  0000               _FLASH_Unlock:
  80                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  82                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  84  0000 a1fd          	cp	a,#253
  85  0002 260a          	jrne	L73
  86                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  88  0004 35565062      	mov	20578,#86
  89                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  91  0008 35ae5062      	mov	20578,#174
  93  000c 2008          	jra	L14
  94  000e               L73:
  95                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  97  000e 35ae5064      	mov	20580,#174
  98                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 100  0012 35565064      	mov	20580,#86
 101  0016               L14:
 102                     ; 104 }
 105  0016 81            	ret
 140                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 140                     ; 113 {
 141                     	switch	.text
 142  0017               _FLASH_Lock:
 146                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 148                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 150  0017 c4505f        	and	a,20575
 151  001a c7505f        	ld	20575,a
 152                     ; 119 }
 155  001d 81            	ret
 178                     ; 126 void FLASH_DeInit(void)
 178                     ; 127 {
 179                     	switch	.text
 180  001e               _FLASH_DeInit:
 184                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 186  001e 725f505a      	clr	20570
 187                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 189  0022 725f505b      	clr	20571
 190                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 192  0026 35ff505c      	mov	20572,#255
 193                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 195  002a 7217505f      	bres	20575,#3
 196                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 198  002e 7213505f      	bres	20575,#1
 199                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 201  0032 c6505f        	ld	a,20575
 202                     ; 134 }
 205  0035 81            	ret
 260                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 260                     ; 143 {
 261                     	switch	.text
 262  0036               _FLASH_ITConfig:
 266                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 268                     ; 147   if(NewState != DISABLE)
 270  0036 4d            	tnz	a
 271  0037 2706          	jreq	L711
 272                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 274  0039 7212505a      	bset	20570,#1
 276  003d 2004          	jra	L121
 277  003f               L711:
 278                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 280  003f 7213505a      	bres	20570,#1
 281  0043               L121:
 282                     ; 155 }
 285  0043 81            	ret
 319                     ; 164 void FLASH_EraseByte(uint32_t Address)
 319                     ; 165 {
 320                     	switch	.text
 321  0044               _FLASH_EraseByte:
 323       00000000      OFST:	set	0
 326                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 328                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 330  0044 1e05          	ldw	x,(OFST+5,sp)
 331  0046 7f            	clr	(x)
 332                     ; 171 }
 335  0047 81            	ret
 378                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 378                     ; 182 {
 379                     	switch	.text
 380  0048               _FLASH_ProgramByte:
 382       00000000      OFST:	set	0
 385                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 387                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 389  0048 7b07          	ld	a,(OFST+7,sp)
 390  004a 1e05          	ldw	x,(OFST+5,sp)
 391  004c f7            	ld	(x),a
 392                     ; 186 }
 395  004d 81            	ret
 429                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 429                     ; 196 {
 430                     	switch	.text
 431  004e               _FLASH_ReadByte:
 433       00000000      OFST:	set	0
 436                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 438                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 440  004e 1e05          	ldw	x,(OFST+5,sp)
 441  0050 f6            	ld	a,(x)
 444  0051 81            	ret
 487                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 487                     ; 213 {
 488                     	switch	.text
 489  0052               _FLASH_ProgramWord:
 491       00000000      OFST:	set	0
 494                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 496                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 498  0052 721c505b      	bset	20571,#6
 499                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 501  0056 721d505c      	bres	20572,#6
 502                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 504  005a 7b07          	ld	a,(OFST+7,sp)
 505  005c 1e05          	ldw	x,(OFST+5,sp)
 506  005e f7            	ld	(x),a
 507                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 509  005f 7b08          	ld	a,(OFST+8,sp)
 510  0061 1e05          	ldw	x,(OFST+5,sp)
 511  0063 e701          	ld	(1,x),a
 512                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 514  0065 7b09          	ld	a,(OFST+9,sp)
 515  0067 1e05          	ldw	x,(OFST+5,sp)
 516  0069 e702          	ld	(2,x),a
 517                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 519  006b 7b0a          	ld	a,(OFST+10,sp)
 520  006d 1e05          	ldw	x,(OFST+5,sp)
 521  006f e703          	ld	(3,x),a
 522                     ; 229 }
 525  0071 81            	ret
 570                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 570                     ; 238 {
 571                     	switch	.text
 572  0072               _FLASH_ProgramOptionByte:
 574  0072 89            	pushw	x
 575       00000000      OFST:	set	0
 578                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 580                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 582  0073 721e505b      	bset	20571,#7
 583                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 585  0077 721f505c      	bres	20572,#7
 586                     ; 247   if(Address == 0x4800)
 588  007b a34800        	cpw	x,#18432
 589  007e 2607          	jrne	L542
 590                     ; 250     *((NEAR uint8_t*)Address) = Data;
 592  0080 7b05          	ld	a,(OFST+5,sp)
 593  0082 1e01          	ldw	x,(OFST+1,sp)
 594  0084 f7            	ld	(x),a
 596  0085 200c          	jra	L742
 597  0087               L542:
 598                     ; 255     *((NEAR uint8_t*)Address) = Data;
 600  0087 7b05          	ld	a,(OFST+5,sp)
 601  0089 1e01          	ldw	x,(OFST+1,sp)
 602  008b f7            	ld	(x),a
 603                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 605  008c 7b05          	ld	a,(OFST+5,sp)
 606  008e 43            	cpl	a
 607  008f 1e01          	ldw	x,(OFST+1,sp)
 608  0091 e701          	ld	(1,x),a
 609  0093               L742:
 610                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 612  0093 a6fd          	ld	a,#253
 613  0095 cd017d        	call	_FLASH_WaitForLastOperation
 615                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 617  0098 721f505b      	bres	20571,#7
 618                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 620  009c 721e505c      	bset	20572,#7
 621                     ; 263 }
 624  00a0 85            	popw	x
 625  00a1 81            	ret
 661                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 661                     ; 271 {
 662                     	switch	.text
 663  00a2               _FLASH_EraseOptionByte:
 665  00a2 89            	pushw	x
 666       00000000      OFST:	set	0
 669                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 671                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 673  00a3 721e505b      	bset	20571,#7
 674                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 676  00a7 721f505c      	bres	20572,#7
 677                     ; 280   if(Address == 0x4800)
 679  00ab a34800        	cpw	x,#18432
 680  00ae 2603          	jrne	L762
 681                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 683  00b0 7f            	clr	(x)
 685  00b1 2009          	jra	L172
 686  00b3               L762:
 687                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 689  00b3 1e01          	ldw	x,(OFST+1,sp)
 690  00b5 7f            	clr	(x)
 691                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 693  00b6 1e01          	ldw	x,(OFST+1,sp)
 694  00b8 a6ff          	ld	a,#255
 695  00ba e701          	ld	(1,x),a
 696  00bc               L172:
 697                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 699  00bc a6fd          	ld	a,#253
 700  00be cd017d        	call	_FLASH_WaitForLastOperation
 702                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 704  00c1 721f505b      	bres	20571,#7
 705                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 707  00c5 721e505c      	bset	20572,#7
 708                     ; 296 }
 711  00c9 85            	popw	x
 712  00ca 81            	ret
 775                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 775                     ; 304 {
 776                     	switch	.text
 777  00cb               _FLASH_ReadOptionByte:
 779  00cb 5204          	subw	sp,#4
 780       00000004      OFST:	set	4
 783                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 785                     ; 306   uint16_t res_value = 0;
 787                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 789                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 791  00cd f6            	ld	a,(x)
 792  00ce 6b01          	ld	(OFST-3,sp),a
 794                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 796  00d0 e601          	ld	a,(1,x)
 797  00d2 6b02          	ld	(OFST-2,sp),a
 799                     ; 315   if(Address == 0x4800)	 
 801  00d4 a34800        	cpw	x,#18432
 802  00d7 2608          	jrne	L523
 803                     ; 317     res_value =	 value_optbyte;
 805  00d9 7b01          	ld	a,(OFST-3,sp)
 806  00db 5f            	clrw	x
 807  00dc 97            	ld	xl,a
 808  00dd 1f03          	ldw	(OFST-1,sp),x
 811  00df 2023          	jra	L723
 812  00e1               L523:
 813                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 815  00e1 7b02          	ld	a,(OFST-2,sp)
 816  00e3 43            	cpl	a
 817  00e4 1101          	cp	a,(OFST-3,sp)
 818  00e6 2617          	jrne	L133
 819                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 821  00e8 7b01          	ld	a,(OFST-3,sp)
 822  00ea 5f            	clrw	x
 823  00eb 97            	ld	xl,a
 824  00ec 4f            	clr	a
 825  00ed 02            	rlwa	x,a
 826  00ee 1f03          	ldw	(OFST-1,sp),x
 828                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 830  00f0 7b02          	ld	a,(OFST-2,sp)
 831  00f2 5f            	clrw	x
 832  00f3 97            	ld	xl,a
 833  00f4 01            	rrwa	x,a
 834  00f5 1a04          	or	a,(OFST+0,sp)
 835  00f7 01            	rrwa	x,a
 836  00f8 1a03          	or	a,(OFST-1,sp)
 837  00fa 01            	rrwa	x,a
 838  00fb 1f03          	ldw	(OFST-1,sp),x
 841  00fd 2005          	jra	L723
 842  00ff               L133:
 843                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 845  00ff ae5555        	ldw	x,#21845
 846  0102 1f03          	ldw	(OFST-1,sp),x
 848  0104               L723:
 849                     ; 331   return(res_value);
 851  0104 1e03          	ldw	x,(OFST-1,sp)
 854  0106 5b04          	addw	sp,#4
 855  0108 81            	ret
 929                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 929                     ; 341 {
 930                     	switch	.text
 931  0109               _FLASH_SetLowPowerMode:
 933  0109 88            	push	a
 934       00000000      OFST:	set	0
 937                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 939                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 941  010a c6505a        	ld	a,20570
 942  010d a4f3          	and	a,#243
 943  010f c7505a        	ld	20570,a
 944                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 946  0112 c6505a        	ld	a,20570
 947  0115 1a01          	or	a,(OFST+1,sp)
 948  0117 c7505a        	ld	20570,a
 949                     ; 350 }
 952  011a 84            	pop	a
 953  011b 81            	ret
1011                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1011                     ; 359 {
1012                     	switch	.text
1013  011c               _FLASH_SetProgrammingTime:
1017                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1019                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1021  011c 7211505a      	bres	20570,#0
1022                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1024  0120 ca505a        	or	a,20570
1025  0123 c7505a        	ld	20570,a
1026                     ; 365 }
1029  0126 81            	ret
1054                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1054                     ; 373 {
1055                     	switch	.text
1056  0127               _FLASH_GetLowPowerMode:
1060                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1062  0127 c6505a        	ld	a,20570
1063  012a a40c          	and	a,#12
1066  012c 81            	ret
1091                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1091                     ; 383 {
1092                     	switch	.text
1093  012d               _FLASH_GetProgrammingTime:
1097                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1099  012d c6505a        	ld	a,20570
1100  0130 a401          	and	a,#1
1103  0132 81            	ret
1137                     ; 392 uint32_t FLASH_GetBootSize(void)
1137                     ; 393 {
1138                     	switch	.text
1139  0133               _FLASH_GetBootSize:
1141  0133 5204          	subw	sp,#4
1142       00000004      OFST:	set	4
1145                     ; 394   uint32_t temp = 0;
1147                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1149  0135 c6505d        	ld	a,20573
1150  0138 5f            	clrw	x
1151  0139 97            	ld	xl,a
1152  013a 90ae0200      	ldw	y,#512
1153  013e cd0000        	call	c_umul
1155  0141 96            	ldw	x,sp
1156  0142 1c0001        	addw	x,#OFST-3
1157  0145 cd0000        	call	c_rtol
1160                     ; 400   if(FLASH->FPR == 0xFF)
1162  0148 c6505d        	ld	a,20573
1163  014b a1ff          	cp	a,#255
1164  014d 2611          	jrne	L354
1165                     ; 402     temp += 512;
1167  014f ae0200        	ldw	x,#512
1168  0152 bf02          	ldw	c_lreg+2,x
1169  0154 ae0000        	ldw	x,#0
1170  0157 bf00          	ldw	c_lreg,x
1171  0159 96            	ldw	x,sp
1172  015a 1c0001        	addw	x,#OFST-3
1173  015d cd0000        	call	c_lgadd
1176  0160               L354:
1177                     ; 406   return(temp);
1179  0160 96            	ldw	x,sp
1180  0161 1c0001        	addw	x,#OFST-3
1181  0164 cd0000        	call	c_ltor
1185  0167 5b04          	addw	sp,#4
1186  0169 81            	ret
1295                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1295                     ; 418 {
1296                     	switch	.text
1297  016a               _FLASH_GetFlagStatus:
1299  016a 88            	push	a
1300       00000001      OFST:	set	1
1303                     ; 419   FlagStatus status = RESET;
1305                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1307                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1309  016b c4505f        	and	a,20575
1310  016e 2706          	jreq	L525
1311                     ; 426     status = SET; /* FLASH_FLAG is set */
1313  0170 a601          	ld	a,#1
1314  0172 6b01          	ld	(OFST+0,sp),a
1317  0174 2002          	jra	L725
1318  0176               L525:
1319                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1321  0176 0f01          	clr	(OFST+0,sp)
1323  0178               L725:
1324                     ; 434   return status;
1326  0178 7b01          	ld	a,(OFST+0,sp)
1329  017a 5b01          	addw	sp,#1
1330  017c 81            	ret
1423                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1423                     ; 550 {
1424                     	switch	.text
1425  017d               _FLASH_WaitForLastOperation:
1427  017d 5203          	subw	sp,#3
1428       00000003      OFST:	set	3
1431                     ; 551   uint8_t flagstatus = 0x00;
1433  017f 0f03          	clr	(OFST+0,sp)
1435                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1437  0181 aeffff        	ldw	x,#65535
1438  0184 1f01          	ldw	(OFST-2,sp),x
1440                     ; 557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1442  0186 a1fd          	cp	a,#253
1443  0188 2628          	jrne	L116
1445  018a 200e          	jra	L775
1446  018c               L575:
1447                     ; 561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1447                     ; 562                                                         FLASH_IAPSR_WR_PG_DIS));
1449  018c c6505f        	ld	a,20575
1450  018f a405          	and	a,#5
1451  0191 6b03          	ld	(OFST+0,sp),a
1453                     ; 563         timeout--;
1455  0193 1e01          	ldw	x,(OFST-2,sp)
1456  0195 1d0001        	subw	x,#1
1457  0198 1f01          	ldw	(OFST-2,sp),x
1459  019a               L775:
1460                     ; 559       while((flagstatus == 0x00) && (timeout != 0x00))
1462  019a 0d03          	tnz	(OFST+0,sp)
1463  019c 261c          	jrne	L506
1465  019e 1e01          	ldw	x,(OFST-2,sp)
1466  01a0 26ea          	jrne	L575
1467  01a2 2016          	jra	L506
1468  01a4               L706:
1469                     ; 570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1469                     ; 571                                                         FLASH_IAPSR_WR_PG_DIS));
1471  01a4 c6505f        	ld	a,20575
1472  01a7 a441          	and	a,#65
1473  01a9 6b03          	ld	(OFST+0,sp),a
1475                     ; 572         timeout--;
1477  01ab 1e01          	ldw	x,(OFST-2,sp)
1478  01ad 1d0001        	subw	x,#1
1479  01b0 1f01          	ldw	(OFST-2,sp),x
1481  01b2               L116:
1482                     ; 568       while((flagstatus == 0x00) && (timeout != 0x00))
1484  01b2 0d03          	tnz	(OFST+0,sp)
1485  01b4 2604          	jrne	L506
1487  01b6 1e01          	ldw	x,(OFST-2,sp)
1488  01b8 26ea          	jrne	L706
1489  01ba               L506:
1490                     ; 584   if(timeout == 0x00 )
1492  01ba 1e01          	ldw	x,(OFST-2,sp)
1493  01bc 2604          	jrne	L716
1494                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
1496  01be a602          	ld	a,#2
1497  01c0 6b03          	ld	(OFST+0,sp),a
1499  01c2               L716:
1500                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
1502  01c2 7b03          	ld	a,(OFST+0,sp)
1505  01c4 5b03          	addw	sp,#3
1506  01c6 81            	ret
1569                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1569                     ; 600 {
1570                     	switch	.text
1571  01c7               _FLASH_EraseBlock:
1573  01c7 89            	pushw	x
1574  01c8 5206          	subw	sp,#6
1575       00000006      OFST:	set	6
1578                     ; 601   uint32_t startaddress = 0;
1580                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1582                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1584  01ca 7b0b          	ld	a,(OFST+5,sp)
1585  01cc a1fd          	cp	a,#253
1586  01ce 260c          	jrne	L356
1587                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1589                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1591  01d0 ae8000        	ldw	x,#32768
1592  01d3 1f05          	ldw	(OFST-1,sp),x
1593  01d5 ae0000        	ldw	x,#0
1594  01d8 1f03          	ldw	(OFST-3,sp),x
1597  01da 200a          	jra	L556
1598  01dc               L356:
1599                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1601                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1603  01dc ae4000        	ldw	x,#16384
1604  01df 1f05          	ldw	(OFST-1,sp),x
1605  01e1 ae0000        	ldw	x,#0
1606  01e4 1f03          	ldw	(OFST-3,sp),x
1608  01e6               L556:
1609                     ; 628     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1611  01e6 1e07          	ldw	x,(OFST+1,sp)
1612  01e8 a680          	ld	a,#128
1613  01ea cd0000        	call	c_cmulx
1615  01ed 96            	ldw	x,sp
1616  01ee 1c0003        	addw	x,#OFST-3
1617  01f1 cd0000        	call	c_ladd
1619  01f4 be02          	ldw	x,c_lreg+2
1620  01f6 1f01          	ldw	(OFST-5,sp),x
1622                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
1624  01f8 721a505b      	bset	20571,#5
1625                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1627  01fc 721b505c      	bres	20572,#5
1628                     ; 637     *pwFlash = (uint32_t)0;
1630  0200 1e01          	ldw	x,(OFST-5,sp)
1631  0202 a600          	ld	a,#0
1632  0204 e703          	ld	(3,x),a
1633  0206 a600          	ld	a,#0
1634  0208 e702          	ld	(2,x),a
1635  020a a600          	ld	a,#0
1636  020c e701          	ld	(1,x),a
1637  020e a600          	ld	a,#0
1638  0210 f7            	ld	(x),a
1639                     ; 645 }
1642  0211 5b08          	addw	sp,#8
1643  0213 81            	ret
1747                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1747                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1747                     ; 658 {
1748                     	switch	.text
1749  0214               _FLASH_ProgramBlock:
1751  0214 89            	pushw	x
1752  0215 5206          	subw	sp,#6
1753       00000006      OFST:	set	6
1756                     ; 659   uint16_t Count = 0;
1758                     ; 660   uint32_t startaddress = 0;
1760                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1762                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1764                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1766  0217 7b0b          	ld	a,(OFST+5,sp)
1767  0219 a1fd          	cp	a,#253
1768  021b 260c          	jrne	L137
1769                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1771                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1773  021d ae8000        	ldw	x,#32768
1774  0220 1f03          	ldw	(OFST-3,sp),x
1775  0222 ae0000        	ldw	x,#0
1776  0225 1f01          	ldw	(OFST-5,sp),x
1779  0227 200a          	jra	L337
1780  0229               L137:
1781                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1783                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1785  0229 ae4000        	ldw	x,#16384
1786  022c 1f03          	ldw	(OFST-3,sp),x
1787  022e ae0000        	ldw	x,#0
1788  0231 1f01          	ldw	(OFST-5,sp),x
1790  0233               L337:
1791                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1793  0233 1e07          	ldw	x,(OFST+1,sp)
1794  0235 a680          	ld	a,#128
1795  0237 cd0000        	call	c_cmulx
1797  023a 96            	ldw	x,sp
1798  023b 1c0001        	addw	x,#OFST-5
1799  023e cd0000        	call	c_lgadd
1802                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1804  0241 0d0c          	tnz	(OFST+6,sp)
1805  0243 260a          	jrne	L537
1806                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
1808  0245 7210505b      	bset	20571,#0
1809                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1811  0249 7211505c      	bres	20572,#0
1813  024d 2008          	jra	L737
1814  024f               L537:
1815                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
1817  024f 7218505b      	bset	20571,#4
1818                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1820  0253 7219505c      	bres	20572,#4
1821  0257               L737:
1822                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1824  0257 5f            	clrw	x
1825  0258 1f05          	ldw	(OFST-1,sp),x
1827  025a               L147:
1828                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1830  025a 1e0d          	ldw	x,(OFST+7,sp)
1831  025c 72fb05        	addw	x,(OFST-1,sp)
1832  025f f6            	ld	a,(x)
1833  0260 1e03          	ldw	x,(OFST-3,sp)
1834  0262 72fb05        	addw	x,(OFST-1,sp)
1835  0265 f7            	ld	(x),a
1836                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1838  0266 1e05          	ldw	x,(OFST-1,sp)
1839  0268 1c0001        	addw	x,#1
1840  026b 1f05          	ldw	(OFST-1,sp),x
1844  026d 1e05          	ldw	x,(OFST-1,sp)
1845  026f a30080        	cpw	x,#128
1846  0272 25e6          	jrult	L147
1847                     ; 698 }
1850  0274 5b08          	addw	sp,#8
1851  0276 81            	ret
1864                     	xdef	_FLASH_WaitForLastOperation
1865                     	xdef	_FLASH_ProgramBlock
1866                     	xdef	_FLASH_EraseBlock
1867                     	xdef	_FLASH_GetFlagStatus
1868                     	xdef	_FLASH_GetBootSize
1869                     	xdef	_FLASH_GetProgrammingTime
1870                     	xdef	_FLASH_GetLowPowerMode
1871                     	xdef	_FLASH_SetProgrammingTime
1872                     	xdef	_FLASH_SetLowPowerMode
1873                     	xdef	_FLASH_EraseOptionByte
1874                     	xdef	_FLASH_ProgramOptionByte
1875                     	xdef	_FLASH_ReadOptionByte
1876                     	xdef	_FLASH_ProgramWord
1877                     	xdef	_FLASH_ReadByte
1878                     	xdef	_FLASH_ProgramByte
1879                     	xdef	_FLASH_EraseByte
1880                     	xdef	_FLASH_ITConfig
1881                     	xdef	_FLASH_DeInit
1882                     	xdef	_FLASH_Lock
1883                     	xdef	_FLASH_Unlock
1884                     	xref.b	c_lreg
1885                     	xref.b	c_x
1886                     	xref.b	c_y
1905                     	xref	c_ladd
1906                     	xref	c_cmulx
1907                     	xref	c_ltor
1908                     	xref	c_lgadd
1909                     	xref	c_rtol
1910                     	xref	c_umul
1911                     	end
