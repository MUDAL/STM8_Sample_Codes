   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 67 void I2C_DeInit(void)
  41                     ; 68 {
  43                     	switch	.text
  44  0000               _I2C_DeInit:
  48                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  50  0000 725f5210      	clr	21008
  51                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  53  0004 725f5211      	clr	21009
  54                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  56  0008 725f5212      	clr	21010
  57                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  59  000c 725f5213      	clr	21011
  60                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  62  0010 725f5214      	clr	21012
  63                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  65  0014 725f521a      	clr	21018
  66                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  68  0018 725f521b      	clr	21019
  69                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  71  001c 725f521c      	clr	21020
  72                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  74  0020 3502521d      	mov	21021,#2
  75                     ; 78 }
  78  0024 81            	ret
 257                     .const:	section	.text
 258  0000               L01:
 259  0000 000186a1      	dc.l	100001
 260  0004               L21:
 261  0004 000f4240      	dc.l	1000000
 262                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 262                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 262                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 262                     ; 99 {
 263                     	switch	.text
 264  0025               _I2C_Init:
 266  0025 5209          	subw	sp,#9
 267       00000009      OFST:	set	9
 270                     ; 100   uint16_t result = 0x0004;
 272                     ; 101   uint16_t tmpval = 0;
 274                     ; 102   uint8_t tmpccrh = 0;
 276  0027 0f07          	clr	(OFST-2,sp)
 278                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 280                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 282                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 284                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 286                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 288                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 290                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 292  0029 c65212        	ld	a,21010
 293  002c a4c0          	and	a,#192
 294  002e c75212        	ld	21010,a
 295                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 297  0031 c65212        	ld	a,21010
 298  0034 1a15          	or	a,(OFST+12,sp)
 299  0036 c75212        	ld	21010,a
 300                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 302  0039 72115210      	bres	21008,#0
 303                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 305  003d c6521c        	ld	a,21020
 306  0040 a430          	and	a,#48
 307  0042 c7521c        	ld	21020,a
 308                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 310  0045 725f521b      	clr	21019
 311                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 313  0049 96            	ldw	x,sp
 314  004a 1c000c        	addw	x,#OFST+3
 315  004d cd0000        	call	c_ltor
 317  0050 ae0000        	ldw	x,#L01
 318  0053 cd0000        	call	c_lcmp
 320  0056 2403          	jruge	L41
 321  0058 cc00e5        	jp	L131
 322  005b               L41:
 323                     ; 131     tmpccrh = I2C_CCRH_FS;
 325  005b a680          	ld	a,#128
 326  005d 6b07          	ld	(OFST-2,sp),a
 328                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 330  005f 0d12          	tnz	(OFST+9,sp)
 331  0061 2630          	jrne	L331
 332                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 334  0063 96            	ldw	x,sp
 335  0064 1c000c        	addw	x,#OFST+3
 336  0067 cd0000        	call	c_ltor
 338  006a a603          	ld	a,#3
 339  006c cd0000        	call	c_smul
 341  006f 96            	ldw	x,sp
 342  0070 1c0001        	addw	x,#OFST-8
 343  0073 cd0000        	call	c_rtol
 346  0076 7b15          	ld	a,(OFST+12,sp)
 347  0078 b703          	ld	c_lreg+3,a
 348  007a 3f02          	clr	c_lreg+2
 349  007c 3f01          	clr	c_lreg+1
 350  007e 3f00          	clr	c_lreg
 351  0080 ae0004        	ldw	x,#L21
 352  0083 cd0000        	call	c_lmul
 354  0086 96            	ldw	x,sp
 355  0087 1c0001        	addw	x,#OFST-8
 356  008a cd0000        	call	c_ludv
 358  008d be02          	ldw	x,c_lreg+2
 359  008f 1f08          	ldw	(OFST-1,sp),x
 362  0091 2034          	jra	L531
 363  0093               L331:
 364                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 366  0093 96            	ldw	x,sp
 367  0094 1c000c        	addw	x,#OFST+3
 368  0097 cd0000        	call	c_ltor
 370  009a a619          	ld	a,#25
 371  009c cd0000        	call	c_smul
 373  009f 96            	ldw	x,sp
 374  00a0 1c0001        	addw	x,#OFST-8
 375  00a3 cd0000        	call	c_rtol
 378  00a6 7b15          	ld	a,(OFST+12,sp)
 379  00a8 b703          	ld	c_lreg+3,a
 380  00aa 3f02          	clr	c_lreg+2
 381  00ac 3f01          	clr	c_lreg+1
 382  00ae 3f00          	clr	c_lreg
 383  00b0 ae0004        	ldw	x,#L21
 384  00b3 cd0000        	call	c_lmul
 386  00b6 96            	ldw	x,sp
 387  00b7 1c0001        	addw	x,#OFST-8
 388  00ba cd0000        	call	c_ludv
 390  00bd be02          	ldw	x,c_lreg+2
 391  00bf 1f08          	ldw	(OFST-1,sp),x
 393                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 395  00c1 7b07          	ld	a,(OFST-2,sp)
 396  00c3 aa40          	or	a,#64
 397  00c5 6b07          	ld	(OFST-2,sp),a
 399  00c7               L531:
 400                     ; 147     if (result < (uint16_t)0x01)
 402  00c7 1e08          	ldw	x,(OFST-1,sp)
 403  00c9 2605          	jrne	L731
 404                     ; 150       result = (uint16_t)0x0001;
 406  00cb ae0001        	ldw	x,#1
 407  00ce 1f08          	ldw	(OFST-1,sp),x
 409  00d0               L731:
 410                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 412  00d0 7b15          	ld	a,(OFST+12,sp)
 413  00d2 97            	ld	xl,a
 414  00d3 a603          	ld	a,#3
 415  00d5 42            	mul	x,a
 416  00d6 a60a          	ld	a,#10
 417  00d8 cd0000        	call	c_sdivx
 419  00db 5c            	incw	x
 420  00dc 1f05          	ldw	(OFST-4,sp),x
 422                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 424  00de 7b06          	ld	a,(OFST-3,sp)
 425  00e0 c7521d        	ld	21021,a
 427  00e3 2043          	jra	L141
 428  00e5               L131:
 429                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 431  00e5 96            	ldw	x,sp
 432  00e6 1c000c        	addw	x,#OFST+3
 433  00e9 cd0000        	call	c_ltor
 435  00ec 3803          	sll	c_lreg+3
 436  00ee 3902          	rlc	c_lreg+2
 437  00f0 3901          	rlc	c_lreg+1
 438  00f2 3900          	rlc	c_lreg
 439  00f4 96            	ldw	x,sp
 440  00f5 1c0001        	addw	x,#OFST-8
 441  00f8 cd0000        	call	c_rtol
 444  00fb 7b15          	ld	a,(OFST+12,sp)
 445  00fd b703          	ld	c_lreg+3,a
 446  00ff 3f02          	clr	c_lreg+2
 447  0101 3f01          	clr	c_lreg+1
 448  0103 3f00          	clr	c_lreg
 449  0105 ae0004        	ldw	x,#L21
 450  0108 cd0000        	call	c_lmul
 452  010b 96            	ldw	x,sp
 453  010c 1c0001        	addw	x,#OFST-8
 454  010f cd0000        	call	c_ludv
 456  0112 be02          	ldw	x,c_lreg+2
 457  0114 1f08          	ldw	(OFST-1,sp),x
 459                     ; 167     if (result < (uint16_t)0x0004)
 461  0116 1e08          	ldw	x,(OFST-1,sp)
 462  0118 a30004        	cpw	x,#4
 463  011b 2405          	jruge	L341
 464                     ; 170       result = (uint16_t)0x0004;
 466  011d ae0004        	ldw	x,#4
 467  0120 1f08          	ldw	(OFST-1,sp),x
 469  0122               L341:
 470                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 472  0122 7b15          	ld	a,(OFST+12,sp)
 473  0124 4c            	inc	a
 474  0125 c7521d        	ld	21021,a
 475  0128               L141:
 476                     ; 181   I2C->CCRL = (uint8_t)result;
 478  0128 7b09          	ld	a,(OFST+0,sp)
 479  012a c7521b        	ld	21019,a
 480                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 482  012d 7b08          	ld	a,(OFST-1,sp)
 483  012f a40f          	and	a,#15
 484  0131 1a07          	or	a,(OFST-2,sp)
 485  0133 c7521c        	ld	21020,a
 486                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 488  0136 72105210      	bset	21008,#0
 489                     ; 188   I2C_AcknowledgeConfig(Ack);
 491  013a 7b13          	ld	a,(OFST+10,sp)
 492  013c ad71          	call	_I2C_AcknowledgeConfig
 494                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 496  013e 7b11          	ld	a,(OFST+8,sp)
 497  0140 c75213        	ld	21011,a
 498                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 498                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 500  0143 1e10          	ldw	x,(OFST+7,sp)
 501  0145 4f            	clr	a
 502  0146 01            	rrwa	x,a
 503  0147 48            	sll	a
 504  0148 59            	rlcw	x
 505  0149 01            	rrwa	x,a
 506  014a a406          	and	a,#6
 507  014c 5f            	clrw	x
 508  014d 6b04          	ld	(OFST-5,sp),a
 510  014f 7b14          	ld	a,(OFST+11,sp)
 511  0151 aa40          	or	a,#64
 512  0153 1a04          	or	a,(OFST-5,sp)
 513  0155 c75214        	ld	21012,a
 514                     ; 194 }
 517  0158 5b09          	addw	sp,#9
 518  015a 81            	ret
 573                     ; 202 void I2C_Cmd(FunctionalState NewState)
 573                     ; 203 {
 574                     	switch	.text
 575  015b               _I2C_Cmd:
 579                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 581                     ; 207   if (NewState != DISABLE)
 583  015b 4d            	tnz	a
 584  015c 2706          	jreq	L371
 585                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 587  015e 72105210      	bset	21008,#0
 589  0162 2004          	jra	L571
 590  0164               L371:
 591                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 593  0164 72115210      	bres	21008,#0
 594  0168               L571:
 595                     ; 217 }
 598  0168 81            	ret
 633                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 633                     ; 226 {
 634                     	switch	.text
 635  0169               _I2C_GeneralCallCmd:
 639                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 641                     ; 230   if (NewState != DISABLE)
 643  0169 4d            	tnz	a
 644  016a 2706          	jreq	L512
 645                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 647  016c 721c5210      	bset	21008,#6
 649  0170 2004          	jra	L712
 650  0172               L512:
 651                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 653  0172 721d5210      	bres	21008,#6
 654  0176               L712:
 655                     ; 240 }
 658  0176 81            	ret
 693                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 693                     ; 251 {
 694                     	switch	.text
 695  0177               _I2C_GenerateSTART:
 699                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 701                     ; 255   if (NewState != DISABLE)
 703  0177 4d            	tnz	a
 704  0178 2706          	jreq	L732
 705                     ; 258     I2C->CR2 |= I2C_CR2_START;
 707  017a 72105211      	bset	21009,#0
 709  017e 2004          	jra	L142
 710  0180               L732:
 711                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 713  0180 72115211      	bres	21009,#0
 714  0184               L142:
 715                     ; 265 }
 718  0184 81            	ret
 753                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 753                     ; 274 {
 754                     	switch	.text
 755  0185               _I2C_GenerateSTOP:
 759                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 761                     ; 278   if (NewState != DISABLE)
 763  0185 4d            	tnz	a
 764  0186 2706          	jreq	L162
 765                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 767  0188 72125211      	bset	21009,#1
 769  018c 2004          	jra	L362
 770  018e               L162:
 771                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 773  018e 72135211      	bres	21009,#1
 774  0192               L362:
 775                     ; 288 }
 778  0192 81            	ret
 814                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 814                     ; 297 {
 815                     	switch	.text
 816  0193               _I2C_SoftwareResetCmd:
 820                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 822                     ; 301   if (NewState != DISABLE)
 824  0193 4d            	tnz	a
 825  0194 2706          	jreq	L303
 826                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 828  0196 721e5211      	bset	21009,#7
 830  019a 2004          	jra	L503
 831  019c               L303:
 832                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 834  019c 721f5211      	bres	21009,#7
 835  01a0               L503:
 836                     ; 311 }
 839  01a0 81            	ret
 875                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 875                     ; 321 {
 876                     	switch	.text
 877  01a1               _I2C_StretchClockCmd:
 881                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 883                     ; 325   if (NewState != DISABLE)
 885  01a1 4d            	tnz	a
 886  01a2 2706          	jreq	L523
 887                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 889  01a4 721f5210      	bres	21008,#7
 891  01a8 2004          	jra	L723
 892  01aa               L523:
 893                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 895  01aa 721e5210      	bset	21008,#7
 896  01ae               L723:
 897                     ; 336 }
 900  01ae 81            	ret
 936                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 936                     ; 346 {
 937                     	switch	.text
 938  01af               _I2C_AcknowledgeConfig:
 940  01af 88            	push	a
 941       00000000      OFST:	set	0
 944                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 946                     ; 350   if (Ack == I2C_ACK_NONE)
 948  01b0 4d            	tnz	a
 949  01b1 2606          	jrne	L743
 950                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 952  01b3 72155211      	bres	21009,#2
 954  01b7 2014          	jra	L153
 955  01b9               L743:
 956                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 958  01b9 72145211      	bset	21009,#2
 959                     ; 360     if (Ack == I2C_ACK_CURR)
 961  01bd 7b01          	ld	a,(OFST+1,sp)
 962  01bf a101          	cp	a,#1
 963  01c1 2606          	jrne	L353
 964                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 966  01c3 72175211      	bres	21009,#3
 968  01c7 2004          	jra	L153
 969  01c9               L353:
 970                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 972  01c9 72165211      	bset	21009,#3
 973  01cd               L153:
 974                     ; 371 }
 977  01cd 84            	pop	a
 978  01ce 81            	ret
1050                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1050                     ; 382 {
1051                     	switch	.text
1052  01cf               _I2C_ITConfig:
1054  01cf 89            	pushw	x
1055       00000000      OFST:	set	0
1058                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1060                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1062                     ; 387   if (NewState != DISABLE)
1064  01d0 9f            	ld	a,xl
1065  01d1 4d            	tnz	a
1066  01d2 2709          	jreq	L314
1067                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1069  01d4 9e            	ld	a,xh
1070  01d5 ca521a        	or	a,21018
1071  01d8 c7521a        	ld	21018,a
1073  01db 2009          	jra	L514
1074  01dd               L314:
1075                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1077  01dd 7b01          	ld	a,(OFST+1,sp)
1078  01df 43            	cpl	a
1079  01e0 c4521a        	and	a,21018
1080  01e3 c7521a        	ld	21018,a
1081  01e6               L514:
1082                     ; 397 }
1085  01e6 85            	popw	x
1086  01e7 81            	ret
1122                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1122                     ; 406 {
1123                     	switch	.text
1124  01e8               _I2C_FastModeDutyCycleConfig:
1128                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1130                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1132  01e8 a140          	cp	a,#64
1133  01ea 2606          	jrne	L534
1134                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1136  01ec 721c521c      	bset	21020,#6
1138  01f0 2004          	jra	L734
1139  01f2               L534:
1140                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1142  01f2 721d521c      	bres	21020,#6
1143  01f6               L734:
1144                     ; 420 }
1147  01f6 81            	ret
1170                     ; 427 uint8_t I2C_ReceiveData(void)
1170                     ; 428 {
1171                     	switch	.text
1172  01f7               _I2C_ReceiveData:
1176                     ; 430   return ((uint8_t)I2C->DR);
1178  01f7 c65216        	ld	a,21014
1181  01fa 81            	ret
1246                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1246                     ; 441 {
1247                     	switch	.text
1248  01fb               _I2C_Send7bitAddress:
1250  01fb 89            	pushw	x
1251       00000000      OFST:	set	0
1254                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1256                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1258                     ; 447   Address &= (uint8_t)0xFE;
1260  01fc 7b01          	ld	a,(OFST+1,sp)
1261  01fe a4fe          	and	a,#254
1262  0200 6b01          	ld	(OFST+1,sp),a
1263                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1265  0202 7b01          	ld	a,(OFST+1,sp)
1266  0204 1a02          	or	a,(OFST+2,sp)
1267  0206 c75216        	ld	21014,a
1268                     ; 451 }
1271  0209 85            	popw	x
1272  020a 81            	ret
1306                     ; 458 void I2C_SendData(uint8_t Data)
1306                     ; 459 {
1307                     	switch	.text
1308  020b               _I2C_SendData:
1312                     ; 461   I2C->DR = Data;
1314  020b c75216        	ld	21014,a
1315                     ; 462 }
1318  020e 81            	ret
1542                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1542                     ; 579 {
1543                     	switch	.text
1544  020f               _I2C_CheckEvent:
1546  020f 89            	pushw	x
1547  0210 5206          	subw	sp,#6
1548       00000006      OFST:	set	6
1551                     ; 580   __IO uint16_t lastevent = 0x00;
1553  0212 5f            	clrw	x
1554  0213 1f04          	ldw	(OFST-2,sp),x
1556                     ; 581   uint8_t flag1 = 0x00 ;
1558                     ; 582   uint8_t flag2 = 0x00;
1560                     ; 583   ErrorStatus status = ERROR;
1562                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1564                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1566  0215 1e07          	ldw	x,(OFST+1,sp)
1567  0217 a30004        	cpw	x,#4
1568  021a 260b          	jrne	L136
1569                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1571  021c c65218        	ld	a,21016
1572  021f a404          	and	a,#4
1573  0221 5f            	clrw	x
1574  0222 97            	ld	xl,a
1575  0223 1f04          	ldw	(OFST-2,sp),x
1578  0225 201f          	jra	L336
1579  0227               L136:
1580                     ; 594     flag1 = I2C->SR1;
1582  0227 c65217        	ld	a,21015
1583  022a 6b03          	ld	(OFST-3,sp),a
1585                     ; 595     flag2 = I2C->SR3;
1587  022c c65219        	ld	a,21017
1588  022f 6b06          	ld	(OFST+0,sp),a
1590                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1592  0231 7b03          	ld	a,(OFST-3,sp)
1593  0233 5f            	clrw	x
1594  0234 97            	ld	xl,a
1595  0235 1f01          	ldw	(OFST-5,sp),x
1597  0237 7b06          	ld	a,(OFST+0,sp)
1598  0239 5f            	clrw	x
1599  023a 97            	ld	xl,a
1600  023b 4f            	clr	a
1601  023c 02            	rlwa	x,a
1602  023d 01            	rrwa	x,a
1603  023e 1a02          	or	a,(OFST-4,sp)
1604  0240 01            	rrwa	x,a
1605  0241 1a01          	or	a,(OFST-5,sp)
1606  0243 01            	rrwa	x,a
1607  0244 1f04          	ldw	(OFST-2,sp),x
1609  0246               L336:
1610                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1612  0246 1e04          	ldw	x,(OFST-2,sp)
1613  0248 01            	rrwa	x,a
1614  0249 1408          	and	a,(OFST+2,sp)
1615  024b 01            	rrwa	x,a
1616  024c 1407          	and	a,(OFST+1,sp)
1617  024e 01            	rrwa	x,a
1618  024f 1307          	cpw	x,(OFST+1,sp)
1619  0251 2606          	jrne	L536
1620                     ; 602     status = SUCCESS;
1622  0253 a601          	ld	a,#1
1623  0255 6b06          	ld	(OFST+0,sp),a
1626  0257 2002          	jra	L736
1627  0259               L536:
1628                     ; 607     status = ERROR;
1630  0259 0f06          	clr	(OFST+0,sp)
1632  025b               L736:
1633                     ; 611   return status;
1635  025b 7b06          	ld	a,(OFST+0,sp)
1638  025d 5b08          	addw	sp,#8
1639  025f 81            	ret
1692                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1692                     ; 629 {
1693                     	switch	.text
1694  0260               _I2C_GetLastEvent:
1696  0260 5206          	subw	sp,#6
1697       00000006      OFST:	set	6
1700                     ; 630   __IO uint16_t lastevent = 0;
1702  0262 5f            	clrw	x
1703  0263 1f05          	ldw	(OFST-1,sp),x
1705                     ; 631   uint16_t flag1 = 0;
1707                     ; 632   uint16_t flag2 = 0;
1709                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1711  0265 c65218        	ld	a,21016
1712  0268 a504          	bcp	a,#4
1713  026a 2707          	jreq	L766
1714                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1716  026c ae0004        	ldw	x,#4
1717  026f 1f05          	ldw	(OFST-1,sp),x
1720  0271 201b          	jra	L176
1721  0273               L766:
1722                     ; 641     flag1 = I2C->SR1;
1724  0273 c65217        	ld	a,21015
1725  0276 5f            	clrw	x
1726  0277 97            	ld	xl,a
1727  0278 1f01          	ldw	(OFST-5,sp),x
1729                     ; 642     flag2 = I2C->SR3;
1731  027a c65219        	ld	a,21017
1732  027d 5f            	clrw	x
1733  027e 97            	ld	xl,a
1734  027f 1f03          	ldw	(OFST-3,sp),x
1736                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1738  0281 1e03          	ldw	x,(OFST-3,sp)
1739  0283 4f            	clr	a
1740  0284 02            	rlwa	x,a
1741  0285 01            	rrwa	x,a
1742  0286 1a02          	or	a,(OFST-4,sp)
1743  0288 01            	rrwa	x,a
1744  0289 1a01          	or	a,(OFST-5,sp)
1745  028b 01            	rrwa	x,a
1746  028c 1f05          	ldw	(OFST-1,sp),x
1748  028e               L176:
1749                     ; 648   return (I2C_Event_TypeDef)lastevent;
1751  028e 1e05          	ldw	x,(OFST-1,sp)
1754  0290 5b06          	addw	sp,#6
1755  0292 81            	ret
1970                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1970                     ; 680 {
1971                     	switch	.text
1972  0293               _I2C_GetFlagStatus:
1974  0293 89            	pushw	x
1975  0294 89            	pushw	x
1976       00000002      OFST:	set	2
1979                     ; 681   uint8_t tempreg = 0;
1981  0295 0f02          	clr	(OFST+0,sp)
1983                     ; 682   uint8_t regindex = 0;
1985                     ; 683   FlagStatus bitstatus = RESET;
1987                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1989                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1991  0297 9e            	ld	a,xh
1992  0298 6b01          	ld	(OFST-1,sp),a
1994                     ; 691   switch (regindex)
1996  029a 7b01          	ld	a,(OFST-1,sp)
1998                     ; 708     default:
1998                     ; 709       break;
1999  029c 4a            	dec	a
2000  029d 2708          	jreq	L376
2001  029f 4a            	dec	a
2002  02a0 270c          	jreq	L576
2003  02a2 4a            	dec	a
2004  02a3 2710          	jreq	L776
2005  02a5 2013          	jra	L3101
2006  02a7               L376:
2007                     ; 694     case 0x01:
2007                     ; 695       tempreg = (uint8_t)I2C->SR1;
2009  02a7 c65217        	ld	a,21015
2010  02aa 6b02          	ld	(OFST+0,sp),a
2012                     ; 696       break;
2014  02ac 200c          	jra	L3101
2015  02ae               L576:
2016                     ; 699     case 0x02:
2016                     ; 700       tempreg = (uint8_t)I2C->SR2;
2018  02ae c65218        	ld	a,21016
2019  02b1 6b02          	ld	(OFST+0,sp),a
2021                     ; 701       break;
2023  02b3 2005          	jra	L3101
2024  02b5               L776:
2025                     ; 704     case 0x03:
2025                     ; 705       tempreg = (uint8_t)I2C->SR3;
2027  02b5 c65219        	ld	a,21017
2028  02b8 6b02          	ld	(OFST+0,sp),a
2030                     ; 706       break;
2032  02ba               L107:
2033                     ; 708     default:
2033                     ; 709       break;
2035  02ba               L3101:
2036                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2038  02ba 7b04          	ld	a,(OFST+2,sp)
2039  02bc 1502          	bcp	a,(OFST+0,sp)
2040  02be 2706          	jreq	L5101
2041                     ; 716     bitstatus = SET;
2043  02c0 a601          	ld	a,#1
2044  02c2 6b02          	ld	(OFST+0,sp),a
2047  02c4 2002          	jra	L7101
2048  02c6               L5101:
2049                     ; 721     bitstatus = RESET;
2051  02c6 0f02          	clr	(OFST+0,sp)
2053  02c8               L7101:
2054                     ; 724   return bitstatus;
2056  02c8 7b02          	ld	a,(OFST+0,sp)
2059  02ca 5b04          	addw	sp,#4
2060  02cc 81            	ret
2104                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2104                     ; 760 {
2105                     	switch	.text
2106  02cd               _I2C_ClearFlag:
2108  02cd 89            	pushw	x
2109       00000002      OFST:	set	2
2112                     ; 761   uint16_t flagpos = 0;
2114                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2116                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2118  02ce 01            	rrwa	x,a
2119  02cf a4ff          	and	a,#255
2120  02d1 5f            	clrw	x
2121  02d2 02            	rlwa	x,a
2122  02d3 1f01          	ldw	(OFST-1,sp),x
2123  02d5 01            	rrwa	x,a
2125                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2127  02d6 7b02          	ld	a,(OFST+0,sp)
2128  02d8 43            	cpl	a
2129  02d9 c75218        	ld	21016,a
2130                     ; 769 }
2133  02dc 85            	popw	x
2134  02dd 81            	ret
2300                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2300                     ; 792 {
2301                     	switch	.text
2302  02de               _I2C_GetITStatus:
2304  02de 89            	pushw	x
2305  02df 5204          	subw	sp,#4
2306       00000004      OFST:	set	4
2309                     ; 793   ITStatus bitstatus = RESET;
2311                     ; 794   __IO uint8_t enablestatus = 0;
2313  02e1 0f03          	clr	(OFST-1,sp)
2315                     ; 795   uint16_t tempregister = 0;
2317                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2319                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2321  02e3 9e            	ld	a,xh
2322  02e4 a407          	and	a,#7
2323  02e6 5f            	clrw	x
2324  02e7 97            	ld	xl,a
2325  02e8 1f01          	ldw	(OFST-3,sp),x
2327                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2329  02ea c6521a        	ld	a,21018
2330  02ed 1402          	and	a,(OFST-2,sp)
2331  02ef 6b03          	ld	(OFST-1,sp),a
2333                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2335  02f1 7b05          	ld	a,(OFST+1,sp)
2336  02f3 97            	ld	xl,a
2337  02f4 7b06          	ld	a,(OFST+2,sp)
2338  02f6 9f            	ld	a,xl
2339  02f7 a430          	and	a,#48
2340  02f9 97            	ld	xl,a
2341  02fa 4f            	clr	a
2342  02fb 02            	rlwa	x,a
2343  02fc a30100        	cpw	x,#256
2344  02ff 2615          	jrne	L1311
2345                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2347  0301 c65217        	ld	a,21015
2348  0304 1506          	bcp	a,(OFST+2,sp)
2349  0306 270a          	jreq	L3311
2351  0308 0d03          	tnz	(OFST-1,sp)
2352  030a 2706          	jreq	L3311
2353                     ; 811       bitstatus = SET;
2355  030c a601          	ld	a,#1
2356  030e 6b04          	ld	(OFST+0,sp),a
2359  0310 2017          	jra	L7311
2360  0312               L3311:
2361                     ; 816       bitstatus = RESET;
2363  0312 0f04          	clr	(OFST+0,sp)
2365  0314 2013          	jra	L7311
2366  0316               L1311:
2367                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2369  0316 c65218        	ld	a,21016
2370  0319 1506          	bcp	a,(OFST+2,sp)
2371  031b 270a          	jreq	L1411
2373  031d 0d03          	tnz	(OFST-1,sp)
2374  031f 2706          	jreq	L1411
2375                     ; 825       bitstatus = SET;
2377  0321 a601          	ld	a,#1
2378  0323 6b04          	ld	(OFST+0,sp),a
2381  0325 2002          	jra	L7311
2382  0327               L1411:
2383                     ; 830       bitstatus = RESET;
2385  0327 0f04          	clr	(OFST+0,sp)
2387  0329               L7311:
2388                     ; 834   return  bitstatus;
2390  0329 7b04          	ld	a,(OFST+0,sp)
2393  032b 5b06          	addw	sp,#6
2394  032d 81            	ret
2439                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2439                     ; 872 {
2440                     	switch	.text
2441  032e               _I2C_ClearITPendingBit:
2443  032e 89            	pushw	x
2444       00000002      OFST:	set	2
2447                     ; 873   uint16_t flagpos = 0;
2449                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2451                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2453  032f 01            	rrwa	x,a
2454  0330 a4ff          	and	a,#255
2455  0332 5f            	clrw	x
2456  0333 02            	rlwa	x,a
2457  0334 1f01          	ldw	(OFST-1,sp),x
2458  0336 01            	rrwa	x,a
2460                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2462  0337 7b02          	ld	a,(OFST+0,sp)
2463  0339 43            	cpl	a
2464  033a c75218        	ld	21016,a
2465                     ; 883 }
2468  033d 85            	popw	x
2469  033e 81            	ret
2482                     	xdef	_I2C_ClearITPendingBit
2483                     	xdef	_I2C_GetITStatus
2484                     	xdef	_I2C_ClearFlag
2485                     	xdef	_I2C_GetFlagStatus
2486                     	xdef	_I2C_GetLastEvent
2487                     	xdef	_I2C_CheckEvent
2488                     	xdef	_I2C_SendData
2489                     	xdef	_I2C_Send7bitAddress
2490                     	xdef	_I2C_ReceiveData
2491                     	xdef	_I2C_ITConfig
2492                     	xdef	_I2C_FastModeDutyCycleConfig
2493                     	xdef	_I2C_AcknowledgeConfig
2494                     	xdef	_I2C_StretchClockCmd
2495                     	xdef	_I2C_SoftwareResetCmd
2496                     	xdef	_I2C_GenerateSTOP
2497                     	xdef	_I2C_GenerateSTART
2498                     	xdef	_I2C_GeneralCallCmd
2499                     	xdef	_I2C_Cmd
2500                     	xdef	_I2C_Init
2501                     	xdef	_I2C_DeInit
2502                     	xref.b	c_lreg
2503                     	xref.b	c_x
2522                     	xref	c_sdivx
2523                     	xref	c_ludv
2524                     	xref	c_rtol
2525                     	xref	c_smul
2526                     	xref	c_lmul
2527                     	xref	c_lcmp
2528                     	xref	c_ltor
2529                     	end
