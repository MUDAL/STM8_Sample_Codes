   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  50                     ; 15 int main(void)
  50                     ; 16 {
  52                     	switch	.text
  53  0000               _main:
  57                     ; 18 	GPIO_Init(GPIOE,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_FAST); 
  59  0000 4be0          	push	#224
  60  0002 4b20          	push	#32
  61  0004 ae5014        	ldw	x,#20500
  62  0007 cd0000        	call	_GPIO_Init
  64  000a 85            	popw	x
  65                     ; 20 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); //16MHz clock
  67  000b 4f            	clr	a
  68  000c cd0000        	call	_CLK_HSIPrescalerConfig
  70                     ; 21 	TIM1_TimeBaseInit(PRESCALER_128,
  70                     ; 22 										TIM1_COUNTERMODE_UP,
  70                     ; 23 									  LOAD_VALUE,
  70                     ; 24 										0);
  72  000f 4b00          	push	#0
  73  0011 ae007c        	ldw	x,#124
  74  0014 89            	pushw	x
  75  0015 4b00          	push	#0
  76  0017 ae0080        	ldw	x,#128
  77  001a cd0000        	call	_TIM1_TimeBaseInit
  79  001d 5b04          	addw	sp,#4
  80                     ; 25 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
  82  001f ae0101        	ldw	x,#257
  83  0022 cd0000        	call	_TIM1_ITConfig
  85                     ; 26 	enableInterrupts();
  88  0025 9a            rim
  90                     ; 27 	TIM1_Cmd(ENABLE);
  93  0026 a601          	ld	a,#1
  94  0028 cd0000        	call	_TIM1_Cmd
  96  002b               L12:
  97                     ; 31 		GPIO_WriteReverse(GPIOE,GPIO_PIN_5);
  99  002b 4b20          	push	#32
 100  002d ae5014        	ldw	x,#20500
 101  0030 cd0000        	call	_GPIO_WriteReverse
 103  0033 84            	pop	a
 104                     ; 32 		TIM1_Delay(1000);
 106  0034 ae03e8        	ldw	x,#1000
 107  0037 89            	pushw	x
 108  0038 ae0000        	ldw	x,#0
 109  003b 89            	pushw	x
 110  003c cd0000        	call	_TIM1_Delay
 112  003f 5b04          	addw	sp,#4
 114  0041 20e8          	jra	L12
 127                     	xdef	_main
 128                     	xref	_TIM1_Delay
 129                     	xref	_TIM1_ITConfig
 130                     	xref	_TIM1_Cmd
 131                     	xref	_TIM1_TimeBaseInit
 132                     	xref	_GPIO_WriteReverse
 133                     	xref	_GPIO_Init
 134                     	xref	_CLK_HSIPrescalerConfig
 153                     	end
