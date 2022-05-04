   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  14                     	bsct
  15  0000               _nCount:
  16  0000 00000000      	dc.l	0
  53                     .const:	section	.text
  54  0000               L6:
  55  0000 00000190      	dc.l	400
  56                     ; 15 int main(void)
  56                     ; 16 {
  57                     	scross	off
  58                     	switch	.text
  59  0000               _main:
  63                     ; 18 	GPIO_Init(GPIOE,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_FAST); 
  65  0000 4be0          	push	#224
  66  0002 4b20          	push	#32
  67  0004 ae5014        	ldw	x,#20500
  68  0007 cd0000        	call	_GPIO_Init
  70  000a 85            	popw	x
  71                     ; 20 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); //16MHz clock
  73  000b 4f            	clr	a
  74  000c cd0000        	call	_CLK_HSIPrescalerConfig
  76                     ; 21 	TIM1_TimeBaseInit(PRESCALER_128,
  76                     ; 22 										TIM1_COUNTERMODE_UP,
  76                     ; 23 									  LOAD_VALUE,
  76                     ; 24 										0);
  78  000f 4b00          	push	#0
  79  0011 ae007c        	ldw	x,#124
  80  0014 89            	pushw	x
  81  0015 4b00          	push	#0
  82  0017 ae0080        	ldw	x,#128
  83  001a cd0000        	call	_TIM1_TimeBaseInit
  85  001d 5b04          	addw	sp,#4
  86                     ; 25 	TIM1_Cmd(ENABLE);
  88  001f a601          	ld	a,#1
  89  0021 cd0000        	call	_TIM1_Cmd
  91  0024               L12:
  92                     ; 28 		if(TIM1_GetFlagStatus(TIM1_FLAG_UPDATE))
  94  0024 ae0001        	ldw	x,#1
  95  0027 cd0000        	call	_TIM1_GetFlagStatus
  97  002a 4d            	tnz	a
  98  002b 27f7          	jreq	L12
  99                     ; 30 			TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 101  002d ae0001        	ldw	x,#1
 102  0030 cd0000        	call	_TIM1_ClearFlag
 104                     ; 31 			if((nCount % 400) == 0)
 106  0033 ae0000        	ldw	x,#_nCount
 107  0036 cd0000        	call	c_ltor
 109  0039 ae0000        	ldw	x,#L6
 110  003c cd0000        	call	c_lumd
 112  003f cd0000        	call	c_lrzmp
 114  0042 2609          	jrne	L72
 115                     ; 33 				GPIO_WriteReverse(GPIOE,GPIO_PIN_5);
 117  0044 4b20          	push	#32
 118  0046 ae5014        	ldw	x,#20500
 119  0049 cd0000        	call	_GPIO_WriteReverse
 121  004c 84            	pop	a
 122  004d               L72:
 123                     ; 35 			nCount++;
 125  004d ae0000        	ldw	x,#_nCount
 126  0050 a601          	ld	a,#1
 127  0052 cd0000        	call	c_lgadc
 129  0055 20cd          	jra	L12
 153                     	xdef	_main
 154                     	xdef	_nCount
 155                     	xref	_TIM1_ClearFlag
 156                     	xref	_TIM1_GetFlagStatus
 157                     	xref	_TIM1_Cmd
 158                     	xref	_TIM1_TimeBaseInit
 159                     	xref	_GPIO_WriteReverse
 160                     	xref	_GPIO_Init
 161                     	xref	_CLK_HSIPrescalerConfig
 162                     	xref.b	c_x
 181                     	xref	c_lgadc
 182                     	xref	c_lrzmp
 183                     	xref	c_lumd
 184                     	xref	c_ltor
 185                     	end
