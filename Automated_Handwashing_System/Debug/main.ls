   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  46                     ; 11 int main(void)
  46                     ; 12 {
  48                     	switch	.text
  49  0000               _main:
  53                     ; 14 	GPIO_Init(GPIOE,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_FAST);
  55  0000 4be0          	push	#224
  56  0002 4b20          	push	#32
  57  0004 ae5014        	ldw	x,#20500
  58  0007 cd0000        	call	_GPIO_Init
  60  000a 85            	popw	x
  61                     ; 15 	GPIO_Init(GPIOF,GPIO_PIN_4,GPIO_MODE_IN_PU_NO_IT);
  63  000b 4b40          	push	#64
  64  000d 4b10          	push	#16
  65  000f ae5019        	ldw	x,#20505
  66  0012 cd0000        	call	_GPIO_Init
  68  0015 85            	popw	x
  69  0016               L12:
  70                     ; 19 		if(!GPIO_ReadInputPin(GPIOF,GPIO_PIN_4))
  72  0016 4b10          	push	#16
  73  0018 ae5019        	ldw	x,#20505
  74  001b cd0000        	call	_GPIO_ReadInputPin
  76  001e 5b01          	addw	sp,#1
  77  0020 4d            	tnz	a
  78  0021 260b          	jrne	L52
  79                     ; 21 			GPIO_WriteLow(GPIOE,GPIO_PIN_5); 
  81  0023 4b20          	push	#32
  82  0025 ae5014        	ldw	x,#20500
  83  0028 cd0000        	call	_GPIO_WriteLow
  85  002b 84            	pop	a
  87  002c 20e8          	jra	L12
  88  002e               L52:
  89                     ; 25 			GPIO_WriteHigh(GPIOE,GPIO_PIN_5);
  91  002e 4b20          	push	#32
  92  0030 ae5014        	ldw	x,#20500
  93  0033 cd0000        	call	_GPIO_WriteHigh
  95  0036 84            	pop	a
  96  0037 20dd          	jra	L12
 109                     	xdef	_main
 110                     	xref	_GPIO_ReadInputPin
 111                     	xref	_GPIO_WriteLow
 112                     	xref	_GPIO_WriteHigh
 113                     	xref	_GPIO_Init
 132                     	end
