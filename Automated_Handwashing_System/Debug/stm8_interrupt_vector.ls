   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  13                     .const:	section	.text
  14  0000               __vectab:
  15  0000 82            	dc.b	130
  17  0001 00            	dc.b	page(__stext)
  18  0002 0000          	dc.w	__stext
  19  0004 82            	dc.b	130
  21  0005 00            	dc.b	page(f_TRAP_IRQHandler)
  22  0006 0000          	dc.w	f_TRAP_IRQHandler
  23  0008 82            	dc.b	130
  25  0009 00            	dc.b	page(f_TLI_IRQHandler)
  26  000a 0000          	dc.w	f_TLI_IRQHandler
  27  000c 82            	dc.b	130
  29  000d 00            	dc.b	page(f_AWU_IRQHandler)
  30  000e 0000          	dc.w	f_AWU_IRQHandler
  31  0010 82            	dc.b	130
  33  0011 00            	dc.b	page(f_CLK_IRQHandler)
  34  0012 0000          	dc.w	f_CLK_IRQHandler
  35  0014 82            	dc.b	130
  37  0015 00            	dc.b	page(f_EXTI_PORTA_IRQHandler)
  38  0016 0000          	dc.w	f_EXTI_PORTA_IRQHandler
  39  0018 82            	dc.b	130
  41  0019 00            	dc.b	page(f_EXTI_PORTB_IRQHandler)
  42  001a 0000          	dc.w	f_EXTI_PORTB_IRQHandler
  43  001c 82            	dc.b	130
  45  001d 00            	dc.b	page(f_EXTI_PORTC_IRQHandler)
  46  001e 0000          	dc.w	f_EXTI_PORTC_IRQHandler
  47  0020 82            	dc.b	130
  49  0021 00            	dc.b	page(f_EXTI_PORTD_IRQHandler)
  50  0022 0000          	dc.w	f_EXTI_PORTD_IRQHandler
  51  0024 82            	dc.b	130
  53  0025 00            	dc.b	page(f_EXTI_PORTE_IRQHandler)
  54  0026 0000          	dc.w	f_EXTI_PORTE_IRQHandler
  55  0028 82            	dc.b	130
  57  0029 00            	dc.b	page(f_NonHandledInterrupt)
  58  002a 0000          	dc.w	f_NonHandledInterrupt
  59  002c 82            	dc.b	130
  61  002d 00            	dc.b	page(f_NonHandledInterrupt)
  62  002e 0000          	dc.w	f_NonHandledInterrupt
  63  0030 82            	dc.b	130
  65  0031 00            	dc.b	page(f_SPI_IRQHandler)
  66  0032 0000          	dc.w	f_SPI_IRQHandler
  67  0034 82            	dc.b	130
  69  0035 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_BRK_IRQHandler)
  70  0036 0000          	dc.w	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
  71  0038 82            	dc.b	130
  73  0039 00            	dc.b	page(f_TIM1_CAP_COM_IRQHandler)
  74  003a 0000          	dc.w	f_TIM1_CAP_COM_IRQHandler
  75  003c 82            	dc.b	130
  77  003d 00            	dc.b	page(f_TIM2_UPD_OVF_BRK_IRQHandler)
  78  003e 0000          	dc.w	f_TIM2_UPD_OVF_BRK_IRQHandler
  79  0040 82            	dc.b	130
  81  0041 00            	dc.b	page(f_TIM2_CAP_COM_IRQHandler)
  82  0042 0000          	dc.w	f_TIM2_CAP_COM_IRQHandler
  83  0044 82            	dc.b	130
  85  0045 00            	dc.b	page(f_TIM3_UPD_OVF_BRK_IRQHandler)
  86  0046 0000          	dc.w	f_TIM3_UPD_OVF_BRK_IRQHandler
  87  0048 82            	dc.b	130
  89  0049 00            	dc.b	page(f_TIM3_CAP_COM_IRQHandler)
  90  004a 0000          	dc.w	f_TIM3_CAP_COM_IRQHandler
  91  004c 82            	dc.b	130
  93  004d 00            	dc.b	page(f_NonHandledInterrupt)
  94  004e 0000          	dc.w	f_NonHandledInterrupt
  95  0050 82            	dc.b	130
  97  0051 00            	dc.b	page(f_NonHandledInterrupt)
  98  0052 0000          	dc.w	f_NonHandledInterrupt
  99  0054 82            	dc.b	130
 101  0055 00            	dc.b	page(f_I2C_IRQHandler)
 102  0056 0000          	dc.w	f_I2C_IRQHandler
 103  0058 82            	dc.b	130
 105  0059 00            	dc.b	page(f_UART2_TX_IRQHandler)
 106  005a 0000          	dc.w	f_UART2_TX_IRQHandler
 107  005c 82            	dc.b	130
 109  005d 00            	dc.b	page(f_UART2_RX_IRQHandler)
 110  005e 0000          	dc.w	f_UART2_RX_IRQHandler
 111  0060 82            	dc.b	130
 113  0061 00            	dc.b	page(f_ADC1_IRQHandler)
 114  0062 0000          	dc.w	f_ADC1_IRQHandler
 115  0064 82            	dc.b	130
 117  0065 00            	dc.b	page(f_TIM4_UPD_OVF_IRQHandler)
 118  0066 0000          	dc.w	f_TIM4_UPD_OVF_IRQHandler
 119  0068 82            	dc.b	130
 121  0069 00            	dc.b	page(f_EEPROM_EEC_IRQHandler)
 122  006a 0000          	dc.w	f_EEPROM_EEC_IRQHandler
 123  006c 82            	dc.b	130
 125  006d 00            	dc.b	page(f_NonHandledInterrupt)
 126  006e 0000          	dc.w	f_NonHandledInterrupt
 127  0070 82            	dc.b	130
 129  0071 00            	dc.b	page(f_NonHandledInterrupt)
 130  0072 0000          	dc.w	f_NonHandledInterrupt
 131  0074 82            	dc.b	130
 133  0075 00            	dc.b	page(f_NonHandledInterrupt)
 134  0076 0000          	dc.w	f_NonHandledInterrupt
 135  0078 82            	dc.b	130
 137  0079 00            	dc.b	page(f_NonHandledInterrupt)
 138  007a 0000          	dc.w	f_NonHandledInterrupt
 139  007c 82            	dc.b	130
 141  007d 00            	dc.b	page(f_NonHandledInterrupt)
 142  007e 0000          	dc.w	f_NonHandledInterrupt
 202                     	xdef	__vectab
 203                     	xref	f_EEPROM_EEC_IRQHandler
 204                     	xref	f_TIM4_UPD_OVF_IRQHandler
 205                     	xref	f_ADC1_IRQHandler
 206                     	xref	f_UART2_TX_IRQHandler
 207                     	xref	f_UART2_RX_IRQHandler
 208                     	xref	f_I2C_IRQHandler
 209                     	xref	f_TIM3_CAP_COM_IRQHandler
 210                     	xref	f_TIM3_UPD_OVF_BRK_IRQHandler
 211                     	xref	f_TIM2_CAP_COM_IRQHandler
 212                     	xref	f_TIM2_UPD_OVF_BRK_IRQHandler
 213                     	xref	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 214                     	xref	f_TIM1_CAP_COM_IRQHandler
 215                     	xref	f_SPI_IRQHandler
 216                     	xref	f_EXTI_PORTE_IRQHandler
 217                     	xref	f_EXTI_PORTD_IRQHandler
 218                     	xref	f_EXTI_PORTC_IRQHandler
 219                     	xref	f_EXTI_PORTB_IRQHandler
 220                     	xref	f_EXTI_PORTA_IRQHandler
 221                     	xref	f_CLK_IRQHandler
 222                     	xref	f_AWU_IRQHandler
 223                     	xref	f_TLI_IRQHandler
 224                     	xref	f_TRAP_IRQHandler
 225                     	xref	f_NonHandledInterrupt
 226                     	xref	__stext
 245                     	end
