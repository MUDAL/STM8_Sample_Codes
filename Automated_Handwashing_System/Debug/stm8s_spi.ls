   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 50 void SPI_DeInit(void)
  41                     ; 51 {
  43                     	switch	.text
  44  0000               _SPI_DeInit:
  48                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  50  0000 725f5200      	clr	20992
  51                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  53  0004 725f5201      	clr	20993
  54                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  56  0008 725f5202      	clr	20994
  57                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  59  000c 35025203      	mov	20995,#2
  60                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  62  0010 35075205      	mov	20997,#7
  63                     ; 57 }
  66  0014 81            	ret
 382                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 382                     ; 79 {
 383                     	switch	.text
 384  0015               _SPI_Init:
 386  0015 89            	pushw	x
 387  0016 88            	push	a
 388       00000001      OFST:	set	1
 391                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 393                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 395                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 397                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 399                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 401                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 403                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 405                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 407                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 407                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 409  0017 7b07          	ld	a,(OFST+6,sp)
 410  0019 1a08          	or	a,(OFST+7,sp)
 411  001b 6b01          	ld	(OFST+0,sp),a
 413  001d 9f            	ld	a,xl
 414  001e 1a02          	or	a,(OFST+1,sp)
 415  0020 1a01          	or	a,(OFST+0,sp)
 416  0022 c75200        	ld	20992,a
 417                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 419  0025 7b09          	ld	a,(OFST+8,sp)
 420  0027 1a0a          	or	a,(OFST+9,sp)
 421  0029 c75201        	ld	20993,a
 422                     ; 97   if (Mode == SPI_MODE_MASTER)
 424  002c 7b06          	ld	a,(OFST+5,sp)
 425  002e a104          	cp	a,#4
 426  0030 2606          	jrne	L302
 427                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 429  0032 72105201      	bset	20993,#0
 431  0036 2004          	jra	L502
 432  0038               L302:
 433                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 435  0038 72115201      	bres	20993,#0
 436  003c               L502:
 437                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 439  003c c65200        	ld	a,20992
 440  003f 1a06          	or	a,(OFST+5,sp)
 441  0041 c75200        	ld	20992,a
 442                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 444  0044 7b0b          	ld	a,(OFST+10,sp)
 445  0046 c75205        	ld	20997,a
 446                     ; 111 }
 449  0049 5b03          	addw	sp,#3
 450  004b 81            	ret
 505                     ; 119 void SPI_Cmd(FunctionalState NewState)
 505                     ; 120 {
 506                     	switch	.text
 507  004c               _SPI_Cmd:
 511                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 513                     ; 124   if (NewState != DISABLE)
 515  004c 4d            	tnz	a
 516  004d 2706          	jreq	L532
 517                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 519  004f 721c5200      	bset	20992,#6
 521  0053 2004          	jra	L732
 522  0055               L532:
 523                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 525  0055 721d5200      	bres	20992,#6
 526  0059               L732:
 527                     ; 132 }
 530  0059 81            	ret
 639                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 639                     ; 142 {
 640                     	switch	.text
 641  005a               _SPI_ITConfig:
 643  005a 89            	pushw	x
 644  005b 88            	push	a
 645       00000001      OFST:	set	1
 648                     ; 143   uint8_t itpos = 0;
 650                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 652                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 654                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 656  005c 9e            	ld	a,xh
 657  005d a40f          	and	a,#15
 658  005f 5f            	clrw	x
 659  0060 97            	ld	xl,a
 660  0061 a601          	ld	a,#1
 661  0063 5d            	tnzw	x
 662  0064 2704          	jreq	L41
 663  0066               L61:
 664  0066 48            	sll	a
 665  0067 5a            	decw	x
 666  0068 26fc          	jrne	L61
 667  006a               L41:
 668  006a 6b01          	ld	(OFST+0,sp),a
 670                     ; 151   if (NewState != DISABLE)
 672  006c 0d03          	tnz	(OFST+2,sp)
 673  006e 270a          	jreq	L113
 674                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 676  0070 c65202        	ld	a,20994
 677  0073 1a01          	or	a,(OFST+0,sp)
 678  0075 c75202        	ld	20994,a
 680  0078 2009          	jra	L313
 681  007a               L113:
 682                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 684  007a 7b01          	ld	a,(OFST+0,sp)
 685  007c 43            	cpl	a
 686  007d c45202        	and	a,20994
 687  0080 c75202        	ld	20994,a
 688  0083               L313:
 689                     ; 159 }
 692  0083 5b03          	addw	sp,#3
 693  0085 81            	ret
 727                     ; 166 void SPI_SendData(uint8_t Data)
 727                     ; 167 {
 728                     	switch	.text
 729  0086               _SPI_SendData:
 733                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 735  0086 c75204        	ld	20996,a
 736                     ; 169 }
 739  0089 81            	ret
 762                     ; 176 uint8_t SPI_ReceiveData(void)
 762                     ; 177 {
 763                     	switch	.text
 764  008a               _SPI_ReceiveData:
 768                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 770  008a c65204        	ld	a,20996
 773  008d 81            	ret
 809                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 809                     ; 188 {
 810                     	switch	.text
 811  008e               _SPI_NSSInternalSoftwareCmd:
 815                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 817                     ; 192   if (NewState != DISABLE)
 819  008e 4d            	tnz	a
 820  008f 2706          	jreq	L163
 821                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 823  0091 72105201      	bset	20993,#0
 825  0095 2004          	jra	L363
 826  0097               L163:
 827                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 829  0097 72115201      	bres	20993,#0
 830  009b               L363:
 831                     ; 200 }
 834  009b 81            	ret
 857                     ; 207 void SPI_TransmitCRC(void)
 857                     ; 208 {
 858                     	switch	.text
 859  009c               _SPI_TransmitCRC:
 863                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 865  009c 72185201      	bset	20993,#4
 866                     ; 210 }
 869  00a0 81            	ret
 905                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 905                     ; 219 {
 906                     	switch	.text
 907  00a1               _SPI_CalculateCRCCmd:
 911                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 913                     ; 223   if (NewState != DISABLE)
 915  00a1 4d            	tnz	a
 916  00a2 2706          	jreq	L314
 917                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 919  00a4 721a5201      	bset	20993,#5
 921  00a8 2004          	jra	L514
 922  00aa               L314:
 923                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 925  00aa 721b5201      	bres	20993,#5
 926  00ae               L514:
 927                     ; 231 }
 930  00ae 81            	ret
 994                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 994                     ; 239 {
 995                     	switch	.text
 996  00af               _SPI_GetCRC:
 998  00af 88            	push	a
 999       00000001      OFST:	set	1
1002                     ; 240   uint8_t crcreg = 0;
1004                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1006                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1008  00b0 4d            	tnz	a
1009  00b1 2707          	jreq	L154
1010                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1012  00b3 c65207        	ld	a,20999
1013  00b6 6b01          	ld	(OFST+0,sp),a
1016  00b8 2005          	jra	L354
1017  00ba               L154:
1018                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1020  00ba c65206        	ld	a,20998
1021  00bd 6b01          	ld	(OFST+0,sp),a
1023  00bf               L354:
1024                     ; 255   return crcreg;
1026  00bf 7b01          	ld	a,(OFST+0,sp)
1029  00c1 5b01          	addw	sp,#1
1030  00c3 81            	ret
1055                     ; 263 void SPI_ResetCRC(void)
1055                     ; 264 {
1056                     	switch	.text
1057  00c4               _SPI_ResetCRC:
1061                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1063  00c4 a601          	ld	a,#1
1064  00c6 add9          	call	_SPI_CalculateCRCCmd
1066                     ; 270   SPI_Cmd(ENABLE);
1068  00c8 a601          	ld	a,#1
1069  00ca ad80          	call	_SPI_Cmd
1071                     ; 271 }
1074  00cc 81            	ret
1098                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1098                     ; 279 {
1099                     	switch	.text
1100  00cd               _SPI_GetCRCPolynomial:
1104                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1106  00cd c65205        	ld	a,20997
1109  00d0 81            	ret
1165                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1165                     ; 289 {
1166                     	switch	.text
1167  00d1               _SPI_BiDirectionalLineConfig:
1171                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1173                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1175  00d1 4d            	tnz	a
1176  00d2 2706          	jreq	L325
1177                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1179  00d4 721c5201      	bset	20993,#6
1181  00d8 2004          	jra	L525
1182  00da               L325:
1183                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1185  00da 721d5201      	bres	20993,#6
1186  00de               L525:
1187                     ; 301 }
1190  00de 81            	ret
1311                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1311                     ; 312 {
1312                     	switch	.text
1313  00df               _SPI_GetFlagStatus:
1315  00df 88            	push	a
1316       00000001      OFST:	set	1
1319                     ; 313   FlagStatus status = RESET;
1321                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1323                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1325  00e0 c45203        	and	a,20995
1326  00e3 2706          	jreq	L306
1327                     ; 320     status = SET; /* SPI_FLAG is set */
1329  00e5 a601          	ld	a,#1
1330  00e7 6b01          	ld	(OFST+0,sp),a
1333  00e9 2002          	jra	L506
1334  00eb               L306:
1335                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1337  00eb 0f01          	clr	(OFST+0,sp)
1339  00ed               L506:
1340                     ; 328   return status;
1342  00ed 7b01          	ld	a,(OFST+0,sp)
1345  00ef 5b01          	addw	sp,#1
1346  00f1 81            	ret
1381                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1381                     ; 347 {
1382                     	switch	.text
1383  00f2               _SPI_ClearFlag:
1387                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1389                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1391  00f2 43            	cpl	a
1392  00f3 c75203        	ld	20995,a
1393                     ; 351 }
1396  00f6 81            	ret
1478                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1478                     ; 367 {
1479                     	switch	.text
1480  00f7               _SPI_GetITStatus:
1482  00f7 88            	push	a
1483  00f8 89            	pushw	x
1484       00000002      OFST:	set	2
1487                     ; 368   ITStatus pendingbitstatus = RESET;
1489                     ; 369   uint8_t itpos = 0;
1491                     ; 370   uint8_t itmask1 = 0;
1493                     ; 371   uint8_t itmask2 = 0;
1495                     ; 372   uint8_t enablestatus = 0;
1497                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1499                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1501  00f9 a40f          	and	a,#15
1502  00fb 5f            	clrw	x
1503  00fc 97            	ld	xl,a
1504  00fd a601          	ld	a,#1
1505  00ff 5d            	tnzw	x
1506  0100 2704          	jreq	L05
1507  0102               L25:
1508  0102 48            	sll	a
1509  0103 5a            	decw	x
1510  0104 26fc          	jrne	L25
1511  0106               L05:
1512  0106 6b01          	ld	(OFST-1,sp),a
1514                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1516  0108 7b03          	ld	a,(OFST+1,sp)
1517  010a 4e            	swap	a
1518  010b a40f          	and	a,#15
1519  010d 6b02          	ld	(OFST+0,sp),a
1521                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1523  010f 7b02          	ld	a,(OFST+0,sp)
1524  0111 5f            	clrw	x
1525  0112 97            	ld	xl,a
1526  0113 a601          	ld	a,#1
1527  0115 5d            	tnzw	x
1528  0116 2704          	jreq	L45
1529  0118               L65:
1530  0118 48            	sll	a
1531  0119 5a            	decw	x
1532  011a 26fc          	jrne	L65
1533  011c               L45:
1534  011c 6b02          	ld	(OFST+0,sp),a
1536                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1538  011e c65203        	ld	a,20995
1539  0121 1402          	and	a,(OFST+0,sp)
1540  0123 6b02          	ld	(OFST+0,sp),a
1542                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1544  0125 c65202        	ld	a,20994
1545  0128 1501          	bcp	a,(OFST-1,sp)
1546  012a 270a          	jreq	L766
1548  012c 0d02          	tnz	(OFST+0,sp)
1549  012e 2706          	jreq	L766
1550                     ; 387     pendingbitstatus = SET;
1552  0130 a601          	ld	a,#1
1553  0132 6b02          	ld	(OFST+0,sp),a
1556  0134 2002          	jra	L176
1557  0136               L766:
1558                     ; 392     pendingbitstatus = RESET;
1560  0136 0f02          	clr	(OFST+0,sp)
1562  0138               L176:
1563                     ; 395   return  pendingbitstatus;
1565  0138 7b02          	ld	a,(OFST+0,sp)
1568  013a 5b03          	addw	sp,#3
1569  013c 81            	ret
1614                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1614                     ; 413 {
1615                     	switch	.text
1616  013d               _SPI_ClearITPendingBit:
1618  013d 88            	push	a
1619       00000001      OFST:	set	1
1622                     ; 414   uint8_t itpos = 0;
1624                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1626                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1628  013e a4f0          	and	a,#240
1629  0140 4e            	swap	a
1630  0141 a40f          	and	a,#15
1631  0143 5f            	clrw	x
1632  0144 97            	ld	xl,a
1633  0145 a601          	ld	a,#1
1634  0147 5d            	tnzw	x
1635  0148 2704          	jreq	L26
1636  014a               L46:
1637  014a 48            	sll	a
1638  014b 5a            	decw	x
1639  014c 26fc          	jrne	L46
1640  014e               L26:
1641  014e 6b01          	ld	(OFST+0,sp),a
1643                     ; 422   SPI->SR = (uint8_t)(~itpos);
1645  0150 7b01          	ld	a,(OFST+0,sp)
1646  0152 43            	cpl	a
1647  0153 c75203        	ld	20995,a
1648                     ; 424 }
1651  0156 84            	pop	a
1652  0157 81            	ret
1665                     	xdef	_SPI_ClearITPendingBit
1666                     	xdef	_SPI_GetITStatus
1667                     	xdef	_SPI_ClearFlag
1668                     	xdef	_SPI_GetFlagStatus
1669                     	xdef	_SPI_BiDirectionalLineConfig
1670                     	xdef	_SPI_GetCRCPolynomial
1671                     	xdef	_SPI_ResetCRC
1672                     	xdef	_SPI_GetCRC
1673                     	xdef	_SPI_CalculateCRCCmd
1674                     	xdef	_SPI_TransmitCRC
1675                     	xdef	_SPI_NSSInternalSoftwareCmd
1676                     	xdef	_SPI_ReceiveData
1677                     	xdef	_SPI_SendData
1678                     	xdef	_SPI_ITConfig
1679                     	xdef	_SPI_Cmd
1680                     	xdef	_SPI_Init
1681                     	xdef	_SPI_DeInit
1700                     	end
