   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 58 void TIM1_DeInit(void)
  41                     ; 59 {
  43                     	switch	.text
  44  0000               _TIM1_DeInit:
  48                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  50  0000 725f5250      	clr	21072
  51                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  53  0004 725f5251      	clr	21073
  54                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  56  0008 725f5252      	clr	21074
  57                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  59  000c 725f5253      	clr	21075
  60                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  62  0010 725f5254      	clr	21076
  63                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  65  0014 725f5256      	clr	21078
  66                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  68  0018 725f525c      	clr	21084
  69                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  71  001c 725f525d      	clr	21085
  72                     ; 70   TIM1->CCMR1 = 0x01;
  74  0020 35015258      	mov	21080,#1
  75                     ; 71   TIM1->CCMR2 = 0x01;
  77  0024 35015259      	mov	21081,#1
  78                     ; 72   TIM1->CCMR3 = 0x01;
  80  0028 3501525a      	mov	21082,#1
  81                     ; 73   TIM1->CCMR4 = 0x01;
  83  002c 3501525b      	mov	21083,#1
  84                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  86  0030 725f525c      	clr	21084
  87                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  89  0034 725f525d      	clr	21085
  90                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  92  0038 725f5258      	clr	21080
  93                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  95  003c 725f5259      	clr	21081
  96                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  98  0040 725f525a      	clr	21082
  99                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 101  0044 725f525b      	clr	21083
 102                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 104  0048 725f525e      	clr	21086
 105                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 107  004c 725f525f      	clr	21087
 108                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 110  0050 725f5260      	clr	21088
 111                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 113  0054 725f5261      	clr	21089
 114                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 116  0058 35ff5262      	mov	21090,#255
 117                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 119  005c 35ff5263      	mov	21091,#255
 120                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 122  0060 725f5265      	clr	21093
 123                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 125  0064 725f5266      	clr	21094
 126                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 128  0068 725f5267      	clr	21095
 129                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 131  006c 725f5268      	clr	21096
 132                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 134  0070 725f5269      	clr	21097
 135                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 137  0074 725f526a      	clr	21098
 138                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 140  0078 725f526b      	clr	21099
 141                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 143  007c 725f526c      	clr	21100
 144                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 146  0080 725f526f      	clr	21103
 147                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 149  0084 35015257      	mov	21079,#1
 150                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 152  0088 725f526e      	clr	21102
 153                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 155  008c 725f526d      	clr	21101
 156                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 158  0090 725f5264      	clr	21092
 159                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 161  0094 725f5255      	clr	21077
 162                     ; 101 }
 165  0098 81            	ret
 274                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 274                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 274                     ; 113                        uint16_t TIM1_Period,
 274                     ; 114                        uint8_t TIM1_RepetitionCounter)
 274                     ; 115 {
 275                     	switch	.text
 276  0099               _TIM1_TimeBaseInit:
 278  0099 89            	pushw	x
 279       00000000      OFST:	set	0
 282                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 284                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 286  009a 7b06          	ld	a,(OFST+6,sp)
 287  009c c75262        	ld	21090,a
 288                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 290  009f 7b07          	ld	a,(OFST+7,sp)
 291  00a1 c75263        	ld	21091,a
 292                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 294  00a4 9e            	ld	a,xh
 295  00a5 c75260        	ld	21088,a
 296                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 298  00a8 9f            	ld	a,xl
 299  00a9 c75261        	ld	21089,a
 300                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 300                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 302  00ac c65250        	ld	a,21072
 303  00af a48f          	and	a,#143
 304  00b1 1a05          	or	a,(OFST+5,sp)
 305  00b3 c75250        	ld	21072,a
 306                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 308  00b6 7b08          	ld	a,(OFST+8,sp)
 309  00b8 c75264        	ld	21092,a
 310                     ; 133 }
 313  00bb 85            	popw	x
 314  00bc 81            	ret
 599                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 599                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 599                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 599                     ; 157                   uint16_t TIM1_Pulse,
 599                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 599                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 599                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 599                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 599                     ; 162 {
 600                     	switch	.text
 601  00bd               _TIM1_OC1Init:
 603  00bd 89            	pushw	x
 604  00be 5203          	subw	sp,#3
 605       00000003      OFST:	set	3
 608                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 610                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 612                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 614                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 616                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 618                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 620                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 622                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 622                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 624  00c0 c6525c        	ld	a,21084
 625  00c3 a4f0          	and	a,#240
 626  00c5 c7525c        	ld	21084,a
 627                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 627                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 627                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 627                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 629  00c8 7b0c          	ld	a,(OFST+9,sp)
 630  00ca a408          	and	a,#8
 631  00cc 6b03          	ld	(OFST+0,sp),a
 633  00ce 7b0b          	ld	a,(OFST+8,sp)
 634  00d0 a402          	and	a,#2
 635  00d2 1a03          	or	a,(OFST+0,sp)
 636  00d4 6b02          	ld	(OFST-1,sp),a
 638  00d6 7b08          	ld	a,(OFST+5,sp)
 639  00d8 a404          	and	a,#4
 640  00da 6b01          	ld	(OFST-2,sp),a
 642  00dc 9f            	ld	a,xl
 643  00dd a401          	and	a,#1
 644  00df 1a01          	or	a,(OFST-2,sp)
 645  00e1 1a02          	or	a,(OFST-1,sp)
 646  00e3 ca525c        	or	a,21084
 647  00e6 c7525c        	ld	21084,a
 648                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 648                     ; 185                           (uint8_t)TIM1_OCMode);
 650  00e9 c65258        	ld	a,21080
 651  00ec a48f          	and	a,#143
 652  00ee 1a04          	or	a,(OFST+1,sp)
 653  00f0 c75258        	ld	21080,a
 654                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 656  00f3 c6526f        	ld	a,21103
 657  00f6 a4fc          	and	a,#252
 658  00f8 c7526f        	ld	21103,a
 659                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 659                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 661  00fb 7b0e          	ld	a,(OFST+11,sp)
 662  00fd a402          	and	a,#2
 663  00ff 6b03          	ld	(OFST+0,sp),a
 665  0101 7b0d          	ld	a,(OFST+10,sp)
 666  0103 a401          	and	a,#1
 667  0105 1a03          	or	a,(OFST+0,sp)
 668  0107 ca526f        	or	a,21103
 669  010a c7526f        	ld	21103,a
 670                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 672  010d 7b09          	ld	a,(OFST+6,sp)
 673  010f c75265        	ld	21093,a
 674                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 676  0112 7b0a          	ld	a,(OFST+7,sp)
 677  0114 c75266        	ld	21094,a
 678                     ; 196 }
 681  0117 5b05          	addw	sp,#5
 682  0119 81            	ret
 786                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 786                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 786                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 786                     ; 220                   uint16_t TIM1_Pulse,
 786                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 786                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 786                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 786                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 786                     ; 225 {
 787                     	switch	.text
 788  011a               _TIM1_OC2Init:
 790  011a 89            	pushw	x
 791  011b 5203          	subw	sp,#3
 792       00000003      OFST:	set	3
 795                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 797                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 799                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 801                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 803                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 805                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 807                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 809                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 809                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 811  011d c6525c        	ld	a,21084
 812  0120 a40f          	and	a,#15
 813  0122 c7525c        	ld	21084,a
 814                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 814                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 814                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 814                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 816  0125 7b0c          	ld	a,(OFST+9,sp)
 817  0127 a480          	and	a,#128
 818  0129 6b03          	ld	(OFST+0,sp),a
 820  012b 7b0b          	ld	a,(OFST+8,sp)
 821  012d a420          	and	a,#32
 822  012f 1a03          	or	a,(OFST+0,sp)
 823  0131 6b02          	ld	(OFST-1,sp),a
 825  0133 7b08          	ld	a,(OFST+5,sp)
 826  0135 a440          	and	a,#64
 827  0137 6b01          	ld	(OFST-2,sp),a
 829  0139 9f            	ld	a,xl
 830  013a a410          	and	a,#16
 831  013c 1a01          	or	a,(OFST-2,sp)
 832  013e 1a02          	or	a,(OFST-1,sp)
 833  0140 ca525c        	or	a,21084
 834  0143 c7525c        	ld	21084,a
 835                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 835                     ; 249                           (uint8_t)TIM1_OCMode);
 837  0146 c65259        	ld	a,21081
 838  0149 a48f          	and	a,#143
 839  014b 1a04          	or	a,(OFST+1,sp)
 840  014d c75259        	ld	21081,a
 841                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 843  0150 c6526f        	ld	a,21103
 844  0153 a4f3          	and	a,#243
 845  0155 c7526f        	ld	21103,a
 846                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 846                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 848  0158 7b0e          	ld	a,(OFST+11,sp)
 849  015a a408          	and	a,#8
 850  015c 6b03          	ld	(OFST+0,sp),a
 852  015e 7b0d          	ld	a,(OFST+10,sp)
 853  0160 a404          	and	a,#4
 854  0162 1a03          	or	a,(OFST+0,sp)
 855  0164 ca526f        	or	a,21103
 856  0167 c7526f        	ld	21103,a
 857                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 859  016a 7b09          	ld	a,(OFST+6,sp)
 860  016c c75267        	ld	21095,a
 861                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 863  016f 7b0a          	ld	a,(OFST+7,sp)
 864  0171 c75268        	ld	21096,a
 865                     ; 260 }
 868  0174 5b05          	addw	sp,#5
 869  0176 81            	ret
 973                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 973                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 973                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 973                     ; 284                   uint16_t TIM1_Pulse,
 973                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 973                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 973                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 973                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 973                     ; 289 {
 974                     	switch	.text
 975  0177               _TIM1_OC3Init:
 977  0177 89            	pushw	x
 978  0178 5203          	subw	sp,#3
 979       00000003      OFST:	set	3
 982                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 984                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 986                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 988                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 990                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 992                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 994                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 996                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 996                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 998  017a c6525d        	ld	a,21085
 999  017d a4f0          	and	a,#240
1000  017f c7525d        	ld	21085,a
1001                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1001                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1001                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1001                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1003  0182 7b0c          	ld	a,(OFST+9,sp)
1004  0184 a408          	and	a,#8
1005  0186 6b03          	ld	(OFST+0,sp),a
1007  0188 7b0b          	ld	a,(OFST+8,sp)
1008  018a a402          	and	a,#2
1009  018c 1a03          	or	a,(OFST+0,sp)
1010  018e 6b02          	ld	(OFST-1,sp),a
1012  0190 7b08          	ld	a,(OFST+5,sp)
1013  0192 a404          	and	a,#4
1014  0194 6b01          	ld	(OFST-2,sp),a
1016  0196 9f            	ld	a,xl
1017  0197 a401          	and	a,#1
1018  0199 1a01          	or	a,(OFST-2,sp)
1019  019b 1a02          	or	a,(OFST-1,sp)
1020  019d ca525d        	or	a,21085
1021  01a0 c7525d        	ld	21085,a
1022                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1022                     ; 312                           (uint8_t)TIM1_OCMode);
1024  01a3 c6525a        	ld	a,21082
1025  01a6 a48f          	and	a,#143
1026  01a8 1a04          	or	a,(OFST+1,sp)
1027  01aa c7525a        	ld	21082,a
1028                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1030  01ad c6526f        	ld	a,21103
1031  01b0 a4cf          	and	a,#207
1032  01b2 c7526f        	ld	21103,a
1033                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1033                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1035  01b5 7b0e          	ld	a,(OFST+11,sp)
1036  01b7 a420          	and	a,#32
1037  01b9 6b03          	ld	(OFST+0,sp),a
1039  01bb 7b0d          	ld	a,(OFST+10,sp)
1040  01bd a410          	and	a,#16
1041  01bf 1a03          	or	a,(OFST+0,sp)
1042  01c1 ca526f        	or	a,21103
1043  01c4 c7526f        	ld	21103,a
1044                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1046  01c7 7b09          	ld	a,(OFST+6,sp)
1047  01c9 c75269        	ld	21097,a
1048                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1050  01cc 7b0a          	ld	a,(OFST+7,sp)
1051  01ce c7526a        	ld	21098,a
1052                     ; 323 }
1055  01d1 5b05          	addw	sp,#5
1056  01d3 81            	ret
1130                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1130                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1130                     ; 340                   uint16_t TIM1_Pulse,
1130                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1130                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1130                     ; 343 {
1131                     	switch	.text
1132  01d4               _TIM1_OC4Init:
1134  01d4 89            	pushw	x
1135  01d5 88            	push	a
1136       00000001      OFST:	set	1
1139                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1141                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1143                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1145                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1147                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1149  01d6 c6525d        	ld	a,21085
1150  01d9 a4cf          	and	a,#207
1151  01db c7525d        	ld	21085,a
1152                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1152                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1154  01de 7b08          	ld	a,(OFST+7,sp)
1155  01e0 a420          	and	a,#32
1156  01e2 6b01          	ld	(OFST+0,sp),a
1158  01e4 9f            	ld	a,xl
1159  01e5 a410          	and	a,#16
1160  01e7 1a01          	or	a,(OFST+0,sp)
1161  01e9 ca525d        	or	a,21085
1162  01ec c7525d        	ld	21085,a
1163                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1163                     ; 358                           TIM1_OCMode);
1165  01ef c6525b        	ld	a,21083
1166  01f2 a48f          	and	a,#143
1167  01f4 1a02          	or	a,(OFST+1,sp)
1168  01f6 c7525b        	ld	21083,a
1169                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1171  01f9 0d09          	tnz	(OFST+8,sp)
1172  01fb 270a          	jreq	L534
1173                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1175  01fd c6526f        	ld	a,21103
1176  0200 aadf          	or	a,#223
1177  0202 c7526f        	ld	21103,a
1179  0205 2004          	jra	L734
1180  0207               L534:
1181                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1183  0207 721d526f      	bres	21103,#6
1184  020b               L734:
1185                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1187  020b 7b06          	ld	a,(OFST+5,sp)
1188  020d c7526b        	ld	21099,a
1189                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1191  0210 7b07          	ld	a,(OFST+6,sp)
1192  0212 c7526c        	ld	21100,a
1193                     ; 373 }
1196  0215 5b03          	addw	sp,#3
1197  0217 81            	ret
1402                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1402                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1402                     ; 390                      uint8_t TIM1_DeadTime,
1402                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1402                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1402                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1402                     ; 394 {
1403                     	switch	.text
1404  0218               _TIM1_BDTRConfig:
1406  0218 89            	pushw	x
1407  0219 88            	push	a
1408       00000001      OFST:	set	1
1411                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1413                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1415                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1417                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1419                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1421                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1423  021a 7b06          	ld	a,(OFST+5,sp)
1424  021c c7526e        	ld	21102,a
1425                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1425                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1425                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1427  021f 7b07          	ld	a,(OFST+6,sp)
1428  0221 1a08          	or	a,(OFST+7,sp)
1429  0223 1a09          	or	a,(OFST+8,sp)
1430  0225 6b01          	ld	(OFST+0,sp),a
1432  0227 9f            	ld	a,xl
1433  0228 1a02          	or	a,(OFST+1,sp)
1434  022a 1a01          	or	a,(OFST+0,sp)
1435  022c c7526d        	ld	21101,a
1436                     ; 409 }
1439  022f 5b03          	addw	sp,#3
1440  0231 81            	ret
1642                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1642                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1642                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1642                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1642                     ; 427                  uint8_t TIM1_ICFilter)
1642                     ; 428 {
1643                     	switch	.text
1644  0232               _TIM1_ICInit:
1646  0232 89            	pushw	x
1647       00000000      OFST:	set	0
1650                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1652                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1654                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1656                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1658                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1660                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1662  0233 9e            	ld	a,xh
1663  0234 4d            	tnz	a
1664  0235 2614          	jrne	L766
1665                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1665                     ; 440                (uint8_t)TIM1_ICSelection,
1665                     ; 441                (uint8_t)TIM1_ICFilter);
1667  0237 7b07          	ld	a,(OFST+7,sp)
1668  0239 88            	push	a
1669  023a 7b06          	ld	a,(OFST+6,sp)
1670  023c 97            	ld	xl,a
1671  023d 7b03          	ld	a,(OFST+3,sp)
1672  023f 95            	ld	xh,a
1673  0240 cd080e        	call	L3_TI1_Config
1675  0243 84            	pop	a
1676                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1678  0244 7b06          	ld	a,(OFST+6,sp)
1679  0246 cd06b6        	call	_TIM1_SetIC1Prescaler
1682  0249 2046          	jra	L176
1683  024b               L766:
1684                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1686  024b 7b01          	ld	a,(OFST+1,sp)
1687  024d a101          	cp	a,#1
1688  024f 2614          	jrne	L376
1689                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1689                     ; 449                (uint8_t)TIM1_ICSelection,
1689                     ; 450                (uint8_t)TIM1_ICFilter);
1691  0251 7b07          	ld	a,(OFST+7,sp)
1692  0253 88            	push	a
1693  0254 7b06          	ld	a,(OFST+6,sp)
1694  0256 97            	ld	xl,a
1695  0257 7b03          	ld	a,(OFST+3,sp)
1696  0259 95            	ld	xh,a
1697  025a cd083e        	call	L5_TI2_Config
1699  025d 84            	pop	a
1700                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1702  025e 7b06          	ld	a,(OFST+6,sp)
1703  0260 cd06c3        	call	_TIM1_SetIC2Prescaler
1706  0263 202c          	jra	L176
1707  0265               L376:
1708                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1710  0265 7b01          	ld	a,(OFST+1,sp)
1711  0267 a102          	cp	a,#2
1712  0269 2614          	jrne	L776
1713                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1713                     ; 458                (uint8_t)TIM1_ICSelection,
1713                     ; 459                (uint8_t)TIM1_ICFilter);
1715  026b 7b07          	ld	a,(OFST+7,sp)
1716  026d 88            	push	a
1717  026e 7b06          	ld	a,(OFST+6,sp)
1718  0270 97            	ld	xl,a
1719  0271 7b03          	ld	a,(OFST+3,sp)
1720  0273 95            	ld	xh,a
1721  0274 cd086e        	call	L7_TI3_Config
1723  0277 84            	pop	a
1724                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1726  0278 7b06          	ld	a,(OFST+6,sp)
1727  027a cd06d0        	call	_TIM1_SetIC3Prescaler
1730  027d 2012          	jra	L176
1731  027f               L776:
1732                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1732                     ; 467                (uint8_t)TIM1_ICSelection,
1732                     ; 468                (uint8_t)TIM1_ICFilter);
1734  027f 7b07          	ld	a,(OFST+7,sp)
1735  0281 88            	push	a
1736  0282 7b06          	ld	a,(OFST+6,sp)
1737  0284 97            	ld	xl,a
1738  0285 7b03          	ld	a,(OFST+3,sp)
1739  0287 95            	ld	xh,a
1740  0288 cd089e        	call	L11_TI4_Config
1742  028b 84            	pop	a
1743                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1745  028c 7b06          	ld	a,(OFST+6,sp)
1746  028e cd06dd        	call	_TIM1_SetIC4Prescaler
1748  0291               L176:
1749                     ; 472 }
1752  0291 85            	popw	x
1753  0292 81            	ret
1849                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1849                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1849                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1849                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1849                     ; 492                      uint8_t TIM1_ICFilter)
1849                     ; 493 {
1850                     	switch	.text
1851  0293               _TIM1_PWMIConfig:
1853  0293 89            	pushw	x
1854  0294 89            	pushw	x
1855       00000002      OFST:	set	2
1858                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1860                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1862                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1864                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1866                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1868                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1870                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1872  0295 9f            	ld	a,xl
1873  0296 a101          	cp	a,#1
1874  0298 2706          	jreq	L157
1875                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1877  029a a601          	ld	a,#1
1878  029c 6b01          	ld	(OFST-1,sp),a
1881  029e 2002          	jra	L357
1882  02a0               L157:
1883                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1885  02a0 0f01          	clr	(OFST-1,sp)
1887  02a2               L357:
1888                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1890  02a2 7b07          	ld	a,(OFST+5,sp)
1891  02a4 a101          	cp	a,#1
1892  02a6 2606          	jrne	L557
1893                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1895  02a8 a602          	ld	a,#2
1896  02aa 6b02          	ld	(OFST+0,sp),a
1899  02ac 2004          	jra	L757
1900  02ae               L557:
1901                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1903  02ae a601          	ld	a,#1
1904  02b0 6b02          	ld	(OFST+0,sp),a
1906  02b2               L757:
1907                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1909  02b2 0d03          	tnz	(OFST+1,sp)
1910  02b4 2626          	jrne	L167
1911                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1911                     ; 527                (uint8_t)TIM1_ICFilter);
1913  02b6 7b09          	ld	a,(OFST+7,sp)
1914  02b8 88            	push	a
1915  02b9 7b08          	ld	a,(OFST+6,sp)
1916  02bb 97            	ld	xl,a
1917  02bc 7b05          	ld	a,(OFST+3,sp)
1918  02be 95            	ld	xh,a
1919  02bf cd080e        	call	L3_TI1_Config
1921  02c2 84            	pop	a
1922                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1924  02c3 7b08          	ld	a,(OFST+6,sp)
1925  02c5 cd06b6        	call	_TIM1_SetIC1Prescaler
1927                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1929  02c8 7b09          	ld	a,(OFST+7,sp)
1930  02ca 88            	push	a
1931  02cb 7b03          	ld	a,(OFST+1,sp)
1932  02cd 97            	ld	xl,a
1933  02ce 7b02          	ld	a,(OFST+0,sp)
1934  02d0 95            	ld	xh,a
1935  02d1 cd083e        	call	L5_TI2_Config
1937  02d4 84            	pop	a
1938                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1940  02d5 7b08          	ld	a,(OFST+6,sp)
1941  02d7 cd06c3        	call	_TIM1_SetIC2Prescaler
1944  02da 2024          	jra	L367
1945  02dc               L167:
1946                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1946                     ; 542                (uint8_t)TIM1_ICFilter);
1948  02dc 7b09          	ld	a,(OFST+7,sp)
1949  02de 88            	push	a
1950  02df 7b08          	ld	a,(OFST+6,sp)
1951  02e1 97            	ld	xl,a
1952  02e2 7b05          	ld	a,(OFST+3,sp)
1953  02e4 95            	ld	xh,a
1954  02e5 cd083e        	call	L5_TI2_Config
1956  02e8 84            	pop	a
1957                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1959  02e9 7b08          	ld	a,(OFST+6,sp)
1960  02eb cd06c3        	call	_TIM1_SetIC2Prescaler
1962                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1964  02ee 7b09          	ld	a,(OFST+7,sp)
1965  02f0 88            	push	a
1966  02f1 7b03          	ld	a,(OFST+1,sp)
1967  02f3 97            	ld	xl,a
1968  02f4 7b02          	ld	a,(OFST+0,sp)
1969  02f6 95            	ld	xh,a
1970  02f7 cd080e        	call	L3_TI1_Config
1972  02fa 84            	pop	a
1973                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1975  02fb 7b08          	ld	a,(OFST+6,sp)
1976  02fd cd06b6        	call	_TIM1_SetIC1Prescaler
1978  0300               L367:
1979                     ; 553 }
1982  0300 5b04          	addw	sp,#4
1983  0302 81            	ret
2038                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2038                     ; 562 {
2039                     	switch	.text
2040  0303               _TIM1_Cmd:
2044                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2046                     ; 567   if (NewState != DISABLE)
2048  0303 4d            	tnz	a
2049  0304 2706          	jreq	L3101
2050                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2052  0306 72105250      	bset	21072,#0
2054  030a 2004          	jra	L5101
2055  030c               L3101:
2056                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2058  030c 72115250      	bres	21072,#0
2059  0310               L5101:
2060                     ; 575 }
2063  0310 81            	ret
2099                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2099                     ; 584 {
2100                     	switch	.text
2101  0311               _TIM1_CtrlPWMOutputs:
2105                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2107                     ; 590   if (NewState != DISABLE)
2109  0311 4d            	tnz	a
2110  0312 2706          	jreq	L5301
2111                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2113  0314 721e526d      	bset	21101,#7
2115  0318 2004          	jra	L7301
2116  031a               L5301:
2117                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2119  031a 721f526d      	bres	21101,#7
2120  031e               L7301:
2121                     ; 598 }
2124  031e 81            	ret
2231                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2231                     ; 618 {
2232                     	switch	.text
2233  031f               _TIM1_ITConfig:
2235  031f 89            	pushw	x
2236       00000000      OFST:	set	0
2239                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2241                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2243                     ; 623   if (NewState != DISABLE)
2245  0320 9f            	ld	a,xl
2246  0321 4d            	tnz	a
2247  0322 2709          	jreq	L7011
2248                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2250  0324 9e            	ld	a,xh
2251  0325 ca5254        	or	a,21076
2252  0328 c75254        	ld	21076,a
2254  032b 2009          	jra	L1111
2255  032d               L7011:
2256                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2258  032d 7b01          	ld	a,(OFST+1,sp)
2259  032f 43            	cpl	a
2260  0330 c45254        	and	a,21076
2261  0333 c75254        	ld	21076,a
2262  0336               L1111:
2263                     ; 633 }
2266  0336 85            	popw	x
2267  0337 81            	ret
2291                     ; 640 void TIM1_InternalClockConfig(void)
2291                     ; 641 {
2292                     	switch	.text
2293  0338               _TIM1_InternalClockConfig:
2297                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2299  0338 c65252        	ld	a,21074
2300  033b a4f8          	and	a,#248
2301  033d c75252        	ld	21074,a
2302                     ; 644 }
2305  0340 81            	ret
2422                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2422                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2422                     ; 664                               uint8_t ExtTRGFilter)
2422                     ; 665 {
2423                     	switch	.text
2424  0341               _TIM1_ETRClockMode1Config:
2426  0341 89            	pushw	x
2427       00000000      OFST:	set	0
2430                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2432                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2434                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2436  0342 7b05          	ld	a,(OFST+5,sp)
2437  0344 88            	push	a
2438  0345 9f            	ld	a,xl
2439  0346 97            	ld	xl,a
2440  0347 7b02          	ld	a,(OFST+2,sp)
2441  0349 95            	ld	xh,a
2442  034a ad1f          	call	_TIM1_ETRConfig
2444  034c 84            	pop	a
2445                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2445                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2447  034d c65252        	ld	a,21074
2448  0350 a488          	and	a,#136
2449  0352 aa77          	or	a,#119
2450  0354 c75252        	ld	21074,a
2451                     ; 676 }
2454  0357 85            	popw	x
2455  0358 81            	ret
2513                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2513                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2513                     ; 696                               uint8_t ExtTRGFilter)
2513                     ; 697 {
2514                     	switch	.text
2515  0359               _TIM1_ETRClockMode2Config:
2517  0359 89            	pushw	x
2518       00000000      OFST:	set	0
2521                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2523                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2525                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2527  035a 7b05          	ld	a,(OFST+5,sp)
2528  035c 88            	push	a
2529  035d 9f            	ld	a,xl
2530  035e 97            	ld	xl,a
2531  035f 7b02          	ld	a,(OFST+2,sp)
2532  0361 95            	ld	xh,a
2533  0362 ad07          	call	_TIM1_ETRConfig
2535  0364 84            	pop	a
2536                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2538  0365 721c5253      	bset	21075,#6
2539                     ; 707 }
2542  0369 85            	popw	x
2543  036a 81            	ret
2599                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2599                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2599                     ; 727                     uint8_t ExtTRGFilter)
2599                     ; 728 {
2600                     	switch	.text
2601  036b               _TIM1_ETRConfig:
2603  036b 89            	pushw	x
2604       00000000      OFST:	set	0
2607                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2609                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2609                     ; 733                          (uint8_t)ExtTRGFilter );
2611  036c 9f            	ld	a,xl
2612  036d 1a01          	or	a,(OFST+1,sp)
2613  036f 1a05          	or	a,(OFST+5,sp)
2614  0371 ca5253        	or	a,21075
2615  0374 c75253        	ld	21075,a
2616                     ; 734 }
2619  0377 85            	popw	x
2620  0378 81            	ret
2709                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2709                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2709                     ; 753                                  uint8_t ICFilter)
2709                     ; 754 {
2710                     	switch	.text
2711  0379               _TIM1_TIxExternalClockConfig:
2713  0379 89            	pushw	x
2714       00000000      OFST:	set	0
2717                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2719                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2721                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2723                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2725  037a 9e            	ld	a,xh
2726  037b a160          	cp	a,#96
2727  037d 260e          	jrne	L1131
2728                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2730  037f 7b05          	ld	a,(OFST+5,sp)
2731  0381 88            	push	a
2732  0382 9f            	ld	a,xl
2733  0383 ae0001        	ldw	x,#1
2734  0386 95            	ld	xh,a
2735  0387 cd083e        	call	L5_TI2_Config
2737  038a 84            	pop	a
2739  038b 200d          	jra	L3131
2740  038d               L1131:
2741                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2743  038d 7b05          	ld	a,(OFST+5,sp)
2744  038f 88            	push	a
2745  0390 7b03          	ld	a,(OFST+3,sp)
2746  0392 ae0001        	ldw	x,#1
2747  0395 95            	ld	xh,a
2748  0396 cd080e        	call	L3_TI1_Config
2750  0399 84            	pop	a
2751  039a               L3131:
2752                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2754  039a 7b01          	ld	a,(OFST+1,sp)
2755  039c ad0a          	call	_TIM1_SelectInputTrigger
2757                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2759  039e c65252        	ld	a,21074
2760  03a1 aa07          	or	a,#7
2761  03a3 c75252        	ld	21074,a
2762                     ; 775 }
2765  03a6 85            	popw	x
2766  03a7 81            	ret
2851                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2851                     ; 788 {
2852                     	switch	.text
2853  03a8               _TIM1_SelectInputTrigger:
2855  03a8 88            	push	a
2856       00000000      OFST:	set	0
2859                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2861                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2863  03a9 c65252        	ld	a,21074
2864  03ac a48f          	and	a,#143
2865  03ae 1a01          	or	a,(OFST+1,sp)
2866  03b0 c75252        	ld	21074,a
2867                     ; 794 }
2870  03b3 84            	pop	a
2871  03b4 81            	ret
2907                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2907                     ; 804 {
2908                     	switch	.text
2909  03b5               _TIM1_UpdateDisableConfig:
2913                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2915                     ; 809   if (NewState != DISABLE)
2917  03b5 4d            	tnz	a
2918  03b6 2706          	jreq	L1731
2919                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2921  03b8 72125250      	bset	21072,#1
2923  03bc 2004          	jra	L3731
2924  03be               L1731:
2925                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2927  03be 72135250      	bres	21072,#1
2928  03c2               L3731:
2929                     ; 817 }
2932  03c2 81            	ret
2990                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2990                     ; 828 {
2991                     	switch	.text
2992  03c3               _TIM1_UpdateRequestConfig:
2996                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2998                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
3000  03c3 4d            	tnz	a
3001  03c4 2706          	jreq	L3241
3002                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
3004  03c6 72145250      	bset	21072,#2
3006  03ca 2004          	jra	L5241
3007  03cc               L3241:
3008                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3010  03cc 72155250      	bres	21072,#2
3011  03d0               L5241:
3012                     ; 841 }
3015  03d0 81            	ret
3051                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3051                     ; 850 {
3052                     	switch	.text
3053  03d1               _TIM1_SelectHallSensor:
3057                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3059                     ; 855   if (NewState != DISABLE)
3061  03d1 4d            	tnz	a
3062  03d2 2706          	jreq	L5441
3063                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3065  03d4 721e5251      	bset	21073,#7
3067  03d8 2004          	jra	L7441
3068  03da               L5441:
3069                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3071  03da 721f5251      	bres	21073,#7
3072  03de               L7441:
3073                     ; 863 }
3076  03de 81            	ret
3133                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3133                     ; 874 {
3134                     	switch	.text
3135  03df               _TIM1_SelectOnePulseMode:
3139                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3141                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3143  03df 4d            	tnz	a
3144  03e0 2706          	jreq	L7741
3145                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3147  03e2 72165250      	bset	21072,#3
3149  03e6 2004          	jra	L1051
3150  03e8               L7741:
3151                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3153  03e8 72175250      	bres	21072,#3
3154  03ec               L1051:
3155                     ; 888 }
3158  03ec 81            	ret
3256                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3256                     ; 904 {
3257                     	switch	.text
3258  03ed               _TIM1_SelectOutputTrigger:
3260  03ed 88            	push	a
3261       00000000      OFST:	set	0
3264                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3266                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3266                     ; 910                         (uint8_t) TIM1_TRGOSource);
3268  03ee c65251        	ld	a,21073
3269  03f1 a48f          	and	a,#143
3270  03f3 1a01          	or	a,(OFST+1,sp)
3271  03f5 c75251        	ld	21073,a
3272                     ; 911 }
3275  03f8 84            	pop	a
3276  03f9 81            	ret
3350                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3350                     ; 924 {
3351                     	switch	.text
3352  03fa               _TIM1_SelectSlaveMode:
3354  03fa 88            	push	a
3355       00000000      OFST:	set	0
3358                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3360                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3360                     ; 930                          (uint8_t)TIM1_SlaveMode);
3362  03fb c65252        	ld	a,21074
3363  03fe a4f8          	and	a,#248
3364  0400 1a01          	or	a,(OFST+1,sp)
3365  0402 c75252        	ld	21074,a
3366                     ; 931 }
3369  0405 84            	pop	a
3370  0406 81            	ret
3406                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3406                     ; 940 {
3407                     	switch	.text
3408  0407               _TIM1_SelectMasterSlaveMode:
3412                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3414                     ; 945   if (NewState != DISABLE)
3416  0407 4d            	tnz	a
3417  0408 2706          	jreq	L3161
3418                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3420  040a 721e5252      	bset	21074,#7
3422  040e 2004          	jra	L5161
3423  0410               L3161:
3424                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3426  0410 721f5252      	bres	21074,#7
3427  0414               L5161:
3428                     ; 953 }
3431  0414 81            	ret
3517                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3517                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3517                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3517                     ; 978 {
3518                     	switch	.text
3519  0415               _TIM1_EncoderInterfaceConfig:
3521  0415 89            	pushw	x
3522       00000000      OFST:	set	0
3525                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3527                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3529                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3531                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3533  0416 9f            	ld	a,xl
3534  0417 4d            	tnz	a
3535  0418 2706          	jreq	L7561
3536                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3538  041a 7212525c      	bset	21084,#1
3540  041e 2004          	jra	L1661
3541  0420               L7561:
3542                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3544  0420 7213525c      	bres	21084,#1
3545  0424               L1661:
3546                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3548  0424 0d05          	tnz	(OFST+5,sp)
3549  0426 2706          	jreq	L3661
3550                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3552  0428 721a525c      	bset	21084,#5
3554  042c 2004          	jra	L5661
3555  042e               L3661:
3556                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3558  042e 721b525c      	bres	21084,#5
3559  0432               L5661:
3560                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3560                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3562  0432 c65252        	ld	a,21074
3563  0435 a4f0          	and	a,#240
3564  0437 1a01          	or	a,(OFST+1,sp)
3565  0439 c75252        	ld	21074,a
3566                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3566                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3568  043c c65258        	ld	a,21080
3569  043f a4fc          	and	a,#252
3570  0441 aa01          	or	a,#1
3571  0443 c75258        	ld	21080,a
3572                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3572                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3574  0446 c65259        	ld	a,21081
3575  0449 a4fc          	and	a,#252
3576  044b aa01          	or	a,#1
3577  044d c75259        	ld	21081,a
3578                     ; 1011 }
3581  0450 85            	popw	x
3582  0451 81            	ret
3649                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3649                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3649                     ; 1025 {
3650                     	switch	.text
3651  0452               _TIM1_PrescalerConfig:
3653  0452 89            	pushw	x
3654       00000000      OFST:	set	0
3657                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3659                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3661  0453 9e            	ld	a,xh
3662  0454 c75260        	ld	21088,a
3663                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3665  0457 9f            	ld	a,xl
3666  0458 c75261        	ld	21089,a
3667                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3669  045b 7b05          	ld	a,(OFST+5,sp)
3670  045d c75257        	ld	21079,a
3671                     ; 1035 }
3674  0460 85            	popw	x
3675  0461 81            	ret
3711                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3711                     ; 1049 {
3712                     	switch	.text
3713  0462               _TIM1_CounterModeConfig:
3715  0462 88            	push	a
3716       00000000      OFST:	set	0
3719                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3721                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3721                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3723  0463 c65250        	ld	a,21072
3724  0466 a48f          	and	a,#143
3725  0468 1a01          	or	a,(OFST+1,sp)
3726  046a c75250        	ld	21072,a
3727                     ; 1057 }
3730  046d 84            	pop	a
3731  046e 81            	ret
3789                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3789                     ; 1068 {
3790                     	switch	.text
3791  046f               _TIM1_ForcedOC1Config:
3793  046f 88            	push	a
3794       00000000      OFST:	set	0
3797                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3799                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3799                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3801  0470 c65258        	ld	a,21080
3802  0473 a48f          	and	a,#143
3803  0475 1a01          	or	a,(OFST+1,sp)
3804  0477 c75258        	ld	21080,a
3805                     ; 1075 }
3808  047a 84            	pop	a
3809  047b 81            	ret
3845                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3845                     ; 1086 {
3846                     	switch	.text
3847  047c               _TIM1_ForcedOC2Config:
3849  047c 88            	push	a
3850       00000000      OFST:	set	0
3853                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3855                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3855                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3857  047d c65259        	ld	a,21081
3858  0480 a48f          	and	a,#143
3859  0482 1a01          	or	a,(OFST+1,sp)
3860  0484 c75259        	ld	21081,a
3861                     ; 1093 }
3864  0487 84            	pop	a
3865  0488 81            	ret
3901                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3901                     ; 1105 {
3902                     	switch	.text
3903  0489               _TIM1_ForcedOC3Config:
3905  0489 88            	push	a
3906       00000000      OFST:	set	0
3909                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3911                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3911                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3913  048a c6525a        	ld	a,21082
3914  048d a48f          	and	a,#143
3915  048f 1a01          	or	a,(OFST+1,sp)
3916  0491 c7525a        	ld	21082,a
3917                     ; 1112 }
3920  0494 84            	pop	a
3921  0495 81            	ret
3957                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3957                     ; 1124 {
3958                     	switch	.text
3959  0496               _TIM1_ForcedOC4Config:
3961  0496 88            	push	a
3962       00000000      OFST:	set	0
3965                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3967                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3967                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3969  0497 c6525b        	ld	a,21083
3970  049a a48f          	and	a,#143
3971  049c 1a01          	or	a,(OFST+1,sp)
3972  049e c7525b        	ld	21083,a
3973                     ; 1131 }
3976  04a1 84            	pop	a
3977  04a2 81            	ret
4013                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
4013                     ; 1140 {
4014                     	switch	.text
4015  04a3               _TIM1_ARRPreloadConfig:
4019                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4021                     ; 1145   if (NewState != DISABLE)
4023  04a3 4d            	tnz	a
4024  04a4 2706          	jreq	L5502
4025                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
4027  04a6 721e5250      	bset	21072,#7
4029  04aa 2004          	jra	L7502
4030  04ac               L5502:
4031                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4033  04ac 721f5250      	bres	21072,#7
4034  04b0               L7502:
4035                     ; 1153 }
4038  04b0 81            	ret
4073                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4073                     ; 1162 {
4074                     	switch	.text
4075  04b1               _TIM1_SelectCOM:
4079                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4081                     ; 1167   if (NewState != DISABLE)
4083  04b1 4d            	tnz	a
4084  04b2 2706          	jreq	L7702
4085                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4087  04b4 72145251      	bset	21073,#2
4089  04b8 2004          	jra	L1012
4090  04ba               L7702:
4091                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4093  04ba 72155251      	bres	21073,#2
4094  04be               L1012:
4095                     ; 1175 }
4098  04be 81            	ret
4134                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4134                     ; 1184 {
4135                     	switch	.text
4136  04bf               _TIM1_CCPreloadControl:
4140                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4142                     ; 1189   if (NewState != DISABLE)
4144  04bf 4d            	tnz	a
4145  04c0 2706          	jreq	L1212
4146                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4148  04c2 72105251      	bset	21073,#0
4150  04c6 2004          	jra	L3212
4151  04c8               L1212:
4152                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4154  04c8 72115251      	bres	21073,#0
4155  04cc               L3212:
4156                     ; 1197 }
4159  04cc 81            	ret
4195                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4195                     ; 1206 {
4196                     	switch	.text
4197  04cd               _TIM1_OC1PreloadConfig:
4201                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4203                     ; 1211   if (NewState != DISABLE)
4205  04cd 4d            	tnz	a
4206  04ce 2706          	jreq	L3412
4207                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4209  04d0 72165258      	bset	21080,#3
4211  04d4 2004          	jra	L5412
4212  04d6               L3412:
4213                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4215  04d6 72175258      	bres	21080,#3
4216  04da               L5412:
4217                     ; 1219 }
4220  04da 81            	ret
4256                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4256                     ; 1228 {
4257                     	switch	.text
4258  04db               _TIM1_OC2PreloadConfig:
4262                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4264                     ; 1233   if (NewState != DISABLE)
4266  04db 4d            	tnz	a
4267  04dc 2706          	jreq	L5612
4268                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4270  04de 72165259      	bset	21081,#3
4272  04e2 2004          	jra	L7612
4273  04e4               L5612:
4274                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4276  04e4 72175259      	bres	21081,#3
4277  04e8               L7612:
4278                     ; 1241 }
4281  04e8 81            	ret
4317                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4317                     ; 1250 {
4318                     	switch	.text
4319  04e9               _TIM1_OC3PreloadConfig:
4323                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4325                     ; 1255   if (NewState != DISABLE)
4327  04e9 4d            	tnz	a
4328  04ea 2706          	jreq	L7022
4329                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4331  04ec 7216525a      	bset	21082,#3
4333  04f0 2004          	jra	L1122
4334  04f2               L7022:
4335                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4337  04f2 7217525a      	bres	21082,#3
4338  04f6               L1122:
4339                     ; 1263 }
4342  04f6 81            	ret
4378                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4378                     ; 1272 {
4379                     	switch	.text
4380  04f7               _TIM1_OC4PreloadConfig:
4384                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4386                     ; 1277   if (NewState != DISABLE)
4388  04f7 4d            	tnz	a
4389  04f8 2706          	jreq	L1322
4390                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4392  04fa 7216525b      	bset	21083,#3
4394  04fe 2004          	jra	L3322
4395  0500               L1322:
4396                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4398  0500 7217525b      	bres	21083,#3
4399  0504               L3322:
4400                     ; 1285 }
4403  0504 81            	ret
4438                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4438                     ; 1294 {
4439                     	switch	.text
4440  0505               _TIM1_OC1FastConfig:
4444                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4446                     ; 1299   if (NewState != DISABLE)
4448  0505 4d            	tnz	a
4449  0506 2706          	jreq	L3522
4450                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4452  0508 72145258      	bset	21080,#2
4454  050c 2004          	jra	L5522
4455  050e               L3522:
4456                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4458  050e 72155258      	bres	21080,#2
4459  0512               L5522:
4460                     ; 1307 }
4463  0512 81            	ret
4498                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4498                     ; 1316 {
4499                     	switch	.text
4500  0513               _TIM1_OC2FastConfig:
4504                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4506                     ; 1321   if (NewState != DISABLE)
4508  0513 4d            	tnz	a
4509  0514 2706          	jreq	L5722
4510                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4512  0516 72145259      	bset	21081,#2
4514  051a 2004          	jra	L7722
4515  051c               L5722:
4516                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4518  051c 72155259      	bres	21081,#2
4519  0520               L7722:
4520                     ; 1329 }
4523  0520 81            	ret
4558                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4558                     ; 1338 {
4559                     	switch	.text
4560  0521               _TIM1_OC3FastConfig:
4564                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4566                     ; 1343   if (NewState != DISABLE)
4568  0521 4d            	tnz	a
4569  0522 2706          	jreq	L7132
4570                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4572  0524 7214525a      	bset	21082,#2
4574  0528 2004          	jra	L1232
4575  052a               L7132:
4576                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4578  052a 7215525a      	bres	21082,#2
4579  052e               L1232:
4580                     ; 1351 }
4583  052e 81            	ret
4618                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4618                     ; 1360 {
4619                     	switch	.text
4620  052f               _TIM1_OC4FastConfig:
4624                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4626                     ; 1365   if (NewState != DISABLE)
4628  052f 4d            	tnz	a
4629  0530 2706          	jreq	L1432
4630                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4632  0532 7214525b      	bset	21083,#2
4634  0536 2004          	jra	L3432
4635  0538               L1432:
4636                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4638  0538 7215525b      	bres	21083,#2
4639  053c               L3432:
4640                     ; 1373 }
4643  053c 81            	ret
4748                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4748                     ; 1390 {
4749                     	switch	.text
4750  053d               _TIM1_GenerateEvent:
4754                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4756                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4758  053d c75257        	ld	21079,a
4759                     ; 1396 }
4762  0540 81            	ret
4798                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4798                     ; 1407 {
4799                     	switch	.text
4800  0541               _TIM1_OC1PolarityConfig:
4804                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4806                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4808  0541 4d            	tnz	a
4809  0542 2706          	jreq	L5242
4810                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4812  0544 7212525c      	bset	21084,#1
4814  0548 2004          	jra	L7242
4815  054a               L5242:
4816                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4818  054a 7213525c      	bres	21084,#1
4819  054e               L7242:
4820                     ; 1420 }
4823  054e 81            	ret
4859                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4859                     ; 1431 {
4860                     	switch	.text
4861  054f               _TIM1_OC1NPolarityConfig:
4865                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4867                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4869  054f 4d            	tnz	a
4870  0550 2706          	jreq	L7442
4871                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4873  0552 7216525c      	bset	21084,#3
4875  0556 2004          	jra	L1542
4876  0558               L7442:
4877                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4879  0558 7217525c      	bres	21084,#3
4880  055c               L1542:
4881                     ; 1444 }
4884  055c 81            	ret
4920                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4920                     ; 1455 {
4921                     	switch	.text
4922  055d               _TIM1_OC2PolarityConfig:
4926                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4928                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4930  055d 4d            	tnz	a
4931  055e 2706          	jreq	L1742
4932                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4934  0560 721a525c      	bset	21084,#5
4936  0564 2004          	jra	L3742
4937  0566               L1742:
4938                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4940  0566 721b525c      	bres	21084,#5
4941  056a               L3742:
4942                     ; 1468 }
4945  056a 81            	ret
4981                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4981                     ; 1479 {
4982                     	switch	.text
4983  056b               _TIM1_OC2NPolarityConfig:
4987                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4989                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4991  056b 4d            	tnz	a
4992  056c 2706          	jreq	L3152
4993                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4995  056e 721e525c      	bset	21084,#7
4997  0572 2004          	jra	L5152
4998  0574               L3152:
4999                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
5001  0574 721f525c      	bres	21084,#7
5002  0578               L5152:
5003                     ; 1492 }
5006  0578 81            	ret
5042                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5042                     ; 1503 {
5043                     	switch	.text
5044  0579               _TIM1_OC3PolarityConfig:
5048                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5050                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5052  0579 4d            	tnz	a
5053  057a 2706          	jreq	L5352
5054                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5056  057c 7212525d      	bset	21085,#1
5058  0580 2004          	jra	L7352
5059  0582               L5352:
5060                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5062  0582 7213525d      	bres	21085,#1
5063  0586               L7352:
5064                     ; 1516 }
5067  0586 81            	ret
5103                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5103                     ; 1528 {
5104                     	switch	.text
5105  0587               _TIM1_OC3NPolarityConfig:
5109                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5111                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5113  0587 4d            	tnz	a
5114  0588 2706          	jreq	L7552
5115                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5117  058a 7216525d      	bset	21085,#3
5119  058e 2004          	jra	L1652
5120  0590               L7552:
5121                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5123  0590 7217525d      	bres	21085,#3
5124  0594               L1652:
5125                     ; 1541 }
5128  0594 81            	ret
5164                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5164                     ; 1552 {
5165                     	switch	.text
5166  0595               _TIM1_OC4PolarityConfig:
5170                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5172                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5174  0595 4d            	tnz	a
5175  0596 2706          	jreq	L1062
5176                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5178  0598 721a525d      	bset	21085,#5
5180  059c 2004          	jra	L3062
5181  059e               L1062:
5182                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5184  059e 721b525d      	bres	21085,#5
5185  05a2               L3062:
5186                     ; 1565 }
5189  05a2 81            	ret
5234                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5234                     ; 1580 {
5235                     	switch	.text
5236  05a3               _TIM1_CCxCmd:
5238  05a3 89            	pushw	x
5239       00000000      OFST:	set	0
5242                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5244                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5246                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5248  05a4 9e            	ld	a,xh
5249  05a5 4d            	tnz	a
5250  05a6 2610          	jrne	L7262
5251                     ; 1588     if (NewState != DISABLE)
5253  05a8 9f            	ld	a,xl
5254  05a9 4d            	tnz	a
5255  05aa 2706          	jreq	L1362
5256                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5258  05ac 7210525c      	bset	21084,#0
5260  05b0 2040          	jra	L5362
5261  05b2               L1362:
5262                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5264  05b2 7211525c      	bres	21084,#0
5265  05b6 203a          	jra	L5362
5266  05b8               L7262:
5267                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5269  05b8 7b01          	ld	a,(OFST+1,sp)
5270  05ba a101          	cp	a,#1
5271  05bc 2610          	jrne	L7362
5272                     ; 1601     if (NewState != DISABLE)
5274  05be 0d02          	tnz	(OFST+2,sp)
5275  05c0 2706          	jreq	L1462
5276                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5278  05c2 7218525c      	bset	21084,#4
5280  05c6 202a          	jra	L5362
5281  05c8               L1462:
5282                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5284  05c8 7219525c      	bres	21084,#4
5285  05cc 2024          	jra	L5362
5286  05ce               L7362:
5287                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5289  05ce 7b01          	ld	a,(OFST+1,sp)
5290  05d0 a102          	cp	a,#2
5291  05d2 2610          	jrne	L7462
5292                     ; 1613     if (NewState != DISABLE)
5294  05d4 0d02          	tnz	(OFST+2,sp)
5295  05d6 2706          	jreq	L1562
5296                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5298  05d8 7210525d      	bset	21085,#0
5300  05dc 2014          	jra	L5362
5301  05de               L1562:
5302                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5304  05de 7211525d      	bres	21085,#0
5305  05e2 200e          	jra	L5362
5306  05e4               L7462:
5307                     ; 1625     if (NewState != DISABLE)
5309  05e4 0d02          	tnz	(OFST+2,sp)
5310  05e6 2706          	jreq	L7562
5311                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5313  05e8 7218525d      	bset	21085,#4
5315  05ec 2004          	jra	L5362
5316  05ee               L7562:
5317                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5319  05ee 7219525d      	bres	21085,#4
5320  05f2               L5362:
5321                     ; 1634 }
5324  05f2 85            	popw	x
5325  05f3 81            	ret
5370                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5370                     ; 1648 {
5371                     	switch	.text
5372  05f4               _TIM1_CCxNCmd:
5374  05f4 89            	pushw	x
5375       00000000      OFST:	set	0
5378                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5380                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5382                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5384  05f5 9e            	ld	a,xh
5385  05f6 4d            	tnz	a
5386  05f7 2610          	jrne	L5072
5387                     ; 1656     if (NewState != DISABLE)
5389  05f9 9f            	ld	a,xl
5390  05fa 4d            	tnz	a
5391  05fb 2706          	jreq	L7072
5392                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5394  05fd 7214525c      	bset	21084,#2
5396  0601 202a          	jra	L3172
5397  0603               L7072:
5398                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5400  0603 7215525c      	bres	21084,#2
5401  0607 2024          	jra	L3172
5402  0609               L5072:
5403                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5405  0609 7b01          	ld	a,(OFST+1,sp)
5406  060b a101          	cp	a,#1
5407  060d 2610          	jrne	L5172
5408                     ; 1668     if (NewState != DISABLE)
5410  060f 0d02          	tnz	(OFST+2,sp)
5411  0611 2706          	jreq	L7172
5412                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5414  0613 721c525c      	bset	21084,#6
5416  0617 2014          	jra	L3172
5417  0619               L7172:
5418                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5420  0619 721d525c      	bres	21084,#6
5421  061d 200e          	jra	L3172
5422  061f               L5172:
5423                     ; 1680     if (NewState != DISABLE)
5425  061f 0d02          	tnz	(OFST+2,sp)
5426  0621 2706          	jreq	L5272
5427                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5429  0623 7214525d      	bset	21085,#2
5431  0627 2004          	jra	L3172
5432  0629               L5272:
5433                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5435  0629 7215525d      	bres	21085,#2
5436  062d               L3172:
5437                     ; 1689 }
5440  062d 85            	popw	x
5441  062e 81            	ret
5486                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5486                     ; 1713 {
5487                     	switch	.text
5488  062f               _TIM1_SelectOCxM:
5490  062f 89            	pushw	x
5491       00000000      OFST:	set	0
5494                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5496                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5498                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5500  0630 9e            	ld	a,xh
5501  0631 4d            	tnz	a
5502  0632 2610          	jrne	L3572
5503                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5505  0634 7211525c      	bres	21084,#0
5506                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5506                     ; 1725                             | (uint8_t)TIM1_OCMode);
5508  0638 c65258        	ld	a,21080
5509  063b a48f          	and	a,#143
5510  063d 1a02          	or	a,(OFST+2,sp)
5511  063f c75258        	ld	21080,a
5513  0642 203a          	jra	L5572
5514  0644               L3572:
5515                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5517  0644 7b01          	ld	a,(OFST+1,sp)
5518  0646 a101          	cp	a,#1
5519  0648 2610          	jrne	L7572
5520                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5522  064a 7219525c      	bres	21084,#4
5523                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5523                     ; 1734                             | (uint8_t)TIM1_OCMode);
5525  064e c65259        	ld	a,21081
5526  0651 a48f          	and	a,#143
5527  0653 1a02          	or	a,(OFST+2,sp)
5528  0655 c75259        	ld	21081,a
5530  0658 2024          	jra	L5572
5531  065a               L7572:
5532                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5534  065a 7b01          	ld	a,(OFST+1,sp)
5535  065c a102          	cp	a,#2
5536  065e 2610          	jrne	L3672
5537                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5539  0660 7211525d      	bres	21085,#0
5540                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5540                     ; 1743                             | (uint8_t)TIM1_OCMode);
5542  0664 c6525a        	ld	a,21082
5543  0667 a48f          	and	a,#143
5544  0669 1a02          	or	a,(OFST+2,sp)
5545  066b c7525a        	ld	21082,a
5547  066e 200e          	jra	L5572
5548  0670               L3672:
5549                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5551  0670 7219525d      	bres	21085,#4
5552                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5552                     ; 1752                             | (uint8_t)TIM1_OCMode);
5554  0674 c6525b        	ld	a,21083
5555  0677 a48f          	and	a,#143
5556  0679 1a02          	or	a,(OFST+2,sp)
5557  067b c7525b        	ld	21083,a
5558  067e               L5572:
5559                     ; 1754 }
5562  067e 85            	popw	x
5563  067f 81            	ret
5597                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5597                     ; 1763 {
5598                     	switch	.text
5599  0680               _TIM1_SetCounter:
5603                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5605  0680 9e            	ld	a,xh
5606  0681 c7525e        	ld	21086,a
5607                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5609  0684 9f            	ld	a,xl
5610  0685 c7525f        	ld	21087,a
5611                     ; 1767 }
5614  0688 81            	ret
5648                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5648                     ; 1776 {
5649                     	switch	.text
5650  0689               _TIM1_SetAutoreload:
5654                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5656  0689 9e            	ld	a,xh
5657  068a c75262        	ld	21090,a
5658                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5660  068d 9f            	ld	a,xl
5661  068e c75263        	ld	21091,a
5662                     ; 1780  }
5665  0691 81            	ret
5699                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5699                     ; 1789 {
5700                     	switch	.text
5701  0692               _TIM1_SetCompare1:
5705                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5707  0692 9e            	ld	a,xh
5708  0693 c75265        	ld	21093,a
5709                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5711  0696 9f            	ld	a,xl
5712  0697 c75266        	ld	21094,a
5713                     ; 1793 }
5716  069a 81            	ret
5750                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5750                     ; 1802 {
5751                     	switch	.text
5752  069b               _TIM1_SetCompare2:
5756                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5758  069b 9e            	ld	a,xh
5759  069c c75267        	ld	21095,a
5760                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5762  069f 9f            	ld	a,xl
5763  06a0 c75268        	ld	21096,a
5764                     ; 1806 }
5767  06a3 81            	ret
5801                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5801                     ; 1815 {
5802                     	switch	.text
5803  06a4               _TIM1_SetCompare3:
5807                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5809  06a4 9e            	ld	a,xh
5810  06a5 c75269        	ld	21097,a
5811                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5813  06a8 9f            	ld	a,xl
5814  06a9 c7526a        	ld	21098,a
5815                     ; 1819 }
5818  06ac 81            	ret
5852                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5852                     ; 1828 {
5853                     	switch	.text
5854  06ad               _TIM1_SetCompare4:
5858                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5860  06ad 9e            	ld	a,xh
5861  06ae c7526b        	ld	21099,a
5862                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5864  06b1 9f            	ld	a,xl
5865  06b2 c7526c        	ld	21100,a
5866                     ; 1832 }
5869  06b5 81            	ret
5905                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5905                     ; 1845 {
5906                     	switch	.text
5907  06b6               _TIM1_SetIC1Prescaler:
5909  06b6 88            	push	a
5910       00000000      OFST:	set	0
5913                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5915                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5915                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5917  06b7 c65258        	ld	a,21080
5918  06ba a4f3          	and	a,#243
5919  06bc 1a01          	or	a,(OFST+1,sp)
5920  06be c75258        	ld	21080,a
5921                     ; 1852 }
5924  06c1 84            	pop	a
5925  06c2 81            	ret
5961                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5961                     ; 1865 {
5962                     	switch	.text
5963  06c3               _TIM1_SetIC2Prescaler:
5965  06c3 88            	push	a
5966       00000000      OFST:	set	0
5969                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5971                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5971                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5973  06c4 c65259        	ld	a,21081
5974  06c7 a4f3          	and	a,#243
5975  06c9 1a01          	or	a,(OFST+1,sp)
5976  06cb c75259        	ld	21081,a
5977                     ; 1873 }
5980  06ce 84            	pop	a
5981  06cf 81            	ret
6017                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6017                     ; 1886 {
6018                     	switch	.text
6019  06d0               _TIM1_SetIC3Prescaler:
6021  06d0 88            	push	a
6022       00000000      OFST:	set	0
6025                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6027                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6027                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
6029  06d1 c6525a        	ld	a,21082
6030  06d4 a4f3          	and	a,#243
6031  06d6 1a01          	or	a,(OFST+1,sp)
6032  06d8 c7525a        	ld	21082,a
6033                     ; 1894 }
6036  06db 84            	pop	a
6037  06dc 81            	ret
6073                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6073                     ; 1907 {
6074                     	switch	.text
6075  06dd               _TIM1_SetIC4Prescaler:
6077  06dd 88            	push	a
6078       00000000      OFST:	set	0
6081                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6083                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6083                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6085  06de c6525b        	ld	a,21083
6086  06e1 a4f3          	and	a,#243
6087  06e3 1a01          	or	a,(OFST+1,sp)
6088  06e5 c7525b        	ld	21083,a
6089                     ; 1915 }
6092  06e8 84            	pop	a
6093  06e9 81            	ret
6145                     ; 1922 uint16_t TIM1_GetCapture1(void)
6145                     ; 1923 {
6146                     	switch	.text
6147  06ea               _TIM1_GetCapture1:
6149  06ea 5204          	subw	sp,#4
6150       00000004      OFST:	set	4
6153                     ; 1926   uint16_t tmpccr1 = 0;
6155                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6159                     ; 1929   tmpccr1h = TIM1->CCR1H;
6161  06ec c65265        	ld	a,21093
6162  06ef 6b02          	ld	(OFST-2,sp),a
6164                     ; 1930   tmpccr1l = TIM1->CCR1L;
6166  06f1 c65266        	ld	a,21094
6167  06f4 6b01          	ld	(OFST-3,sp),a
6169                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6171  06f6 7b01          	ld	a,(OFST-3,sp)
6172  06f8 5f            	clrw	x
6173  06f9 97            	ld	xl,a
6174  06fa 1f03          	ldw	(OFST-1,sp),x
6176                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6178  06fc 7b02          	ld	a,(OFST-2,sp)
6179  06fe 5f            	clrw	x
6180  06ff 97            	ld	xl,a
6181  0700 4f            	clr	a
6182  0701 02            	rlwa	x,a
6183  0702 01            	rrwa	x,a
6184  0703 1a04          	or	a,(OFST+0,sp)
6185  0705 01            	rrwa	x,a
6186  0706 1a03          	or	a,(OFST-1,sp)
6187  0708 01            	rrwa	x,a
6188  0709 1f03          	ldw	(OFST-1,sp),x
6190                     ; 1935   return (uint16_t)tmpccr1;
6192  070b 1e03          	ldw	x,(OFST-1,sp)
6195  070d 5b04          	addw	sp,#4
6196  070f 81            	ret
6248                     ; 1943 uint16_t TIM1_GetCapture2(void)
6248                     ; 1944 {
6249                     	switch	.text
6250  0710               _TIM1_GetCapture2:
6252  0710 5204          	subw	sp,#4
6253       00000004      OFST:	set	4
6256                     ; 1947   uint16_t tmpccr2 = 0;
6258                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6262                     ; 1950   tmpccr2h = TIM1->CCR2H;
6264  0712 c65267        	ld	a,21095
6265  0715 6b02          	ld	(OFST-2,sp),a
6267                     ; 1951   tmpccr2l = TIM1->CCR2L;
6269  0717 c65268        	ld	a,21096
6270  071a 6b01          	ld	(OFST-3,sp),a
6272                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6274  071c 7b01          	ld	a,(OFST-3,sp)
6275  071e 5f            	clrw	x
6276  071f 97            	ld	xl,a
6277  0720 1f03          	ldw	(OFST-1,sp),x
6279                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6281  0722 7b02          	ld	a,(OFST-2,sp)
6282  0724 5f            	clrw	x
6283  0725 97            	ld	xl,a
6284  0726 4f            	clr	a
6285  0727 02            	rlwa	x,a
6286  0728 01            	rrwa	x,a
6287  0729 1a04          	or	a,(OFST+0,sp)
6288  072b 01            	rrwa	x,a
6289  072c 1a03          	or	a,(OFST-1,sp)
6290  072e 01            	rrwa	x,a
6291  072f 1f03          	ldw	(OFST-1,sp),x
6293                     ; 1956   return (uint16_t)tmpccr2;
6295  0731 1e03          	ldw	x,(OFST-1,sp)
6298  0733 5b04          	addw	sp,#4
6299  0735 81            	ret
6351                     ; 1964 uint16_t TIM1_GetCapture3(void)
6351                     ; 1965 {
6352                     	switch	.text
6353  0736               _TIM1_GetCapture3:
6355  0736 5204          	subw	sp,#4
6356       00000004      OFST:	set	4
6359                     ; 1967   uint16_t tmpccr3 = 0;
6361                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6365                     ; 1970   tmpccr3h = TIM1->CCR3H;
6367  0738 c65269        	ld	a,21097
6368  073b 6b02          	ld	(OFST-2,sp),a
6370                     ; 1971   tmpccr3l = TIM1->CCR3L;
6372  073d c6526a        	ld	a,21098
6373  0740 6b01          	ld	(OFST-3,sp),a
6375                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6377  0742 7b01          	ld	a,(OFST-3,sp)
6378  0744 5f            	clrw	x
6379  0745 97            	ld	xl,a
6380  0746 1f03          	ldw	(OFST-1,sp),x
6382                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6384  0748 7b02          	ld	a,(OFST-2,sp)
6385  074a 5f            	clrw	x
6386  074b 97            	ld	xl,a
6387  074c 4f            	clr	a
6388  074d 02            	rlwa	x,a
6389  074e 01            	rrwa	x,a
6390  074f 1a04          	or	a,(OFST+0,sp)
6391  0751 01            	rrwa	x,a
6392  0752 1a03          	or	a,(OFST-1,sp)
6393  0754 01            	rrwa	x,a
6394  0755 1f03          	ldw	(OFST-1,sp),x
6396                     ; 1976   return (uint16_t)tmpccr3;
6398  0757 1e03          	ldw	x,(OFST-1,sp)
6401  0759 5b04          	addw	sp,#4
6402  075b 81            	ret
6454                     ; 1984 uint16_t TIM1_GetCapture4(void)
6454                     ; 1985 {
6455                     	switch	.text
6456  075c               _TIM1_GetCapture4:
6458  075c 5204          	subw	sp,#4
6459       00000004      OFST:	set	4
6462                     ; 1987   uint16_t tmpccr4 = 0;
6464                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6468                     ; 1990   tmpccr4h = TIM1->CCR4H;
6470  075e c6526b        	ld	a,21099
6471  0761 6b02          	ld	(OFST-2,sp),a
6473                     ; 1991   tmpccr4l = TIM1->CCR4L;
6475  0763 c6526c        	ld	a,21100
6476  0766 6b01          	ld	(OFST-3,sp),a
6478                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6480  0768 7b01          	ld	a,(OFST-3,sp)
6481  076a 5f            	clrw	x
6482  076b 97            	ld	xl,a
6483  076c 1f03          	ldw	(OFST-1,sp),x
6485                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6487  076e 7b02          	ld	a,(OFST-2,sp)
6488  0770 5f            	clrw	x
6489  0771 97            	ld	xl,a
6490  0772 4f            	clr	a
6491  0773 02            	rlwa	x,a
6492  0774 01            	rrwa	x,a
6493  0775 1a04          	or	a,(OFST+0,sp)
6494  0777 01            	rrwa	x,a
6495  0778 1a03          	or	a,(OFST-1,sp)
6496  077a 01            	rrwa	x,a
6497  077b 1f03          	ldw	(OFST-1,sp),x
6499                     ; 1996   return (uint16_t)tmpccr4;
6501  077d 1e03          	ldw	x,(OFST-1,sp)
6504  077f 5b04          	addw	sp,#4
6505  0781 81            	ret
6539                     ; 2004 uint16_t TIM1_GetCounter(void)
6539                     ; 2005 {
6540                     	switch	.text
6541  0782               _TIM1_GetCounter:
6543  0782 89            	pushw	x
6544       00000002      OFST:	set	2
6547                     ; 2006   uint16_t tmpcntr = 0;
6549                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6551  0783 c6525e        	ld	a,21086
6552  0786 5f            	clrw	x
6553  0787 97            	ld	xl,a
6554  0788 4f            	clr	a
6555  0789 02            	rlwa	x,a
6556  078a 1f01          	ldw	(OFST-1,sp),x
6558                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6560  078c c6525f        	ld	a,21087
6561  078f 5f            	clrw	x
6562  0790 97            	ld	xl,a
6563  0791 01            	rrwa	x,a
6564  0792 1a02          	or	a,(OFST+0,sp)
6565  0794 01            	rrwa	x,a
6566  0795 1a01          	or	a,(OFST-1,sp)
6567  0797 01            	rrwa	x,a
6570  0798 5b02          	addw	sp,#2
6571  079a 81            	ret
6605                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6605                     ; 2020 {
6606                     	switch	.text
6607  079b               _TIM1_GetPrescaler:
6609  079b 89            	pushw	x
6610       00000002      OFST:	set	2
6613                     ; 2021   uint16_t temp = 0;
6615                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6617  079c c65260        	ld	a,21088
6618  079f 5f            	clrw	x
6619  07a0 97            	ld	xl,a
6620  07a1 4f            	clr	a
6621  07a2 02            	rlwa	x,a
6622  07a3 1f01          	ldw	(OFST-1,sp),x
6624                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6626  07a5 c65261        	ld	a,21089
6627  07a8 5f            	clrw	x
6628  07a9 97            	ld	xl,a
6629  07aa 01            	rrwa	x,a
6630  07ab 1a02          	or	a,(OFST+0,sp)
6631  07ad 01            	rrwa	x,a
6632  07ae 1a01          	or	a,(OFST-1,sp)
6633  07b0 01            	rrwa	x,a
6636  07b1 5b02          	addw	sp,#2
6637  07b3 81            	ret
6811                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6811                     ; 2048 {
6812                     	switch	.text
6813  07b4               _TIM1_GetFlagStatus:
6815  07b4 89            	pushw	x
6816  07b5 89            	pushw	x
6817       00000002      OFST:	set	2
6820                     ; 2049   FlagStatus bitstatus = RESET;
6822                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6826                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6828                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6830  07b6 9f            	ld	a,xl
6831  07b7 c45255        	and	a,21077
6832  07ba 6b01          	ld	(OFST-1,sp),a
6834                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6836  07bc 7b03          	ld	a,(OFST+1,sp)
6837  07be 6b02          	ld	(OFST+0,sp),a
6839                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6841  07c0 c65256        	ld	a,21078
6842  07c3 1402          	and	a,(OFST+0,sp)
6843  07c5 1a01          	or	a,(OFST-1,sp)
6844  07c7 2706          	jreq	L5643
6845                     ; 2060     bitstatus = SET;
6847  07c9 a601          	ld	a,#1
6848  07cb 6b02          	ld	(OFST+0,sp),a
6851  07cd 2002          	jra	L7643
6852  07cf               L5643:
6853                     ; 2064     bitstatus = RESET;
6855  07cf 0f02          	clr	(OFST+0,sp)
6857  07d1               L7643:
6858                     ; 2066   return (FlagStatus)(bitstatus);
6860  07d1 7b02          	ld	a,(OFST+0,sp)
6863  07d3 5b04          	addw	sp,#4
6864  07d5 81            	ret
6899                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6899                     ; 2088 {
6900                     	switch	.text
6901  07d6               _TIM1_ClearFlag:
6903  07d6 89            	pushw	x
6904       00000000      OFST:	set	0
6907                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6909                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6911  07d7 9f            	ld	a,xl
6912  07d8 43            	cpl	a
6913  07d9 c75255        	ld	21077,a
6914                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6914                     ; 2095                         (uint8_t)0x1E);
6916  07dc 7b01          	ld	a,(OFST+1,sp)
6917  07de 43            	cpl	a
6918  07df a41e          	and	a,#30
6919  07e1 c75256        	ld	21078,a
6920                     ; 2096 }
6923  07e4 85            	popw	x
6924  07e5 81            	ret
6988                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6988                     ; 2113 {
6989                     	switch	.text
6990  07e6               _TIM1_GetITStatus:
6992  07e6 88            	push	a
6993  07e7 89            	pushw	x
6994       00000002      OFST:	set	2
6997                     ; 2114   ITStatus bitstatus = RESET;
6999                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
7003                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
7005                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
7007  07e8 c45255        	and	a,21077
7008  07eb 6b01          	ld	(OFST-1,sp),a
7010                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
7012  07ed c65254        	ld	a,21076
7013  07f0 1403          	and	a,(OFST+1,sp)
7014  07f2 6b02          	ld	(OFST+0,sp),a
7016                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
7018  07f4 0d01          	tnz	(OFST-1,sp)
7019  07f6 270a          	jreq	L1453
7021  07f8 0d02          	tnz	(OFST+0,sp)
7022  07fa 2706          	jreq	L1453
7023                     ; 2126     bitstatus = SET;
7025  07fc a601          	ld	a,#1
7026  07fe 6b02          	ld	(OFST+0,sp),a
7029  0800 2002          	jra	L3453
7030  0802               L1453:
7031                     ; 2130     bitstatus = RESET;
7033  0802 0f02          	clr	(OFST+0,sp)
7035  0804               L3453:
7036                     ; 2132   return (ITStatus)(bitstatus);
7038  0804 7b02          	ld	a,(OFST+0,sp)
7041  0806 5b03          	addw	sp,#3
7042  0808 81            	ret
7078                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7078                     ; 2150 {
7079                     	switch	.text
7080  0809               _TIM1_ClearITPendingBit:
7084                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7086                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7088  0809 43            	cpl	a
7089  080a c75255        	ld	21077,a
7090                     ; 2156 }
7093  080d 81            	ret
7145                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7145                     ; 2175                        uint8_t TIM1_ICSelection,
7145                     ; 2176                        uint8_t TIM1_ICFilter)
7145                     ; 2177 {
7146                     	switch	.text
7147  080e               L3_TI1_Config:
7149  080e 89            	pushw	x
7150  080f 88            	push	a
7151       00000001      OFST:	set	1
7154                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7156  0810 7211525c      	bres	21084,#0
7157                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7157                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7159  0814 7b06          	ld	a,(OFST+5,sp)
7160  0816 97            	ld	xl,a
7161  0817 a610          	ld	a,#16
7162  0819 42            	mul	x,a
7163  081a 9f            	ld	a,xl
7164  081b 1a03          	or	a,(OFST+2,sp)
7165  081d 6b01          	ld	(OFST+0,sp),a
7167  081f c65258        	ld	a,21080
7168  0822 a40c          	and	a,#12
7169  0824 1a01          	or	a,(OFST+0,sp)
7170  0826 c75258        	ld	21080,a
7171                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7173  0829 0d02          	tnz	(OFST+1,sp)
7174  082b 2706          	jreq	L1163
7175                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7177  082d 7212525c      	bset	21084,#1
7179  0831 2004          	jra	L3163
7180  0833               L1163:
7181                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7183  0833 7213525c      	bres	21084,#1
7184  0837               L3163:
7185                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7187  0837 7210525c      	bset	21084,#0
7188                     ; 2197 }
7191  083b 5b03          	addw	sp,#3
7192  083d 81            	ret
7244                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7244                     ; 2216                        uint8_t TIM1_ICSelection,
7244                     ; 2217                        uint8_t TIM1_ICFilter)
7244                     ; 2218 {
7245                     	switch	.text
7246  083e               L5_TI2_Config:
7248  083e 89            	pushw	x
7249  083f 88            	push	a
7250       00000001      OFST:	set	1
7253                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7255  0840 7219525c      	bres	21084,#4
7256                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7256                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7258  0844 7b06          	ld	a,(OFST+5,sp)
7259  0846 97            	ld	xl,a
7260  0847 a610          	ld	a,#16
7261  0849 42            	mul	x,a
7262  084a 9f            	ld	a,xl
7263  084b 1a03          	or	a,(OFST+2,sp)
7264  084d 6b01          	ld	(OFST+0,sp),a
7266  084f c65259        	ld	a,21081
7267  0852 a40c          	and	a,#12
7268  0854 1a01          	or	a,(OFST+0,sp)
7269  0856 c75259        	ld	21081,a
7270                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7272  0859 0d02          	tnz	(OFST+1,sp)
7273  085b 2706          	jreq	L3463
7274                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7276  085d 721a525c      	bset	21084,#5
7278  0861 2004          	jra	L5463
7279  0863               L3463:
7280                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7282  0863 721b525c      	bres	21084,#5
7283  0867               L5463:
7284                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7286  0867 7218525c      	bset	21084,#4
7287                     ; 2236 }
7290  086b 5b03          	addw	sp,#3
7291  086d 81            	ret
7343                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7343                     ; 2255                        uint8_t TIM1_ICSelection,
7343                     ; 2256                        uint8_t TIM1_ICFilter)
7343                     ; 2257 {
7344                     	switch	.text
7345  086e               L7_TI3_Config:
7347  086e 89            	pushw	x
7348  086f 88            	push	a
7349       00000001      OFST:	set	1
7352                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7354  0870 7211525d      	bres	21085,#0
7355                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7355                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7357  0874 7b06          	ld	a,(OFST+5,sp)
7358  0876 97            	ld	xl,a
7359  0877 a610          	ld	a,#16
7360  0879 42            	mul	x,a
7361  087a 9f            	ld	a,xl
7362  087b 1a03          	or	a,(OFST+2,sp)
7363  087d 6b01          	ld	(OFST+0,sp),a
7365  087f c6525a        	ld	a,21082
7366  0882 a40c          	and	a,#12
7367  0884 1a01          	or	a,(OFST+0,sp)
7368  0886 c7525a        	ld	21082,a
7369                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7371  0889 0d02          	tnz	(OFST+1,sp)
7372  088b 2706          	jreq	L5763
7373                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7375  088d 7212525d      	bset	21085,#1
7377  0891 2004          	jra	L7763
7378  0893               L5763:
7379                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7381  0893 7213525d      	bres	21085,#1
7382  0897               L7763:
7383                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7385  0897 7210525d      	bset	21085,#0
7386                     ; 2276 }
7389  089b 5b03          	addw	sp,#3
7390  089d 81            	ret
7442                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7442                     ; 2295                        uint8_t TIM1_ICSelection,
7442                     ; 2296                        uint8_t TIM1_ICFilter)
7442                     ; 2297 {
7443                     	switch	.text
7444  089e               L11_TI4_Config:
7446  089e 89            	pushw	x
7447  089f 88            	push	a
7448       00000001      OFST:	set	1
7451                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7453  08a0 7219525d      	bres	21085,#4
7454                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7454                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7456  08a4 7b06          	ld	a,(OFST+5,sp)
7457  08a6 97            	ld	xl,a
7458  08a7 a610          	ld	a,#16
7459  08a9 42            	mul	x,a
7460  08aa 9f            	ld	a,xl
7461  08ab 1a03          	or	a,(OFST+2,sp)
7462  08ad 6b01          	ld	(OFST+0,sp),a
7464  08af c6525b        	ld	a,21083
7465  08b2 a40c          	and	a,#12
7466  08b4 1a01          	or	a,(OFST+0,sp)
7467  08b6 c7525b        	ld	21083,a
7468                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7470  08b9 0d02          	tnz	(OFST+1,sp)
7471  08bb 2706          	jreq	L7273
7472                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7474  08bd 721a525d      	bset	21085,#5
7476  08c1 2004          	jra	L1373
7477  08c3               L7273:
7478                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7480  08c3 721b525d      	bres	21085,#5
7481  08c7               L1373:
7482                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7484  08c7 7218525d      	bset	21085,#4
7485                     ; 2317 }
7488  08cb 5b03          	addw	sp,#3
7489  08cd 81            	ret
7502                     	xdef	_TIM1_ClearITPendingBit
7503                     	xdef	_TIM1_GetITStatus
7504                     	xdef	_TIM1_ClearFlag
7505                     	xdef	_TIM1_GetFlagStatus
7506                     	xdef	_TIM1_GetPrescaler
7507                     	xdef	_TIM1_GetCounter
7508                     	xdef	_TIM1_GetCapture4
7509                     	xdef	_TIM1_GetCapture3
7510                     	xdef	_TIM1_GetCapture2
7511                     	xdef	_TIM1_GetCapture1
7512                     	xdef	_TIM1_SetIC4Prescaler
7513                     	xdef	_TIM1_SetIC3Prescaler
7514                     	xdef	_TIM1_SetIC2Prescaler
7515                     	xdef	_TIM1_SetIC1Prescaler
7516                     	xdef	_TIM1_SetCompare4
7517                     	xdef	_TIM1_SetCompare3
7518                     	xdef	_TIM1_SetCompare2
7519                     	xdef	_TIM1_SetCompare1
7520                     	xdef	_TIM1_SetAutoreload
7521                     	xdef	_TIM1_SetCounter
7522                     	xdef	_TIM1_SelectOCxM
7523                     	xdef	_TIM1_CCxNCmd
7524                     	xdef	_TIM1_CCxCmd
7525                     	xdef	_TIM1_OC4PolarityConfig
7526                     	xdef	_TIM1_OC3NPolarityConfig
7527                     	xdef	_TIM1_OC3PolarityConfig
7528                     	xdef	_TIM1_OC2NPolarityConfig
7529                     	xdef	_TIM1_OC2PolarityConfig
7530                     	xdef	_TIM1_OC1NPolarityConfig
7531                     	xdef	_TIM1_OC1PolarityConfig
7532                     	xdef	_TIM1_GenerateEvent
7533                     	xdef	_TIM1_OC4FastConfig
7534                     	xdef	_TIM1_OC3FastConfig
7535                     	xdef	_TIM1_OC2FastConfig
7536                     	xdef	_TIM1_OC1FastConfig
7537                     	xdef	_TIM1_OC4PreloadConfig
7538                     	xdef	_TIM1_OC3PreloadConfig
7539                     	xdef	_TIM1_OC2PreloadConfig
7540                     	xdef	_TIM1_OC1PreloadConfig
7541                     	xdef	_TIM1_CCPreloadControl
7542                     	xdef	_TIM1_SelectCOM
7543                     	xdef	_TIM1_ARRPreloadConfig
7544                     	xdef	_TIM1_ForcedOC4Config
7545                     	xdef	_TIM1_ForcedOC3Config
7546                     	xdef	_TIM1_ForcedOC2Config
7547                     	xdef	_TIM1_ForcedOC1Config
7548                     	xdef	_TIM1_CounterModeConfig
7549                     	xdef	_TIM1_PrescalerConfig
7550                     	xdef	_TIM1_EncoderInterfaceConfig
7551                     	xdef	_TIM1_SelectMasterSlaveMode
7552                     	xdef	_TIM1_SelectSlaveMode
7553                     	xdef	_TIM1_SelectOutputTrigger
7554                     	xdef	_TIM1_SelectOnePulseMode
7555                     	xdef	_TIM1_SelectHallSensor
7556                     	xdef	_TIM1_UpdateRequestConfig
7557                     	xdef	_TIM1_UpdateDisableConfig
7558                     	xdef	_TIM1_SelectInputTrigger
7559                     	xdef	_TIM1_TIxExternalClockConfig
7560                     	xdef	_TIM1_ETRConfig
7561                     	xdef	_TIM1_ETRClockMode2Config
7562                     	xdef	_TIM1_ETRClockMode1Config
7563                     	xdef	_TIM1_InternalClockConfig
7564                     	xdef	_TIM1_ITConfig
7565                     	xdef	_TIM1_CtrlPWMOutputs
7566                     	xdef	_TIM1_Cmd
7567                     	xdef	_TIM1_PWMIConfig
7568                     	xdef	_TIM1_ICInit
7569                     	xdef	_TIM1_BDTRConfig
7570                     	xdef	_TIM1_OC4Init
7571                     	xdef	_TIM1_OC3Init
7572                     	xdef	_TIM1_OC2Init
7573                     	xdef	_TIM1_OC1Init
7574                     	xdef	_TIM1_TimeBaseInit
7575                     	xdef	_TIM1_DeInit
7594                     	end
