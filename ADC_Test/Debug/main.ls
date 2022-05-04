   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  14                     	bsct
  15  0000               _adcValue:
  16  0000 0000          	dc.w	0
  52                     ; 12 int main(void)
  52                     ; 13 {
  54                     	switch	.text
  55  0000               _main:
  59                     ; 15 	GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_IN_FL_NO_IT);
  61  0000 4b00          	push	#0
  62  0002 4b20          	push	#32
  63  0004 ae5005        	ldw	x,#20485
  64  0007 cd0000        	call	_GPIO_Init
  66  000a 85            	popw	x
  67                     ; 16 	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_5, ADC1_PRESSEL_FCPU_D2, 
  67                     ; 17 					  ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL5,
  67                     ; 18 						DISABLE);
  69  000b 4b00          	push	#0
  70  000d 4b05          	push	#5
  71  000f 4b08          	push	#8
  72  0011 4b00          	push	#0
  73  0013 4b00          	push	#0
  74  0015 4b00          	push	#0
  75  0017 ae0105        	ldw	x,#261
  76  001a cd0000        	call	_ADC1_Init
  78  001d 5b06          	addw	sp,#6
  79                     ; 19 	ADC1_StartConversion();
  81  001f cd0000        	call	_ADC1_StartConversion
  83  0022               L12:
  84                     ; 23 		if(ADC1_GetFlagStatus(ADC1_FLAG_EOC))
  86  0022 a680          	ld	a,#128
  87  0024 cd0000        	call	_ADC1_GetFlagStatus
  89  0027 4d            	tnz	a
  90  0028 27f8          	jreq	L12
  91                     ; 25 			adcValue = ADC1_GetConversionValue();
  93  002a cd0000        	call	_ADC1_GetConversionValue
  95  002d bf00          	ldw	_adcValue,x
  96                     ; 26 			ADC1_ClearFlag(ADC1_FLAG_EOC);
  98  002f a680          	ld	a,#128
  99  0031 cd0000        	call	_ADC1_ClearFlag
 101  0034 20ec          	jra	L12
 125                     	xdef	_main
 126                     	xdef	_adcValue
 127                     	xref	_GPIO_Init
 128                     	xref	_ADC1_ClearFlag
 129                     	xref	_ADC1_GetFlagStatus
 130                     	xref	_ADC1_GetConversionValue
 131                     	xref	_ADC1_StartConversion
 132                     	xref	_ADC1_Init
 151                     	end
