   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 54 void BEEP_DeInit(void)
  41                     ; 55 {
  43                     	switch	.text
  44  0000               _BEEP_DeInit:
  48                     ; 56   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  50  0000 351f50f3      	mov	20723,#31
  51                     ; 57 }
  54  0004 81            	ret
 119                     ; 67 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 119                     ; 68 {
 120                     	switch	.text
 121  0005               _BEEP_Init:
 123  0005 88            	push	a
 124       00000000      OFST:	set	0
 127                     ; 70   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 129                     ; 73   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 131  0006 c650f3        	ld	a,20723
 132  0009 a41f          	and	a,#31
 133  000b a11f          	cp	a,#31
 134  000d 2610          	jrne	L15
 135                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 137  000f c650f3        	ld	a,20723
 138  0012 a4e0          	and	a,#224
 139  0014 c750f3        	ld	20723,a
 140                     ; 76     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 142  0017 c650f3        	ld	a,20723
 143  001a aa0b          	or	a,#11
 144  001c c750f3        	ld	20723,a
 145  001f               L15:
 146                     ; 80   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 148  001f c650f3        	ld	a,20723
 149  0022 a43f          	and	a,#63
 150  0024 c750f3        	ld	20723,a
 151                     ; 81   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 153  0027 c650f3        	ld	a,20723
 154  002a 1a01          	or	a,(OFST+1,sp)
 155  002c c750f3        	ld	20723,a
 156                     ; 82 }
 159  002f 84            	pop	a
 160  0030 81            	ret
 215                     ; 91 void BEEP_Cmd(FunctionalState NewState)
 215                     ; 92 {
 216                     	switch	.text
 217  0031               _BEEP_Cmd:
 221                     ; 93   if (NewState != DISABLE)
 223  0031 4d            	tnz	a
 224  0032 2706          	jreq	L101
 225                     ; 96     BEEP->CSR |= BEEP_CSR_BEEPEN;
 227  0034 721a50f3      	bset	20723,#5
 229  0038 2004          	jra	L301
 230  003a               L101:
 231                     ; 101     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 233  003a 721b50f3      	bres	20723,#5
 234  003e               L301:
 235                     ; 103 }
 238  003e 81            	ret
 291                     .const:	section	.text
 292  0000               L41:
 293  0000 000003e8      	dc.l	1000
 294                     ; 118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 294                     ; 119 {
 295                     	switch	.text
 296  003f               _BEEP_LSICalibrationConfig:
 298  003f 5206          	subw	sp,#6
 299       00000006      OFST:	set	6
 302                     ; 124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 304                     ; 126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 306  0041 96            	ldw	x,sp
 307  0042 1c0009        	addw	x,#OFST+3
 308  0045 cd0000        	call	c_ltor
 310  0048 ae0000        	ldw	x,#L41
 311  004b cd0000        	call	c_ludv
 313  004e be02          	ldw	x,c_lreg+2
 314  0050 1f03          	ldw	(OFST-3,sp),x
 316                     ; 130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 318  0052 c650f3        	ld	a,20723
 319  0055 a4e0          	and	a,#224
 320  0057 c750f3        	ld	20723,a
 321                     ; 132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 323  005a 1e03          	ldw	x,(OFST-3,sp)
 324  005c 54            	srlw	x
 325  005d 54            	srlw	x
 326  005e 54            	srlw	x
 327  005f 1f05          	ldw	(OFST-1,sp),x
 329                     ; 134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 331  0061 1e05          	ldw	x,(OFST-1,sp)
 332  0063 58            	sllw	x
 333  0064 58            	sllw	x
 334  0065 58            	sllw	x
 335  0066 1f01          	ldw	(OFST-5,sp),x
 337  0068 1e03          	ldw	x,(OFST-3,sp)
 338  006a 72f001        	subw	x,(OFST-5,sp)
 339  006d 1605          	ldw	y,(OFST-1,sp)
 340  006f 9058          	sllw	y
 341  0071 905c          	incw	y
 342  0073 cd0000        	call	c_imul
 344  0076 1605          	ldw	y,(OFST-1,sp)
 345  0078 9058          	sllw	y
 346  007a 9058          	sllw	y
 347  007c 9058          	sllw	y
 348  007e bf00          	ldw	c_x,x
 349  0080 90b300        	cpw	y,c_x
 350  0083 250c          	jrult	L331
 351                     ; 136     BEEP->CSR |= (uint8_t)(A - 2U);
 353  0085 7b06          	ld	a,(OFST+0,sp)
 354  0087 a002          	sub	a,#2
 355  0089 ca50f3        	or	a,20723
 356  008c c750f3        	ld	20723,a
 358  008f 2009          	jra	L531
 359  0091               L331:
 360                     ; 140     BEEP->CSR |= (uint8_t)(A - 1U);
 362  0091 7b06          	ld	a,(OFST+0,sp)
 363  0093 4a            	dec	a
 364  0094 ca50f3        	or	a,20723
 365  0097 c750f3        	ld	20723,a
 366  009a               L531:
 367                     ; 142 }
 370  009a 5b06          	addw	sp,#6
 371  009c 81            	ret
 384                     	xdef	_BEEP_LSICalibrationConfig
 385                     	xdef	_BEEP_Cmd
 386                     	xdef	_BEEP_Init
 387                     	xdef	_BEEP_DeInit
 388                     	xref.b	c_lreg
 389                     	xref.b	c_x
 408                     	xref	c_imul
 409                     	xref	c_ludv
 410                     	xref	c_ltor
 411                     	end
