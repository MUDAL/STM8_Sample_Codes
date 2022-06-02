   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
 107                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 107                     ; 54 {
 109                     	switch	.text
 110  0000               _GPIO_DeInit:
 114                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 116  0000 7f            	clr	(x)
 117                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 119  0001 6f02          	clr	(2,x)
 120                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 122  0003 6f03          	clr	(3,x)
 123                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 125  0005 6f04          	clr	(4,x)
 126                     ; 59 }
 129  0007 81            	ret
 369                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 369                     ; 72 {
 370                     	switch	.text
 371  0008               _GPIO_Init:
 373  0008 89            	pushw	x
 374       00000000      OFST:	set	0
 377                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 379                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 381                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 383  0009 7b05          	ld	a,(OFST+5,sp)
 384  000b 43            	cpl	a
 385  000c e404          	and	a,(4,x)
 386  000e e704          	ld	(4,x),a
 387                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 389  0010 7b06          	ld	a,(OFST+6,sp)
 390  0012 a580          	bcp	a,#128
 391  0014 271d          	jreq	L771
 392                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 394  0016 7b06          	ld	a,(OFST+6,sp)
 395  0018 a510          	bcp	a,#16
 396  001a 2706          	jreq	L102
 397                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 399  001c f6            	ld	a,(x)
 400  001d 1a05          	or	a,(OFST+5,sp)
 401  001f f7            	ld	(x),a
 403  0020 2007          	jra	L302
 404  0022               L102:
 405                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 407  0022 1e01          	ldw	x,(OFST+1,sp)
 408  0024 7b05          	ld	a,(OFST+5,sp)
 409  0026 43            	cpl	a
 410  0027 f4            	and	a,(x)
 411  0028 f7            	ld	(x),a
 412  0029               L302:
 413                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 415  0029 1e01          	ldw	x,(OFST+1,sp)
 416  002b e602          	ld	a,(2,x)
 417  002d 1a05          	or	a,(OFST+5,sp)
 418  002f e702          	ld	(2,x),a
 420  0031 2009          	jra	L502
 421  0033               L771:
 422                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 424  0033 1e01          	ldw	x,(OFST+1,sp)
 425  0035 7b05          	ld	a,(OFST+5,sp)
 426  0037 43            	cpl	a
 427  0038 e402          	and	a,(2,x)
 428  003a e702          	ld	(2,x),a
 429  003c               L502:
 430                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 432  003c 7b06          	ld	a,(OFST+6,sp)
 433  003e a540          	bcp	a,#64
 434  0040 270a          	jreq	L702
 435                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 437  0042 1e01          	ldw	x,(OFST+1,sp)
 438  0044 e603          	ld	a,(3,x)
 439  0046 1a05          	or	a,(OFST+5,sp)
 440  0048 e703          	ld	(3,x),a
 442  004a 2009          	jra	L112
 443  004c               L702:
 444                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 446  004c 1e01          	ldw	x,(OFST+1,sp)
 447  004e 7b05          	ld	a,(OFST+5,sp)
 448  0050 43            	cpl	a
 449  0051 e403          	and	a,(3,x)
 450  0053 e703          	ld	(3,x),a
 451  0055               L112:
 452                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 454  0055 7b06          	ld	a,(OFST+6,sp)
 455  0057 a520          	bcp	a,#32
 456  0059 270a          	jreq	L312
 457                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 459  005b 1e01          	ldw	x,(OFST+1,sp)
 460  005d e604          	ld	a,(4,x)
 461  005f 1a05          	or	a,(OFST+5,sp)
 462  0061 e704          	ld	(4,x),a
 464  0063 2009          	jra	L512
 465  0065               L312:
 466                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 468  0065 1e01          	ldw	x,(OFST+1,sp)
 469  0067 7b05          	ld	a,(OFST+5,sp)
 470  0069 43            	cpl	a
 471  006a e404          	and	a,(4,x)
 472  006c e704          	ld	(4,x),a
 473  006e               L512:
 474                     ; 131 }
 477  006e 85            	popw	x
 478  006f 81            	ret
 524                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 524                     ; 142 {
 525                     	switch	.text
 526  0070               _GPIO_Write:
 528  0070 89            	pushw	x
 529       00000000      OFST:	set	0
 532                     ; 143   GPIOx->ODR = PortVal;
 534  0071 7b05          	ld	a,(OFST+5,sp)
 535  0073 1e01          	ldw	x,(OFST+1,sp)
 536  0075 f7            	ld	(x),a
 537                     ; 144 }
 540  0076 85            	popw	x
 541  0077 81            	ret
 588                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 588                     ; 155 {
 589                     	switch	.text
 590  0078               _GPIO_WriteHigh:
 592  0078 89            	pushw	x
 593       00000000      OFST:	set	0
 596                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 598  0079 f6            	ld	a,(x)
 599  007a 1a05          	or	a,(OFST+5,sp)
 600  007c f7            	ld	(x),a
 601                     ; 157 }
 604  007d 85            	popw	x
 605  007e 81            	ret
 652                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 652                     ; 168 {
 653                     	switch	.text
 654  007f               _GPIO_WriteLow:
 656  007f 89            	pushw	x
 657       00000000      OFST:	set	0
 660                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 662  0080 7b05          	ld	a,(OFST+5,sp)
 663  0082 43            	cpl	a
 664  0083 f4            	and	a,(x)
 665  0084 f7            	ld	(x),a
 666                     ; 170 }
 669  0085 85            	popw	x
 670  0086 81            	ret
 717                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 717                     ; 181 {
 718                     	switch	.text
 719  0087               _GPIO_WriteReverse:
 721  0087 89            	pushw	x
 722       00000000      OFST:	set	0
 725                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 727  0088 f6            	ld	a,(x)
 728  0089 1805          	xor	a,(OFST+5,sp)
 729  008b f7            	ld	(x),a
 730                     ; 183 }
 733  008c 85            	popw	x
 734  008d 81            	ret
 772                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 772                     ; 192 {
 773                     	switch	.text
 774  008e               _GPIO_ReadOutputData:
 778                     ; 193   return ((uint8_t)GPIOx->ODR);
 780  008e f6            	ld	a,(x)
 783  008f 81            	ret
 820                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 820                     ; 203 {
 821                     	switch	.text
 822  0090               _GPIO_ReadInputData:
 826                     ; 204   return ((uint8_t)GPIOx->IDR);
 828  0090 e601          	ld	a,(1,x)
 831  0092 81            	ret
 899                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 899                     ; 214 {
 900                     	switch	.text
 901  0093               _GPIO_ReadInputPin:
 903  0093 89            	pushw	x
 904       00000000      OFST:	set	0
 907                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 909  0094 e601          	ld	a,(1,x)
 910  0096 1405          	and	a,(OFST+5,sp)
 913  0098 85            	popw	x
 914  0099 81            	ret
 992                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 992                     ; 226 {
 993                     	switch	.text
 994  009a               _GPIO_ExternalPullUpConfig:
 996  009a 89            	pushw	x
 997       00000000      OFST:	set	0
1000                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1002                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1004                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1006  009b 0d06          	tnz	(OFST+6,sp)
1007  009d 2708          	jreq	L374
1008                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1010  009f e603          	ld	a,(3,x)
1011  00a1 1a05          	or	a,(OFST+5,sp)
1012  00a3 e703          	ld	(3,x),a
1014  00a5 2009          	jra	L574
1015  00a7               L374:
1016                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1018  00a7 1e01          	ldw	x,(OFST+1,sp)
1019  00a9 7b05          	ld	a,(OFST+5,sp)
1020  00ab 43            	cpl	a
1021  00ac e403          	and	a,(3,x)
1022  00ae e703          	ld	(3,x),a
1023  00b0               L574:
1024                     ; 238 }
1027  00b0 85            	popw	x
1028  00b1 81            	ret
1041                     	xdef	_GPIO_ExternalPullUpConfig
1042                     	xdef	_GPIO_ReadInputPin
1043                     	xdef	_GPIO_ReadOutputData
1044                     	xdef	_GPIO_ReadInputData
1045                     	xdef	_GPIO_WriteReverse
1046                     	xdef	_GPIO_WriteLow
1047                     	xdef	_GPIO_WriteHigh
1048                     	xdef	_GPIO_Write
1049                     	xdef	_GPIO_Init
1050                     	xdef	_GPIO_DeInit
1069                     	end
